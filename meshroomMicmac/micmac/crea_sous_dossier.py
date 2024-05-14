import re  # Import module for regular expressions
import shutil  # Import module for file and directory operations
from meshroom.core import desc  # Import Meshroom description classes
from meshroomMicmac.custom import node  # Import custom node module for MicMac
import os  # Import module for system operations
import psutil  # Import module for managing system processes
import shlex  # Import module for parsing command strings


class testRegEx(node.MicmacNode):  # Define a class for a custom MicMac node
    commandLine = 'mm3d testRegEx {command_lineValue}{allParams}'  # Define MicMac command line
    documentation = 'testRegEx'  # Node documentation
    category = 'MicMac'  # Node category in Meshroom


    inputs = [  # Define node inputs
        desc.File(  # File input for project directory
            name='projectDirectory',
            label='Project Directory',
            description='Project Directory.',
            value="",
            group='',  # Group required to execute mm3d command line
            uid=[0],  # Unique identifier
        ),
                
        desc.GroupAttribute(  # Group attribute for image selector
            name='image_selector',
            label='image selector',
            description="give the start and end image that you want to put in a new folder",
            brackets='[]',
            joinChar=',',
            group='',  # Unnamed parameter
            groupDesc=[  # Group description
                desc.BoolParam(  # Boolean parameter to indicate if numbers start with zero
                    name='name_zero',
                    label='zero at the beginning',
                    description="file name with a number containing zeros before the number.",
                    uid=[0],
                    value=True,
                ),
                
                desc.File(  # File input for first image
                     name="first_image",
                     label="first image",
                     description="no from the first image",
                     value="",
                     uid=[0],
                ),
                
                desc.File(  # File input for last image
                    name="last_image",
                    label="last image",
                    description="no from the last image",
                    value="",
                    uid=[0],
                ),
                
            
            ]),
        
        desc.File(  # File input for command line
            name='command_line',
            label='command line',
            description="command line to select all images between the first and the last",
            value="",
            uid=[0],
            group='',  # Unnamed parameter
 
        ),
       
        desc.BoolParam(  # Boolean parameter for displaying pattern
            name='DispPat',
            label='Disp Pat',
            description="Display Pattern to use in cmd line ; Def=false",
            uid=[0],
            value=False,
            advanced=True,  # Advanced parameter
        ),
        
        desc.File(  # File parameter for exporting image list
            name='ExpList',
            label='Exp List',
            description="Export list image in text file ; Def=false",
            uid=[0],
            value="files_txt",
            advanced=True,  # Advanced parameter
        ),
        
        desc.File(  # File parameter for name of new files
            name='name_new_files',
            label='name new files',
            description="name of the new folder which will contain the separate images",
            uid=[0],
            value="",
            group='',  # Unnamed parameter
        ),
        
        desc.StringParam(  # String parameter for output file names
            name='name_outputfiles',
            label='name_outputs',
            description="name new projectDirectory",
            uid=[0],
            value="",
            group='',  # Unnamed parameter
            enabled=lambda node: node.intermediateResults.exportTilePattern.value,  # Conditional activation
        ),
    ]


    outputs = [  # Define node outputs
         desc.File(  # Output file for new project directory
             name='outputFile',
             label='new projectDirectory',
             description="Folder containing all images separate",
             value=os.path.join(desc.Node.internalFolder, '{name_new_filesValue}'.strip('"')),  # Default value for output directory
             group='',  # Not a command line parameter
             uid=[],
         ),
     ]
       
    # Method to process data using MicMac
    def processChunk(self, chunk, ):
            try:
                with open(chunk.logFile, 'w') as logF:
                    cmd = self.buildCommandLine(chunk) + ' @ExitOnBrkp @ExitOnWarn @ExitOnNan'  # Build command line and add MicMac enter key flags
                    projectDir = chunk.node._cmdVars['projectDirectoryValue'].replace('"','')  # Get project directory from parameter (and remove quotes)
                    chunk.status.commandLine = cmd
                    chunk.saveStatusFile()
                    chunk.subprocess = psutil.Popen(shlex.split(cmd), stdout=logF, stderr=logF, cwd=projectDir)  # Execute in project directory
                    chunk.statThread.proc = chunk.subprocess
                    stdout, stderr = chunk.subprocess.communicate()
                    chunk.subprocess.wait()
                    chunk.status.returnCode = chunk.subprocess.returncode
                    # Check if the process completed successfully
                    if chunk.subprocess.returncode == 0:
                        self.execute_command(chunk.node)
                    else:
                        print("Process failed.")
            except:
                raise
            finally:
                chunk.subprocess = None
                
                
    # Method to execute image moving command
    def execute_command(cls,node):
            input_directory = node.projectDirectory.value.strip('"')
            name_new_files = node.name_new_files.value.strip('"')
            name_file=node.ExpList.value.strip('"')
   
            output_directory =  str(input_directory + "/" + name_new_files)
            file_imag = str(input_directory + "/" + name_file)
            cls.move_images(input_directory, output_directory, file_imag)
                
    # Method to move images to a new directory
    def move_images(cls, input_directory, output_directory, image_list_file):
        os.makedirs(output_directory, exist_ok=True)
        with open(image_list_file, 'r') as file:
            image_list = file.readlines()

        # Remove line breaks
        image_list = [image.strip() for image in image_list]

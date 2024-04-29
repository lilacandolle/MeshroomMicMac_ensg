import re
import shutil
from meshroom.core import desc
from meshroomMicmac.custom import node
import os
import psutil
import shlex


class testRegEx(node.MicmacNode):
    commandLine = 'mm3d testRegEx {command_lineValue}{allParams}'
    documentation = 'testRegEx'
    category = 'MicMac'


   
    inputs = [
        desc.File(
            name='projectDirectory',
            label='Project Directory',
            description='Project Directory.',
            value="",
            group='', # required to execute mm3d command line
            uid=[0],
        ),
                
        
        desc.GroupAttribute(
            name='image_selector',
            label='image selector',
            description="give the start and end image that you want to put in a new folder",
            brackets='[]',
            joinChar=',',
            group='', # unnamed parameter
            groupDesc=[
                desc.BoolParam(
                    name='name_zero',
                    label='zero at the beginning',
                    description="file name with a number containing zeros before the number.",
                    uid=[0],
                    value=True,
                ),
                
                desc.File(
                     name="first_image",
                     label="first image",
                     description="no from the first image",
                     value="",
                     uid=[0],
                ),
                
                desc.File(               
                    name="last_image",
                    label="last image",
                    description="no from the last image",
                    value="",
                    uid=[0],
                ),
                
            
            ]),

        desc.File(
            name='command_line',
            label='command line',
            description="command line to select all images between the first and the last",
            value="",
            uid=[0],
            group='', # unnamed parameter
 
        ),
       
        desc.BoolParam(
            name='DispPat',
            label='Disp Pat',
            description="Display Pattern to use in cmd line ; Def=false",
            uid=[0],
            value=False,
            advanced=True,
        ),
        
        desc.File(
            name='ExpList',
            label='Exp List',
            description="Export list image in text file ; Def=false",
            uid=[0],
            value="files_txt",
            advanced=True,
        ),
        
        desc.File(
            name='name_new_files',
            label='name new files',
            description="name of the new folder which will contain the separate images",
            uid=[0],
            value="",
            group='', # unnamed parameter
        ),
        
        desc.StringParam(
            name='name_outputfiles',
            label='name_outputs',
            description="name new projectDirectory",
            uid=[0],
            value="",
            group='', # unnamed parameter
            enabled=lambda node: node.intermediateResults.exportTilePattern.value,
        ),

    ]



    outputs = [

         desc.File(
             name='outputFile',
             label='new projectDirectory',
             description="Folder containing all images separate",
             value=os.path.join(desc.Node.internalFolder, '{name_new_filesValue}'.strip('"')), 
             group='', # not a command line parameter
             uid=[],
         ),
     ]
       
    
    def processChunk(self, chunk, ):
            try:
                with open(chunk.logFile, 'w') as logF:
                    cmd = self.buildCommandLine(chunk) + ' @ExitOnBrkp @ExitOnWarn @ExitOnNan' # build command line and add MicMac enter key flags
                    projectDir = chunk.node._cmdVars['projectDirectoryValue'].replace('"','')  # get project directory from parameter (and remove quotes)
                    chunk.status.commandLine = cmd
                    chunk.saveStatusFile()
                    chunk.subprocess = psutil.Popen(shlex.split(cmd), stdout=logF, stderr=logF, cwd=projectDir) # execute in project directory
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
                
                
    
    def execute_command(cls,node):

                    
            input_directory = node.projectDirectory.value.strip('"')
            name_new_files = node.name_new_files.value.strip('"')
            name_file=node.ExpList.value.strip('"')
        
   
            output_directory =  str(input_directory + "/" + name_new_files)
            file_imag = str(input_directory + "/" + name_file)

            cls.move_images(input_directory, output_directory, file_imag)
                
    def move_images(cls, input_directory, output_directory, image_list_file):
        os.makedirs(output_directory, exist_ok=True)
        with open(image_list_file, 'r') as file:
            image_list = file.readlines()

        # Remove line breaks
        image_list = [image.strip() for image in image_list]

           
        # Move images
        for image in image_list:
            shutil.copy(f"{input_directory}/{image}", output_directory)
        
        print (image_list_file)
        os.remove(image_list_file)
    
            
    @classmethod
    def update(cls, node):

        if not isinstance(node.nodeDesc, cls):
            raise ValueError("Node {} is not an instance of type {}".format(node, cls))
        # Here, you can put your logic to update parameter values
        # For example:
        
        # Accéder à attrValues
        first_image_value=node.image_selector.first_image.value
        last_image_value =node.image_selector.last_image.value
        

        
        name_zero=node.image_selector.name_zero.value

        chaine=cls.generateFilePattern(first_image_value,last_image_value,name_zero)
        
        node.command_line.value = str(chaine)

        print ( node.name_outputfiles.value)
        node.name_outputfiles.value = node.projectDirectory.value.strip('"') + "/" + node.name_new_files.value.strip('"')
        print ( node.outputFile.value)
        
        
    def generateFilePattern(start_file, end_file,name_zero):
        # Extract common prefix and suffix
        prefix = ''
        suffix = ''
        start_num=''
        end_num=''
        contains_digit=False
        zero_counter_start = 0
        zero_counter_end = 0
        
        for i, (a, b) in enumerate(zip(start_file, end_file)):

            if a.isdigit() and b.isdigit(): 
                contains_digit = True 
            if a == b:

                prefix += a
             
            else:
                suffix = start_file[-4:]
                break

        if contains_digit==True :
 
            # Extract numeric range
            start_num_entier = re.search(r'\d+', start_file).group(0)
            end_num_entier = re.search(r'\d+', end_file).group(0)
            

            
            
            # Vérifier la longueur des nombres entiers
            if len(start_num_entier) !=len(end_num_entier):
                # Si la longueur de start_num_entier est supérieure à celle de end_num_entier
                if len(start_num_entier) > len(end_num_entier):
                   print ("please put the smallest number in first_image")
                else:
                    # Ajouter des zéros à start_num_entier
                    start_num_entier = start_num_entier.zfill(len(end_num_entier))
    
                    
            
    
            for i, (a, b) in enumerate(zip(start_num_entier, end_num_entier)):
                
            
    
                if a != b:
                    start_num = start_num_entier[i:]
                    end_num = end_num_entier[i:]                   
                    break
            
            if name_zero==False:
              
                for digit_start in start_num_entier:
                    if digit_start == '0':
                        zero_counter_start += 1
                    else:
                        break  # Stop counting if a non-zero digit is encountered
            
                for digit_end in end_num_entier:
                    if digit_end == '0':
                        zero_counter_end += 1
                    else:
                        break  # Stop counting if a non-zero digit is encountered
                   
             
                
            taile_modif_numb=len(start_num_entier)-len(start_num)
            prefix_mofif=len(prefix)-taile_modif_numb
            prefix_nom= prefix[0:prefix_mofif]
            

            
            if len(start_num)==1:
 
                file_pattern = f"{prefix_nom}({start_num_entier[zero_counter_start : taile_modif_numb]}[{start_num}-{end_num}]){suffix}"
               
            elif len(start_num)==2:
    
                

                
                prem_cond =f'{start_num_entier[zero_counter_start : taile_modif_numb+1]}[{start_num_entier[taile_modif_numb+1]}-9]'
                deux_cond =f'{start_num_entier[zero_counter_start : taile_modif_numb]}[{start_num_entier[taile_modif_numb]}-{str(int(end_num_entier[taile_modif_numb])-1)}][0-9]'
                troi_cond=f'{end_num_entier[zero_counter_end : taile_modif_numb+1]}[0-{end_num_entier[taile_modif_numb+1]}]'
                file_pattern = f"{prefix_nom}({prem_cond}"
                

                if int(end_num_entier[taile_modif_numb])-int(start_num_entier[taile_modif_numb])!=1 or  int(start_num_entier[taile_modif_numb])-(int(end_num_entier[taile_modif_numb])-1)!=0:
                    file_pattern += f"|{deux_cond}"
                    
                file_pattern += f"|{troi_cond}){suffix}"
    
            elif len(start_num)==3:
                
                
                prem_cond =f'{start_num_entier[zero_counter_start : taile_modif_numb+2]}[{start_num_entier[taile_modif_numb+2]}-9]'
                deux_cond =f'{start_num_entier[zero_counter_start : taile_modif_numb+1]}[{str(int(start_num_entier[taile_modif_numb+1])+1)}-9][0-9]'
                troi_cond =f'{start_num_entier[zero_counter_start : taile_modif_numb]}[{str(int(start_num_entier[taile_modif_numb])+1)}-{str(int(end_num_entier[taile_modif_numb])-1)}][0-9][0-9]'
                quatre_cond =f'{end_num_entier[zero_counter_end : taile_modif_numb+1]}[0-{str(int(end_num_entier[taile_modif_numb+1])-1)}][0-9]'
                cinq_cond=f'{end_num_entier[zero_counter_end : taile_modif_numb+2]}[0-{end_num_entier[taile_modif_numb+2]}]'
    
                file_pattern = f"{prefix_nom}({prem_cond}"
                
                if int(start_num_entier[taile_modif_numb+1])+1!=10 :
                    file_pattern +=f"|{deux_cond}"
                    
                if int(start_num_entier[taile_modif_numb]) - int(end_num_entier[taile_modif_numb])!=-1 or int(start_num_entier[taile_modif_numb])-(int(end_num_entier[taile_modif_numb])-1)!=0: 
                   file_pattern += f"|{troi_cond}"
                

                if int(end_num_entier[taile_modif_numb+1])-1!=-1:
                    file_pattern +=f"|{quatre_cond}"
               
                file_pattern += f"|{cinq_cond}){suffix}"
    
     
            
    
            return file_pattern
        
        
        

    









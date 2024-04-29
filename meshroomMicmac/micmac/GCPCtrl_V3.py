__version__ = "1.1.1"

import sys
from meshroom.core import desc
from meshroomMicmac.custom import node

class GCPCtrl_V3(node.MicmacNode):
    commandLine = 'mm3d GCPCtrl {imagePatternValue} {orientationInValue} {GCPFileValue} {imageMeasurementsFileValue} {allParams}'
    documentation = 'GCPCtrl_V3'
    #category = 'MicMac'

    inputs = [
        desc.File(
            name='projectDirectory',
            label='Project Directory',
            description='Project Directory.',
            value="",
            group='', # required to execute mm3d command line
            uid=[0],
        ),
        desc.File(
            name='imagePattern',
            label='Image Pattern',
            description="Full name (Dir+Pat)",
            uid=[0],
            group='', # unnamed parameter
            value="",
        ),
        desc.File(
            name='orientationIn',
            label='Orientation In',
            description="Orientation in",
            uid=[0],
            group='', # unnamed parameter
            value="",
        ),
        desc.File(
            name='GCPFile',
            label='GCP File',
            description="Ground Control Points File",
            uid=[0],
            group='', # unnamed parameter
            value="",
        ),
        desc.File(
            name='imageMeasurementsFile',
            label='Image Measurements File',
            description="Image Measurements File",
            uid=[0],
            group='', # unnamed parameter
            value="",
        ),
        desc.BoolParam(
            name='CPI',
            label='C P I',
            description="when Calib Per Image has to be used",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.BoolParam(
            name='ShowU',
            label='Show U',
            description="Show unused point (def=true)",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.StringParam(
            name='OutTxt',
            label='Out Txt',
            description="Name TXT file for Ctrl result (def=false)",
            uid=[0],
            value="",
        ),
        desc.File(
            name='OutJSON',
            label='Out J S O N',
            description="Name .geojson file for Ctrl result (def=false)",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.BoolParam(
            name='WithDetProj',
            label='With Det Proj',
            description="with detail on all proj (def=false)",
            uid=[0],
            value=False,
            advanced=True,
        ),
    ]

    outputs = [
        desc.File(
		name='OutTxtFile',
		label='OutTxtFile',
		description="Out Txt format",
		value="{OutTxtFormatValue}",
        group='', # not a command line parameter
        uid=[],
 	),
#         desc.File(
# 		name='OutJSON',
# 		label='OutJSON',
# 		description="Out JSON format",
# 		value="{OutJSONValue}",
#         group='', # not a command line parameter
#         uid=[],
#  	),
    ]

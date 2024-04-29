# -*- coding: utf-8 -*-
"""
Created on Wed Mar 20 15:41:33 2024

@author: leoni
"""

__version__ = "1.1.1"

import sys
from meshroom.core import desc
from meshroomMicmac.custom import node

class ChgSysCo(node.MicmacNode):
    commandLine = 'mm3d ChgSysCo {imagePatternValue} {orientationInValue} {ChgSystValue} {OutValue}'# {allParams}'
    documentation = 'ChgSysCo'

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
            description='Image Pattern.',
            group='', # unnamed parameter
            value="",
            uid=[0],
        ),
        desc.File(
            name='orientationIn',
            label='Input Orientation',
            description="Input Orientation.",
            group='unnamedParams',
            uid=[0],
            value="",
        ),
        desc.File(
            name='ChgSyst',
            label='Changing system file',
            description="Changing system file",
            group='unnamedParams',
            uid=[0],
            value="",
        ),
        desc.StringParam(   #this input gives the name or the directory of the output orientation file
            name='Out',
            label='Output Name',
            description="Directory of Output Orientation",
            value="",
            uid=[0],
        ),
        
        ###Paramètre avancé que j'ai ajouté par la suite
        desc.BoolParam( 
            name='FR',
            label='F R',
            description="Force orientation matrix to be pure rotation (Def = true)",
            uid=[0],
            value=False,
            advanced=True,
        ),
          
    ]

    outputs = [
        desc.File( #output: new orientation file; this arguments allows the output to appear in the node in Meshroom (and makes links possible between two nodes)
		name='orientationOut', #for each output in a node, we have to set an input (for the name of the input) and an output (to make links between nodes)
		label='Output Orientation',
		description="Orientation out",
		value="{OutValue}",
        group='', # not a command line parameter
        uid=[],
 	),
    ]


# -*- coding: utf-8 -*-
"""
Created on Wed Mar 20 10:11:39 2024

@author: leoni
"""

__version__ = "1.1.1"

import sys
from meshroom.core import desc
from meshroomMicmac.custom import node

class CenterBascule(node.MicmacNode):
    commandLine = 'mm3d CenterBascule {imagePatternValue} {orientationInValue} {LocalizationOfInformationCentersValue} {OutValue} {allParams}'
    documentation = 'CenterBascule'

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
            name='LocalizationOfInformationCenters',
            label='Localization of Information on Centers',
            description="Localization of Information on Centers",
            group='unnamedParams',
            uid=[0],
            value="",
        ),
	    
        desc.BoolParam(
            name='setL1',
            label='Set L1',
            description="Set L1",
            uid=[0],
            value=False,
            group='',
            advanced=True,
        ),
        
	    
        desc.BoolParam(
            name='L1',
            label='L1',
            description="L1 minimisation vs L2",
            enabled=lambda node: node.setL1.value,
            uid=[0],
            value=False,
            advanced=True,
        ),
               
        
        desc.BoolParam(
            name='CalcV',
            label='Compute Speed',
            description="Compute Speed",
            uid=[0],
            value=False,

        ),
	    
        ####modif####
        desc.BoolParam(
            name='setForceVert',
            label='Set Force Vert',
            description="Set Force Vert",
            uid=[0],
            value=False,
            group='',
            advanced=True,
        ), 
        ####modif####
	    
        desc.FloatParam(
            name='ForceVert',
            label='Force Vert',
            description="Weight for forcing Axe of camera to vertical",
            enabled=lambda node: node.setForceVert.value,
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        desc.StringParam(
            name='Out',
            label='Output Name',
            description="Directory of Output Orientation",
            group='unnamedParams',
            value="",
            uid=[0],
        ),
    ]

    outputs = [
        desc.File(
		name='orientationOut',
		label='Output Orientation',
		description="Orientation out",
		value="{OutValue}",
        group='', # not a command line parameter
        uid=[],
 	),
    ]

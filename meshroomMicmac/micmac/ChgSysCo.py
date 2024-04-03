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
        desc.StringParam(
            name='Out',
            label='Output Name',
            description="Directory of Output Orientation",
            value="",
            uid=[0],
        ),
          # desc.StringParam(
          #           name='ForceSol',
          #           label='Force Sol',
          #           description="To Force Sol from existing solution (xml file)",
          #           uid=[0],
          #           value="",
          #           advanced=True,
          #       ),
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

# class ChgSysCo(node.MicmacNode):
#     commandLine = 'mm3d ChgSysCo {imagePatternValue} {orientationInValue} {chgsysValue} {OutValue}' # {allParams}'
#     documentation = 'ChangeSystemCoordinate'

#     inputs = [
#         desc.File(
#             name='projectDirectory',
#             label='Project Directory',
#             description='Project Directory.',
#             value="",
#             group='', # required to execute mm3d command line
#             uid=[0],
#         ),
#         desc.File(
#             name='imagePattern',
#             label='Image Pattern',
#             description='Image Pattern.',
#             group='', # unnamed parameter
#             value="",
#             uid=[0],
#         ),
#         desc.File(
#             name='orientationIn',
#             label='Input Orientation',
#             description="Input Orientation.",
#             group='unnamedParams',
#             uid=[0],
#             value="",
#         ),
#         desc.File(
#             name='chsys', #nom de l'objet attribut #je ne sais pas encore si on va en avoir besoin
#             label='Change System File', #label sur l'interface
#             description='Fichier de changement de coordonnees',
#             group='unnamedParams',
#             uid=[0],
#             value="", #value vide mais pq par défaut met un nom de dossier
#         ),
        
#         desc.StringParam(
#             name='Out',
#             label='Output Name',
#             description="Directory of Output Orientation",
#             group='unnamedParams',
#             value="",
#             uid=[0],
#         ),
#         # desc.BoolParam(
#         #     name='FR',
#         #     label='FR',
#         #     description="FR",
#         #     uid=[0],
#         #     value=True,
#         #     advanced=True,
#         # ),
        
#       #  desc.StringParam(
#       #      name='ForceSol',
#       #      label='Force Sol',
#       #      description="To Force Sol from existing solution (xml file)",
#       #      uid=[0],
#       #      value="",
#       #      advanced=True,
#       #  ),
#     ]
    
#     outputs = [
#         desc.File(
#             name='orientationOut',
#     		label='Output Orientation',
#     		description="Orientation out",
#     		value="{OutValue}",
#             group='', # not a command line parameter
#             uid=[],
#         ),
#     ]
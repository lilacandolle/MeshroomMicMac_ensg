__version__ = "1.1.1"

import sys
from meshroom.core import desc
from meshroomMicmac.custom import node

class GrShade(node.MicmacNode):
    commandLine = 'mm3d GrShade {imageFileValue} {allParams}'
    documentation = 'GrShade'
    category = 'MicMac'

    inputs = [
        #######mandatory unamed parameters
        desc.File(
            name='projectDirectory',
            label='Project Directory',
            description='Project Directory.',
            value="",
            group='', # required to execute mm3d command line
            uid=[0],
        ),
        desc.File(
            name='imageFile',
            label='imageFile',
            description="image of the relief File name",
            uid=[0],
            group='', # unnamed parameter
            value="",
        ),
        ####### optional named and useful parameters
        desc.FloatParam(
            name = 'FZ',
            label = 'FZ',
            description = 'step in z by which the relief is multiplied before being shaded',
            value = 1.0,
            range = (-3.0, 5.0, 0.1),
            uid = [0],
        ),
        desc.StringParam(
            name='suffixOut',
            label='Output Suffix',
            description="Suffix of the OutputFile",
            value="",
            uid=[0],
            group = '',
        ),
        desc.StringParam(
            name='Out',
            label='Output File',
            description="Output File name",
            value="",
            uid=[0],
        ),
        desc.FloatParam(
            name = 'Anisotropie',
            label = 'Anisotropie',
            description = 'Anisotropie',
            value = 0.95,
            range = (0.0, 1.0, 0.05),
            uid = [0],
        ),
        desc.IntParam(
            name = 'Dequant',
            label = 'Dequant',
            description = 'Dequant',
            value = 0,
            range = (0, 10, 1),
            uid = [0],
        ),
        desc.BoolParam(
            name = 'setHypsoDyn',
            label = 'Set HypsoDyn',
            description = 'Set HypsoDyn.',
            value = False,
            uid = [0],
            advanced = True,
            group = '',
        ),
        desc.FloatParam(
            name='HypsoDyn',
            label='HypsoDyn',
            description='HypsoDyn.',
            value=-1.0,
            range=(-5.0, 10.0, 0.5),
            uid=[0],
            enabled=lambda node: node.setHypsoDyn.value,
            advanced=True,
        ),
        desc.BoolParam(
            name = 'setHypsoSat',
            label = 'Set HypsoSat', 
            description = 'Set HypsoSat.',
            value = False,
            uid = [0],
            advanced = True,
            group = '',
        ),
        desc.FloatParam(
            name='HypsoSat',
            label='HypsoSat',
            description='HypsoSat.',
            value=0.5,
            range=(-5.0, 10.0, 0.5),
            uid=[0],
            enabled=lambda node: node.setHypsoSat.value,
            advanced=True,
        ),
        #######optional named and advanced parameters
        """desc.BoolParam(
            name = 'Visu',
            label = 'Visu',
            description = 'Visu.',
            value = False,
            uid = [0],
            advanced = True,
        ),
        desc.File(
            name='FileCol',
            label='File Col',
            description="Color file",
            uid=[0],
            value="",
        ),
        desc.StringParam(
            name='TypeMnt',
            label='Type Mnt',
            description="Type",
            uid=[0],
            value="",
        ),
        desc.StringParam(
            name='TypeShade',
            label='Type Shade',
            description="Type",
            uid=[0],
            value="",
        ),
        desc.ChoiceParam(
            name = 'ModeOmbre',
            label = 'Mode Ombre',
            description = 'Mode Ombre.',
            value = 'IgnE',
            values = ['CielVu', 'IgnE', 'Local', 'Med', 'Mixte'],
            exclusive = True,
            uid = [0],
        ),
        desc.File(
            name='Mask',
            label='Mask',
            description="Mask file",
            uid=[0],
            value="",
        ),
        desc.StringParam(
            name='ModeColor',
            label='Mode Color',
            description="Color mode",
            uid=[0],
            value="",
        ),"""
    ]

    """outputs = [
        desc.File(
            name='OutDir',
            label='Output',
            description='Output file',
            value='{OutValue}',
            uid=[0],
        ),
    ]"""

    @classmethod
    def update(cls, node):
        # Vérifie si le nœud est une instance de la classe
        if not isinstance(node.nodeDesc, cls):
            raise ValueError("Node {} is not an instance of type {}".format(node, cls))
        
        # Obtient la valeur de l'attribut suffixOut
        chaine = node.suffixOut.value
        
        # Concatène la chaîne obtenue avec "Shade.tif" et met à jour la valeur de l'attribut Out
        node.Out.value = str(chaine)+ "Shade.tif"
        
        # Affiche la nouvelle valeur de l'attribut Out
        print ( node.Out.value)
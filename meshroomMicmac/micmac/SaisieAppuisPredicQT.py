__version__ = "1.1.1"

from meshroom.core import desc
from meshroomMicmac.custom import node

class SaisieAppuisPredicQT(node.MicmacNode):
    commandLine = 'mm3d SaisieAppuisPredicQT {imagePatternValue} {orientationInValue} {groundControlPointsFileValue} {iMeaFileValue} {allParams}'
    documentation = '''SaisieAppuisPredicQT'''

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
            name='groundControlPointsFile',
            label='GCP  File',
            description="Ground Control Points File",
            group='unnamedParams',
            uid=[0],
            value="",
        ),
        desc.StringParam(
            name='imageMeasurementsFile',
            label='Image Measurements File',
            description="Image Measurements File",
            uid=[],
            group = '',
            value="Mesure.xml",
        ),
        desc.GroupAttribute(
            name = 'SzW',
            label = 'Size of the window',
            description = 'Size of the window',
            brackets='[]',
            joinChar=',',
            groupDesc=[
                desc.IntParam(
                    name='SzW1',
                    label='SzW1',
                    description='Size of the window 1.',
                    value=800,
                    range=(100, 2000, 100),
                    uid=[0],
                ),
                desc.IntParam(
                    name='SzW2',
                    label='SzW2',
                    description='Size of the window 2.',
                    value=800,
                    range=(100, 2000, 100),
                    uid=[0],
                ),
            ],
        ),
        desc.GroupAttribute(
            name = 'NbF',
            label = 'Number of Subwindows',
            description = 'Number of Subwindows',
            brackets='[]',
            joinChar=',',
            groupDesc=[
                desc.IntParam(
                    name='NbF1',
                    label='NbF1',
                    description='Number of Subwindows 1.',
                    value=2,
                    range=(1, 5, 1),
                    uid=[0],
                ),
                desc.IntParam(
                    name='NbF2',
                    label='NbF2',
                    description='Number of Subwindows 2.',
                    value=2,
                    range=(1, 5, 1),
                    uid=[0],
                ),
            ],
        ),
        desc.BoolParam(
            name = 'setWBlur',
            label = 'Set WBlur',
            description = 'Set WBlur.',
            value = False,
            uid = [0],
            advanced = True,
            group = '',
        ),
        desc.FloatParam(
            name='WBlur',
            label='Size in ground geometry of bluring for target',
            enabled=lambda node: node.setWBlur.value,
            description='Size in ground geometry of bluring for target.',
            value=0.0,
            range=(0.0, 10.0, 0.1),
            uid=[0],
            advanced=True,
        ),
        desc.ChoiceParam(
            name='Type',
            label='Type',
            description='Type.',
            value='MaxLoc',
            values=['MaxLoc', 'MinLoc', 'GeoCube'],
            exclusive=True,
            uid=[0],
            advanced=True,
        ),
        desc.BoolParam(
            name='ForceGray',
            label='Force gray image',
            description='Force gray image.',
            value=True,
            uid=[0],
            advanced=True,
            group = '',
        ),
        desc.StringParam(
            name='OriMode',
            label='Orientation type',
            description='Orientation type.',
            value='Std',
            uid=[0],
            advanced=True,
        ),
        desc.BoolParam(
            name = 'setZMoy',
            label = 'Set ZMoy',
            description = 'Set ZMoy.',
            value = False,
            uid = [0],
            advanced = True,
            group = '',
        ),
        desc.FloatParam(
            name='ZMoy',
            label='Average Z',
            description='Average Z.',
            value=0.0,
            range=(0.0, 50.0, 10.0),
            uid=[0],
            enabled=lambda node: node.setZMoy.value,
            advanced=True,
        ),
        desc.BoolParam(
            name = 'setZInc',
            label = 'Set ZInc',
            description = 'Set ZInc.',
            value = False,
            uid = [0],
            advanced = True,
            group = '',
        ),
        desc.FloatParam(
            name='ZInc',
            label='Incertitude on Z',
            description='Incertitude on Z, Mandatory in PB.',
            value=0.0,
            uid=[0],
            range=(0.0, 1.0, 0.1),
            advanced=True,
            enabled=lambda node: node.setZInc.value,
        ),
        desc.File(
            name='Masq3D',
            label='3D Masq',
            description='3D Masq used for visibility.',
            value="",
            uid=[0],
            advanced=True,
        ),
        desc.File(
            name='PIMsF',
            label='PIMs Filter',
            description='PIMs filter used for visibility.',
            value="",
            uid=[0],
            advanced=True,
        ),
        desc.File(
            name = 'InputSec',
            label = 'InputSec',
            description = 'InputSec',
            value = "",
            uid = [0],
            advanced = True,
        ),
        desc.StringParam(
            name='strImageMeasurements2D',
            label='Image Measurements 2D',
            description='Image Measurements 2D.',
            value='',
            uid=[0],
            advanced=True,
            group = '',
        ),
        desc.StringParam(
            name='strImageMeasurements3D',
            label='Image Measurements 3D',
            description='Image Measurements 3D.',
            value='',
            uid=[0],
            advanced=True,
            group = '',
        ),
    ]

    outputs = [
        desc.File(
            name='imageMeasurements2D',
            label='imageMeasurements2D',
            description="Image Measurements 2D file.",
            uid=[],
            value= "{strImageMeasurements2DValue}",
            group = '',
        ),
        desc.File(
            name='imageMeasurements3D',
            label='imageMeasurements3D',
            description="Image Measurements 3D file.",
            uid=[],
            value= "{strImageMeasurements3DValue}",
            group = '',
        ),
    ]

    @classmethod
    # méthode permettant de mettre à jour les valeurs de certains attributs pour construire les noms de fichiers créés à partir de noms d'inputs
    def update(cls, node):
            # vérifie que le noeud est bien une instance de la classe
        if not isinstance(node.nodeDesc, cls):
            raise ValueError("Node {} is not an instance of type {}".format(node, cls))

        nom = node.imageMeasurementsFile.value

        chaine=nom[:-4] # on enlève l'extension .xml en enlevant les 4 derniers caractères
        
        # on met à jour les valeurs des attributs strImageMeasurements2D et strImageMeasurements3D
        node.strImageMeasurements2D.value = str(chaine)+ "-S2D.xml"
        print ( node.strImageMeasurements2D.value)
        node.strImageMeasurements3D.value =  str(chaine) + "-S3D.xml"
        print ( node.strImageMeasurements3D.value)

# -*- coding: utf-8 -*-
"""
Created on Wed Mar 20 11:15:14 2024

@author: leoni
"""

__version__ = "1.1.1"

from meshroom.core import desc
from meshroomMicmac.custom import node

class OriConvertV2(node.MicmacNode):
    commandLine = 'mm3d OriConvert {formatSpecificationValue} {orientationFileValue} {targetedOrientationValue} {allParams}'
    documentation = '''OriConvert''' #Images orientation (for spatial images) 
    
    ###Remarque: pour l'ensemble des paramètres integer, le curseur est fixé pour pouvoir aller de -1000 à 1000 
    ###car nous ne nous rendions pas compte de l'ordre de grandeur de ces paramètres. Vous pouvez bien évidement modifier ces curseurs 
    ###si jamais vous utilisez d'autres valeurs

    inputs = [
        desc.File(
            name='projectDirectory',
            label='Project Directory', 
            description='Project Directory.',
            value="", 
            group='', 
            uid=[0],
        ),
        
        desc.ChoiceParam(
            name='formatSpecification',
            label='Format Specification',
            description='Format du nouveau fichier d orientation',
            group='', # unnamed parameter
            value='OriTxtInFile',
            values=['OriTxtAgiSoft', 'OriBluh', 'OriTxtInFile'], #we only have the choice between three different type of format, but the most
            exclusive=True,                                      #commonly used is OriTxtInFile (default value)
            uid=[0],
        ),
        
        desc.File(
            name='orientationFile', 
            label='Orientation File', #label that appears on Meshroom
            description='Fichier d orientation des images',
            value="", 
            group='',
            uid=[0],
        ),
        
        desc.File(
            name='targetedOrientation', 
            label='Targeted Orientation', 
            description='Targeted Orientation',
            value="", 
            group='', 
            uid=[0],
        ),
        
        
        desc.File(
            name='ChSys', 
            label='Change System File', 
            description='Fichier de changement de coordonnees',
            uid=[0],
            value="", #pay attention of this value: the name should be like systemFile1@systFile2 to change the coordinates of the images 
                        # in the two system 
        ),
        desc.File(
            name='Calib',
            label='Calib',
            description="External XML calibration file",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.BoolParam(
            name='AddCalib',
            label='Add Calib',
            description="Try to add calibration, def=true",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.StringParam(
            name='ConvOri',
            label='Conv Ori',
            description="Orientation convention (like eConvAngPhotoMGrade ...)",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.File(
            name='KN2I',
            label='K N2 I',
            description="Key 2 compute Name Image from Id in file",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.FloatParam(
            name='DN',
            label='D N',
            description="Neighbooring distance for Image Graph",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        
        desc.BoolParam(
            name='MTD1',
            label='MTD1',
            description="Compute Metadata only for first image (tuning)",
            uid=[0],
            value=True,
        ),
        
        desc.File(
            name='NameCple',  
            label='Couple Image File',
            description='Fichier généralement en xml qui couple les images deux à deux',
            uid=[0],
            value="", 
        ),
        
        desc.BoolParam(
            name='CalcV',
            label='Compute Speed',
            description="Compute Speed",
            uid=[0],
            value=False,
        ),
        
        desc.IntParam(
            name='RedSizeSC',
            label='Red Size S C',
            description="Reduced Size of image to use for Tapioca for AltiSol (Def=1000)",
            uid=[0],
            value=0,
            range=(1, 500, 1),
            advanced=True,
        ),
        desc.StringParam(
            name='Reexp',
            label='Reexp',
            description="Reexport as Matrix (internal set up)",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.FloatParam(
            name='Regul',
            label='Regul',
            description="Regularisation cost (Cost of hole), Def=5.0",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        desc.FloatParam(
            name='RegNewBr',
            label='Reg New Br',
            description="cost of creating a new branch (Def=0.4, prop to Regul)",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        desc.FloatParam(
            name='Reliab',
            label='Reliab',
            description="Threshold for reliable speed, Def=0.75 (prop to Regul)",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        
        desc.BoolParam(
            name='setDelay',
            label='Set Delay',
            description="Set delay",
            uid=[0],
            value=False,
            group='',
            advanced=True,
        ),
        
        desc.FloatParam(
            name='Delay',
            label='Delay',
            description="Delay",
            enabled=lambda node: node.setAttr.value,
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True, #this value can be fil in parameter, but the node can also calculats it
        ),
        desc.BoolParam(
            name='TFC',
            label='T F C',
            description="Teta from cap : compute orientation from speed)",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.StringParam(
            name='RefOri',
            label='Ref Ori',
            description="Ref Orientation (internal purpose)",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.IntParam(
            name='SiftR',
            label='Sift R',
            description="Resolution of sift point for Tapioca ,when ImC, (Def No Sift)",
            uid=[0],
            value=0,
            range=(-1000, 1000, 1),
            advanced=True,
        ),
        desc.IntParam(
            name='SiftLR',
            label='Sift L R',
            description="Low Resolution of sift point for MultisCale ,when ImC (Def no multicale)",
            uid=[0],
            value=0,
            range=(-1000, 1000, 1),
            advanced=True,
        ),
        desc.BoolParam(
            name='Delaunay',
            label='Delaunay',
            description="Add delaunay arc when save couple (Def=true)",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.BoolParam(
            name='DelaunayCross',
            label='Delaunay Cross',
            description="Complete delaunay with some crossing trick arc when save couple (Def=true)",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.BoolParam(
            name='UOC',
            label='U O C',
            description="Use Only Center (tuning)",
            uid=[0],
            value=False,
            advanced=True,
        ),    
        
        desc.File(
            name='ImC', 
            label='Image Center',
            description='Image Center for computing AltiSol',
            uid=[0],
            value="", 
        ),
        
        desc.IntParam(
            name='NbImC',
            label='Nb Adjacent Images',
            description='Number of neighboors around Image "Center" (Def=50)',
            uid=[0],
            value=50,
            range=(1, 500, 1),
        ),
        desc.IntParam(
            name='Line',
            label='Line',
            description="Nb neighbour in the same line",
            uid=[0],
            value=0,
            range=(-1000, 1000, 1),
            advanced=True,
        ),
        desc.BoolParam(
            name='CBF',
            label='C B F',
            description="Export calib as a link to existing file",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.FloatParam(
            name='AltiSol',
            label='Alti Sol',
            description="Average altitude of ground",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        desc.FloatParam(
            name='Prof',
            label='Prof',
            description="Average Prof of images",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        desc.GroupAttribute(
            name='OffsetXYZ',
            label='Offset X Y Z',
            description="Offset to substract from X,Y,Z (To avoid possible round off error)",
            brackets='[]',
            joinChar=',',
            groupDesc=[
            desc.FloatParam(
                name="x",
                label="X",
                description="x.",
                value=0.0,
                range=(-float('inf'), float('inf'), 0.01),
                uid=[0],
                advanced=True,
            ),
            desc.FloatParam(
                name="y",
                label="Y",
                description="y.",
                value=0.0,
                range=(-float('inf'), float('inf'), 0.01),
                uid=[0],
            ),
            desc.FloatParam(
                name="z",
                label="Z",
                description="z.",
                value=0.0,
                range=(-float('inf'), float('inf'), 0.01),
                uid=[0],
            ),
        ]),
        desc.StringParam(
            name='CalOFC',
            label='Cal O F C',
            description="When specified compute initial orientation from centers (in Ori-GenFromC) Ori-${CalOFC",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.BoolParam(
            name='OkNoIm',
            label='Ok No Im',
            description="Do not create error if image does not exist (def = false)",
            uid=[0],
            value=False,
            advanced=True,
        ),
        desc.File(
            name='FNI',
            label='F N I',
            description="File to Create when non exist",
            uid=[0],
            value="",
            advanced=True,
        ),
        desc.FloatParam(
            name='SzW',
            label='Sz W',
            description="Size for visualisation",
            uid=[0],
            value=0.0,
            range=(-float('inf'), float('inf'), 0.01),
            advanced=True,
        ),
        desc.StringParam(
            name='UniteAng',
            label='Unite Ang',
            description="in [Degre,Radian,Grade], Def=Degre",
            uid=[0],
            value="",
            advanced=True,
        ),
        
        
    ]

    outputs = [
        desc.File(
            name='Targeted Orientation',
            label='Ori_chgmt_sys', # Directory Postfix
            description='Ori_chgmt_sys',
            value="{targetedOrientationValue}",
            group='',
            uid=[],
        ),
    ]
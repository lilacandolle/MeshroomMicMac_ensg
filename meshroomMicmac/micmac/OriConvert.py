# -*- coding: utf-8 -*-
"""
Created on Wed Mar  6 14:53:09 2024

@author: leoni
"""

__version__ = "1.1.1"

from meshroom.core import desc
from meshroomMicmac.custom import node

class OriConvert(node.MicmacNode):
    commandLine = 'mm3d OriConvert {formatSpecificationValue} {orientationFileValue} {targetedOrientationValue} {allParams}'
    documentation = '''OriConvert''' #orientation des images (notamment pour des prises de vue aériennes)

    inputs = [
        desc.File(
            name='projectDirectory', #nom de l'objet attribut #je ne sais pas encore si on va en avoir besoin
            label='Project Directory', #label sur l'interface
            description='Project Directory.',
            value="", #value vide mais pq par défaut met un nom de dossier
            group='', # required to execute mm3d command line
            uid=[0],
        ),
        
        desc.ChoiceParam(
            name='formatSpecification',
            label='Format Specification',
            description='Format du nouveau fichier d orientation',
            group='', # unnamed parameter
            value='OriTxtInFile',
            values=['OriTxtAgiSoft', 'OriBluh', 'OriTxtInFile'],
            exclusive=True,
            uid=[0],
        ),
        
        desc.File(
            name='orientationFile', #nom de l'objet attribut #je ne sais pas encore si on va en avoir besoin
            label='Orientation File', #label sur l'interface
            description='Fichier d orientation des images',
            value="", #value vide mais pq par défaut met un nom de dossier
            group='', # required to execute mm3d command line
            uid=[0],
        ),
        
        # desc.StringParam(
        #     name='targetedOrientation',
        #     label='Targeted Orientation',
        #     description="Orientation souhaitée",
        #     uid=[0],
        #     value="",
        # ),
        
        desc.File(
            name='targetedOrientation', #nom de l'objet attribut #je ne sais pas encore si on va en avoir besoin
            label='Targeted Orientation', #label sur l'interface
            description='Targeted Orientation',
            value="", #value vide mais pq par défaut met un nom de dossier
            group='', # required to execute mm3d command line
            uid=[0],
        ),
        
        
        desc.File(
            name='ChSys', #nom de l'objet attribut #je ne sais pas encore si on va en avoir besoin
            label='Change System File', #label sur l'interface
            description='Fichier de changement de coordonnees',
            uid=[0],
            value="", #value vide mais pq par défaut met un nom de dossier
        ),
        
        desc.BoolParam(
            name='MTD1',
            label='MTD1',
            description="Compute Metadata only for first image (tuning)",
            uid=[0],
            value=True,
        ),
        
        desc.File(
            name='NameCple', #nom de l'objet attribut 
            label='Couple Image File', #label sur l'interface
            description='Fichier généralement en xml qui couple les images deux à deux',
            uid=[0],
            value="", #value vide mais pq par défaut met un nom de dossier
        ),
        
        desc.BoolParam(
            name='CalcV',
            label='Compute Speed',
            description="Compute Speed",
            uid=[0],
            value=False,
        ),
        
        # desc.RealParam(
        #     name='delay',
        #     label='Delay',
        #     description='delay',
        #     uid=[0],
        #     value=0
        # ),
        
        desc.File(
            name='ImC', #nom de l'objet attribut #je ne sais pas encore si on va en avoir besoin
            label='Image Center', #label sur l'interface
            description='Image Center for computing AltiSol',
            uid=[0],
            value="", #value vide mais pq par défaut met un nom de dossier
        ),
        
        desc.IntParam(
            name='NbImC',
            label='Nb Adjacent Images',
            description='Number of neighboors around Image "Center" (Def=50)',
            uid=[0],
            value=50,
            range=(1, 500, 1),
        ),
        
        
    ]

    outputs = [
        desc.File(
            name='Ori_chgmt_sys',
            label='Ori_chgmt_sys', # Directory Postfix
            description='Ori_chgmt_sys',
            value="{targetedOrientationValue}",
            uid=[],
        ),
    ]
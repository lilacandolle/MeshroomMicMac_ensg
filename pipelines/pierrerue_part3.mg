{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "SaisieAppuisInit": "1.1.1",
            "MicMacProject": "1.0",
            "C3DC": "1.1.1",
            "AperiCloud": "1.1.1",
            "Tawny": "1.1.1",
            "TapiocaMulScale": "1.1.1",
            "CameraInit": "9.0",
            "Tapas": "1.1.1",
            "SaisieMasqQT": "1.1.1",
            "SaisieAppuisPredicQT": "1.1.1",
            "Pims2Mnt": "1.1.1",
            "RepLocBascule": "0.0"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 0,
                "split": 1
            },
            "uids": {
                "0": "961e54591174ec5a2457c66da8eadc0cb03d89ba"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [],
                "intrinsics": [],
                "sensorDatabase": "${ALICEVISION_SENSOR_DB}",
                "lensCorrectionProfileInfo": "${ALICEVISION_LENS_PROFILE_INFO}",
                "lensCorrectionProfileSearchIgnoreCameraModel": true,
                "defaultFieldOfView": 45.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1",
                    "3deanamorphic4",
                    "3deradial4",
                    "3declassicld"
                ],
                "rawColorInterpretation": "LibRawWhiteBalancing",
                "colorProfileDatabase": "${ALICEVISION_COLOR_PROFILE_DB}",
                "errorOnMissingColorProfile": true,
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "MicMacProject_1": {
            "nodeType": "MicMacProject",
            "position": [
                200,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "f054c6e152a6b9263adbbebba547907418b2199f"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "verboseLevel": "info"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "projectDirectory": "{cache}/{nodeType}/{uid0}/project"
            }
        },
        "TapiocaMulScale_1": {
            "nodeType": "TapiocaMulScale",
            "position": [
                400,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "9cb7bc651c6138e1c16acd639328a2448f9a63e9"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imagePattern": ".*.(jpg|jpeg|JPG|JPEG|png|PNG|tif|tiff|TIF|TIFF)",
                "Pat2": "",
                "imageSizeLowResolution": 500,
                "imageSizeHighResolution": 1000,
                "setByP": false,
                "ByP": -1,
                "NbMinPt": 2,
                "ExpTxt": false,
                "NoMax": false,
                "NoMin": false,
                "Ratio": 0.6,
                "wallisFilter": ""
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "PostFix": "MulScale"
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                600,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "a15747ea2e40b3a57c731f0657128aa5300b2e01"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{TapiocaMulScale_1.projectDirectory}",
                "imagePattern": "IMGP416[0-5].JPG",
                "calibrationModel": "FraserBasic",
                "InCal": "",
                "InOri": "",
                "SH": "{TapiocaMulScale_1.PostFix}",
                "ExpTxt": false,
                "FrozenPoses": "",
                "FrozenCalibs": "",
                "RefineAll": true,
                "ImInit": "",
                "EcInit": {
                    "max": 100.0,
                    "min": 5.0
                },
                "EcMax": 5.0,
                "setLibPP": false,
                "LibPP": true,
                "setLibFoc": false,
                "LibFoc": true,
                "setLibCP": false,
                "LibCP": true,
                "setLibCD": false,
                "LibCD": true,
                "setLibDec": false,
                "LibDec": true,
                "setDegRadMax": false,
                "DegRadMax": 0,
                "setDRMax": false,
                "DRMax": 0,
                "PropDiag": 1.0,
                "setVitesseInit": false,
                "VitesseInit": 2,
                "FocFree": true,
                "PPFree": true,
                "AffineFree": true,
                "BlocGlob": [],
                "DistBlocGlob": [],
                "BlocTimeRel": [],
                "OptBlocG": [],
                "RegulDist": [],
                "Out": "Calib"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "Tapas Calib",
                "color": ""
            },
            "outputs": {
                "orientationDirectory": "{OutValue}"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                806,
                187
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "8f4aeb868cd5914a9d424939bc02acfb0e38a5fa"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "{Tapas_1.imagePattern}",
                "SH": "{Tapas_1.SH}",
                "orientationDir": "{Tapas_1.orientationDirectory}",
                "ExpTxt": false,
                "Bin": true,
                "RGB": false,
                "WithPoints": true,
                "WithCam": true,
                "SeuilEc": 10.0,
                "LimBsH": 0.01,
                "CalPerIm": false,
                "StepIm": -1.0,
                "ProfCam": 0.3,
                "RabDrBundle": 0.0,
                "SavePtsCol": true,
                "GCPCtrl": [],
                "Out": "AperiCloud_Calib.ply"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "AperiCloud Calib",
                "color": ""
            },
            "outputs": {
                "pointCloud": "{OutValue}"
            }
        },
        "SaisieMasqQT_1": {
            "nodeType": "SaisieMasqQT",
            "position": [
                1238,
                7
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "c1155bb6a144ab6725186e5c11572b239336c2e2"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{AperiCloud_2.projectDirectory}",
                "filePath": "{AperiCloud_2.pointCloud}",
                "setPostfix": false,
                "Post": "_Masq",
                "setName": false,
                "Name": "",
                "setAttr": false,
                "Attr": "",
                "setGamma": false,
                "Gama": 1.5
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "SaisieMasqQT 3D",
                "color": ""
            },
            "outputs": {}
        },
        "C3DC_1": {
            "nodeType": "C3DC",
            "position": [
                1394,
                -4
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "a8e366c46f70ee8e096f3358c927cacf8693b6a5"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{SaisieMasqQT_1.projectDirectory}",
                "imagePattern": "{AperiCloud_2.imagePattern}",
                "SH": "{AperiCloud_2.SH}",
                "orientationDir": "{AperiCloud_2.orientationDir}",
                "mode": "QuickMac",
                "Masq3D": "AperiCloud_polyg3d.xml",
                "SzNorm": 2,
                "PlyCoul": true,
                "Purge": true,
                "ExpTxt": false,
                "Bin": true,
                "NormByC": false,
                "TetaOpt": 0.17,
                "ExpImSec": true,
                "setCustomZoomF": false,
                "ZoomF": 2,
                "FilePair": "",
                "OffsetPly": {
                    "x": 0.0,
                    "y": 0.0,
                    "z": 0.0
                },
                "Out": "C3DC.ply"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "pointCloud": "{OutValue}"
            }
        },
        "Pims2Mnt_1": {
            "nodeType": "Pims2Mnt",
            "position": [
                1795,
                -5
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "a2ab3bae598d578acc1c2487d88fae63c2305b9e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{C3DC_1.projectDirectory}",
                "dirOrPIM": "Quickmac",
                "DS": 1.0,
                "Repere": "{RepLocBascule_1.localFrameOut}",
                "DoMnt": true,
                "DoOrtho": true,
                "MasqImGlob": "",
                "UseTA": false,
                "RI": 1.0,
                "SeuilE": 5.0,
                "ZoomF": 2,
                "DirMTD": "PIMs-TmpMnt/",
                "DirOrtho": "PIMs-ORTHO/",
                "DirBasc": "PIMs-TmpBasc/",
                "NameMerge": "PIMs-Merged.xml",
                "Debug": false
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {}
        },
        "RepLocBascule_1": {
            "nodeType": "RepLocBascule",
            "position": [
                1594,
                -6
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "f392d0f329e8b24b8a521cbbd1dd01b123960e9a"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{SaisieMasqQT_2.projectDirectory}",
                "imagePattern": "{C3DC_1.imagePattern}",
                "orientationDir": "{AperiCloud_2.orientationDir}",
                "imageMeasures": "HOR",
                "ExpTxt": false,
                "PostPlan": "",
                "OrthoCyl": false,
                "localFrame": "RepLoc.xml"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "Need to rename HomolMulScale in Homol.\nWaiting for SH option in RepLoc to come in july, then in precomp binaries before november.",
                "label": "",
                "color": ""
            },
            "outputs": {
                "localFrameOut": "{localFrameValue}"
            }
        },
        "Tawny_1": {
            "nodeType": "Tawny",
            "position": [
                2006,
                -4
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "128e118551ce74bddff6ca9ee665d6efe8d1f7ed"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Pims2Mnt_1.projectDirectory}",
                "orthoDirectory": "",
                "RadiomEgal": false,
                "setDEq": false,
                "DEq": 1,
                "setDEqXY": false,
                "DEqXY": {
                    "x": 0,
                    "y": 0
                },
                "setAddCste": false,
                "AddCste": false,
                "setDegRap": false,
                "DegRap": 0,
                "setDegRapXY": false,
                "DegRapXY": {
                    "x": 0,
                    "y": 0
                },
                "setRGP": false,
                "RGP": true,
                "setDynG": false,
                "DynG": 0.0,
                "setImPrio": false,
                "ImPrio": ".*",
                "setSzV": false,
                "SzV": 1,
                "setCorThr": false,
                "CorThr": 0.7,
                "setNbPerIm": false,
                "NbPerIm": 10000.0,
                "setL1F": false,
                "L1F": true,
                "setSatThresh": false,
                "SatThresh": 0.0
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "Out": "Orthophotomosaic.tif"
            }
        },
        "Tapas_2": {
            "nodeType": "Tapas",
            "position": [
                804,
                -5
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "0bd283c9fabf15f47eda000e1c303dcbf957e034"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "IMGP41(6[7-9]|[7-8].).JPG",
                "calibrationModel": "Figee",
                "InCal": "{Tapas_1.orientationDirectory}",
                "InOri": "",
                "SH": "{Tapas_1.SH}",
                "ExpTxt": false,
                "FrozenPoses": "",
                "FrozenCalibs": "",
                "RefineAll": true,
                "ImInit": "",
                "EcInit": {
                    "max": 100.0,
                    "min": 5.0
                },
                "EcMax": 5.0,
                "setLibPP": false,
                "LibPP": true,
                "setLibFoc": false,
                "LibFoc": true,
                "setLibCP": false,
                "LibCP": true,
                "setLibCD": false,
                "LibCD": true,
                "setLibDec": false,
                "LibDec": true,
                "setDegRadMax": false,
                "DegRadMax": 0,
                "setDRMax": false,
                "DRMax": 0,
                "PropDiag": 1.0,
                "setVitesseInit": false,
                "VitesseInit": 2,
                "FocFree": true,
                "PPFree": true,
                "AffineFree": true,
                "BlocGlob": [],
                "DistBlocGlob": [],
                "BlocTimeRel": [],
                "OptBlocG": [],
                "RegulDist": [],
                "Out": "Relative"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "Tapas All",
                "color": ""
            },
            "outputs": {
                "orientationDirectory": "{OutValue}"
            }
        },
        "AperiCloud_2": {
            "nodeType": "AperiCloud",
            "position": [
                981,
                521
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "23adb3f7217bbf9ab472b95bac516143f6e0b39e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "{Tapas_2.imagePattern}",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "{Tapas_2.orientationDirectory}",
                "ExpTxt": false,
                "Bin": true,
                "RGB": false,
                "WithPoints": true,
                "WithCam": true,
                "SeuilEc": 10.0,
                "LimBsH": 0.01,
                "CalPerIm": false,
                "StepIm": -1.0,
                "ProfCam": 0.3,
                "RabDrBundle": 0.0,
                "SavePtsCol": true,
                "GCPCtrl": [],
                "Out": "AperiCloud.ply"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "AperiCloud All",
                "color": ""
            },
            "outputs": {
                "pointCloud": "{OutValue}"
            }
        },
        "SaisieMasqQT_2": {
            "nodeType": "SaisieMasqQT",
            "position": [
                1400,
                153
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "34cc1ef78d822e28d85e9032c7fe7f64810672a5"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{SaisieMasqQT_1.projectDirectory}",
                "filePath": "IMGP4176.JPG",
                "setPostfix": false,
                "Post": "_Masq",
                "setName": false,
                "Name": "",
                "setAttr": false,
                "Attr": "",
                "setGamma": false,
                "Gama": 1.5
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "SaisieMasqQT 2D",
                "color": ""
            },
            "outputs": {}
        },
        "SaisieAppuisInit_1": {
            "nodeType": "SaisieAppuisInit",
            "position": [
                1047,
                64
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "79305d05c36e8a7f8d30064b3cab173fa4f8242a"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": ".*.(jpg|jpeg|JPG|JPEG|png|PNG|tif|tiff|TIF|TIFF)",
                "inputOrientation": "{Tapas_2.orientationDirectory}",
                "pointName": "",
                "fileForImageMeasurements": "",
                "SzW": {
                    "SzW1": 900,
                    "SzW2": 700
                },
                "nameAuto": "",
                "forceGray": false,
                "oriMode": "Std",
                "ZMoy": 0.0,
                "ZInc": 0.0
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {}
        },
        "SaisieAppuisPredicQT_1": {
            "nodeType": "SaisieAppuisPredicQT",
            "position": [
                1335,
                338
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "bfb6c8f8da8693cb21fb036aa2cc2039160a4479"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{SaisieAppuisInit_1.projectDirectory}",
                "imagePattern": "{SaisieAppuisInit_1.imagePattern}",
                "orientationIn": "{SaisieAppuisInit_1.inputOrientation}",
                "groundControlPointsFile": "",
                "imageMeasurementsFile": "Mesure.xml",
                "SzW": {
                    "SzW1": 800,
                    "SzW2": 800
                },
                "NbF": {
                    "NbF1": 2,
                    "NbF2": 2
                },
                "setWBlur": false,
                "WBlur": 0.0,
                "Type": "MaxLoc",
                "ForceGray": true,
                "OriMode": "Std",
                "setZMoy": false,
                "ZMoy": 0.0,
                "setZInc": false,
                "ZInc": 0.0,
                "Masq3D": "",
                "PIMsF": "",
                "InputSec": "",
                "strImageMeasurements2D": "Mesure-S2D.xml",
                "strImageMeasurements3D": "Mesure-S3D.xml"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "imageMeasurements2D": "{strImageMeasurements2DValue}",
                "imageMeasurements3D": "{strImageMeasurements3DValue}"
            }
        }
    }
}
{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": false,
        "nodesVersions": {
            "AperiCloud": "1.1.1",
            "CameraInit": "9.0",
            "OriConvertV2": "1.1.1",
            "TapiocaFile": "1.1.1",
            "CenterBascule": "1.1.1",
            "MicMacProject": "1.0",
            "Tapas": "1.1.1",
            "ChgSysCo": "1.1.1"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                -419,
                68
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "592aa7df791f016284aa213257e6327baade2acb"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 904593753,
                        "poseId": 904593753,
                        "path": "C:/Users/leoni/Documents/ENSG/PID/MMM/projets/MeshroomCache/MicMacProject/0f16359ecb0ca09bfc4cf7fe24d06a1c954f6c53/project/R0040438.JPG",
                        "intrinsicId": 1676130094,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"7.530000\", \"Copyright\": \"                         \", \"DateTime\": \"2012:10:22 14:50:30\", \"Exif:ApertureValue\": \"4\", \"Exif:BrightnessValue\": \"10.1\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"2.8\", \"Exif:DateTimeDigitized\": \"2012:10:22 14:50:30\", \"Exif:DateTimeOriginal\": \"2012:10:22 14:50:30\", \"Exif:ExifVersion\": \"0221\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"16\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"6\", \"Exif:LightSource\": \"10\", \"Exif:MaxApertureValue\": \"1.9\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"100\", \"Exif:PixelXDimension\": \"3648\", \"Exif:PixelYDimension\": \"2736\", \"Exif:SceneCaptureType\": \"0\", \"Exif:Sharpness\": \"0\", \"Exif:WhiteBalance\": \"1\", \"Exif:YCbCrPositioning\": \"2\", \"ExposureTime\": \"0.000625\", \"FNumber\": \"4\", \"ImageDescription\": \"Exif_JPEG_PICTURE                                              \", \"Make\": \"RICOH      \", \"Model\": \"GR DIGITAL 3   \", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1676130094,
                        "initialFocalLength": 6.0,
                        "focalLength": 6.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 800,
                        "height": 600,
                        "sensorWidth": 7.53,
                        "sensorHeight": 5.647500000000001,
                        "serialNumber": "C:/Users/leoni/Documents/ENSG/PID/MMM/projets/MeshroomCache/MicMacProject/0f16359ecb0ca09bfc4cf7fe24d06a1c954f6c53/project_RICOH      _GR DIGITAL 3   ",
                        "principalPoint": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "initializationMode": "estimated",
                        "distortionInitializationMode": "none",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "undistortionOffset": {
                            "x": 0.0,
                            "y": 0.0
                        },
                        "undistortionParams": [],
                        "locked": false
                    }
                ],
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
                -125,
                80
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "2808962601e61c6c3fb8c65fb3b25d470cceb585"
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
        "TapiocaFile_1": {
            "nodeType": "TapiocaFile",
            "position": [
                182,
                66
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "ac522de76409037bf20359703447f03f811fec5b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "xmlPath": "FileImagesNeighbour.xml",
                "resolution": 500,
                "ExpTxt": false,
                "NoMax": false,
                "NoMin": false,
                "NoUnknown": false,
                "Ratio": 0.6
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "PostFix": "Tapioca"
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                411,
                -234
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "9e685b9fcbad31544ff95426a8ce7fff4968ad5c"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imagePattern": "\"R0040536.JPG|R0040537.JPG|R0040535.JPG|R0040578.JPG|R0040498.JPG|R0040499.JPG|R0040579.JPG|R0040538.JPG|R0040577.JPG|R0040534.JPG|R0040497.JPG|R0040500.JPG|R0040580.JPG|R0040456.JPG|R0040616.JPG|R0040576.JPG|R0040496.JPG|R0040617.JPG|R004045.JPG|R0040457.JPG|R0040615.JPG|R0040539.JPG|R0040501.JPG|R0040581.JPG|R0040533.JPG\"",
                "calibrationModel": "RadialBasic",
                "InCal": "",
                "InOri": "",
                "SH": "{TapiocaFile_1.PostFix}",
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
                "Out": "Sample4Calib-Rel"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "orientationDirectory": "{OutValue}"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                1374,
                -225
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "d5c4efe1f6450b76dc91065489132ab73ac03404"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "\"R.*.JPG\"",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "All-Rel",
                "ExpTxt": false,
                "Bin": true,
                "RGB": true,
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
                "Out": "AperiCloud_OriRel.ply"
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
        "ChgSysCo_1": {
            "nodeType": "ChgSysCo",
            "position": [
                1163,
                94
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "0a2b53b7992663c57d484021f46b748eb618d681"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{CenterBascule_1.projectDirectory}",
                "imagePattern": "\"R.*JPG\"",
                "orientationIn": "{CenterBascule_1.orientationOut}",
                "ChgSyst": "SysCoRTL.xml@SysCoBL72_EPSG31370.xml",
                "Out": "All-BL72_V0",
                "FR": false
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "orientationOut": "{OutValue}"
            }
        },
        "OriConvertV2_1": {
            "nodeType": "OriConvertV2",
            "position": [
                442,
                227
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "d234b7fa637dc403a6f9c7e806ecb8e2fcd96b42"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "formatSpecification": "OriTxtInFile",
                "orientationFile": "GPS_WPK_Grand-Leez.csv",
                "targetedOrientation": "Nav-adjusted-RTL",
                "ChSys": "DegreeWGS84@SysCoRTL.xml",
                "Calib": "",
                "setAddCalib": false,
                "AddCalib": false,
                "ConvOri": "",
                "KN2I": "",
                "setDN": false,
                "DN": 0.0,
                "MTD1": true,
                "NameCple": "",
                "setCalcV": false,
                "CalcV": false,
                "setRedSizeSC": false,
                "RedSizeSC": 0,
                "Reexp": "",
                "setRegul": false,
                "Regul": 0.0,
                "setRegNewBr": false,
                "RegNewBr": 0.0,
                "setReliab": false,
                "Reliab": 0.0,
                "setDelay": true,
                "Delay": -0.0787348,
                "setTFC": false,
                "TFC": false,
                "RefOri": "",
                "setSiftR": false,
                "SiftR": 0,
                "setSiftLR": false,
                "SiftLR": 0,
                "setDelaunay": false,
                "Delaunay": false,
                "setDelaunayCross": false,
                "DelaunayCross": false,
                "setUOC": false,
                "UOC": false,
                "ImC": "",
                "setNbImC": false,
                "NbImC": 0,
                "setLine": false,
                "Line": 0,
                "setCBF": false,
                "CBF": false,
                "setAltiSol": false,
                "AltiSol": 0.0,
                "setProf": false,
                "Prof": 0.0,
                "setOffsetXYZ": false,
                "OffsetXYZ": {
                    "x": 0.0,
                    "y": 0.0,
                    "z": 0.0
                },
                "CalOFC": "",
                "setOkNoIm": false,
                "OkNoIm": false,
                "FNI": "",
                "setSzW": false,
                "SzW": 0.0,
                "setUniteAng": false,
                "UniteAng": ""
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "Targeted Orientation": "{targetedOrientationValue}"
            }
        },
        "Tapas_2": {
            "nodeType": "Tapas",
            "position": [
                703,
                -234
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "1ae9f6ad85f5dce8d0c32b684f9a5db846a29a55"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "\"R.*.JPG\"",
                "calibrationModel": "RadialBasic",
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
                "Out": "All-Rel"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "orientationDirectory": "{OutValue}"
            }
        },
        "AperiCloud_2": {
            "nodeType": "AperiCloud",
            "position": [
                1358,
                -54
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "ed193a6e388069b2ea319f8f286dafab6356e5ce"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{CenterBascule_1.projectDirectory}",
                "imagePattern": "\"R.*.JPG\"",
                "SH": "{TapiocaFile_1.PostFix}",
                "orientationDir": "{CenterBascule_1.orientationOut}",
                "ExpTxt": false,
                "Bin": true,
                "RGB": true,
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
                "Out": "AperiCloud_OriAbs_Syst1.ply"
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
        "AperiCloud_3": {
            "nodeType": "AperiCloud",
            "position": [
                1366,
                250
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "625b755a5485cbae72a19145e952e991673bc24d"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{ChgSysCo_1.projectDirectory}",
                "imagePattern": "\"R.*JPG\"",
                "SH": "{TapiocaFile_1.PostFix}",
                "orientationDir": "{ChgSysCo_1.orientationOut}",
                "ExpTxt": false,
                "Bin": true,
                "RGB": true,
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
                "label": "",
                "color": ""
            },
            "outputs": {
                "pointCloud": "{OutValue}"
            }
        },
        "CenterBascule_1": {
            "nodeType": "CenterBascule",
            "position": [
                913,
                -84
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "eab97670bdff7ec03dad5761911a1ed4659c1f23"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "\"R.*.JPG\"",
                "orientationIn": "{Tapas_2.orientationDirectory}",
                "LocalizationOfInformationCenters": "{OriConvertV2_1.Targeted Orientation}",
                "setL1": false,
                "L1": false,
                "CalcV": true,
                "setForceVert": false,
                "ForceVert": 0.0,
                "Out": "tmp"
            },
            "internalInputs": {
                "invalidation": "",
                "comment": "",
                "label": "",
                "color": ""
            },
            "outputs": {
                "orientationOut": "{OutValue}"
            }
        }
    }
}
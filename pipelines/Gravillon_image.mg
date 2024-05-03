{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0-develop",
        "fileVersion": "1.1",
        "template": true,
        "nodesVersions": {
            "CameraInit": "9.0",
            "MicMacProject": "1.0",
            "GCPBascule": "1.1.1",
            "C3DC": "1.1.1",
            "TapiocaAll": "1.1.1",
            "Campari": "0.0",
            "AperiCloud": "1.1.1",
            "Tapas": "1.1.1"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                1033,
                7
            ],
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 29791940,
                        "poseId": 29791940,
                        "path": "D:/Gravillions/2.JPG",
                        "intrinsicId": 344537163,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.600000\", \"DateTime\": \"2012:07:13 14:41:25\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2012:07:13 14:41:25\", \"Exif:DateTimeOriginal\": \"2012:07:13 14:41:25\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0221\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"26\", \"Exif:FocalLengthIn35mmFilm\": \"39\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"14\", \"Exif:MaxApertureValue\": \"4\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"320\", \"Exif:PixelXDimension\": \"4288\", \"Exif:PixelYDimension\": \"2848\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"1\", \"Exif:YCbCrPositioning\": \"2\", \"ExposureTime\": \"0.008\", \"FNumber\": \"6.3\", \"GPS:VersionID\": \"2, 2, 0, 0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D90\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 931832423,
                        "poseId": 931832423,
                        "path": "D:/Gravillions/3.JPG",
                        "intrinsicId": 344537163,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.600000\", \"DateTime\": \"2012:07:13 14:41:34\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2012:07:13 14:41:34\", \"Exif:DateTimeOriginal\": \"2012:07:13 14:41:34\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0221\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"26\", \"Exif:FocalLengthIn35mmFilm\": \"39\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"14\", \"Exif:MaxApertureValue\": \"4\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"320\", \"Exif:PixelXDimension\": \"4288\", \"Exif:PixelYDimension\": \"2848\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"1\", \"Exif:YCbCrPositioning\": \"2\", \"ExposureTime\": \"0.008\", \"FNumber\": \"6.3\", \"GPS:VersionID\": \"2, 2, 0, 0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D90\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 981348298,
                        "poseId": 981348298,
                        "path": "D:/Gravillions/1.JPG",
                        "intrinsicId": 344537163,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.600000\", \"DateTime\": \"2012:07:13 14:41:18\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2012:07:13 14:41:18\", \"Exif:DateTimeOriginal\": \"2012:07:13 14:41:18\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0221\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"26\", \"Exif:FocalLengthIn35mmFilm\": \"39\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"14\", \"Exif:MaxApertureValue\": \"4\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"320\", \"Exif:PixelXDimension\": \"4288\", \"Exif:PixelYDimension\": \"2848\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"1\", \"Exif:YCbCrPositioning\": \"2\", \"ExposureTime\": \"0.008\", \"FNumber\": \"6.3\", \"GPS:VersionID\": \"2, 2, 0, 0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D90\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    },
                    {
                        "viewId": 2144462792,
                        "poseId": 2144462792,
                        "path": "D:/Gravillions/4.JPG",
                        "intrinsicId": 344537163,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"23.600000\", \"DateTime\": \"2012:07:13 14:42:29\", \"Exif:ColorSpace\": \"1\", \"Exif:CompressedBitsPerPixel\": \"4\", \"Exif:Contrast\": \"0\", \"Exif:CustomRendered\": \"0\", \"Exif:DateTimeDigitized\": \"2012:07:13 14:42:29\", \"Exif:DateTimeOriginal\": \"2012:07:13 14:42:29\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0221\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"1\", \"Exif:ExposureProgram\": \"1\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"26\", \"Exif:FocalLengthIn35mmFilm\": \"39\", \"Exif:GainControl\": \"0\", \"Exif:LightSource\": \"14\", \"Exif:MaxApertureValue\": \"4\", \"Exif:MeteringMode\": \"5\", \"Exif:PhotographicSensitivity\": \"320\", \"Exif:PixelXDimension\": \"4288\", \"Exif:PixelYDimension\": \"2848\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:SensingMethod\": \"2\", \"Exif:Sharpness\": \"0\", \"Exif:SubjectDistanceRange\": \"0\", \"Exif:SubsecTime\": \"00\", \"Exif:SubsecTimeDigitized\": \"00\", \"Exif:SubsecTimeOriginal\": \"00\", \"Exif:WhiteBalance\": \"1\", \"Exif:YCbCrPositioning\": \"2\", \"ExposureTime\": \"0.008\", \"FNumber\": \"6.3\", \"GPS:VersionID\": \"2, 2, 0, 0\", \"Make\": \"NIKON CORPORATION\", \"Model\": \"NIKON D90\", \"Orientation\": \"1\", \"ResolutionUnit\": \"in\", \"Software\": \"Ver.1.00 \", \"XResolution\": \"300\", \"YResolution\": \"300\", \"jpeg:subsampling\": \"4:2:2\", \"oiio:ColorSpace\": \"sRGB\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 344537163,
                        "initialFocalLength": 26.0,
                        "focalLength": 26.0,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 2144,
                        "height": 1424,
                        "sensorWidth": 23.6,
                        "sensorHeight": 15.674626865671645,
                        "serialNumber": "D:/Gravillions_NIKON CORPORATION_NIKON D90",
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
                ]
            }
        },
        "MicMacProject_1": {
            "nodeType": "MicMacProject",
            "position": [
                1252,
                -9
            ],
            "inputs": {
                "input": "{CameraInit_1.output}"
            }
        },
        "TapiocaAll_1": {
            "nodeType": "TapiocaAll",
            "position": [
                1466,
                -28
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imageSize": -1
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                1712,
                -30
            ],
            "inputs": {
                "projectDirectory": "{TapiocaAll_1.projectDirectory}",
                "imagePattern": "{TapiocaAll_1.imagePattern}",
                "calibrationModel": "FraserBasic",
                "SH": "{TapiocaAll_1.PostFix}"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                1932,
                -31
            ],
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "{Tapas_1.imagePattern}",
                "SH": "{Tapas_1.SH}",
                "orientationDir": "{Tapas_1.orientationDirectory}"
            }
        },
        "C3DC_1": {
            "nodeType": "C3DC",
            "position": [
                2816,
                116
            ],
            "inputs": {
                "projectDirectory": "{AperiCloud_2.projectDirectory}",
                "imagePattern": "{AperiCloud_2.imagePattern}",
                "SH": "{AperiCloud_2.SH}",
                "orientationDir": "{AperiCloud_2.orientationDir}"
            }
        },
        "Campari_1": {
            "nodeType": "Campari",
            "position": [
                2388,
                113
            ],
            "inputs": {
                "projectDirectory": "{GCPBascule_1.projectDirectory}",
                "imagePattern": "{GCPBascule_1.imagePattern}",
                "inputOrientation": "{GCPBascule_1.orientationOut}",
                "SH": "{AperiCloud_1.SH}"
            }
        },
        "GCPBascule_1": {
            "nodeType": "GCPBascule",
            "position": [
                2175,
                -38
            ],
            "inputs": {
                "projectDirectory": "{AperiCloud_1.projectDirectory}",
                "imagePattern": "{AperiCloud_1.imagePattern}",
                "orientationIn": "{AperiCloud_1.orientationDir}",
                "groundControlPointsFile": "Dico-Appuis.xml",
                "imageMeasurementsFile": "Mesure-Appuis.xml"
            }
        },
        "AperiCloud_2": {
            "nodeType": "AperiCloud",
            "position": [
                2598,
                115
            ],
            "inputs": {
                "projectDirectory": "{Campari_1.projectDirectory}",
                "imagePattern": "{Campari_1.imagePattern}",
                "SH": "{Campari_1.SH}",
                "orientationDir": "{Campari_1.Out}",
                "Out": "AperiCloud2.ply"
            }
        }
    }
}
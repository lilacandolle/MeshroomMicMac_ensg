{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": true,
        "nodesVersions": {
            "C3DC": "1.1.1",
            "GCPCtrl_V3": "1.1.1",
            "TapiocaMulScale": "1.1.1",
            "MicMacProject": "1.0",
            "GCPBascule": "1.1.1",
            "CameraInit": "9.0",
            "Tapas": "1.1.1",
            "AperiCloud": "1.1.1",
            "Campari": "0.0"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                -577,
                62
            ],
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 1491631623,
                        "poseId": 1491631623,
                        "path": "C:/Users/leoni/Documents/ENSG/PID/Test_MicMac/Grealou_MM/DJI_0853.JPG",
                        "intrinsicId": 2708847125,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"AliceVision:SensorWidth\": \"8.000000\", \"DateTime\": \"1970-01-01\", \"Exif:BodySerialNumber\": \"0K8TFC40022369\", \"Exif:ColorSpace\": \"1\", \"Exif:Contrast\": \"0\", \"Exif:DateTimeDigitized\": \"2022:05:26 17:39:35\", \"Exif:DateTimeOriginal\": \"2022:05:26 17:39:35\", \"Exif:DigitalZoomRatio\": \"1\", \"Exif:ExifVersion\": \"0230\", \"Exif:ExposureBiasValue\": \"0\", \"Exif:ExposureMode\": \"0\", \"Exif:ExposureProgram\": \"2\", \"Exif:Flash\": \"0\", \"Exif:FlashPixVersion\": \"0100\", \"Exif:FocalLength\": \"10.26\", \"Exif:FocalLengthIn35mmFilm\": \"28\", \"Exif:GainControl\": \"0\", \"Exif:LensSpecification\": \"28, 28, 2.8, 11\", \"Exif:LightSource\": \"2\", \"Exif:MaxApertureValue\": \"2.971\", \"Exif:MeteringMode\": \"2\", \"Exif:PhotographicSensitivity\": \"200\", \"Exif:PixelXDimension\": \"5472\", \"Exif:PixelYDimension\": \"3648\", \"Exif:Saturation\": \"0\", \"Exif:SceneCaptureType\": \"0\", \"Exif:Sharpness\": \"0\", \"Exif:WhiteBalance\": \"0\", \"Exif:YCbCrPositioning\": \"1\", \"ExposureTime\": \"0.003125\", \"FNumber\": \"5.6\", \"GPS:Altitude\": \"404\", \"GPS:AltitudeRef\": \"0\", \"GPS:Latitude\": \"44, 32, 5.2683\", \"GPS:LatitudeRef\": \"N\", \"GPS:Longitude\": \"1, 51, 45.1692\", \"GPS:LongitudeRef\": \"E\", \"GPS:VersionID\": \"2, 3, 0, 0\", \"IPTC:ModifyDate\": \"1970-01-01\", \"ImageDescription\": \"default\", \"Make\": \"DJI\", \"Model\": \"Test_Pro\", \"Orientation\": \"1\", \"ResolutionUnit\": \"none\", \"Software\": \"10.00.14.06\", \"XResolution\": \"72\", \"YResolution\": \"72\", \"crs:AlreadyApplied\": \"False\", \"crs:HasCrop\": \"0\", \"crs:HasSettings\": \"0\", \"crs:Version\": \"7.0\", \"drone-dji:AbsoluteAltitude\": \"404.3\", \"drone-dji:CamReverse\": \"0\", \"drone-dji:FlightPitchDegree\": \"4.6\", \"drone-dji:FlightRollDegree\": \"-2.6\", \"drone-dji:FlightYawDegree\": \"111.6\", \"drone-dji:GimbalPitchDegree\": \"-84.8\", \"drone-dji:GimbalReverse\": \"0\", \"drone-dji:GimbalRollDegree\": \"0\", \"drone-dji:GimbalYawDegree\": \"115.7\", \"drone-dji:GpsLatitude\": \"44.5348\", \"drone-dji:GpsLongitude\": \"1.86255\", \"drone-dji:RelativeAltitude\": \"9.3\", \"drone-dji:SelfData\": \"Self data\", \"jpeg:subsampling\": \"4:2:0\", \"oiio:ColorSpace\": \"sRGB\", \"rdf:about\": \"DJI Meta Data\"}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 2708847125,
                        "initialFocalLength": 10.26,
                        "focalLength": 10.26,
                        "pixelRatio": 1.0,
                        "pixelRatioLocked": true,
                        "type": "radial3",
                        "width": 5472,
                        "height": 3648,
                        "sensorWidth": 8.0,
                        "sensorHeight": 5.333333333333333,
                        "serialNumber": "0K8TFC40022369",
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
                -386,
                60
            ],
            "inputs": {
                "input": "{CameraInit_1.output}"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                539,
                -145
            ],
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "{Tapas_2.imagePattern}",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "{Tapas_2.orientationDirectory}",
                "Out": "Cloud_Rel.ply"
            }
        },
        "GCPCtrl_V3_1": {
            "nodeType": "GCPCtrl_V3",
            "position": [
                717,
                143
            ],
            "inputs": {
                "projectDirectory": "{GCPBascule_1.projectDirectory}",
                "imagePattern": "{GCPBascule_1.imagePattern}",
                "orientationIn": "{GCPBascule_1.orientationOut}",
                "GCPFile": "{GCPBascule_1.groundControlPointsFile}",
                "imageMeasurementsFile": "{GCPBascule_1.imageMeasurementsFile}",
                "OutTxt": "test_3"
            },
            "internalInputs": {
                "label": "GCPControl"
            }
        },
        "GCPBascule_1": {
            "nodeType": "GCPBascule",
            "position": [
                415,
                155
            ],
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "{Tapas_2.imagePattern}",
                "orientationIn": "{Tapas_2.orientationDirectory}",
                "groundControlPointsFile": "Saisie-S3D.xml",
                "imageMeasurementsFile": "Saisie-S2D.xml"
            }
        },
        "C3DC_1": {
            "nodeType": "C3DC",
            "position": [
                958,
                501
            ],
            "inputs": {
                "projectDirectory": "{Campari_1.projectDirectory}",
                "imagePattern": "{Campari_1.imagePattern}",
                "SH": "{Campari_1.SH}",
                "orientationDir": "{Campari_1.Out}"
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                -85,
                -78
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "SH": "{TapiocaMulScale_1.PostFix}"
            }
        },
        "TapiocaMulScale_1": {
            "nodeType": "TapiocaMulScale",
            "position": [
                -185,
                147
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}"
            }
        },
        "Campari_1": {
            "nodeType": "Campari",
            "position": [
                743,
                375
            ],
            "inputs": {
                "projectDirectory": "{GCPBascule_1.projectDirectory}",
                "imagePattern": "{GCPBascule_1.imagePattern}",
                "inputOrientation": "{GCPBascule_1.orientationOut}",
                "SH": "{Tapas_2.SH}",
                "GCP": {
                    "GCPCtrl": [
                        "",
                        "",
                        "",
                        ""
                    ]
                }
            }
        },
        "Tapas_2": {
            "nodeType": "Tapas",
            "position": [
                148,
                53
            ],
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "D.*JPG",
                "calibrationModel": "FraserBasic",
                "InCal": "{Tapas_1.orientationDirectory}",
                "SH": "{Tapas_1.SH}",
                "Out": "All-Rel"
            }
        },
        "AperiCloud_2": {
            "nodeType": "AperiCloud",
            "position": [
                958,
                269
            ],
            "inputs": {
                "projectDirectory": "{Campari_1.projectDirectory}",
                "imagePattern": "{Campari_1.imagePattern}",
                "SH": "{Campari_1.SH}",
                "orientationDir": "{Campari_1.Out}",
                "ProfCam": 0.0,
                "Out": "AperiCloud2.ply"
            }
        },
        "AperiCloud_3": {
            "nodeType": "AperiCloud",
            "position": [
                772,
                -74
            ],
            "inputs": {
                "projectDirectory": "{GCPBascule_1.projectDirectory}",
                "imagePattern": "{GCPBascule_1.imagePattern}",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "{GCPBascule_1.orientationOut}"
            }
        }
    }
}
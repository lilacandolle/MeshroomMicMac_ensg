{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": true,
        "nodesVersions": {
            "CameraInit": "9.0",
            "TapiocaMulScale": "1.1.1",
            "ChgSysCo": "1.1.1",
            "AperiCloud": "1.1.1",
            "CenterBascule": "1.1.1",
            "OriConvertV2": "1.1.1",
            "Tapas": "1.1.1",
            "MicMacProject": "1.0"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                -419,
                68
            ],
            "inputs": {}
        },
        "MicMacProject_1": {
            "nodeType": "MicMacProject",
            "position": [
                -125,
                80
            ],
            "inputs": {
                "input": "{CameraInit_1.output}"
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                411,
                -234
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imagePattern": "\"R(004054[0-9]|00405[4-5][0-9]|004056[0-0]).JPG\"",
                "SH": "{TapiocaMulScale_1.PostFix}",
                "Out": "Sample4Calib-Rel"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                1374,
                -225
            ],
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "{Tapas_2.imagePattern}",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "All-Rel",
                "Out": "AperiCloud_OriRel.ply"
            }
        },
        "ChgSysCo_1": {
            "nodeType": "ChgSysCo",
            "position": [
                1163,
                94
            ],
            "inputs": {
                "projectDirectory": "{CenterBascule_1.projectDirectory}",
                "imagePattern": "R.*JPG",
                "orientationIn": "{CenterBascule_1.orientationOut}",
                "ChgSyst": "SysCoRTL.xml@SysCoBL72_EPSG31370.xml",
                "Out": "All-BL72_V0"
            }
        },
        "TapiocaMulScale_1": {
            "nodeType": "TapiocaMulScale",
            "position": [
                205,
                47
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imagePattern": "R.*JPG",
                "imageSizeLowResolution": 200,
                "imageSizeHighResolution": 1000
            }
        },
        "OriConvertV2_1": {
            "nodeType": "OriConvertV2",
            "position": [
                442,
                227
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "orientationFile": "GPS_WPK_Grand-Leez.csv",
                "targetedOrientation": "Nav-adjusted-RTL",
                "ChSys": "DegreeWGS84@SysCoRTL.xml",
                "Delay": -0.0787348,
                "NbImC": 0
            }
        },
        "Tapas_2": {
            "nodeType": "Tapas",
            "position": [
                703,
                -234
            ],
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "{TapiocaMulScale_1.imagePattern}",
                "InCal": "{Tapas_1.orientationDirectory}",
                "SH": "{Tapas_1.SH}",
                "Out": "All-Rel"
            }
        },
        "AperiCloud_2": {
            "nodeType": "AperiCloud",
            "position": [
                1358,
                -54
            ],
            "inputs": {
                "projectDirectory": "{CenterBascule_1.projectDirectory}",
                "imagePattern": "{CenterBascule_1.imagePattern}",
                "SH": "{TapiocaMulScale_1.PostFix}",
                "orientationDir": "{CenterBascule_1.orientationOut}",
                "Out": "AperiCloud_OriAbs_Syst1.ply"
            }
        },
        "AperiCloud_3": {
            "nodeType": "AperiCloud",
            "position": [
                1366,
                250
            ],
            "inputs": {
                "projectDirectory": "{ChgSysCo_1.projectDirectory}",
                "imagePattern": "{ChgSysCo_1.imagePattern}",
                "SH": "{TapiocaMulScale_1.PostFix}",
                "orientationDir": "{ChgSysCo_1.orientationOut}"
            }
        },
        "CenterBascule_1": {
            "nodeType": "CenterBascule",
            "position": [
                913,
                -84
            ],
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "R.*JPG",
                "orientationIn": "{Tapas_2.orientationDirectory}",
                "LocalizationOfInformationCenters": "{OriConvertV2_1.Targeted Orientation}",
                "Out": "tmp"
            }
        }
    }
}
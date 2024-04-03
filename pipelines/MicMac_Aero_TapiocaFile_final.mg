{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": true,
        "nodesVersions": {
            "AperiCloud": "1.1.1",
            "MicMacProject": "1.0",
            "TapiocaFile": "1.1.1",
            "Tapas": "1.1.1",
            "ChgSysCo": "1.1.1",
            "CenterBascule": "1.1.1",
            "CameraInit": "9.0",
            "OriConvertV2": "1.1.1"
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
        "TapiocaFile_1": {
            "nodeType": "TapiocaFile",
            "position": [
                182,
                66
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "xmlPath": "FileImagesNeighbour.xml"
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
                "imagePattern": "\"R0040536.JPG|R0040537.JPG|R0040535.JPG|R0040578.JPG|R0040498.JPG|R0040499.JPG|R0040579.JPG|R0040538.JPG|R0040577.JPG|R0040534.JPG|R0040497.JPG|R0040500.JPG|R0040580.JPG|R0040456.JPG|R0040616.JPG|R0040576.JPG|R0040496.JPG|R0040617.JPG|R004045.JPG|R0040457.JPG|R0040615.JPG|R0040539.JPG|R0040501.JPG|R0040581.JPG|R0040533.JPG\"",
                "SH": "{TapiocaFile_1.PostFix}",
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
                "imagePattern": "\"R.*.JPG\"",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "All-Rel",
                "Out": "AperiCloud_OriRel.ply"
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
                "imagePattern": "\"R.*.JPG\"",
                "orientationIn": "{Tapas_2.orientationDirectory}",
                "LocalizationOfInformationCenters": "{OriConvertV2_1.Ori_chgmt_sys}",
                "Out": "tmp",
                "CalcV": true
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
        "ChgSysCo_1": {
            "nodeType": "ChgSysCo",
            "position": [
                1163,
                94
            ],
            "inputs": {
                "projectDirectory": "{CenterBascule_1.projectDirectory}",
                "imagePattern": "\"R.*JPG\"",
                "orientationIn": "{CenterBascule_1.orientationOut}",
                "ChgSyst": "SysCoRTL.xml@SysCoBL72_EPSG31370.xml",
                "Out": "All-BL72_V0"
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
                "imagePattern": "\"R.*.JPG\"",
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
                "imagePattern": "\"R.*.JPG\"",
                "SH": "{TapiocaFile_1.PostFix}",
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
                "imagePattern": "\"R.*JPG\"",
                "SH": "{TapiocaFile_1.PostFix}",
                "orientationDir": "{ChgSysCo_1.orientationOut}"
            }
        }
    }
}
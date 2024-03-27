{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0",
        "fileVersion": "1.1",
        "template": true,
        "nodesVersions": {
            "Tapas": "1.1.1",
            "CameraInit": "9.0",
            "MicMacProject": "1.0",
            "C3DC": "1.1.1",
            "SaisieMasqQT": "1.1.1",
            "TapiocaAll": "1.1.1",
            "AperiCloud": "1.1.1"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                -6,
                -243
            ],
            "inputs": {}
        },
        "MicMacProject_1": {
            "nodeType": "MicMacProject",
            "position": [
                196,
                -246
            ],
            "inputs": {
                "input": "{CameraInit_1.output}"
            }
        },
        "TapiocaAll_1": {
            "nodeType": "TapiocaAll",
            "position": [
                401,
                -244
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imageSize": 1500
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                623,
                -254
            ],
            "inputs": {
                "projectDirectory": "{TapiocaAll_1.projectDirectory}",
                "imagePattern": "{TapiocaAll_1.imagePattern}",
                "calibrationModel": "RadialStd",
                "setFocs": true,
                "SH": "{TapiocaAll_1.PostFix}",
                "Out": "F24"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                1114,
                -255
            ],
            "inputs": {
                "projectDirectory": "{Tapas_2.projectDirectory}",
                "imagePattern": "{Tapas_2.imagePattern}",
                "SH": "{Tapas_2.SH}",
                "orientationDir": "{Tapas_2.orientationDirectory}"
            }
        },
        "SaisieMasqQT_1": {
            "nodeType": "SaisieMasqQT",
            "position": [
                1624,
                -327
            ],
            "inputs": {
                "projectDirectory": "{AperiCloud_1.projectDirectory}",
                "filePath": "DSC_3128.JPG",
                "setPostfix": true,
                "Name": "marsque"
            }
        },
        "C3DC_1": {
            "nodeType": "C3DC",
            "position": [
                1631,
                -197
            ],
            "inputs": {
                "projectDirectory": "{AperiCloud_1.projectDirectory}",
                "imagePattern": "DSC_313[2-9].JPG",
                "SH": "{AperiCloud_1.SH}",
                "orientationDir": "{AperiCloud_1.orientationDir}",
                "mode": "BigMac"
            }
        },
        "Tapas_2": {
            "nodeType": "Tapas",
            "position": [
                866,
                -255
            ],
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "{Tapas_1.imagePattern}",
                "calibrationModel": "RadialStd",
                "InOri": "{Tapas_1.orientationDirectory}",
                "SH": "{Tapas_1.SH}",
                "Out": "All"
            }
        }
    }
}
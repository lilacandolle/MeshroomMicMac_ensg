{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2023.3.0-develop",
        "fileVersion": "1.1",
        "template": true,
        "nodesVersions": {
            "Tapas": "1.1.1",
            "C3DC": "1.1.1",
            "SaisieMasqQT": "1.1.1",
            "AperiCloud": "1.1.1",
            "MicMacProject": "1.0",
            "CameraInit": "9.0",
            "TapiocaMulScale": "1.1.1"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                261,
                221
            ],
            "inputs": {}
        },
        "MicMacProject_1": {
            "nodeType": "MicMacProject",
            "position": [
                458,
                206
            ],
            "inputs": {
                "input": "{CameraInit_1.output}"
            }
        },
        "TapiocaMulScale_1": {
            "nodeType": "TapiocaMulScale",
            "position": [
                677,
                190
            ],
            "inputs": {
                "projectDirectory": "{MicMacProject_1.projectDirectory}",
                "imageSizeHighResolution": 2500
            }
        },
        "Tapas_1": {
            "nodeType": "Tapas",
            "position": [
                893,
                189
            ],
            "inputs": {
                "projectDirectory": "{TapiocaMulScale_1.projectDirectory}",
                "imagePattern": "{TapiocaMulScale_1.imagePattern}",
                "calibrationModel": "RadialStd",
                "SH": "{TapiocaMulScale_1.PostFix}",
                "Out": "Fontaine"
            }
        },
        "AperiCloud_1": {
            "nodeType": "AperiCloud",
            "position": [
                1112,
                188
            ],
            "inputs": {
                "projectDirectory": "{Tapas_1.projectDirectory}",
                "imagePattern": "{Tapas_1.imagePattern}",
                "SH": "{Tapas_1.SH}",
                "orientationDir": "{Tapas_1.orientationDirectory}",
                "Out": "AperiCloud_Fontaine.ply"
            }
        },
        "SaisieMasqQT_1": {
            "nodeType": "SaisieMasqQT",
            "position": [
                1299,
                190
            ],
            "inputs": {
                "projectDirectory": "{AperiCloud_1.projectDirectory}",
                "filePath": "{AperiCloud_1.pointCloud}"
            }
        },
        "C3DC_1": {
            "nodeType": "C3DC",
            "position": [
                1476,
                306
            ],
            "inputs": {
                "projectDirectory": "{SaisieMasqQT_1.projectDirectory}",
                "imagePattern": "{AperiCloud_1.imagePattern}",
                "SH": "{AperiCloud_1.SH}",
                "orientationDir": "{AperiCloud_1.orientationDir}"
            }
        }
    }
}
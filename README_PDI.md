Le guide d'installation peut être trouvé ici: https://micmac.ensg.eu/index.php/MicMacRoom_Installation (uniquement accesible avec Firefox)

Si ce n'est pas accesible, voici une copie de la page:

## Information
This guide will cover the installation of MicMacRoom on WINDOWS.

Throughout this guide, MicMacRoom and Meshroom MicMac refer to the same thing; both terms are interchangeable.

## Necessary software needed for installation

### MicMac Installation

In the current version of MicMacRoom, you will need MicMac v1.1.1. To install it, go to [the MicMac GitHub](https://github.com/micmacIGN/micmac/releases) and download the `micmac_windows.zip` under the v1.1.1 release. Then, follow the [tutorial here](Install MicMac Windows). Make sure that MicMac is not installed in the Program Files folder.

### Meshroom Installation

In the current version of MicMacRoom, you will need Meshroom 2023.3.0. To install it, go to [the Meshroom GitHub](https://github.com/alicevision/Meshroom/releases) and download `Meshroom-2023.3.0` for Windows under Meshroom 2023.3.0. Unzip it, and that's it. You can launch it simply by clicking on the `.exe` file.

## MicMacRoom Installation

Now that you have the required software, you can install MicMacRoom itself. Go to the [MicMacRoom GitHub](https://github.com/alicevision/MeshroomMicMac) and then, either do a git clone of the repository or simply download it as a ZIP by clicking the green "<> Code" button and then "Download ZIP". Unzip it in the folder of your choice, preferably not Program Files nor the folder containing either MicMac or Meshroom.

Then, access the environment variables (on Windows 10, right-click on the Windows logo on the bottom of your screen -> then System -> then, on the right "Advanced system settings" -> then at the bottom "Environment Variables"). If you have installed MicMac, you should be familiar with this screen. We need to add two new variables, to do so click on New and then add:

- Variable Name: `MESHROOM_NODES_PATH`, Variable Value = full file path to the MicMacRoom folder, for example `C:\MeshroomMicMac`.
- Variable Name: `MESHROOM_PIPELINE_TEMPLATES_PATH`, Variable Value = full file path to the MicMacRoom folder/pipelines, for example `C:\Meshroom\pipelines`.

## Verification

Close all settings windows, go to your Meshroom installation folder, and open Meshroom by double-clicking on the `.exe`. If you want to check whether the installation has worked, then go to the "Graph Editor" at the bottom of the Meshroom window, and right-click. If there is a MicMac category in the menu that appears, then you should be good.
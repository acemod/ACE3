---
layout: wiki
title: Setting Up the Development Environment
description: This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE and utilize file patching.
group: development
parent: wiki
order: 0
---

This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE and utilize file patching.


## 1. Requirements

- Arma 3
- Arma 3 Tools (available on Steam)
- Run Arma 3 and Arma 3 Tools directly from steam once to install registry entries (and again after every update)
- [CBA](https://github.com/CBATeam/CBA_A3/releases/latest) mod (release or development version)

**HEMTT:** _(recommended)_
- [Windows] PowerShell v3.0+ _(pre-installed on Windows 8 or newer)_
- [HEMTT](https://hemtt.dev/installation) (>=v1.7.2)
    - `hemtt` (Linux / MacOS) or `hemtt.exe` (Windows)

**Mikero Tools:**
- P-drive
- [Python 3.x](https://www.python.org/)
- [Mikero Tools](https://mikero.bytex.digital/Downloads): DePbo, DeOgg, Rapify, MakePbo, PboProject >=3.16
  - `*.hpp` removed from PboProject's "Exclude From Pbo" list
- Python, Mikero Tools and Git in PATH environment variable


## 2. Why so complicated?

If you have contributed to AGM you might be used to an easier build process, where there was even an .exe you could use for building. ACE3, however, makes use of CBA macros to simplify things and give the developer access to a better debug process, which requires a stricter build environment. Additionally, HEMTT and Mikero's Tools are stricter and report more errors than AddonBuilder does. The structure of this development environment also allows for [file patching](#7-file-patching), which is very useful for debugging.

Not including `.exe`s in the repository for the tools we use allows us to make easy changes without the hassle of compiling self-extracting exes all the time.


## 3. Getting Source Code

To actually get the ACE3 source code on your machine, it is recommended that you use Git. Tutorials for this are all around the web, and it allows you to track your changes and easily update your local copy.

If you just want to create a quick and dirty build, you can also directly download the source code using the "Download ZIP" button on the front page of the GitHub repo.


## 4. Setup and Building (HEMTT)

_Replace `hemtt` with `hemtt.exe` on Windows. P-drive is **not** required for HEMTT or file patching._

### 4.1 Initial Setup

Install HEMTT using the instructions provided in [The HEMTT Book](https://hemtt.dev/installation).

(Windows and Linux - binarization supported only on Windows at this time).

#### 4.1.1 File Patching Setup

ACE3 comes pre-configured for testing with [file patching](#file-patching) using only CBA's latest published version. You must subscribe to [CBA_A3](https://steamcommunity.com/workshop/filedetails/?id=450814997) on the Workshop.

If you intend to test using file patching with CBA versions different than latest published, or with other mods, further setup is required. First, create a folder called `z` in your Arma 3 directory. Then run the following command as admin, replacing the text in brackets with the appropriate paths:

```bat
mklink /J "[Arma 3 installation folder]\z\ace" "[location of the ACE3 project]/.hemttout/dev"
```

### 4.2 Creating a Development Build

Run `$ hemtt dev` to build the mod for use with [file patching](#file-patching) (with links to the original addon folders) without binarization (faster and often not needed for development). This will populate the `.hemttout/dev` folder with unbinarized PBOs, with links back to the original addon folders. You cannot distribute this build to others.

Run `$ hemtt launch` to run ACE3 with pre-configured file patching. _Uses `$ hemtt dev` before launching Arma._

To launch a development build using file patching with CBA versions different than latest published, or with other mods, you must build the mod with `$ hemtt dev` and start the game by providing a modline:
```bat
-mod=@CBA_A3;z\ace -skipIntro -noSplash -showScriptErrors -debug -filePatching
```

### 4.3 Creating a Test Build

To create a development build to test changes or to debug something, execute `build.bat` (double-click on Windows) or run `$ hemtt build` in the root folder. This will populate the `.hemttout/build` folder with binarized PBOs. This type of build is meant for sharing, group testing, but not for release.

To start the game using this build, you can use the following modline:
```bat
-mod=@CBA_A3;z\ace -skipIntro -noSplash -showScriptErrors -debug
```

### 4.4 Creating a Release Build

To create a complete build that you can use without the source files, with full binarization and all optimizations, run `$ hemtt release` in the root folder. This will populate the `.hemttout/release` folder with binarized PBOs  and an archive in `releases` that you can redistribute. These handle like those of any other mod.

## 7. File Patching

File Patching allows you to change the files in an addon while the game is running, requiring only a restart of the mission. This makes it great for debugging, as it cuts down the time required between tests.

To run Arma 3 with file patching add the `-filePatching` startup parameter (since Arma 3 v1.50, file patching is disabled by default).

### 7.1 Disabling CBA Function Caching

By default CBA caches a compiled version of functions to reduce mission load times. This interferes with file patching. There are three ways to disable function caching:

- Load `cba_cache_disable.pbo` (included in CBA's optional folder - simply move it to `addons` folder for the time being)
- Add the following to your test missions description.ext:

```cpp
class CfgSettings {
    class CBA {
        class Caching {
            compile = 0;
            xeh = 0;
            functions = 0;
        };
    };
};
```

- To only disable caching for a single module, hence greatly improving mission restart time, add the following line to the `script_component.hpp` file of said module (prepared in each ACE3 component, simply uncomment):

```sqf
#define DISABLE_COMPILE_CACHE
```

All functions in module with `DISABLE_COMPILE_CACHE` line can be recompiled without mission restart with `[] call ACE_PREP_RECOMPILE;` command. You can add a addAction/keybind/pfeh with this code and use it for fast recompiling.

### 7.2 Restrictions

Files must exist in the built PBOs for file patching to work. If you create a new file you must rebuild the PBO or Arma will not find it in your file paths.

Configs are not patched during run time, only at load time. You do not have to rebuild a PBO to make config changes, just restart Arma. You can get around this though if you are on the dev branch of Arma 3 and running the [diagnostic exe](https://community.bistudio.com/wiki/Arma_3_Diagnostics_Exe). That includes `diag_mergeConfigFile` which takes a full system path (as in `diag_mergeConfigFile  ["p:\z\ace\addons\my_module\config.cpp"]`) and allows you selectively reload config files.

If you need to add/remove files, then you'll need to run HEMTT again without the game running, and restart. That is all that is required to add new files for further use in testing.

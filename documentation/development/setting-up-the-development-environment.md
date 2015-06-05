---
layout: wiki
title: Setting Up The Development Environment
description: This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE and utilize file patching. 
group: development
parent: wiki
order: 0
---

This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE and utilize file patching.


## 1. Requirements

- Arma 3 (duh)
- A proper installation of the Arma 3 Tools (available on Steam)
- A properly setup P-drive
- Run ArmA 3 and Arma 3 Tools directly from steam once to install registry entries (and again after every update)
- Python 3.x, available [here](http://www.python.org)
- The following Mikero Tools (available [here](https://dev.withsix.com/projects/mikero-pbodll/files)): DePBO, Rapify, MakePBO, PBOProject
- A properly setup PATH variable (containing Python and the Mikero tools)


## 2. Why so complicated?

If you have contributed to AGM you might be used to an easier build process, where there was even an .exe you could use for building. ACE3, however, makes use of CBA macros to simplify things and give the developer access to a better debug process, which requires a stricter build environment. Additionally, Mikero's tools are stricter and report more errors than AddonBuilder does. The structure of this development environment also allows for [file patching](#file-patching), which is very useful for debugging.

Not offering .exes for the Python scripts we use allows us to make easy changes without the hassle of compiling self-extracting exes all the time.


## 3. Getting ACE

To actually get the ACE source code on your machine, it is recommended that you use Git. Tutorials for this are all around the web, and it allows you to track your changes and easily update your local copy.

If you just want to create a quick and dirty build, you can also directly download the source code using the "Download ZIP" button on the front page of the GitHub repo.


## 4. Initial Setup

After ensuring that you have installed all requirements, execute the `setup.py` script found in the `tools` folder. This will do most of the heavy lifting for you, create the links you need and copy the required CBA code to the proper place. Please note that these links are tied to the location of your ACE3 source code, so make sure that the project folder is where you want it to be. We recommend that you store the ACE3 project on your P-drive.

### 4.1 Manual Setup

Should the script fail, here is how you create the required links manually:

First, to set up the links, create `z` folders both in your Arma 3 directory and on your P-drive. Then run the following commands as admin, replacing the text in brackets with the appropriate paths:

Windows 8:

```
mklink /D /J "[Arma 3 installation folder]\z\ace" "[location of the ACE3 project]"
mklink /D /J "P:\z\ace" "[location of the ACE3 project]"
```

Windows 7 and Vista:

```
mklink /D "[Arma 3 installation folder]\z\ace" "[location of the ACE3 project]"
mklink /D "P:\z\ace" "[location of the ACE3 project]"
```

Then, copy the `cba` folder from the `tools` folder to `P:\x\cba`. Create the `x` folder if needed. That folder contains the parts of the CBA source code that are required for the macros to work.


## 5. Creating a Test Build

To create a development build of ACE to test changes or to debug something, run the `build.py` file in the `tools` folder. This will populate the `addons` folder with binarized PBOs. These PBOs still point to the source files in their respective folders however, which allows you to use [file patching](#file-patching).

This also means that you cannot distribute this build to others.

To start the game using this build, you can use the following modline:

```
-mod=@cba_a3;z\ace
```


## 6. Creating a Release Build

To create a complete build of ACE that you can use without the source files, run the `make.py` file in the `tools` folder. This will populate the `release` folder with binarized PBOs that you can redistribute. These handle like those of any other mod.


## 7. File Patching

File Patching allows you to change the files in an addon while the game is running, requiring only a restart of the mission. This makes it great for debugging, as it cuts down the time required between tests. Note that this only works with PBOs created using MakePBO, as outlined in [Creating a Test Build](#creating-a-test-build).

### 7.1 Enabling File Patching

There are two ways to enable file patching:

- Load cba_cache_disable.pbo (included in CBA's optional folder)
- Add the following to your test missions description.ext:

```c++
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

### 7.2 Restrictions of File Patching

Files must exist in the built PBOs for filepatching to work. If you create a new file you must rebuild the PBO or Arma will not find it in your file paths.

Configs are not patched during run time, only at load time. You do not have have to rebuild a PBO to make config changes, just restart Arma. You can get around this though if you are on the dev branch of Arma 3 and running the diagnostic exe. That includes `diag_mergeConfig` which takes a full system path (as in `p:\z\ace\addons\my_module\config.cpp`) and allows you selectivly reload config files.

If you need to add/remove files, then you'll need to run build.py again without the game running, and restart. That is all that is required to add new files to then further use in testing.

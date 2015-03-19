---
layout: wiki
title: Setting up the development environment
group: dev
parent: wiki
order: 0
---

The folder structure and pathing here is setup in such a way that you can quickly and easily setup your environment to allow for dynamic loading of changes, and also your build environment is set up at the same time. Our structure allows you to basically dynamically load modules for testing, as well as quick building/rebuilding of PBO's.

## What this allows us to do

Using this set up allows you to do dynamic editing of files existing within an addon while the game is running, just requiring a mission reload for the changes to take affect. So, for example, you can use a test mission which is calling `ACE_boobAddon_fnc_balls`, this set up you can dynamically edit that file directly in your source tree and then reload your mission, and the changes take affect. 

*New Files and Config changes do not take affect here* - If you add a SQF, or make changes to a Config file, you'll need to reload your game unless you are using the dev branch.

## Initial Installations

We will be making the following assumptions for the sake of this article on where you have things installed:

  1. ArmA3 Install: C:\Program Files (x86)\Steam\steamapps\common\ArmA 3
  2. ArmA3 Tools: C:\Program Files (x86)\Steam\steamapps\common\ArmA 3 Tools
  3. Mikero's tools must be installed. Specifically, makepbo is used for dev testing builds. These must be in your PATH variable
  4. Your clone of the ACE3 git repository is c:\dev\ace3
  5. The P: drive is setup correctly.
  6. Install mikeros makepbo from `https://dev.withsix.com/projects/mikero-pbodll/files`
  7. Git pull the latest version to that same folder from `git://git.withsix.com/pbodll-release.git`

## Setting up your Links

With our folder structure, we can configure an entire development/testing setup with just a few windows symbolic links. This allows us to load "uncompiled" addon code and dynamically test in the mission editor (called file patching in Arma technical terms). We will need to link our ACE3 development folder in the arma3 and P: directories.

Make the \z folder first in both locations.
You will need to run the following commands in a command prompt window as Administrator:

Windows 8:

```powershell
mklink /D /J "C:\Program Files (x86)\Steam\steamapps\common\ArmA 3\z\ace" "C:\dev\ACE3"
mklink /D /J "P:\z\ace" "C:\dev\ACE3"
```

Windows 7 and Vista:

```powershell
mklink /D "C:\Program Files (x86)\Steam\steamapps\common\ArmA 3\z\ace" "C:\dev\ACE3"
mklink /D "P:\z\ace" "C:\dev\ACE3"
```

## How to use it

You'll still need pbos created - use the tools\build.bat file for quick, unbinarized building.  we'll need the pbo's build and present in your c:\dev\ace3\addons\ folder just as if it were the real addons folder.

After the pbo's are built, you will change your modline to load the following instead:

```powershell
-mod=@cba_a3;z\ace
```

This will load our new linked structure, directly from the source tree, instead of the actual addon (folder @ace3). 

## Restrictions

Files must exist in the built PBOs for filepatching to work. If you create a new file you must rebuild the PBO or Arma will not find it in your file paths.

Configs are not patched during run time, only at load time. You do not have have to rebuild a PBO to make config changes, just restart Arma. You can get around this though if you are on the dev branch of Arma 3 and running the diagnostic exe. That includes `diag_mergeConfig` which takes a full system path (as in `p:\z\ace\addons\my_module\config.cpp`) and allows you selectivly reload config files.

*If you need to add/remove files* Then you'll need to run build.bat again without the game running, and restart. That is all that is required to add new files to then further use in testing.


## Enabling File Patching

You have two options for file patching to work. 

  * you can load `cba_cache_disable.pbo`
  * Add the following to your test missions description.ext

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

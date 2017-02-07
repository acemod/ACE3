---
layout: wiki
title: Setting Up The Development Environment
description: This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE3 and utilize file patching.
group: development
parent: wiki
order: 0
---

This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE3 and utilize file patching.


## 1. Getting Source Code

To actually get the ACE3 source code on your machine, it is recommended that you use Git. Tutorials for this are all around the web, and it allows you to track your changes and easily update your local copy.

If you just want to create a quick and dirty build, you can also directly download the source code using the "Download ZIP" button on the front page of the GitHub repo.


## 2. Setup and Building

### 2.1 Windows

On Windows, you can use the make.bat file for creating a simple build of all PBOs using the packaged version of armake.

If you want more advanced features like only rebuilding changed addons or automated release packaging, you'll have to aquire `make` for Windows or use a Linux environment on Windows such as Cygwin or the Windows Subsystem for Linux in Windows 10 and then simply follow the Linux instructions.

### 2.2 Linux

On Linux, you'll have to aquire armake from the appropriate source for your distribution. Check the [armake repository](https://github.com/KoffeinFlummi/armake) for instructions for your distribution. Example for Ubuntu:

```sh
$ sudo add-apt-repository ppa:koffeinflummi/armake
$ sudo apt-get update
$ sudo apt-get install armake
```

Then, simply navigate to the ACE3 project directory and run `$ make`

Other make targets include:

- `$ make signatures` - Creates a signed build.
- `$ make release` - Creates a signed build and packages it into a zip file ready for release.
- `$ make filepatching` - Creates a build usable for filepatching.


## 3. File Patching

File Patching allows you to change the files in an addon while the game is running, requiring only a restart of the mission. This makes it great for debugging, as it cuts down the time required between tests. Note that this only works with PBOs created using `$ make filepatching`.

For file patching to work, you need a symbolic link from "[Arma 3 installation folder]/z/ace" to your ACE3 project folder. To do this on Windows and Linux respectively, run these commands:

```sh
$ # Windows
$ mkdir "[Arma 3 installation folder]\z"
$ mklink /J "[Arma 3 installation folder]\z\ace" "[location of the ACE3 project]"

$ # Linux
$ mkdir "[Arma 3 installation folder]/z"
$ ln -s "[Arma 3 installation folder]/z/ace" "[location of the ACE3 project]"
```

To run Arma 3 with file patching add the `-filePatching` startup parameter (since Arma 3 v1.50, file patching is disabled by default).

### 3.1 Disabling CBA Function Caching

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

```cpp
#define DISABLE_COMPILE_CACHE
```

### 3.2 Restrictions

Files must exist in the built PBOs for file patching to work. If you create a new file you must rebuild the PBO or Arma will not find it in your file paths.

Configs are not patched during run time, only at load time. You do not have have to rebuild a PBO to make config changes, just restart Arma. You can get around this though if you are on the dev branch of Arma 3 and running the [diagnostic exe](https://community.bistudio.com/wiki/Arma_3_Diagnostics_Exe). That includes `diag_mergeConfigFile` which takes a full system path (as in `diag_mergeConfigFile  ["p:\z\ace\addons\my_module\config.cpp"]`) and allows you selectively reload config files.

If you need to add/remove files, then you'll need to run `build.py` again without the game running, and restart. That is all that is required to add new files for further use in testing.

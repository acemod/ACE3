---
layout: wiki
title: Setting Up The Development Environment
description: This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE and utilize file patching.
group: development
parent: wiki
order: 0
---

This page describes how you can setup your development environment for ACE3, allowing you to properly build ACE and utilize file patching.


## 1. Getting ACE

To actually get the ACE source code on your machine, it is recommended that you use Git. Tutorials for this are all around the web, and it allows you to track your changes and easily update your local copy.

If you just want to create a quick and dirty build, you can also directly download the source code using the "Download ZIP" button on the front page of the GitHub repo.


## 2. Building ACE

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

### 3.1 Disabling CBA Function Caching

By default CBA caches a compiled version of functions to reduce mission load times. This interferes with file patching. There are three ways to disable function caching:

- Load `cba_cache_disable.pbo` (included in CBA's optional folder)
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

- To only disable caching for a single module, hence greatly improving mission restart time, add the following line to the `script_component.hpp` file of said module:

```cpp
#define DISABLE_COMPILE_CACHE
```

### 3.2 Running Arma 3 with File Patching Enabled

Starting from version 1.50, Arma 3 was changed to disable file patching by default, making the feature opt-in. To execute the game with file patching enabled add the `-filePatching` flag to the command line.

### 3.3 Restrictions of File Patching

Files must exist in the built PBOs for file patching to work. If you create a new file you must rebuild the PBO or Arma will not find it in your file paths.

Configs are not patched during run time, only at load time. You do not have have to rebuild a PBO to make config changes, just restart Arma. You can get around this though if you are on the dev branch of Arma 3 and running the [diagnostic exe](https://community.bistudio.com/wiki/Arma_3_Diagnostics_Exe). That includes `diag_mergeConfigFile` which takes a full system path (as in `diag_mergeConfigFile  ["p:\z\ace\addons\my_module\config.cpp"]`) and allows you selectively reload config files.

If you need to add/remove files, then you'll need to run `$ make filepatching` again without the game running, and restart. That is all that is required to add new files to then further use in testing.

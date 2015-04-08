---
layout: wiki
title: Extension Guidelines
group: dev
parent: wiki
order: 9
---

## Basics

### Requirements

- A compiler (VS/GCC/Clang) 
    - If starting with visual studio, you need to make sure to use the Visual studio command prompt
- cmake 3.0 or later in your path

### Cross-Platform Guidelines

### C++ basic style and naming guide

### ace_common cpp library

---

## Building Extensions on Windows

### Compiling 

#### Windows - Creating a Visual Studio Project
1. Open your compiling command prompt (which has cmake and your compiler)
2. From this directory, you need to use cmake to build the appropriate build files. Change the -G property appropriately. run cmake --help to get a list of the options.

```
cd extensions\build
cmake .. -G "Visual Studio 2014"
```

A Visual studio project file will now be generated in your build directory.

#### Windows - Visual Studio - Compile only (nmake)
1. Open your compiling command prompt (which has cmake and your compiler)
2. From this directory, you need to use cmake to build the appropriate build files. Change the -G property appropriately. run cmake --help to get a list of the options.

```
cd extensions\build
cmake .. -G "NMake Makefiles"
nmake
```

The extensions will not be built in its appropriate project folder, for example:

```
extensions\
    build\
        fcs\ace_fcs.dll
        somethingElse\ace_somethingElse.dll
```

### Creating a New Extension

---
layout: wiki
title: Extension Guidelines
description: 
group: development
parent: wiki
order: 9
---

## 1. Basics

### 1.1 Requirements

- A compiler (VS/GCC/Clang) 
    - If starting with Visual Studio, you need to make sure to use the Visual studio command prompt
- cmake 3.0 or later in your path

### 1.2 Cross-Platform Guidelines

### 1.3 C++ basic style and naming guide

### 1.4 ace_common cpp library

---

## 2 Building Extensions on Windows

###  2.1 Compiling 

####  2.1.1 Windows - Creating a Visual Studio Project
1. Open your compiling command prompt (which has cmake and your compiler)
2. From this directory, you need to use cmake to build the appropriate build files. Change the -G property appropriately. run cmake --help to get a list of the options.

```
cd extensions\build
cmake .. -G "Visual Studio 15 2017 Win64"
```

A Visual studio project file will now be generated in your build directory.

#### 2.1.2 Windows - Visual Studio - Compile only (nmake)
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

### 2.2 Creating a new Extension

#### 2.2.1 Arma Config

ACE3 loads extensions defined in `ACE_Extensions` root config class and supports the following entries:

```cpp
// Platform
windows = 1; // Load on Windows
linux = 1;   // Load on Linux

// Type
client = 1;  // Load on Client
server = 1;  // Load on Server
```

```cpp
class ACE_Extensions {
    // Windows Client only extension
    class tag_extension {
       windows = 1;
       client = 1;
    };

    // Any platform Server extension
    class tag_extension2 {
        windows = 1;
        linux = 1;
        server = 1;
    };
};
```

Combining platform and client/server values is possible to get all combinations currently supported by the game and more.

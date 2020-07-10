#!/usr/bin/env python3
# vim: set fileencoding=utf-8 :

# make.py
# An Arma 3 addon build system

###############################################################################

# The MIT License (MIT)

# Copyright (c) 2013-2014 Ryan Schultz

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

###############################################################################

import sys
import os
import os.path
import shutil
import platform
import glob
import subprocess
import hashlib
import configparser
import json
import traceback
import time
import timeit
import re
import fileinput
if sys.platform == "win32":
    import winreg

def compile_extensions(force_build):
    originalDir = os.getcwd()
    extensions_root = os.path.join(os.path.dirname(os.getcwd()), "extensions")
    os.chdir(extensions_root)
    print("\nCompiling extensions in {} with rebuild:{}\n".format(extensions_root,force_build))

    if shutil.which("git") == None:
        print("Failed to find Git!")
        return
    if shutil.which("cmake") == None:
        print("Failed to find CMake!")
        return
    if shutil.which("msbuild") == None:
        print("Failed to find MSBuild!")
        return

    try:
        buildType = "rebuild" if force_build else "build"
        # 32-bit
        vcproj32 = os.path.join(extensions_root,"vcproj")
        if not os.path.exists(vcproj32): os.mkdir(vcproj32)
        os.chdir(vcproj32)
        subprocess.call(["cmake", "..", "-A", "Win32"])  #note: cmake will update ace_version stuff
        subprocess.call(["msbuild", "ACE.sln", "/m", "/t:{}".format(buildType), "/p:Configuration=Release"])

        # 64-bit
        vcproj64 = os.path.join(extensions_root,"vcproj64")
        if not os.path.exists(vcproj64): os.mkdir(vcproj64)
        os.chdir(vcproj64)
        subprocess.call(["cmake", "..", "-A", "x64"])
        subprocess.call(["msbuild", "ACE.sln", "/m", "/t:{}".format(buildType), "/p:Configuration=Release"])
    except Exception as e:
        print("Error: COMPILING EXTENSIONS - {}".format(e))
        raise
    finally:
        os.chdir(originalDir)

def main(argv):
    if "force" in argv:
        argv.remove("force")
        force_build = True
    else:
        force_build = False
        
    compile_extensions(force_build)

if __name__ == "__main__":
    start_time = timeit.default_timer()
    main(sys.argv)
    print("\nTotal Program time elapsed: {0} sec".format(timeit.default_timer() - start_time))
    # input("Press Enter to continue...")

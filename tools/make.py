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

__version__ = "0.4"

import sys

if sys.version_info[0] == 2:
    print("Python 3 is required.")
    sys.exit(1)

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
import re

if sys.platform == "win32":
    import winreg

######## GLOBALS #########
ACE_VERSION = "3.0.0.3"
work_drive = ""
module_root = ""
make_root = ""
release_dir = ""
module_root_parent = ""
optionals_root = ""
key_name = "ace"
key = ""
dssignfile = ""
prefix = "ace"
pbo_name_prefix = "ace_"
signature_blacklist = ["ace_server.pbo"]

###############################################################################
# http://akiscode.com/articles/sha-1directoryhash.shtml
# Copyright (c) 2009 Stephen Akiki
# MIT License (Means you can do whatever you want with this)
#  See http://www.opensource.org/licenses/mit-license.php
# Error Codes:
#   -1 -> Directory does not exist
#   -2 -> General error (see stack traceback)
def  get_directory_hash(directory):
    directory_hash = hashlib.sha1()
    if not os.path.exists (directory):
        return -1

    try:
        for root, dirs, files in os.walk(directory):
            for names in files:
                path = os.path.join(root, names)
                try:
                    f = open(path, 'rb')
                except:
                    # You can't open the file for some reason
                    f.close()
                    continue

                while 1:
                    # Read file in as little chunks
                    buf = f.read(4096)
                    if not buf: break
                    new = hashlib.sha1(buf)
                    directory_hash.update(new.digest())
                f.close()

    except:
        # Print the stack traceback
        traceback.print_exc()
        return -2

    retVal = directory_hash.hexdigest()
    #print_yellow("Hash Value for {} is {}".format(directory,retVal))
    return directory_hash.hexdigest()

# Copyright (c) André Burgaud
# http://www.burgaud.com/bring-colors-to-the-windows-console-with-python/
if sys.platform == "win32":
    from ctypes import windll, Structure, c_short, c_ushort, byref

    SHORT = c_short
    WORD = c_ushort

    class COORD(Structure):
      """struct in wincon.h."""
      _fields_ = [
        ("X", SHORT),
        ("Y", SHORT)]

    class SMALL_RECT(Structure):
      """struct in wincon.h."""
      _fields_ = [
        ("Left", SHORT),
        ("Top", SHORT),
        ("Right", SHORT),
        ("Bottom", SHORT)]

    class CONSOLE_SCREEN_BUFFER_INFO(Structure):
      """struct in wincon.h."""
      _fields_ = [
        ("dwSize", COORD),
        ("dwCursorPosition", COORD),
        ("wAttributes", WORD),
        ("srWindow", SMALL_RECT),
        ("dwMaximumWindowSize", COORD)]

    # winbase.h
    STD_INPUT_HANDLE = -10
    STD_OUTPUT_HANDLE = -11
    STD_ERROR_HANDLE = -12

    # wincon.h
    FOREGROUND_BLACK     = 0x0000
    FOREGROUND_BLUE      = 0x0001
    FOREGROUND_GREEN     = 0x0002
    FOREGROUND_CYAN      = 0x0003
    FOREGROUND_RED       = 0x0004
    FOREGROUND_MAGENTA   = 0x0005
    FOREGROUND_YELLOW    = 0x0006
    FOREGROUND_GREY      = 0x0007
    FOREGROUND_INTENSITY = 0x0008 # foreground color is intensified.

    BACKGROUND_BLACK     = 0x0000
    BACKGROUND_BLUE      = 0x0010
    BACKGROUND_GREEN     = 0x0020
    BACKGROUND_CYAN      = 0x0030
    BACKGROUND_RED       = 0x0040
    BACKGROUND_MAGENTA   = 0x0050
    BACKGROUND_YELLOW    = 0x0060
    BACKGROUND_GREY      = 0x0070
    BACKGROUND_INTENSITY = 0x0080 # background color is intensified.

    stdout_handle = windll.kernel32.GetStdHandle(STD_OUTPUT_HANDLE)
    SetConsoleTextAttribute = windll.kernel32.SetConsoleTextAttribute
    GetConsoleScreenBufferInfo = windll.kernel32.GetConsoleScreenBufferInfo

    def get_text_attr():
      """Returns the character attributes (colors) of the console screen
      buffer."""
      csbi = CONSOLE_SCREEN_BUFFER_INFO()
      GetConsoleScreenBufferInfo(stdout_handle, byref(csbi))
      return csbi.wAttributes

    def set_text_attr(color):
      """Sets the character attributes (colors) of the console screen
      buffer. Color is a combination of foreground and background color,
      foreground and background intensity."""
      SetConsoleTextAttribute(stdout_handle, color)
###############################################################################

def find_bi_tools(work_drive):
    """Find BI tools."""

    reg = winreg.ConnectRegistry(None, winreg.HKEY_CURRENT_USER)
    try:
        k = winreg.OpenKey(reg, r"Software\bohemia interactive\arma 3 tools")
        arma3tools_path = winreg.QueryValueEx(k, "path")[0]
        winreg.CloseKey(k)
    except:
        raise Exception("BadTools","Arma 3 Tools are not installed correctly or the P: drive needs to be created.")

    addonbuilder_path = os.path.join(arma3tools_path, "AddonBuilder", "AddonBuilder.exe")
    dssignfile_path = os.path.join(arma3tools_path, "DSSignFile", "DSSignFile.exe")
    dscreatekey_path = os.path.join(arma3tools_path, "DSSignFile", "DSCreateKey.exe")
    cfgconvert_path = os.path.join(arma3tools_path, "CfgConvert", "CfgConvert.exe")

    if os.path.isfile(addonbuilder_path) and os.path.isfile(dssignfile_path) and os.path.isfile(dscreatekey_path) and os.path.isfile(cfgconvert_path):
        return [addonbuilder_path, dssignfile_path, dscreatekey_path, cfgconvert_path]
    else:
        raise Exception("BadTools","Arma 3 Tools are not installed correctly or the P: drive needs to be created.")


def find_depbo_tools(regKey):
    """Use registry entries to find DePBO-based tools."""
    stop = False

    if regKey == "HKCU":
        reg = winreg.ConnectRegistry(None, winreg.HKEY_CURRENT_USER)
        stop = True
    else:
        reg = winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE)

    try:
        try:
            k = winreg.OpenKey(reg, r"Software\Wow6432Node\Mikero\pboProject")
        except FileNotFoundError:
            k = winreg.OpenKey(reg, r"Software\Mikero\pboProject")
        try:
            pboproject_path = winreg.QueryValueEx(k, "exe")[0]
            winreg.CloseKey(k)
            print("Found pboproject.")
        except:
            print_error("ERROR: Could not find pboProject.")

        try:
            k = winreg.OpenKey(reg, r"Software\Wow6432Node\Mikero\rapify")
        except FileNotFoundError:
            k = winreg.OpenKey(reg, r"Software\Mikero\rapify")
        try:
            rapify_path = winreg.QueryValueEx(k, "exe")[0]
            winreg.CloseKey(k)
            print("Found rapify.")
        except:
            print_error("Could not find rapify.")

        try:
            k = winreg.OpenKey(reg, r"Software\Wow6432Node\Mikero\MakePbo")
        except FileNotFoundError:
            k = winreg.OpenKey(reg, r"Software\Mikero\MakePbo")
        try:
            makepbo_path = winreg.QueryValueEx(k, "exe")[0]
            winreg.CloseKey(k)
            print("Found makepbo.")
        except:
            print_error("Could not find makepbo.")
    except:
        if stop == True:
            raise Exception("BadDePBO", "DePBO tools not installed correctly")
        return -1


    #Strip any quotations from the path due to a MikeRo tool bug which leaves a trailing space in some of its registry paths.
    return [pboproject_path.strip('"'),rapify_path.strip('"'),makepbo_path.strip('"')]


def color(color):
    """Set the color. Works on Win32 and normal terminals."""
    if sys.platform == "win32":
        if color == "green":
            set_text_attr(FOREGROUND_GREEN | get_text_attr() & 0x0070 | FOREGROUND_INTENSITY)
        elif color == "yellow":
            set_text_attr(FOREGROUND_YELLOW | get_text_attr() & 0x0070 | FOREGROUND_INTENSITY)
        elif color == "red":
            set_text_attr(FOREGROUND_RED | get_text_attr() & 0x0070 | FOREGROUND_INTENSITY)
        elif color == "blue":
            set_text_attr(FOREGROUND_BLUE | get_text_attr() & 0x0070 | FOREGROUND_INTENSITY)
        elif color == "reset":
            set_text_attr(FOREGROUND_GREY | get_text_attr() & 0x0070)
        elif color == "grey":
            set_text_attr(FOREGROUND_GREY | get_text_attr() & 0x0070)
    else :
        if color == "green":
            sys.stdout.write('\033[92m')
        elif color == "red":
            sys.stdout.write('\033[91m')
        elif color == "blue":
            sys.stdout.write('\033[94m')
        elif color == "reset":
            sys.stdout.write('\033[0m')

def print_error(msg):
    color("red")
    print ("ERROR: {}".format(msg))
    color("reset")

def print_green(msg):
    color("green")
    print(msg)
    color("reset")

def print_blue(msg):
    color("blue")
    print(msg)
    color("reset")

def print_yellow(msg):
    color("yellow")
    print(msg)
    color("reset")


def copy_important_files(source_dir,destination_dir):

    originalDir = os.getcwd()
    importantFiles = ["mod.cpp",
    "README.md",
    "AUTHORS.txt",
    "LICENSE",
    "logo_ace3_ca.paa"
    ]

    #copy importantFiles
    try:
        print_blue("\nSearching for important files in {}".format(source_dir))
        print("Source_dir: {}".format(source_dir))
        print("Destination_dir: {}".format(destination_dir))

        for file in importantFiles:
            print_green("Copying file => {}".format(os.path.join(source_dir,file)))
            shutil.copyfile(os.path.join(source_dir,file),os.path.join(destination_dir,file))
    except:
        print_error("COPYING IMPORTANT FILES.")
        raise

    #copy all extension dlls
    try:
        os.chdir(os.path.join(source_dir))
        print_blue("\nSearching for DLLs in {}".format(os.getcwd()))
        filenames = glob.glob("*.dll")

        if not filenames:
            print ("Empty SET")

        for dll in filenames:
            print_green("Copying dll => {}".format(os.path.join(source_dir,dll)))
            if os.path.isfile(dll):
                shutil.copyfile(os.path.join(source_dir,dll),os.path.join(destination_dir,dll))
    except:
        print_error("COPYING DLL FILES.")
        raise
    finally:
        os.chdir(originalDir)


def copy_optionals_for_building(mod,pbos):
    src_directories = os.listdir(optionals_root)
    current_dir = os.getcwd()

    print_blue("\nChecking Optionals folder...")
    try:

        #special server.pbo processing
        files = glob.glob(os.path.join(release_dir, "@ace","optionals","*.pbo"))
        for file in files:
            file_name = os.path.basename(file)
            #print ("Adding the following file: {}".format(file_name))
            pbos.append(file_name)
            pbo_path = os.path.join(release_dir, "@ace","optionals",file_name)
            sigFile_name = file_name +"."+ key_name + ".bisign"
            sig_path = os.path.join(release_dir, "@ace","optionals",sigFile_name)
            if (os.path.isfile(pbo_path)):
                print("Moving {} for processing.".format(pbo_path))
                shutil.move(pbo_path, os.path.join(release_dir,"@ace","addons",file_name))

            if (os.path.isfile(sig_path)):
                #print("Moving {} for processing.".format(sig_path))
                shutil.move(sig_path, os.path.join(release_dir,"@ace","addons",sigFile_name))
    except:
        print_error("Error in moving")
        raise
    finally:
        os.chdir(current_dir)

    print("")
    try:
        for dir_name in src_directories:
            mod.append(dir_name)
            #userconfig requires special handling since it is not a PBO source folder.
            #CfgConvert fails to build server.pbo if userconfig is not found in P:\
            if (dir_name == "userconfig"):
                if (os.path.exists(os.path.join(release_dir, "@ace","optionals",dir_name))):
                    shutil.rmtree(os.path.join(release_dir, "@ace","optionals",dir_name), True)
                shutil.copytree(os.path.join(optionals_root,dir_name), os.path.join(release_dir, "@ace","optionals",dir_name))
                destination = os.path.join(work_drive,dir_name)
            else:
                destination = os.path.join(module_root,dir_name)

            print("Temporarily copying {} => {} for building.".format(os.path.join(optionals_root,dir_name),destination))
            if (os.path.exists(destination)):
                shutil.rmtree(destination, True)
            shutil.copytree(os.path.join(optionals_root,dir_name), destination)
    except:
        print_error("Copy Optionals Failed")
        raise
    finally:
        os.chdir(current_dir)


def cleanup_optionals(mod):
    print("")
    try:
        for dir_name in mod:
            #userconfig requires special handling since it is not a PBO source folder.
            if (dir_name == "userconfig"):
                destination = os.path.join(work_drive,dir_name)
            else:
                destination = os.path.join(module_root,dir_name)

            print("Cleaning {}".format(destination))

            try:
                file_name = "ace_{}.pbo".format(dir_name)
                src_file_path = os.path.join(release_dir, "@ace","addons",file_name)
                dst_file_path = os.path.join(release_dir, "@ace","optionals",file_name)

                sigFile_name = file_name +"."+ key_name + ".bisign"
                src_sig_path = os.path.join(release_dir, "@ace","addons",sigFile_name)
                dst_sig_path = os.path.join(release_dir, "@ace","optionals",sigFile_name)

                if (os.path.isfile(src_file_path)):
                    #print("Preserving {}".format(file_name))
                    os.renames(src_file_path,dst_file_path)
                if (os.path.isfile(src_sig_path)):
                    #print("Preserving {}".format(sigFile_name))
                    os.renames(src_sig_path,dst_sig_path)
            except FileExistsError:
                print_error(file_name + " already exists")
                continue
            shutil.rmtree(destination)

    except:
        print_error("Cleaning Optionals Failed")
        raise


def purge(dir, pattern, friendlyPattern="files"):
    print_green("Deleting {} files from directory: {}".format(friendlyPattern,dir))
    for f in os.listdir(dir):
        if re.search(pattern, f):
            os.remove(os.path.join(dir, f))


def build_signature_file(file_name):
    global key
    global dssignfile
    global signature_blacklist
    ret = 0
    baseFile = os.path.basename(file_name)
    #print_yellow("Sig_fileName: {}".format(baseFile))
    if not (baseFile in signature_blacklist):
        print("Signing with {}.".format(key))
        ret = subprocess.call([dssignfile, key, file_name])
    if ret == 0:
        return True
    else:
        return False


def check_for_obsolete_pbos(addonspath, file):
    module = file[4:-4]
    if not os.path.exists(os.path.join(addonspath, module)):
        return True
    return False


def addon_restore(modulePath):
    #PABST: cleanup config BS (you could comment this out to see the "de-macroed" cpp
    #print_green("\Pabst! (restoring): {}".format(os.path.join(modulePath, "config.cpp")))
    try:
        if os.path.isfile(os.path.join(modulePath, "config.cpp")):
            os.remove(os.path.join(modulePath, "config.cpp"))
        if os.path.isfile(os.path.join(modulePath, "config.backup")):
            os.rename(os.path.join(modulePath, "config.backup"), os.path.join(modulePath, "config.cpp"))
        if os.path.isfile(os.path.join(modulePath, "config.bin")):
            os.remove(os.path.join(modulePath, "config.bin"))
        if os.path.isfile(os.path.join(modulePath, "texHeaders.bin")):
            os.remove(os.path.join(modulePath, "texHeaders.bin"))
        if os.path.isfile(os.path.join(modulePath, "$PBOPREFIX$.backup")):
            if os.path.isfile(os.path.join(modulePath, "$PBOPREFIX$")):
                os.remove(os.path.join(modulePath, "$PBOPREFIX$"))
            os.rename(os.path.join(modulePath, "$PBOPREFIX$.backup"), os.path.join(modulePath, "$PBOPREFIX$"))
    except:
        print_yellow("Some error occurred. Check your addon folder {} for integrity".format(modulePath))

    return True


def get_ace_version():
    global ACE_VERSION
    #do the magic based on https://github.com/acemod/ACE3/issues/806#issuecomment-95639048
    return ACE_VERSION


def get_private_keyname(commitID,module="main"):
    global pbo_name_prefix

    aceVersion = get_ace_version()
    keyName = str("{prefix}{version}-{commit_id}".format(prefix=pbo_name_prefix,version=aceVersion,commit_id=commitID))
    print_yellow(keyName)
    return keyName


def get_commit_ID():
    # Get latest commit ID
    global make_root
    curDir = os.getcwd()
    try:
        gitpath = os.path.join(os.path.dirname(make_root), ".git")
        assert os.path.exists(gitpath)
        os.chdir(make_root)

        commit_id = subprocess.check_output(["git", "rev-parse", "HEAD"])
        commit_id = str(commit_id, "utf-8")[:8]
    except:
        print_error("FAILED TO DETERMINE COMMIT ID.")
        print_yellow("Verify that \GIT\BIN or \GIT\CMD is in your system path or user path.")
        commit_id = "NOGIT"
        raise
    finally:
        pass
        os.chdir(curDir)

    print_yellow("COMMIT ID set to {}".format(commit_id))
    return commit_id


def version_stamp_pboprefix(module,commitID):
    ### Update pboPrefix with the correct version stamp. Use commit_id as the build number.
    global work_drive
    global prefix

    try:
        configpath = os.path.join(work_drive, prefix, module, "$PBOPREFIX$")
        shutil.copyfile(configpath, os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"))

        f = open(configpath, "r")
        configtext = f.read()
        f.close()

        if configtext:
            patchestext = re.search(r"version.*?=.*?$", configtext, re.DOTALL)
            print("{}".format(patchestext))
            if patchestext:
                if configtext:
                    print("configtext before ==> {}".format(configtext))
                    patchestext = re.search(r"(version.*?=)(.*?)$", configtext, re.DOTALL).group(1)
                    print("patchestext before ==> {}".format(patchestext))
                    #patchestext1 = re.sub(r'version(.*?)="(.*?)"$', r'version\1=" {}"'.format(commitID), patchestext)
                    #print("patchestext after ==> {}".format(patchestext1))
                    print("commitID ==> {}".format(commitID))
                    configtext = re.sub(r"version(.*?)=(.*?)$", "version = {}\n".format(commitID), configtext, flags=re.DOTALL)
                    print("configtext after ==> {}".format(configtext))
                    f = open(configpath, "w")
                    f.write(configtext)
                    f.close()
                    os.remove(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"))
                else:
                    os.remove(os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
                    os.rename(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"), os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
            else:
                if configtext:
                    #append version info
                    f = open(configpath, "a")
                    f.write("\nversion = {}".format(commitID))
                    f.close()
                    os.remove(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"))

    except:
        print_error("Failed to include build number")
        raise
        return False

    finally:
        if os.path.isfile(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup")):
            if os.path.isfile(os.path.join(work_drive, prefix, module, "$PBOPREFIX$")):
                os.remove(os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
            os.rename(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"), os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))

    return True
###############################################################################


def main(argv):
    """Build an Arma addon suite in a directory from rules in a make.cfg file."""
    print_blue("\nmake.py for Arma, modified for Advanced Combat Environment v{}".format(__version__))

    global ACE_VERSION
    global work_drive
    global module_root
    global make_root
    global release_dir
    global module_root_parent
    global optionals_root
    global key_name
    global key
    global dssignfile
    global prefix
    global pbo_name_prefix

    if sys.platform != "win32":
        print_error("Non-Windows platform (Cygwin?). Please re-run from cmd.")
        sys.exit(1)

    reg = winreg.ConnectRegistry(None, winreg.HKEY_CURRENT_USER)
    try:
        k = winreg.OpenKey(reg, r"Software\bohemia interactive\arma 3 tools")
        arma3tools_path = winreg.QueryValueEx(k, "path")[0]
        winreg.CloseKey(k)
    except:
        raise Exception("BadTools","Arma 3 Tools are not installed correctly or the P: drive needs to be created.")

    # Default behaviors
    test = False # Copy to Arma 3 directory?
    arg_modules = False # Only build modules on command line?
    make_release = False # Make zip file from the release?
    release_version = 0 # Version of release
    use_pboproject = True # Default to pboProject build tool
    make_target = "DEFAULT" # Which section in make.cfg to use for the build
    new_key = True # Make a new key and use it to sign?
    quiet = False # Suppress output from build tool?

    # Parse arguments
    if "help" in argv or "-h" in argv or "--help" in argv:
        print ("""
make.py [help] [test] [force] [key <name>] [target <name>] [release <version>]
        [module name] [module name] [...]

test -- Copy result to Arma 3.
release <version> -- Make archive with <version>.
force -- Ignore cache and build all.
checkexternal -- Check External Files
target <name> -- Use rules in make.cfg under heading [<name>] rather than
   default [Make]
key <name> -- Use key in working directory with <name> to sign. If it does not
   exist, create key.
quiet -- Suppress command line output from build tool.

If module names are specified, only those modules will be built.

Examples:
   make.py force test
      Build all modules (ignoring cache) and copy the mod folder to the Arma 3
      directory.
   make.py mymodule_gun
      Only build the module named 'mymodule_gun'.
   make.py force key MyNewKey release 1.0
      Build all modules (ignoring cache), sign them with NewKey, and pack them
      into a zip file for release with version 1.0.


If a file called $NOBIN$ is found in the module directory, that module will not be binarized.

See the make.cfg file for additional build options.
""")
        sys.exit(0)

    if "force" in argv:
        argv.remove("force")
        force_build = True
    else:
        force_build = False

    if "test" in argv:
        test = True
        argv.remove("test")

    if "release" in argv:
        make_release = True
        release_version = argv[argv.index("release") + 1]
        argv.remove(release_version)
        argv.remove("release")

    if "target" in argv:
        make_target = argv[argv.index("target") + 1]
        argv.remove("target")
        argv.remove(make_target)
        force_build = True

    if "key" in argv:
        new_key = True
        key_name = argv[argv.index("key") + 1]
        argv.remove("key")
        argv.remove(key_name)

    if "quiet" in argv:
        quiet = True
        argv.remove("quiet")

    if "checkexternal" in argv:
        argv.remove("checkexternal")
        check_external = True
    else:
        check_external = False

    print_yellow("\nCheck external references is set to {}".format(str(check_external)))

    # Get the directory the make script is in.
    make_root = os.path.dirname(os.path.realpath(__file__))
    make_root_parent = os.path.abspath(os.path.join(os.getcwd(), os.pardir))
    os.chdir(make_root)



    cfg = configparser.ConfigParser();
    try:
        cfg.read(os.path.join(make_root, "make.cfg"))

        # Project name (with @ symbol)
        project = cfg.get(make_target, "project", fallback="@"+os.path.basename(os.getcwd()))

        # BI Tools work drive on Windows
        work_drive = cfg.get(make_target, "work_drive",  fallback="P:\\")

        # Private key path
        key = cfg.get(make_target, "key", fallback=None)

        # Private key creation directory
        private_key_path = cfg.get(make_target, "private_key_path", fallback=os.path.join(work_drive, "private_keys"))

        # Project prefix (folder path)
        prefix = cfg.get(make_target, "prefix", fallback="")

        # Should we autodetect modules on a complete build?
        module_autodetect = cfg.getboolean(make_target, "module_autodetect", fallback=True)

        # Manual list of modules to build for a complete build
        modules = cfg.get(make_target, "modules", fallback=None)
        # Parse it out
        if modules:
            modules = [x.strip() for x in modules.split(',')]
        else:
            modules = []

        # List of directories to ignore when detecting
        ignore = [x.strip() for x in cfg.get(make_target, "ignore",  fallback="release").split(',')]

        # Which build tool should we use?
        build_tool = cfg.get(make_target, "build_tool", fallback="addonbuilder").lower()

        # Release/build directory, relative to script dir
        release_dir = cfg.get(make_target, "release_dir", fallback="release")

        #Directory to copy the final built PBO's for a test run.
        test_dir = cfg.get(make_target, "test_dir", fallback=os.path.join(os.environ["USERPROFILE"],r"documents\Arma 3"))

        # Project PBO file prefix (files are renamed to prefix_name.pbo)
        pbo_name_prefix = cfg.get(make_target, "pbo_name_prefix", fallback=None)

        # Project module Root
        module_root_parent = os.path.abspath(os.path.join(os.path.join(work_drive, prefix), os.pardir))
        module_root = cfg.get(make_target, "module_root", fallback=os.path.join(make_root_parent, "addons"))
        optionals_root = os.path.join(module_root_parent, "optionals")
        extensions_root = os.path.join(module_root_parent, "extensions")
        print_green ("module_root: {}".format(module_root))


        commit_id = get_commit_ID()
        key_name = versionStamp = get_private_keyname(commit_id)

        if (os.path.isdir(module_root)):
            os.chdir(module_root)
        else:
            print_error ("Directory {} does not exist.".format(module_root))
            sys.exit()

        if (os.path.isdir(optionals_root)):
            print_green ("optionals_root: {}".format(optionals_root))
        else:
            print_error ("Directory {} does not exist.".format(optionals_root))
            sys.exit()

        print_green ("release_dir: {}".format(release_dir))

    except:
        raise
        print_error("Could not parse make.cfg.")
        sys.exit(1)

    # See if we have been given specific modules to build from command line.
    if len(argv) > 1 and not make_release:
        arg_modules = True
        modules = argv[1:]

    # Find the tools we need.
    try:
        tools = find_bi_tools(work_drive)
        addonbuilder = tools[0]
        dssignfile = tools[1]
        dscreatekey = tools[2]
        cfgconvert = tools[3]

    except:
        print_error("Arma 3 Tools are not installed correctly or the P: drive has not been created.")
        sys.exit(1)

    if build_tool == "pboproject":
        try:
            depbo_tools = find_depbo_tools("HKLM")
            if depbo_tools == -1:
                depbo_tools = find_depbo_tools("HKCU")
            pboproject = depbo_tools[0]
            rapifyTool = depbo_tools[1]
            makepboTool = depbo_tools[2]
        except:
            raise
            print_error("Could not find dePBO tools. Download the needed tools from: https://dev.withsix.com/projects/mikero-pbodll/files")
            sys.exit(1)

    # Try to open and deserialize build cache file.
    try:
        cache = {}
        with open(os.path.join(make_root, "make.cache"), 'r') as f:
            cache_raw = f.read()

        cache = json.loads(cache_raw)

    except:
        print ("No cache found.")
        cache = {}

    if not os.path.isdir(os.path.join(release_dir, project, "addons")):
        try:
            os.makedirs(os.path.join(release_dir, project, "addons"))
        except:
            print_error("Cannot create release directory")
            raise

    if not os.path.isdir(os.path.join(release_dir, project, "keys")):
        try:
            os.makedirs(os.path.join(release_dir, project, "keys"))
        except:
            print_error("Cannot create release directory")
            raise


    try:
        #Temporarily copy optionals_root for building. They will be removed later.
        optionals_modules = []
        optional_files = []
        copy_optionals_for_building(optionals_modules,optional_files)

        # Get list of subdirs in make root.
        dirs = next(os.walk(module_root))[1]

        # Autodetect what directories to build.
        if module_autodetect and not arg_modules:
            modules = []
            for path in dirs:
                # Any dir that has a config.cpp in its root is an addon to build.
                config_path = os.path.join(path, 'config.cpp')
                if os.path.isfile(config_path) and not path in ignore:
                    modules.append(path)

        # Make the key specified from command line if necessary.
        if new_key:
            if not os.path.isfile(os.path.join(private_key_path, key_name + ".biprivatekey")):
                print_yellow("\nRequested key does not exist.")
                try:
                    os.makedirs(private_key_path)
                except:
                    pass
                curDir = os.getcwd()
                os.chdir(private_key_path)
                ret = subprocess.call([dscreatekey, key_name]) # Created in make_root
                os.chdir(curDir)
                if ret == 0:
                    print_green("Created: {}".format(os.path.join(private_key_path, key_name + ".biprivatekey")))
                    print("Removing any old signature keys...")
                    purge(os.path.join(module_root, release_dir, project, "addons"), "^.*\.bisign$","*.bisign")
                    purge(os.path.join(module_root, release_dir, project, "optionals"), "^.*\.bisign$","*.bisign")
                    purge(os.path.join(module_root, release_dir, project, "keys"), "^.*\.bikey$","*.bikey")
                else:
                    print_error("Failed to create key!")

                try:
                    print("Copying public key to release directory.")

                    try:
                        os.makedirs(os.path.join(module_root, release_dir, project, "keys"))
                    except:
                        pass

                    shutil.copyfile(os.path.join(private_key_path, key_name + ".bikey"), os.path.join(module_root, release_dir, project, "keys", key_name + ".bikey"))

                except:
                    print_error("Could not copy key to release directory.")
                    raise

            else:
                print_green("\nNOTE: Using key {}".format(os.path.join(private_key_path, key_name + ".biprivatekey")))

            key = os.path.join(private_key_path, key_name + ".biprivatekey")

        # Remove any obsolete files.
        print_blue("\nChecking for obsolete files...")
        obsolete_check_path = os.path.join(module_root, release_dir, project,"addons")
        for file in os.listdir(obsolete_check_path):
            if (file.endswith(".pbo") and os.path.isfile(os.path.join(obsolete_check_path,file))):
                if check_for_obsolete_pbos(module_root, file):
                    fileName = os.path.splitext(file)[0]
                    print_yellow("Removing obsolete file => {}".format(file))
                    purge(obsolete_check_path,fileName+"\..",fileName+".*")

        obsolete_check_path = os.path.join(module_root, release_dir, project)
        for file in os.listdir(obsolete_check_path):
            if (file.endswith(".dll") and os.path.isfile(os.path.join(obsolete_check_path,file))):
                if check_for_obsolete_pbos(extensions_root, file):
                    fileName = os.path.splitext(file)[0]
                    print_yellow("Removing obsolete file => {}".format(file))
                    try:
                        os.remove(os.path.join(obsolete_check_path,file))
                    except:
                        print_error("\nFailed to delete {}".format(os.path.join(obsolete_check_path,file)))
                        pass

        # For each module, prep files and then build.
        print_blue("\nBuilding...")
        for module in modules:
            print_green("\nMaking {}".format(module + "-"*max(1, (60-len(module)))))
            missing = False
            sigMissing = False

            # Cache check
            if module in cache:
                old_sha = cache[module]
            else:
                old_sha = ""

            # Hash the module
            new_sha = get_directory_hash(os.path.join(module_root, module))

            # Is the pbo or sig file missing?
            missing = not os.path.isfile(os.path.join(release_dir, project, "addons", "ace_{}.pbo".format(module)))
            sigFile = pbo_name_prefix+module + ".pbo." + key_name + ".bisign"
            sigMissing = not os.path.isfile(os.path.join(release_dir, project, "addons", sigFile ))

            if missing:
                print_yellow("Missing PBO file ace_{}.pbo".format(module) + ". Building...")

            # Check if it needs rebuilt
            # print ("Hash:", new_sha)
            if old_sha == new_sha and not missing:
                if not force_build:
                    print("Module has not changed.")
                    if sigMissing:
                        if key:
                            print("Missing Signature key {}".format(sigFile))
                            build_signature_file(os.path.join(module_root, release_dir, project, "addons", pbo_name_prefix + module + ".pbo"))
                    # Skip everything else
                    continue

            # Only do this if the project isn't stored directly on the work drive.
            # Split the path at the drive name and see if they are on the same drive (usually P:)
            if os.path.splitdrive(module_root)[0] != os.path.splitdrive(work_drive)[0]:
                try:
                    # Remove old work drive version (ignore errors)
                    shutil.rmtree(os.path.join(work_drive, prefix, module), True)

                    # Copy module to the work drive
                    shutil.copytree(module, os.path.join(work_drive, prefix, module))

                except:
                    raise
                    print_error("ERROR: Could not copy module to work drive. Does the module exist?")
                    input("Press Enter to continue...")
                    print("Resuming build...")
                    continue
            #else:
                #print("WARNING: Module is stored on work drive ({}).".format(work_drive))

            try:
                # Remove the old pbo, key, and log
                old = os.path.join(module_root, release_dir, project, "addons", pbo_name_prefix+module) + "*"
                files = glob.glob(old)
                for f in files:
                    os.remove(f)

                if pbo_name_prefix:
                    old = os.path.join(module_root, release_dir, project, "addons", pbo_name_prefix+module) + "*"
                    files = glob.glob(old)
                    for f in files:
                        os.remove(f)
            except:
                raise
                print_error("ERROR: Could not copy module to work drive. Does the module exist?")
                input("Press Enter to continue...")
                print("Resuming build...")
                continue

            # Build the module into a pbo
            print_blue("Building: {}".format(os.path.join(work_drive, prefix, module)))
            print_blue("Destination: {}".format(os.path.join(module_root, release_dir, project, "addons")))

            # Make destination folder (if needed)
            try:
                os.makedirs(os.path.join(module_root, release_dir, project, "addons"))
            except:
                pass


            # Run build tool
            build_successful = False
            if build_tool == "pboproject":
                try:
                    #PABST: Convert config (run the macro'd config.cpp through CfgConvert twice to produce a de-macro'd cpp that pboProject can read without fucking up:
                    shutil.copyfile(os.path.join(work_drive, prefix, module, "config.cpp"), os.path.join(work_drive, prefix, module, "config.backup"))

                    os.chdir("P:\\")

                    cmd = [os.path.join(arma3tools_path, "CfgConvert", "CfgConvert.exe"), "-bin", "-dst", os.path.join(work_drive, prefix, module, "config.bin"), os.path.join(work_drive, prefix, module, "config.cpp")]
                    ret = subprocess.call(cmd)
                    if ret != 0:
                        print_error("CfgConvert -bin return code == {}. Usually means there is a syntax error within the config.cpp file.".format(str(ret)))
                        os.remove(os.path.join(work_drive, prefix, module, "config.cpp"))
                        shutil.copyfile(os.path.join(work_drive, prefix, module, "config.backup"), os.path.join(work_drive, prefix, module, "config.cpp"))

                    cmd = [os.path.join(arma3tools_path, "CfgConvert", "CfgConvert.exe"), "-txt", "-dst", os.path.join(work_drive, prefix, module, "config.cpp"), os.path.join(work_drive, prefix, module, "config.bin")]
                    ret = subprocess.call(cmd)
                    if ret != 0:
                        print_error("CfgConvert -txt return code == {}. Usually means there is a syntax error within the config.cpp file.".format(str(ret)))
                        os.remove(os.path.join(work_drive, prefix, module, "config.cpp"))
                        shutil.copyfile(os.path.join(work_drive, prefix, module, "config.backup"), os.path.join(work_drive, prefix, module, "config.cpp"))


                    version_stamp_pboprefix(module,commit_id)

                    if os.path.isfile(os.path.join(work_drive, prefix, module, "$NOBIN$")):
                        print_green("$NOBIN$ Found. Proceeding with non-binarizing!")
                        cmd = [makepboTool, "-P","-A","-L","-N","-G", os.path.join(work_drive, prefix, module),os.path.join(module_root, release_dir, project,"addons")]

                    else:
                        if check_external:
                            cmd = [pboproject, "-P", os.path.join(work_drive, prefix, module), "+Engine=Arma3", "-S","+Noisy", "+X", "+Clean", "+Mod="+os.path.join(module_root, release_dir, project), "-Key"]
                        else:
                            cmd = [pboproject, "-P", os.path.join(work_drive, prefix, module), "+Engine=Arma3", "-S","+Noisy", "-X", "+Clean", "+Mod="+os.path.join(module_root, release_dir, project), "-Key"]

                    color("grey")
                    if quiet:
                        devnull = open(os.devnull, 'w')
                        ret = subprocess.call(cmd, stdout=devnull)
                        devnull.close()
                    else:
                        ret = subprocess.call(cmd)
                    color("reset")

                    if ret == 0:
                        print_green("pboProject return code == {}".format(str(ret)))
                        # Prettyprefix rename the PBO if requested.
                        if pbo_name_prefix:
                            try:
                                os.rename(os.path.join(module_root, release_dir, project, "addons", module+".pbo"), os.path.join(module_root, release_dir, project, "addons", pbo_name_prefix+module+".pbo"))
                            except:
                                raise
                                print_error("Could not rename built PBO with prefix.")
                        # Sign result
                        if (key and not "ace_{}.pbo".format(module) in signature_blacklist):
                            print("Signing with {}.".format(key))
                            if pbo_name_prefix:
                                ret = subprocess.call([dssignfile, key, os.path.join(module_root, release_dir, project, "addons", pbo_name_prefix + module + ".pbo")])
                            else:
                                ret = subprocess.call([dssignfile, key, os.path.join(module_root, release_dir, project, "addons", module + ".pbo")])

                            if ret == 0:
                                build_successful = True
                        else:
                            build_successful = True

                    if not build_successful:
                        print_error("pboProject return code == {}".format(str(ret)))
                        print_error("Module not successfully built/signed. Check your {}temp\{}_packing.log for more info.".format(work_drive,module))
                        print ("Resuming build...")
                        continue

                    # Back to the root
                    os.chdir(module_root)

                except:
                    raise
                    print_error("Could not run Addon Builder.")
                    input("Press Enter to continue...")
                    print ("Resuming build...")
                    continue
                finally:
                    addon_restore(os.path.join(work_drive, prefix, module))

            elif build_tool== "addonbuilder":
                # Detect $NOBIN$ and do not binarize if found.
                if os.path.isfile(os.path.join(work_drive, prefix, module, "$NOBIN$")):
                    do_binarize = False
                    print("$NOBIN$ file found in module, packing only.")
                else:
                    do_binarize = True
                try:
                    # Call AddonBuilder
                    os.chdir("P:\\")

                    cmd = [addonbuilder, os.path.join(work_drive, prefix, module), os.path.join(make_root, release_dir, project, "addons"), "-clear", "-project="+work_drive]
                    if not do_binarize:
                        cmd.append("-packonly")

                    if quiet:
                        previousDirectory = os.getcwd()
                        os.chdir(arma3tools_path)
                        devnull = open(os.devnull, 'w')
                        ret = subprocess.call(cmd, stdout=devnull)
                        devnull.close()
                        os.chdir(previousDirectory)
                    else:
                        previousDirectory = os.getcwd()
                        os.chdir(arma3tools_path)
                        print_error("Current directory - {}".format(os.getcwd()))
                        ret = subprocess.call(cmd)
                        os.chdir(previousDirectory)
                        print_error("Current directory - {}".format(os.getcwd()))
                    color("reset")
                    print_green("completed")
                    # Prettyprefix rename the PBO if requested.
                    if pbo_name_prefix:
                        try:
                            os.rename(os.path.join(make_root, release_dir, project, "addons", module+".pbo"), os.path.join(make_root, release_dir, project, "addons", pbo_name_prefix+module+".pbo"))
                        except:
                            raise
                            print_error("Could not rename built PBO with prefix.")

                    if ret == 0:
                        # Sign result

                        #print_yellow("Sig_fileName: ace_{}.pbo".format(module))
                        if (key and not "ace_{}.pbo".format(module) in signature_blacklist) :
                            print("Signing with {}.".format(key))
                            if pbo_name_prefix:
                                ret = subprocess.call([dssignfile, key, os.path.join(make_root, release_dir, project, "addons", pbo_name_prefix + module + ".pbo")])
                            else:
                                ret = subprocess.call([dssignfile, key, os.path.join(make_root, release_dir, project, "addons", module + ".pbo")])

                            if ret == 0:
                                build_successful = True
                        else:
                            build_successful = True

                    if not build_successful:
                        print_error("Module not successfully built. Check your {}temp\{}_packing.log for more info.".format(work_drive,module))

                    # Back to the root
                    os.chdir(make_root)

                except:
                    raise
                    print_error("Could not run Addon Builder.")
                    input("Press Enter to continue...")
                    print ("Resuming build...")
                    continue

            else:
                print_error("Unknown build_tool {}!".format(build_tool))

            # Update the hash for a successfully built module
            if build_successful:
                cache[module] = new_sha

    except:
        print_yellow("Cancel or some error detected.")

    finally:
        copy_important_files(module_root_parent,os.path.join(release_dir, "@ace"))
        cleanup_optionals(optionals_modules)

    # Done building all modules!

    # Write out the cache state
    cache_out = json.dumps(cache)
    with open(os.path.join(make_root, "make.cache"), 'w') as f:
        f.write(cache_out)

    # Delete the pboproject temp files if building a release.
    if make_release and build_tool == "pboproject":
        try:
            shutil.rmtree(os.path.join(module_root, release_dir, project, "temp"), True)
        except:
            print_error("ERROR: Could not delete pboProject temp files.")

    # Make release
    if make_release:
        print_blue("\nMaking release: {}-{}.zip".format(project,release_version))

        try:
            # Delete all log files
            for root, dirs, files in os.walk(os.path.join(module_root, release_dir, project, "addons")):
                for currentFile in files:
                    if currentFile.lower().endswith("log"):
                        os.remove(os.path.join(root, currentFile))

            # Create a zip with the contents of release/ in it
            shutil.make_archive(project + "-" + release_version, "zip", os.path.join(module_root, release_dir))
        except:
            raise
            print_error("Could not make release.")

    # Copy to Arma 3 folder for testing
    if test:
        print_blue("\nCopying to Arma 3.")

        if sys.platform == "win32":
            reg = winreg.ConnectRegistry(None, winreg.HKEY_LOCAL_MACHINE)
            try:
                k = winreg.OpenKey(reg, r"SOFTWARE\Wow6432Node\Bohemia Interactive\Arma 3")
                a3_path = winreg.EnumValue(k, 1)[1]
                winreg.CloseKey(k)
            except:
                print_error("Could not find Arma 3's directory in the registry.")
        else:
            a3_path = cygwin_a3path

        print_yellow("Path from the registry => {}".format(a3_path))
        a3_path = test_dir

        print_yellow("Copying build files to {}".format(a3_path))

        if os.path.exists(a3_path):
            try:
                shutil.rmtree(os.path.join(a3_path, project), True)
                shutil.copytree(os.path.join(module_root, release_dir, project), os.path.join(a3_path, project))
            except:
                print_error("Could not copy files. Is Arma 3 running?")

    print_green("\nDone.")


if __name__ == "__main__":
    main(sys.argv)
input("Press Enter to continue...")

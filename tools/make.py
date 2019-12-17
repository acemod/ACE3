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

__version__ = "0.9"

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
import timeit
import re
from tempfile import mkstemp

if sys.platform == "win32":
    import winreg

######## GLOBALS #########
project = "@ace"
project_version = "3.0.0"
arma3tools_path = ""
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
signature_blacklist = []
importantFiles = ["mod.cpp", "README.md", "docs\\README_DE.md", "docs\\README_PL.md", "docs\\README.zh-TW.md", "AUTHORS.txt", "LICENSE", "logo_ace3_ca.paa", "meta.cpp"]
versionFiles = ["mod.cpp", "README.md", "docs\\README_DE.md", "docs\\README_PL.md", "docs\\README.zh-TW.md"]

ciBuild = False # Used for CI builds

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

def Fract_Sec(s):
    temp = float()
    temp = float(s) / (60*60*24)
    d = int(temp)
    temp = (temp - d) * 24
    h = int(temp)
    temp = (temp - h) * 60
    m = int(temp)
    temp = (temp - m) * 60
    sec = temp
    return d,h,m,sec
    #endef Fract_Sec

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


def find_depbo_tools():
    """Use registry entries to find DePBO-based tools."""
    requiredToolPaths = {"pboProject": None, "rapify": None, "MakePbo": None}
    failed = False

    for tool in requiredToolPaths:
        try:
            try:
                k = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\Mikero\{}".format(tool))
                path = winreg.QueryValueEx(k, "exe")[0]
            except FileNotFoundError:
                try:
                    k = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, r"Software\Mikero\{}".format(tool))
                    path = winreg.QueryValueEx(k, "exe")[0]
                except FileNotFoundError:
                    try:
                        k = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r"Software\Wow6432Node\Mikero\{}".format(tool))
                        path = winreg.QueryValueEx(k, "exe")[0]
                    except FileNotFoundError:
                        k = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, r"Software\Wow6432Node\Mikero\{}".format(tool))
                        path = winreg.QueryValueEx(k, "exe")[0]
        except FileNotFoundError:
            print_error("Could not find {}".format(tool))
            failed = True
        else:
            #Strip any quotations from the path due to a MikeRo tool bug which leaves a trailing space in some of its registry paths.
            requiredToolPaths[tool] = path.strip('"')
            print_green("Found {}.".format(tool))
        finally:
            winreg.CloseKey(k)

    if failed:
        raise Exception("BadDePBO", "DePBO tools not installed correctly")

    return requiredToolPaths


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
    print("ERROR: {}".format(msg))
    color("reset")
    global printedErrors
    printedErrors += 1

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

    # Copy importantFiles
    try:
        print_blue("\nSearching for important files in {}".format(source_dir))
        print("Source_dir: {}".format(source_dir))
        print("Destination_dir: {}".format(destination_dir))

        for file in importantFiles:
            filePath = os.path.join(module_root_parent, file)
            if os.path.exists(filePath):
                print_green("Copying file => {}".format(filePath))
                shutil.copy(os.path.join(source_dir,filePath), destination_dir)
            else:
                missingFiles.append("{}".format(filePath))
                print_error("Failed copying file => {}".format(filePath))
    except:
        print_error("COPYING IMPORTANT FILES.")
        raise

    # Copy all extensions
    try:
        os.chdir(os.path.join(source_dir))
        print_blue("\nSearching for DLLs in {}".format(os.getcwd()))
        filenames = glob.glob("*.dll") + glob.glob("*.so")

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

    print_blue("\nChecking optionals folder...")
    try:
        #special server.pbo processing
        files = glob.glob(os.path.join(release_dir, project, "optionals", "*.pbo"))
        for file in files:
            file_name = os.path.basename(file)
            #print ("Adding the following file: {}".format(file_name))
            pbos.append(file_name)
            pbo_path = os.path.join(release_dir, project, "optionals", file_name)
            sigFile_name = file_name +"."+ key_name + ".bisign"
            sig_path = os.path.join(release_dir, project, "optionals", sigFile_name)
            if (os.path.isfile(pbo_path)):
                print("Moving {} for processing.".format(pbo_path))
                shutil.move(pbo_path, os.path.join(release_dir, project, "addons", file_name))

            if (os.path.isfile(sig_path)):
                #print("Moving {} for processing.".format(sig_path))
                shutil.move(sig_path, os.path.join(release_dir, project, "addons", sigFile_name))

    except:
        print_error("Error in moving")
        raise
    finally:
        os.chdir(current_dir)

    try:
        for dir_name in src_directories:
            mod.append(dir_name)
            #userconfig requires special handling since it is not a PBO source folder.
            #CfgConvert fails to build server.pbo if userconfig is not found in P:\
            if (dir_name == "userconfig"):
                if (os.path.exists(os.path.join(release_dir, project, "optionals", dir_name))):
                    shutil.rmtree(os.path.join(release_dir, project, "optionals", dir_name), True)
                shutil.copytree(os.path.join(optionals_root,dir_name), os.path.join(release_dir, project, "optionals", dir_name))
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
                file_name = "{}{}.pbo".format(pbo_name_prefix,dir_name)
                folder= "@{}{}".format(pbo_name_prefix,dir_name)
                src_file_path = os.path.join(release_dir, project, "addons", file_name)
                dst_file_path = os.path.join(release_dir, project, "optionals",folder,"addons",file_name)

                sigFile_name = "{}.{}.bisign".format(file_name,key_name)
                src_sig_path = os.path.join(release_dir, project, "addons", sigFile_name)
                dst_sig_path = os.path.join(release_dir, project, "optionals",folder,"addons", sigFile_name)


                if (os.path.isfile(src_file_path)):
                    if (os.path.isfile(dst_file_path)):
                        # print("Cleanuping up old file {}".format(dst_file_path))
                        os.remove(dst_file_path);
                    #print("Preserving {}".format(file_name))
                    os.renames(src_file_path,dst_file_path)
                if (os.path.isfile(src_sig_path)):
                    if (os.path.isfile(dst_sig_path)):
                        # print("Cleanuping up old file {}".format(dst_sig_path))
                        os.remove(dst_sig_path);
                    #print("Preserving {}".format(sigFile_name))
                    os.renames(src_sig_path,dst_sig_path)
            except FileExistsError:
                print_error("{} already exists".format(file_name))
                continue
            shutil.rmtree(destination)

    except FileNotFoundError:
        print_yellow("{} file not found".format(file_name))

    except:
        print_error("Cleaning Optionals Failed")
        raise


def purge(dir, pattern, friendlyPattern="files"):
    print_green("Deleting {} files from directory: {}".format(friendlyPattern,dir))
    if os.path.exists(dir):
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
    module = file[len(pbo_name_prefix):-4]
    if not os.path.exists(os.path.join(addonspath, module)):
        return True
    return False


def backup_config(module):
    #backup original $PBOPREFIX$
    global work_drive
    global prefix

    try:
        configpath = os.path.join(work_drive, prefix, module, "$PBOPREFIX$")
        if os.path.isfile(configpath):
            shutil.copyfile(configpath, os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"))
        else:
            print_error("$PBOPREFIX$ Does not exist for module: {}.".format(module))

    except:
        print_error("Error creating backup of $PBOPREFIX$ for module {}.".format(module))

    return True

def addon_restore(modulePath):
    #restore original $PBOPREFIX$
    try:
        if os.path.isfile(os.path.join(modulePath, "$PBOPREFIX$.backup")):
            if os.path.isfile(os.path.join(modulePath, "$PBOPREFIX$")):
                os.remove(os.path.join(modulePath, "$PBOPREFIX$"))
            os.rename(os.path.join(modulePath, "$PBOPREFIX$.backup"), os.path.join(modulePath, "$PBOPREFIX$"))
    except:
        print_yellow("Some error occurred. Check your addon folder {} for integrity".format(modulePath))

    return True


def get_project_version(version_increments=[]):
    global project_version
    versionStamp = project_version
    #do the magic based on https://github.com/acemod/ACE3/issues/806#issuecomment-95639048

    try:
        scriptModPath = os.path.join(module_root, "main\script_version.hpp")

        if os.path.isfile(scriptModPath):
            f = open(scriptModPath, "r")
            hpptext = f.read()
            f.close()

            if hpptext:
                majorText = re.search(r"#define MAJOR (.*\b)", hpptext).group(1)
                minorText = re.search(r"#define MINOR (.*\b)", hpptext).group(1)
                patchText = re.search(r"#define PATCHLVL (.*\b)", hpptext).group(1)
                buildText = re.search(r"#define BUILD (.*\b)", hpptext).group(1)

                # Increment version (reset all below except build)
                if version_increments != []:
                    if "major" in version_increments:
                        majorText = int(majorText) + 1
                        minorText = 0
                        patchText = 0
                    elif "minor" in version_increments:
                        minorText = int(minorText) + 1
                        patchText = 0
                    elif "patch" in version_increments:
                        patchText = int(patchText) + 1

                    # Always increment build
                    if "build" in version_increments:
                        buildText = int(buildText) + 1

                    print_green("Incrementing version to {}.{}.{}.{}".format(majorText,minorText,patchText,buildText))
                    with open(scriptModPath, "w", newline="\n") as file:
                        file.writelines([
                            "#define MAJOR {}\n".format(majorText),
                            "#define MINOR {}\n".format(minorText),
                            "#define PATCHLVL {}\n".format(patchText),
                            "#define BUILD {}\n".format(buildText)
                        ])

                if majorText:
                    versionStamp = "{}.{}.{}.{}".format(majorText,minorText,patchText,buildText)

        else:
            print_error("A Critical file seems to be missing or inaccessible: {}".format(scriptModPath))
            raise FileNotFoundError("File Not Found: {}".format(scriptModPath))

    except Exception as e:
        print_error("Get_project_version error: {}".format(e))
        print_error("Check the integrity of the file: {}".format(scriptModPath))
        versionStamp = project_version
        print_error("Resetting to the default version stamp: {}".format(versionStamp))
        input("Press Enter to continue...")
        print("Resuming build...")

    print_yellow("{} VERSION set to {}".format(project.lstrip("@").upper(),versionStamp))
    project_version = versionStamp
    return project_version


def replace_file(filePath, oldSubstring, newSubstring):
    fh, absPath = mkstemp()
    with open(absPath, "w", encoding="utf-8") as newFile:
        with open(filePath, encoding="utf-8") as oldFile:
            for line in oldFile:
                newFile.write(line.replace(oldSubstring, newSubstring))

    newFile.close()
    os.remove(filePath)
    shutil.move(absPath, filePath)


def set_version_in_files():
    newVersion = project_version # MAJOR.MINOR.PATCH.BUILD
    newVersionArr = newVersion.split(".")
    newVersionShort = ".".join((newVersionArr[0],newVersionArr[1],newVersionArr[2])) # MAJOR.MINOR.PATCH

    # Regex patterns
    pattern = re.compile(r"([\d]+\.[\d]+\.[\d]+\.[\d]+)") # MAJOR.MINOR.PATCH.BUILD
    patternShort = re.compile(r"([\d]+\.[\d]+\.[\d]+)") # MAJOR.MINOR.PATCH

    # Change versions in files containing version
    for i in versionFiles:
        filePath = os.path.join(module_root_parent, i)

        try:
            # Save the file contents to a variable if the file exists
            if os.path.isfile(filePath):
                f = open(filePath, "r+", encoding="utf-8")
                fileText = f.read()
                f.close()

                if fileText:
                    # Version string files
                    # Search and save version stamp
                    versionsFound = re.findall(pattern, fileText) + re.findall(patternShort, fileText)
                    # Filter out sub-versions of other versions
                    versionsFound = [j for i, j in enumerate(versionsFound) if all(j not in k for k in versionsFound[i + 1:])]

                    # Replace version stamp if any of the new version parts is higher than the one found
                    for versionFound in versionsFound:
                        if versionFound:
                            # Use the same version length as the one found
                            newVersionUsed = "" # In case undefined
                            if versionFound.count(".") == newVersion.count("."):
                                newVersionUsed = newVersion
                            if versionFound.count(".") == newVersionShort.count("."):
                                newVersionUsed = newVersionShort

                            # Print change and modify the file if changed
                            if newVersionUsed and versionFound != newVersionUsed:
                                print_green("Changing version {} => {} in {}".format(versionFound, newVersionUsed, filePath))
                                replace_file(filePath, versionFound, newVersionUsed)
        except WindowsError as e:
            # Temporary file is still "in use" by Python, pass this exception
            pass
        except Exception as e:
            print_error("set_version_in_files error: {}".format(e))
            raise

    return True


def stash_version_files_for_building():
    try:
        for file in versionFiles:
            filePath = os.path.join(module_root_parent, file)
            if os.path.exists(filePath):
                # Take only file name for stash location if in subfolder (otherwise it gets removed when removing folders from release dir)
                if "\\" in file:
                    count = file.count("\\")
                    file = file.split("\\", count)[-1]
                stashPath = os.path.join(release_dir, file)
                print("Temporarily stashing {} => {}.bak for version update".format(filePath, stashPath))
                shutil.copy(filePath, "{}.bak".format(stashPath))
            else:
                print_error("Failed temporarily stashing {} for version update".format(filePath))
                missingFiles.append("{}".format(filePath))
    except:
        print_error("Stashing version files failed")
        raise

    # Set version
    set_version_in_files()
    return True


def restore_version_files():
    try:
        print_blue("\nRestoring version files...")

        for file in versionFiles:
            filePath = os.path.join(module_root_parent, file)
            # Take only file name for stash path if in subfolder (otherwise it gets removed when removing folders from release dir)
            if "\\" in file:
                count = file.count("\\")
                file = file.split("\\", count)[-1]
            stashPath = os.path.join(release_dir, file)
            if os.path.exists(filePath):
                print("Restoring {}".format(filePath))
                shutil.move("{}.bak".format(stashPath), filePath)
    except:
        print_error("Restoring version files failed")
        raise
    return True


def get_private_keyname(commitID,module="main"):
    global pbo_name_prefix
    global project_version

    keyName = str("{prefix}{version}-{commit_id}".format(prefix=pbo_name_prefix,version=project_version,commit_id=commitID))
    return keyName


def get_commit_ID():
    # Get latest commit ID
    global make_root
    curDir = os.getcwd()
    commit_id = ""

    try:
        # Verify if Git repository
        gitpath = os.path.join(os.path.dirname(make_root), ".git")
        assert os.path.exists(gitpath)

        # Try to get commit ID through Git client
        os.chdir(make_root)
        commit_id = subprocess.check_output(["git", "rev-parse", "HEAD"])
        commit_id = str(commit_id, "utf-8")[:8]
    except FileNotFoundError:
        # Try to get commit ID from git files (subprocess failed - eg. no Git client)
        head_path = os.path.join(gitpath, "HEAD")
        if os.path.exists(head_path):
            with open(head_path, "r") as head_file:
                branch_path = head_file.readline().split(": ")

                # Commit ID is written in HEAD file directly when in detached state
                if len(branch_path) == 1:
                    commit_id = branch_path[0]
                else:
                    branch_path = branch_path[-1].strip()
                    ref_path = os.path.join(gitpath, branch_path)
                    if os.path.exists(ref_path):
                        with open(ref_path, "r") as ref_file:
                            commit_id = ref_file.readline()

        if commit_id != "":
            commit_id = commit_id.strip()[:8]
        else:
            raise
    except:
        # All other exceptions (eg. AssertionException)
        if commit_id == "":
            raise
    finally:
        pass
        if commit_id == "":
            print_error("Failed to determine commit ID - folder is not a Git repository.")
            commit_id = "NOGIT"
        os.chdir(curDir)

    print_yellow("COMMIT ID set to {}".format(commit_id))
    return commit_id


def version_stamp_pboprefix(module,commitID):
    ### Update pboPrefix with the correct version stamp. Use commit_id as the build number.
    #This function will not handle any $PBOPREFIX$ backup or cleanup.
    global work_drive
    global prefix

    configpath = os.path.join(work_drive, prefix, module, "$PBOPREFIX$")

    try:
        f = open(configpath, "r")
        configtext = f.read()
        f.close()

        if configtext:
            if re.search(r"version=(.*?)$", configtext, re.DOTALL):
                if configtext:
                    configtext = re.sub(r"version=(.*?)$", "version={}\n".format(commitID), configtext, flags=re.DOTALL)
                    f = open(configpath, "w")
                    f.write(configtext)
                    f.close()
                else:
                    os.remove(os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
                    os.rename(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"), os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
            else:
                if configtext:
                    #append version info
                    f = open(configpath, "a")
                    f.write("\nversion = {}".format(commitID))
                    f.close()
                else:
                    os.remove(os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
                    os.rename(os.path.join(work_drive, prefix, module, "$PBOPREFIX$.backup"), os.path.join(work_drive, prefix, module, "$PBOPREFIX$"))
    except Exception as e:
        print_error("Failed to include build number: {}".format(e))
        return False

    return True


###############################################################################


def main(argv):
    """Build an Arma addon suite in a directory from rules in a make.cfg file."""
    print_blue("\nmake.py for Arma, modified for Advanced Combat Environment v{}".format(__version__))

    global project_version
    global arma3tools_path
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
    global ciBuild
    global missingFiles
    global failedBuilds
    global printedErrors

    printedErrors = 0

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
        make_release_zip = True
        argv.remove("release")
    else:
        make_release_zip = False

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

    if "version" in argv:
        argv.remove("version")
        version_update = True
    else:
        version_update = False

    version_increments = []
    if "increment_build" in argv:
        argv.remove("increment_build")
        version_increments.append("build")
    if "increment_patch" in argv:
        argv.remove("increment_patch")
        version_increments.append("patch")
    if "increment_minor" in argv:
        argv.remove("increment_minor")
        version_increments.append("minor")
    if "increment_major" in argv:
        argv.remove("increment_major")
        version_increments.append("major")

    if "ci" in argv:
        argv.remove("ci")
        ciBuild = True

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

        # Release archive prefix
        zipPrefix = cfg.get(make_target, "zipPrefix", fallback=project.lstrip("@").lower())

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

        if (os.path.isdir(module_root)):
            os.chdir(module_root)
        else:
            print_error ("Directory {} does not exist.".format(module_root))
            sys.exit(1)

        commit_id = get_commit_ID()
        get_project_version(version_increments)
        key_name = versionStamp = get_private_keyname(commit_id)
        print_green ("module_root: {}".format(module_root))

        if (os.path.isdir(optionals_root)):
            print_green ("optionals_root: {}".format(optionals_root))
        else:
            print("optionals_root does not exist: {}".format(optionals_root))

        print_green ("release_dir: {}".format(release_dir))

    except:
        raise
        print_error("Could not parse make.cfg.")
        sys.exit(1)

    # See if we have been given specific modules to build from command line.
    if len(argv) > 1 and not make_release_zip:
        arg_modules = True
        modules = [a for a in argv[1:] if a[0] != "-"]

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
            depbo_tools = find_depbo_tools()

            pboproject = depbo_tools["pboProject"]
            rapifyTool = depbo_tools["rapify"]
            makepboTool = depbo_tools["MakePbo"]
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

    # Check the build version (from main) with cached version - forces a full rebuild when version changes
    cacheVersion = "None";
    if 'cacheVersion' in cache:
        cacheVersion = cache['cacheVersion']

    if (project_version != cacheVersion):
        cache = {}
        print("Reseting Cache {0} to New Version {1}".format(cacheVersion, project_version))
        cache['cacheVersion'] = project_version

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

    failedBuilds = []
    missingFiles = []

    # Update version stamp in all files that contain it
    # Update version only for release if full update not requested (backup and restore files)
    print_blue("\nChecking for obsolete version numbers...")
    if not version_update:
        stash_version_files_for_building()
    else:
        # Set version
        set_version_in_files();
        print("Version in files has been changed, make sure you commit and push the updates!")

    try:
        # Temporarily copy optionals_root for building. They will be removed later.
        if (os.path.isdir(optionals_root)):
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



            else:
                print_green("\nNOTE: Using key {}".format(os.path.join(private_key_path, key_name + ".biprivatekey")))

            try:
                print("Copying public key to release directory.")

                try:
                    os.makedirs(os.path.join(module_root, release_dir, project, "keys"))
                except:
                    pass

                # Use biKeyNameAbrev to attempt to minimize problems from this BI Bug REFERENCE: http://feedback.arma3.com/view.php?id=22133
                biKeyNameAbrev = key_name.split("-")[0]
                shutil.copyfile(os.path.join(private_key_path, key_name + ".bikey"), os.path.join(module_root, release_dir, project, "keys", "{}.bikey".format(biKeyNameAbrev)))

            except:
                print_error("Could not copy key to release directory.")
                raise

            key = os.path.join(private_key_path, "{}.biprivatekey".format(key_name))

        # Remove any obsolete files.
        print_blue("\nChecking for obsolete files...")
        obsolete_check_path = os.path.join(module_root, release_dir, project,"addons")
        for file in os.listdir(obsolete_check_path):
            if (file.endswith(".pbo") and os.path.isfile(os.path.join(obsolete_check_path,file))):
                if check_for_obsolete_pbos(module_root, file):
                    fileName = os.path.splitext(file)[0]
                    print_yellow("Removing obsolete pbo => {}".format(file))
                    purge(obsolete_check_path, "{}\..".format(fileName), "{}.*".format(fileName))

        obsolete_check_path = os.path.join(module_root, release_dir, project)
        for file in os.listdir(obsolete_check_path):
            if (file.endswith(".dll") and os.path.isfile(os.path.join(obsolete_check_path,file))):
                if not os.path.exists(os.path.join(module_root_parent, file)):
                    print_yellow("Removing obsolete dll => {}".format(file))
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
            missing = not os.path.isfile(os.path.join(release_dir, project, "addons", "{}{}.pbo".format(pbo_name_prefix,module)))
            sigFile = "{}{}.pbo.{}.bisign".format(pbo_name_prefix,module,key_name)
            sigMissing = not os.path.isfile(os.path.join(release_dir, project, "addons", sigFile))

            if missing:
                print_yellow("Missing PBO file {}{}.pbo. Building...".format(pbo_name_prefix,module))

            # Check if it needs rebuilt
            # print ("Hash:", new_sha)
            if old_sha == new_sha and not missing:
                if not force_build:
                    print("Module has not changed.")
                    if sigMissing:
                        if key:
                            print("Missing Signature key {}".format(sigFile))
                            build_signature_file(os.path.join(module_root, release_dir, project, "addons", "{}{}.pbo".format(pbo_name_prefix,module)))
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
                    print_error("Could not copy module to work drive. Does the module exist?")
                    input("Press Enter to continue...")
                    print("Resuming build...")
                    continue
            #else:
                #print("WARNING: Module is stored on work drive ({}).".format(work_drive))

            try:
                # Remove the old pbo, key, and log
                old = os.path.join(module_root, release_dir, project, "addons", "{}{}".format(pbo_name_prefix,module)) + "*"
                files = glob.glob(old)
                for f in files:
                    os.remove(f)

                if pbo_name_prefix:
                    old = os.path.join(module_root, release_dir, project, "addons", "{}{}".format(pbo_name_prefix,module)) + "*"
                    files = glob.glob(old)
                    for f in files:
                        os.remove(f)
            except:
                raise
                print_error("Could not copy module to work drive. Does the module exist?")
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
                    nobinFilePath = os.path.join(work_drive, prefix, module, "$NOBIN$")
                    backup_config(module)

                    version_stamp_pboprefix(module,commit_id)

                    if os.path.isfile(nobinFilePath):
                        print_green("$NOBIN$ Found. Proceeding with non-binarizing!")
                        cmd = [makepboTool, "-P","-A","-G","-N","-X=*.backup", os.path.join(work_drive, prefix, module),os.path.join(module_root, release_dir, project,"addons")]

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
                                os.rename(os.path.join(module_root, release_dir, project, "addons", "{}.pbo".format(module)), os.path.join(module_root, release_dir, project, "addons", "{}{}.pbo".format(pbo_name_prefix,module)))
                            except:
                                raise
                                print_error("Could not rename built PBO with prefix.")
                        # Sign result
                        if (key and not "{}{}.pbo".format(pbo_name_prefix,module) in signature_blacklist):
                            print("Signing with {}.".format(key))
                            if pbo_name_prefix:
                                ret = subprocess.call([dssignfile, key, os.path.join(module_root, release_dir, project, "addons", "{}{}.pbo".format(pbo_name_prefix,module))])
                            else:
                                ret = subprocess.call([dssignfile, key, os.path.join(module_root, release_dir, project, "addons", "{}.pbo".format(module))])

                            if ret == 0:
                                build_successful = True
                        else:
                            build_successful = True

                    if not build_successful:
                        print_error("pboProject return code == {}".format(str(ret)))
                        print_error("Module not successfully built/signed. Check your {}temp\{}_packing.log for more info.".format(work_drive,module))
                        print ("Resuming build...")
                        failedBuilds.append("{}".format(module))
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
                            os.rename(os.path.join(make_root, release_dir, project, "addons", "{}.pbo".format(module)), os.path.join(make_root, release_dir, project, "addons", "{}{}.pbo".format(pbo_name_prefix,module)))
                        except:
                            raise
                            print_error("Could not rename built PBO with prefix.")

                    if ret == 0:
                        # Sign result

                        #print_yellow("Sig_fileName: ace_{}.pbo".format(module))
                        if (key and not "{}{}.pbo".format(pbo_name_prefix,module) in signature_blacklist) :
                            print("Signing with {}.".format(key))
                            if pbo_name_prefix:
                                ret = subprocess.call([dssignfile, key, os.path.join(make_root, release_dir, project, "addons","{}{}.pbo".format(pbo_name_prefix,module))])
                            else:
                                ret = subprocess.call([dssignfile, key, os.path.join(make_root, release_dir, project, "addons", "{}.pbo".format(module))])

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

    except Exception as e:
        print_yellow("Cancel or some error detected: {}".format(e))


    finally:
        copy_important_files(module_root_parent,os.path.join(release_dir, project))
        if (os.path.isdir(optionals_root)):
            cleanup_optionals(optionals_modules)
        if not version_update:
            restore_version_files()

    # Done building all modules!

    # Write out the cache state
    cache_out = json.dumps(cache)
    with open(os.path.join(make_root, "make.cache"), 'w') as f:
        f.write(cache_out)

    # Delete the pboproject temp files if building a release.
    if make_release_zip and build_tool == "pboproject":
        try:
            shutil.rmtree(os.path.join(release_dir, project, "temp"), True)
        except:
            print_error("ERROR: Could not delete pboProject temp files.")

    # Make release
    if make_release_zip:
        release_name = "{}_{}".format(zipPrefix, project_version.rsplit(".", 1)[0])

        try:
            # Delete all log files
            for root, dirs, files in os.walk(os.path.join(release_dir, project, "addons")):
                for currentFile in files:
                    if currentFile.lower().endswith("log"):
                        os.remove(os.path.join(root, currentFile))

            # Remove all zip files from release folder to prevent zipping the zip
            for file in os.listdir(release_dir):
                if file.endswith(".zip"):
                    os.remove(os.path.join(release_dir, file))

            # Create a zip with the contents of release folder in it
            print_blue("\nMaking release: {}.zip ...".format(release_name))
            print("Packing...")
            release_zip = shutil.make_archive("{}".format(release_name), "zip", release_dir)

            # Move release zip to release folder
            shutil.copy(release_zip, release_dir)
            os.remove(release_zip)
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

    tracedErrors = len(failedBuilds) + len(missingFiles)
    if printedErrors > 0: # printedErrors includes tracedErrors
        printedOnlyErrors = printedErrors - tracedErrors
        print()
        print_error("Failed with {} errors.".format(printedErrors))
        if len(failedBuilds) > 0:
            for failedBuild in failedBuilds:
                print("- {} build failed!".format(failedBuild))
        if len(missingFiles) > 0:
            for missingFile in missingFiles:
                print("- {} not found!".format(missingFile))
        if printedOnlyErrors > 0:
            print_yellow("- {} untraced error(s)!".format(printedOnlyErrors))
    else:
        print_green("\nCompleted with 0 errors.")


if __name__ == "__main__":
    start_time = timeit.default_timer()
    main(sys.argv)
    d,h,m,s = Fract_Sec(timeit.default_timer() - start_time)
    print("\nTotal Program time elapsed: {0:2}h {1:2}m {2:4.5f}s".format(h,m,s))

    if ciBuild:
        sys.exit(0)

    input("Press Enter to continue...")

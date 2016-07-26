#!/usr/bin/env python3

#Author: PabstMirror

#Uploads ace relases to workshop
#Will slice up compats to their own folders


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
import fnmatch

if sys.platform == "win32":
    import winreg

def find_bi_tools():
    reg = winreg.ConnectRegistry(None, winreg.HKEY_CURRENT_USER)
    try:
        k = winreg.OpenKey(reg, r"Software\bohemia interactive\arma 3 tools")
        arma3tools_path = winreg.QueryValueEx(k, "path")[0]
        winreg.CloseKey(k)
    except:
        raise Exception("BadTools","Arma 3 Tools are not installed correctly or the P: drive needs to be created.")

    publisher_path = os.path.join(arma3tools_path, "Publisher", "PublisherCmd.exe")

    if os.path.isfile(publisher_path):
        return publisher_path
    else:
        raise Exception("BadTools","Arma 3 Tools are not installed correctly or the P: drive needs to be created.")

def buildCompatFolder(folderName, copyFileNames):
    compatRelease_dir = os.path.join(release_dir, folderName)
    if os.path.exists(compatRelease_dir):
        shutil.rmtree(compatRelease_dir)
    os.makedirs(compatRelease_dir)
    os.makedirs(os.path.join(compatRelease_dir, "addons"))
    print("Adding files for folder {}".format(folderName))
    for copyFileName in copyFileNames:
        for file in os.listdir(ace_optionals_dir):
            if fnmatch.fnmatch(file, copyFileName):
                print("    Copying: {}".format(file))
                shutil.copyfile(os.path.join(ace_optionals_dir, file), os.path.join(compatRelease_dir, "addons", file))

    return compatRelease_dir

def publishFolder(folder,modID,changeNotes):
    cmd = [publisherTool_path, "update", "/id:{}".format(modID), "/changeNote:'{}'".format(changeNotes), "/path:{}".format(folder)]
    print("")
    print("Publishing folder {} to workshop ID {}".format(folder,modID))
    print("")
    if (not do_publish):
        print("Just doing test build")
        return
    ret = subprocess.call(cmd)
    if ret != 0:
        print("publisher faild with code {}".format(ret))
        raise Exception("Publisher","Publisher shit the bed")


#GLOBALS
release_dir = "P:\\z\\ace\\release"
project = "@ace"
publisherTool_path = find_bi_tools()
ace_release_dir = os.path.join(release_dir, project)
ace_optionals_dir = os.path.join(ace_release_dir, "optionals")
do_publish = True #False will let you just build dirs and test without running publisher


def main(argv):
    if not os.path.exists(ace_release_dir):
        raise Exception("No ACE Build","ACE not built")
    if not os.path.exists(ace_optionals_dir):
        raise Exception("No Optionals","ACE not built")
    if not os.path.exists(publisherTool_path):
        raise Exception("No Publisher","Arma Tools not found")


    #Simple changenotes
    changeNotes = "Rebuilt for latest ace release"


    #ACE Main
    # publishFolder(ace_release_dir, "?", changeNotes)


    #RHS Compats
    folder = buildCompatFolder("@ace_rhs_compat", ["ace_compat_rhs_afrf3.*", "ace_compat_rhs_usf3.*"])
    # publishFolder(folder, "??", changeNotes)


    #ADR97 (p90)
    folder = buildCompatFolder("@ace_adr97_compat", ["ace_compat_adr_97.*"])
    publishFolder(folder, "731517232", changeNotes)



if __name__ == "__main__":
    main(sys.argv)


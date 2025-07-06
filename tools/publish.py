#!/usr/bin/env python3

# Author: PabstMirror

# Uploads ace relases to workshop
# Will slice up compats to their own folders
# to use: unzip a ace-latest.zip so that you have a \releases\@ace\addons

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


def publishFolder(folder,modID,changeNotes):
    cmd = [publisherTool_path, "update", "/id:{}".format(modID), "/changeNoteFile:{}".format(changeNotes), "/path:{}".format(folder)]

    print ("running: {}".format(cmd))

    print("")
    print("Publishing folder {} to workshop ID {}".format(folder,modID))
    print("")
    if (not do_publish):
        print("Just doing test build")
        return
    ret = subprocess.call(cmd)
    if ret != 0:
        print("publisher faild with code {}".format(ret))
        raise Exception("Publisher","Publisher had problems")


#GLOBALS
project_base_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
release_dir = os.path.join(project_base_path,"releases")
project = "@ace"
publisherTool_path = find_bi_tools()
changelog_path = os.path.join(release_dir,"changelog.txt")
ace_release_dir = os.path.join(release_dir, project)
ace_optionals_dir = os.path.join(ace_release_dir, "optionals")

do_publish = True
# do_publish = False #will let you just build dirs and test without running publisher


def main(argv):
    if not os.path.exists(ace_release_dir):
        raise Exception("ace_release_dir not found","ACE not built or in wrong path")
    if not os.path.exists(ace_optionals_dir):
        raise Exception("ace_optionals_dir not found","ACE not built or in wrong path")
    if not os.path.exists(publisherTool_path):
        raise Exception("publisherTool_path not found","Arma Tools not found")
    if not os.path.exists(changelog_path):
        raise Exception("changelog_path not found","Requires changelog.txt be present in the release dir")

    if do_publish:
        repl = input("\nThis will publish to steam, are you positive release dir has correct files? (y/n): ")
        if repl.lower() != "y":
            return 0

    #ACE Main - http://steamcommunity.com/sharedfiles/filedetails/?id=463939057
    # Note: command line publisher doesn't like our file structure, just upload this one manually

    #noactionmenu: - https://steamcommunity.com/sharedfiles/filedetails/?id=2202412030
    publishFolder(os.path.join(ace_optionals_dir,"@ace_noactionmenu"), "2202412030", changelog_path)

    #nocrosshair: - https://steamcommunity.com/sharedfiles/filedetails/?id=2202412481
    publishFolder(os.path.join(ace_optionals_dir,"@ace_nocrosshair"), "2202412481", changelog_path)

    #nomedical: - https://steamcommunity.com/sharedfiles/filedetails/?id=3053169823
    publishFolder(os.path.join(ace_optionals_dir,"@ace_nomedical"), "3053169823", changelog_path)

    #norealisticnames: - https://steamcommunity.com/sharedfiles/filedetails/?id=3053177117
    publishFolder(os.path.join(ace_optionals_dir,"@ace_norealisticnames"), "3053177117", changelog_path)

    #nouniformrestrictions: - https://steamcommunity.com/sharedfiles/filedetails/?id=2202413047
    publishFolder(os.path.join(ace_optionals_dir,"@ace_nouniformrestrictions"), "2202413047", changelog_path)

    #particles: - https://steamcommunity.com/sharedfiles/filedetails/?id=2202413537
    publishFolder(os.path.join(ace_optionals_dir,"@ace_particles"), "2202413537", changelog_path)

    #realisticdispersion: - https://steamcommunity.com/sharedfiles/filedetails/?id=2202414018
    publishFolder(os.path.join(ace_optionals_dir,"@ace_realisticdispersion"), "2202414018", changelog_path)

    #tracers: - https://steamcommunity.com/sharedfiles/filedetails/?id=2202414450
    publishFolder(os.path.join(ace_optionals_dir,"@ace_tracers"), "2202414450", changelog_path)


if __name__ == "__main__":
    main(sys.argv)

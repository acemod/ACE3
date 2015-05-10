#!/usr/bin/env python3

####################################
# ACE3 automatic deployment script #
# ================================ #
# This is not meant to be run      #
# directly!                        #
####################################

import os
import sys
import shutil
import traceback
import subprocess as sp
from pygithub3 import Github


TRANSLATIONISSUE = 367
TRANSLATIONBODY = """**How to translate ACE3:**
https://github.com/acemod/ACE3/blob/master/documentation/development/how-to-translate-ace3.md

{}
"""

REPOUSER = "acemod"
REPONAME = "ACE3"
REPOPATH = "{}/{}".format(REPOUSER,REPONAME)

USERNAME = "ACE3 Travis"
USEREMAIL = "travis@ace3mod.com"


def update_translations(token):
    diag = sp.check_output(["python3", "tools/stringtablediag.py", "--markdown"])
    diag = str(diag, "utf-8")
    repo = Github(token).get_repo(REPOPATH)
    issue = repo.get_issue(TRANSLATIONISSUE)
    issue.edit(body=TRANSLATIONBODY.format(diag))


def deploy_documentation(token):
    devnull = open(os.devnull, "w")
    url = "https://{}@github.com/{}".format(token, REPOPATH)

    sp.check_call(["git", "clone", url, "out", "--depth", "10", "--branch", "gh-pages"], stdout=devnull, stderr=devnull)
    os.chdir("out")

    sp.check_call(["git", "config", "user.name", USERNAME])
    sp.check_call(["git", "config", "user.email", USEREMAIL])

    for root, dirs, files in os.walk("../documentation", topdown=False):
        target = root.replace("../documentation", "wiki")
        if root == "../documentation":
            continue
        for name in files:
            print("{} => {}".format(os.path.join(root, name), os.path.join(target, name)))
            shutil.copyfile(os.path.join(root, name), os.path.join(target, name))

    sp.check_call(["git", "add", "--all", "."])

    filenum = sp.check_output(["git", "status", "--porcelain"])
    filenum = len(str(filenum, "utf-8").split("\n")) - 1
    if filenum > 0:
        sp.check_call(["git", "commit", "-m", "Automatic gh-pages deployment"])
        print("Pushing changes ...")
        sp.check_call(["git", "push", "origin", "gh-pages"], stdout=devnull, stderr=devnull)
    else:
        print("No changes.")

    os.chdir("..")


def main():
    print("Obtaining token ...")
    try:
        token = os.environ["GH_TOKEN"]
    except:
        print("Could not obtain token.")
        print(traceback.format_exc())
        return 1
    else:
        print("done.")

    print("\nUpdating translation issue ...")
    try:
        update_translations(token)
    except:
        print("Failed to update translation issue.")
        print(traceback.format_exc())
        return 1
    else:
        print("done.")

    print("\nDeploying documentation ...")
    try:
        deploy_documentation(token)
    except:
        print("Failed to deploy documentation.")
        print(traceback.format_exc())
        return 1
    else:
        print("done.")

    return 0


if __name__ == "__main__":
    sys.exit(main())

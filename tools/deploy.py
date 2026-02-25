#!/usr/bin/env python3

####################################
# ACE3 automatic deployment script #
# ================================ #
# This is not meant to be run      #
# directly!!                       #
####################################

import os
import sys
import traceback
import subprocess as sp
from github import Github, Auth


TRANSLATIONISSUE = 367
TRANSLATIONBODY = """**[ACE3 Translation Guide](http://ace3.acemod.org/wiki/development/how-to-translate-ace3.html)**

{}
"""

REPOUSER = "acemod"
REPONAME = "ACE3"
REPOPATH = "{}/{}".format(REPOUSER, REPONAME)

BRANCH = "master"


def update_translations(repo):
    diag = sp.check_output(["python3", "tools/stringtablediag.py", "--markdown"])
    diag = str(diag, "utf-8")
    issue = repo.get_issue(TRANSLATIONISSUE)
    issue.edit(body=TRANSLATIONBODY.format(diag))


def main():
    print("Obtaining token ...")
    try:
        token = os.environ["GH_TOKEN"]
        auth = Auth.Token(token)
        repo = Github(auth=auth).get_repo(REPOPATH)
    except:
        print("Could not obtain token.")
        print(traceback.format_exc())
        return 1
    else:
        print("Token sucessfully obtained.")

    print("\nUpdating translation issue ...")
    try:
        update_translations(repo)
    except:
        print("Failed to update translation issue.")
        print(traceback.format_exc())
        return 1
    else:
        print("Translation issue successfully updated.")

    return 0


if __name__ == "__main__":
    sys.exit(main())

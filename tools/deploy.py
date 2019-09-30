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
from github import Github, InputGitAuthor


TRANSLATIONISSUE = 367
TRANSLATIONBODY = """**[ACE3 Translation Guide](http://ace3mod.com/wiki/development/how-to-translate-ace3.html)**

{}
"""

DEPENDENCIESPATH = "docs/_includes/dependencies_list.md"

REPOUSER = "acemod"
REPONAME = "ACE3"
REPOPATH = "{}/{}".format(REPOUSER,REPONAME)

BRANCH = "master"


def update_translations(repo):
    diag = sp.check_output(["python3", "tools/stringtablediag.py", "--markdown"])
    diag = str(diag, "utf-8")
    issue = repo.get_issue(TRANSLATIONISSUE)
    issue.edit(body=TRANSLATIONBODY.format(diag))

def update_dependencies(repo):
    dependencies = sp.check_output(["python3", "tools/extract_dependencies.py", "--markdown"])
    dependencies = str(dependencies, "utf-8")
    diff = sp.check_output(["git", "diff", "--name-only", DEPENDENCIESPATH])
    diff = str(diff, "utf-8")

    if diff != "":
        sha = repo.get_contents(DEPENDENCIESPATH, ref=BRANCH).sha
        repo.update_file(
            path="{}".format(DEPENDENCIESPATH),
            message="[Docs] Update component dependencies\nAutomatically committed through CI.\n\n[ci skip]",
            content=dependencies, sha=sha, committer=InputGitAuthor("ace3mod", "ace3mod@gmail.com"), branch=BRANCH
        )
        print("Dependencies successfully updated.")
    else:
        print("Dependencies skipped - no change.")


def main():
    print("Obtaining token ...")
    try:
        token = os.environ["GH_TOKEN"]
        repo = Github(token).get_repo(REPOPATH)
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

    print("\nUpdating dependencies list ...")
    try:
        update_dependencies(repo)
    except:
        print("Failed to update dependencies.")
        print(traceback.format_exc())
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())

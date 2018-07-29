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


def sort_stringtables(repo):
    sp.run(["python3", "tools/sort_stringtables.py"])
    diff = sp.check_output(["git", "diff", "--name-only"])
    diff = str(diff, "utf-8")

    if diff != "":
        for file in diff.split("\n"):
            sha = repo.get_contents(file).sha
            with open(file) as f:
                new_content = f.read()
            rel_path = os.path.basename(os.path.normpath(os.path.split(file)[0]))
            repo.update_file(
                path="/{}".format(file),
                message="[Auto] Sort {} stringtable.xml\nAutomatically committed through Travis CI.\n\n[ci skip]".format(file),
                content=new_content, sha=sha, committer=InputGitAuthor("ace3mod", "ace3mod@gmail.com")
            )

        print("Stringtables successfully sorted.")
    else:
        print("Stringtable sorting skipped - already sorted.")


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
        sha = repo.get_contents(DEPENDENCIESPATH
            #, ref="travisForDocs" # Debug
        ).sha
        repo.update_file(
            path="/{}".format(DEPENDENCIESPATH),
            message="[Docs] Update component dependencies\nAutomatically committed through Travis CI.\n\n[ci skip]",
            content=dependencies, sha=sha, committer=InputGitAuthor("ace3mod", "ace3mod@gmail.com")
            #, branch="travisForDocs" # Debug
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

    print("\nSorting stringtables ...")
    try:
        sort_stringtables(repo)
    except:
        print("Failed to sort stringtables.")
        print(traceback.format_exc())
        return 1

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

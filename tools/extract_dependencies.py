#!/usr/bin/env python3

# Author: Jonpas
# Extracts dependencies to a file (defined in globals), which can be used by update_dependencies.py on gh-pages branch

import os
import sys
import re

######## GLOBALS #########
FILE_EXTRACTED = "temp\\dependencies.temp"
##########################

def get_dependencies(line):
    dependencies = re.findall(r'"(.*?)"', line)
    return dependencies


def main():
    print("""
    ####################################
    # Extract ACE3 Module Dependencies #
    ####################################
    """)

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    addonspath = os.path.join(projectpath, "addons")

    # Prepare directory and file
    if not os.path.exists("temp"):
        os.makedirs("temp")

    open(FILE_EXTRACTED, "w").close()

    # Iterate through folders in the addons directory
    for folder in next(os.walk(addonspath))[1]:
        # Open config.cpp file and extract dependencies
        data = []
        with open(os.path.join(addonspath, folder, "config.cpp")) as file:
            match = False
            for line in file:
                # One-line
                if not match and re.match(r"\s+requiredAddons\[\]\ = {.+?};", line):
                    data += get_dependencies(line)
                    break
                # Multi-line
                else:
                    if re.match(r"\s+requiredAddons\[\]\ = {", line):
                        # First line
                        match = True
                        data += get_dependencies(line)
                        continue
                    elif match and re.match(r"\s+};", line):
                        # Final line
                        data += get_dependencies(line)
                        match = False
                        break
                    elif match:
                        # All lines between
                        data += get_dependencies(line)
                        continue

        print("{}: {}".format(folder,data))

        with open(FILE_EXTRACTED, "a") as file:
            file.write("['{}', {}]\n".format(folder,data))

    print("\nCopy 'temp\dependencies.temp' and run 'update_dependencies_from_file.py' script in 'gh-pages' branch to put the extracted information to the wiki.")


if __name__ == "__main__":
    main()

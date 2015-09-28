#!/usr/bin/env python3

# Author: Jonpas

import os
import sys
import re

######## GLOBALS #########
FILE_EXTRACTED = "temp\\dependencies.temp"
##########################

def writeToFile(string):
    with open(FILE_EXTRACTED, "a") as file:
        file.write("{}\n".format(string))


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
        writeToFile(folder)
        print("Module: {}".format(folder))

        # Open config.cpp file
        with open(os.path.join(addonspath, folder, "config.cpp")) as file:
            for line in file:
                # Extract dependencies
                match = re.match(r"\s+requiredAddons\[]\ = {(.+)};", line)
                if match:
                    data = match.group(1).replace("\"", "`").replace(" ", "")
                    writeToFile(data)
                    print("- Dependencies: {}\n".format(data))


    print("\nCopy 'temp\dependencies.temp' and run 'update_dependencies_from_file.py' script in 'gh-pages' branch to put the extracted information to the wiki.")


if __name__ == "__main__":
    main()

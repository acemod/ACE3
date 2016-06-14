#!/usr/bin/env python3

# Author: Jonpas
# Extracts dependencies to a file (defined in globals) for use with Jekyll include statement.
# Place generated file to "_includes/" folder on gh-pages branch and use the following line to add dependencies to a feature page:
# {% include dependencies_list.md component="<component>" %}

import os
import sys
import re

######## GLOBALS #########
FILE_EXTRACTED = "temp\\dependencies_list.md"
##########################

def get_dependencies(line):
    dependencies = re.findall(r'"(.*?)"', line)
    return dependencies


def main():
    print("""
    ####################################
    # Extract ACE3 Module Dependencies #
    #       (for Jekyll include)       #
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

        data = "`, `".join(data)
        data = "`{}`".format(data)
        print("{}: {}".format(folder,data))

        with open(FILE_EXTRACTED, "a") as file:
            file.writelines([
                "{% if include.component == \"" + folder + "\" %}\n",
                "{}\n".format(data),
                "{% endif %}\n",
            ])

    print("\nCopy 'temp\dependencies_list.md' to '_includes/' folder on 'gh-pages' branch.")


if __name__ == "__main__":
    main()

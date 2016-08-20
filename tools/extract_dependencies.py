#!/usr/bin/env python3

# Author: Jonpas
# Extracts dependencies to "docs/_includes/dependencies_list.md" for use with Jekyll include statement.
# Use the following line to add dependencies to a feature page:
# {% include dependencies_list.md component="<component>" %}

import os
import sys
import re


def get_dependencies(line):
    dependencies = re.findall(r'"(.*?)"', line)
    return dependencies


def main():
    if "--markdown" not in sys.argv:
        print("""
        ####################################
        # Extract ACE3 Module Dependencies #
        #       (for Jekyll include)       #
        ####################################
        """)

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    addonspath = os.path.join(projectpath, "addons")
    includepath = os.path.join(projectpath, "docs", "_includes")
    dependenciespath = os.path.join(includepath, "dependencies_list.md")

    # Prepare directory and file
    if not os.path.exists(includepath):
        print("Jekyll documentation not found!")
        sys.exit(0)

    open(dependenciespath, "w", newline="\n").close()

    # Iterate through folders in the addons directory
    for folder in next(os.walk(addonspath))[1]:
        # Ignore "main" component
        if folder == "main":
            continue

        # Open config.cpp file and extract dependencies
        data = []
        configfile = os.path.join(addonspath, folder, "config.cpp")
        if os.path.exists(configfile):
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

        jekyll_statement = "".join([
            "{% if include.component == \"" + folder + "\" %}\n",
            "{}\n".format(data),
            "{% endif %}\n"
        ])

        with open(dependenciespath, "a", newline="\n") as file:
            file.writelines([jekyll_statement, "\n"])

        if "--markdown" not in sys.argv:
            print("{}: {}".format(folder,data))
        else:
            print(jekyll_statement)


if __name__ == "__main__":
    main()

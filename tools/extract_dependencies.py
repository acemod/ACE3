#!/usr/bin/env python3

# Author: Jonpas
# Extracts dependencies to "docs/_includes/dependencies_list.md" for use with Jekyll include statement.
# Use the following line to add dependencies to an ACE3 feature page: {% include dependencies_list.md component="<component>" %}


import os
import sys
import re


def get_dependencies(line):
    dependencies = re.findall(r'"(.*?)"', line)
    return dependencies


def main():
    if "--markdown" not in sys.argv:
        print("""
        #############################################
        #     Extract ACE3 Module Dependencies      #
        #           (for Jekyll include)            #
        #############################################
        """)

    # Mod paths
    script_path = os.path.realpath(__file__)
    project_path = os.path.dirname(os.path.dirname(script_path))
    addons_path = os.path.join(project_path, "addons")
    optionals_path = os.path.join(project_path, "optionals")

    # Documentation paths
    include_path = os.path.join(project_path, "docs", "_includes")
    dependencies_path = os.path.join(include_path, "dependencies_list.md")

    # Prepare files and paths list
    if not os.path.exists(include_path):
        print("Jekyll documentation not found!")
        sys.exit(0)

    open(dependencies_path, "w", newline="\n").close()
    if os.path.exists(addons_path):
        addons = sorted(next(os.walk(addons_path))[1])
        if os.path.exists(optionals_path):
            addons += ["."] + sorted(next(os.walk(optionals_path))[1])

    dependencies_path_current = dependencies_path
    addons_path_current = addons_path

    # Iterate through folders in the addons directories
    for folder in addons:
        # Ignore "main" component
        if folder == "main":
            continue

        # Change to optionals list on "." separator
        if folder == ".":
            if addons_path_current == addons_path:
                addons_path_current = optionals_path
            continue

        # Open config.cpp file and extract dependencies
        data = []
        configfile = os.path.join(addons_path_current, folder, "config.cpp")

        if os.path.exists(configfile):
            with open(os.path.join(addons_path_current, folder, "config.cpp")) as file:
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

            with open(dependencies_path_current, "a", newline="\n") as file:
                file.writelines([jekyll_statement, "\n"])

            if "--markdown" not in sys.argv:
                print("{}: {}".format(folder, data))
            else:
                print(jekyll_statement)


if __name__ == "__main__":
    main()

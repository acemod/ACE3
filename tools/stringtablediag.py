#!/usr/bin/env python3

import os
import sys

from xml.dom import minidom

# STRINGTABLE DIAG TOOL
# Author: KoffeinFlummi
# ---------------------
# Checks for missing translations and all that jazz.

def get_all_languages(projectpath):
    """ Checks what languages exist in the repo. """
    languages = []

    for module in os.listdir(projectpath):
        if module[0] == ".":
            continue

        stringtablepath = os.path.join(projectpath, module, "stringtable.xml")
        try:
            xmldoc = minidom.parse(stringtablepath)
        except:
            continue

        keys = xmldoc.getElementsByTagName("Key")
        for key in keys:
            for child in key.childNodes:
                try:
                    if not child.tagName in languages:
                        languages.append(child.tagName)
                except:
                    continue

    return languages

def check_module(projectpath, module, languages):
    """ Checks the given module for all the different languages. """
    localized = []

    stringtablepath = os.path.join(projectpath, module, "stringtable.xml")
    try:
        xmldoc = minidom.parse(stringtablepath)
    except:
        return 0, localized

    keynumber = len(xmldoc.getElementsByTagName("Key"))

    for language in languages:
        localized.append(len(xmldoc.getElementsByTagName(language)))

    return keynumber, localized

def main():
    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    projectpath = os.path.join(projectpath, "addons")

    if "--markdown" not in sys.argv:
        print("#########################")
        print("# Stringtable Diag Tool #")
        print("#########################")

    languages = get_all_languages(projectpath)

    if "--markdown" not in sys.argv:
        print("\nLanguages present in the repo:")
        print(", ".join(languages))

    keysum = 0
    localizedsum = list(map(lambda x: 0, languages))
    missing = list(map(lambda x: [], languages))

    for module in os.listdir(projectpath):
        keynumber, localized = check_module(projectpath, module, languages)

        if keynumber == 0:
            continue

        if "--markdown" not in sys.argv:
            print("\n# " + module)

        keysum += keynumber
        for i in range(len(localized)):
            if "--markdown" not in sys.argv:
                print("  %s %s / %i" % ((languages[i]+":").ljust(10), str(localized[i]).ljust(3), keynumber))
            localizedsum[i] += localized[i]
            if localized[i] < keynumber:
                missing[i].append(module)

    if "--markdown" not in sys.argv:
        print("\n###########")
        print("# RESULTS #")
        print("###########")
        print("\nTotal number of keys: %i\n" % (keysum))

        for i in range(len(languages)):
            if localizedsum[i] == keysum:
                print("%s No missing stringtable entries." % ((languages[i] + ":").ljust(12)))
            else:
                print("%s %s missing stringtable entry/entries." % ((languages[i] + ":").ljust(12), str(keysum - localizedsum[i]).rjust(4)), end="")
                print(" ("+", ".join(missing[i])+")")

        print("\n\n### MARKDOWN ###\n")

    print("Total number of keys: %i\n" % (keysum))

    print("| Language | Missing Entries | Relevant Modules | % done |")
    print("|----------|----------------:|------------------|--------|")

    for i, language in enumerate(languages):
        if localizedsum[i] == keysum:
            print("| {} | 0 | - | 100% |".format(language))
        else:
            print("| {} | {} | {} | {}% |".format(
                language,
                keysum - localizedsum[i],
                ", ".join(missing[i]),
                round(100 * localizedsum[i] / keysum, 2)))

if __name__ == "__main__":
    main()

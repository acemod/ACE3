#!/usr/bin/env python3

import os
import sys
import re

from xml.dom import minidom

# STRINGTABLE MERGER TOOL
# Author: KoffeinFlummi
# --------------------------
# Automatically merges all stringtable entries
# in the given language from the given dir.

def get_modules(projectpath):
    """ Get all the modules of the project. """
    modules = []

    for i in os.listdir(projectpath):
        path = os.path.join(projectpath, i)
        if not os.path.isdir(path):
            continue
        if i[0] == ".":
            continue
        modules.append(i)

    return modules

def contains_language(key, language):
    """ Checks whether a given key contains a certain language. """
    for child in key.childNodes:
        try:
            assert(child.tagName == language)
            return True
        except:
            pass

    return False

def get_entry_by_id(keys, keyid):
    """ Returns the first child of keys with ID='keyid'. """
    for key in keys:
        if key.getAttribute("ID") == keyid:
            return key

    return False

def replace_entries(oldpath, newpath, language, breakdown):
    """ Replaces all new entries of the given language in the given module. """
    oldfile = minidom.parse(oldpath)
    newfile = minidom.parse(newpath)

    oldkeys = oldfile.getElementsByTagName("Key")
    newkeys = newfile.getElementsByTagName("Key")
    newkeys = list(filter(lambda x: contains_language(x, language), newkeys))

    for newkey in newkeys:
        keyid = newkey.getAttribute("ID")
        oldkey = get_entry_by_id(oldkeys, keyid)

        if not oldkey:
            continue

        if breakdown:
            print("  Merging %s translation for %s" % (language, keyid))

        newentry = newkey.getElementsByTagName(language)[0].firstChild

        try:
            # An entry for this language already exists, overwrite it
            oldentry = oldkey.getElementsByTagName(language)[0].firstChild
            oldentry.replaceWholeText(newentry.wholeText)
        except:
            # There is no entry for this language yet, make one
            oldentry = oldfile.createElement(language)
            oldentry.appendChild(oldfile.createTextNode(newentry.wholeText))
            # Some whitespace tetris to maintain file structure
            oldkey.insertBefore(oldfile.createTextNode("\n          "), oldkey.lastChild)
            oldkey.insertBefore(oldentry, oldkey.lastChild)

    # Make a nice string
    xmlstring = oldfile.toxml()
    xmlstring = xmlstring.replace('" ?>', '" encoding="utf-8"?>')

    # Replace the newlines that minidom swallows
    xmlstring = xmlstring.replace("><", ">\n<")
    xmlstring += "\n"

    fhandle = open(oldpath, "w")
    fhandle.write(xmlstring)
    fhandle.close()

    return len(newkeys)

def main(sourcepath, language, breakdown):
    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    projectpath = os.path.join(projectpath, "addons")

    modules = get_modules(projectpath)
    modulecounter = 0
    keycounter = 0

    for module in modules:
        oldpath = os.path.join(projectpath, module, "stringtable.xml")
        newpath = os.path.join(sourcepath, module, "stringtable.xml")

        # Some translators extract the lowercase PBOs, so the module name might
        # be lowercase (obviously only matters on Linux)
        if not os.path.exists(newpath):
            newpath = os.path.join(sourcepath, module.lower(), "stringtable.xml")

        # Translator didn't include this module, skip
        if not os.path.exists(newpath):
            continue

        keynum = replace_entries(oldpath, newpath, language, breakdown)
        modulecounter += 1
        keycounter += keynum

        print("# Merged %i entry/entries in %s" % (keynum, module))
        if breakdown:
            print("")

    print("")
    print("# Merged %i entry/entries in %i modules" % (keycounter, modulecounter))

if __name__ == "__main__":
    try:
        sourcepath = os.path.normpath(os.path.join(os.getcwd(), sys.argv[1]))
        language = sys.argv[2]
    
        assert(os.path.exists(sourcepath))
    except:
        print("ERROR: Missing arguments of invalid path.")
        print("\nUsage:")
        print("[script] [path to new project] [language]")
        sys.exit(1)

    main(sourcepath, language, "--breakdown" in sys.argv)

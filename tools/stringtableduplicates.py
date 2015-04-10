#!/usr/bin/env python3

import os
import sys
from xml.dom import minidom

# STRINGTABLE DUPLICATE FINDER
# Author: KoffeinFlummi
# ----------------------------
# Counts duplicate stringtable entries

def main():
    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    projectpath = os.path.join(projectpath, "addons")

    entries = {}

    for module in os.listdir(projectpath):
        if module[0] == ".":
            continue
        stringtablepath = os.path.join(projectpath, module, "stringtable.xml")
        try:
            xmldoc = minidom.parse(stringtablepath)
        except:
            continue

        keys = xmldoc.getElementsByTagName("English")
        for key in keys:
            text = key.firstChild.wholeText
            parentid = key.parentNode.getAttribute("ID")
            if text in entries:
                entries[text].append(parentid)
            else:
                entries[text] = [parentid]

    entries = {k: v for k, v in entries.items() if len(v) > 1}
    output = list([[k, v] for k, v in entries.items()])
    output = sorted(output, key=lambda x: len(x[1])*-1)

    print("Potential duplicate stringtable entries:\n")
    for l in output:
        k, v = l
        print(k.ljust(50), end=" ")
        print("Listed %i times in: %s" % (len(v), ", ".join(v)))

    print("\n# MARKDOWN\n")

    print("| Text | # Occurences | Containing Entries |")
    print("|------|-------------:|--------------------|")

    for l in output:
        print("| %s | %i | %s |" % (l[0], len(l[1]), ", ".join(l[1])))

if __name__ == "__main__":
    main()

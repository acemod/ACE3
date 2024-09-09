#!/usr/bin/env python3

import fnmatch
import os
import xml.etree.ElementTree as ET

# STRINGTABLE SORTER
# Author: kymckay, johnb43, mharis001
# ---------------------
# Sorts all stringtable.xml files in the project.
#   - Sorts both the entries and each entry's attributes (languages).
#   - English is placed as the first translation.
#
# Important: This deletes all comments in the stringtable.xml files!

def sort_children(parent):
    parent[:] = sorted(parent, key=lambda child: child.get('ID') if child.tag == 'Key' else child.get('name'))

    for child in parent:
        if child.tag in ('Package','Container'):
            sort_children(child)
            continue

        # This part sorts languages alphabetically
        if child.tag == 'Key':
            elements = []

            for element in child.iter():
                if element.tag != 'Key':
                    elements.append(element)

            if len(elements) == 0:
                continue

            # Sort languages alphabetically
            elements = sorted(elements, key=lambda element: element.tag)

            # https://stackoverflow.com/questions/51410881/python-equivalent-of-c-find-if
            try:
                index = next(idx for idx, n in enumerate(elements) if n.tag == 'English')
            except StopIteration:
                print('ERROR - English missing in "{}"'.format(child.attrib.get('ID')))
                continue

            # Move English to the top
            elementEnglish = elements[index]
            elements.pop(index)
            elements.insert(0, elementEnglish)

            # Remove old element and append it again
            for element in elements:
                child.remove(element)
                child.append(element)


def indent_pretty(parent, level=0):
    parent.tail = '\n' + "".join(['    '] * level)

    if len(parent) == 0:
        return

    last_child = parent[len(parent) - 1]

    for child in parent:
        indent_pretty(child, level+1)

        if child == last_child:
            child.tail = parent.tail


def main():
    print("Sorting Stringtables")
    print("-----------------------")

    # Allow running from root directory and tools directory
    root_dir = ".."

    if os.path.exists("addons"):
        root_dir = "."

    # Check all stringtable.xml files in the project directory
    stringtable_files = []

    for root, _, files in os.walk(root_dir):
        for file in fnmatch.filter(files, "stringtable.xml"):
            if (".hemttout" in root):
                continue

            stringtable_files.append(os.path.join(root, file))

    stringtable_files.sort()

    for filepath in stringtable_files:
        tree = ET.parse(filepath)
        xml_root = tree.getroot()

        # Verify that stringtable is structured as expected
        if xml_root.tag != 'Project':
            print('Missing "Project" root tag: {}'.format(os.path.relpath(filepath, root_dir)))
            continue

        sort_children(xml_root)
        indent_pretty(xml_root)
        print('Sorted: {}'.format(os.path.relpath(filepath, root_dir)))

        tree.write(filepath, encoding="utf-8", xml_declaration=True, method='xml')


if __name__ == "__main__":
    main()

#!/usr/bin/env python3

import os
import xml.etree.ElementTree as ET

def sort_children(parent):
    parent[:] = sorted(parent, key=lambda child: child.get('ID') if child.tag == 'Key' else child.get('name'))
    for child in parent:
        if child.tag in ('Package','Container'):
            sort_children(child)


def indent_pretty(parent, level=0):
    parent.tail = '\n' + "".join(['    '] * level)

    if len(parent) is 0:
        return

    last_child = parent[len(parent) - 1]
    for child in parent:
        indent_pretty(child, level+1)
        if child == last_child:
            child.tail = '\n' + "".join(['    '] * level)


def main():
    for root, dirs, files in os.walk('../addons/'):
        for file in files:
            if file == 'stringtable.xml':
                filepath = root + '/' + file

                tree = ET.parse(filepath)
                xml_root = tree.getroot()

                # Verify that stringtable is structured as expected
                if xml_root.tag != 'Project':
                    print('Missing "Project" root tag: {}'.format(filepath))


                print('Sorting: {}'.format(filepath))
                sort_children(xml_root)
                indent_pretty(xml_root)

                tree.write(filepath, encoding='utf-8', xml_declaration=True, method='xml')


if __name__ == "__main__":
    main()

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
            child.tail = parent.tail


def main():
    # Mod paths
    script_path = os.path.realpath(__file__)
    project_path = os.path.dirname(os.path.dirname(script_path))
    addons_path = os.path.join(project_path, 'addons')
    optionals_path = os.path.join(project_path, 'optionals')

    if os.path.exists(addons_path):
        addons = sorted(next(os.walk(addons_path))[1])
        if os.path.exists(optionals_path):
            addons += ['.'] + sorted(next(os.walk(optionals_path))[1])

    addons_path_current = addons_path

    for folder in addons:
        # Change to optionals list on "." separator
        if folder == '.':
            if addons_path_current == addons_path:
                addons_path_current = optionals_path
            continue

        # All stringtables have the same filename in addon root
        filepath = os.path.join(addons_path_current, folder, 'stringtable.xml')

        # Not all addons have stringtable.xml
        if not os.path.isfile(filepath):
            continue

        tree = ET.parse(filepath)
        xml_root = tree.getroot()

        # Verify that stringtable is structured as expected
        if xml_root.tag != 'Project':
            #print('Missing "Project" root tag: {}'.format(os.path.join(folder, 'stringtable.xml')))
            continue

        sort_children(xml_root)
        indent_pretty(xml_root)
        #print('Sorted: {}'.format(os.path.join(folder, 'stringtable.xml')))

        tree.write(filepath, encoding='utf-8', xml_declaration=True, method='xml')



if __name__ == "__main__":
    main()

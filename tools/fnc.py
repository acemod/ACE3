import os
import sys
import re
import glob
import subprocess
import textwrap

PREFIX = 'ace'
AUTHOR = ''
ADDONS = '../addons/'
PREP = 'XEH_PREP.hpp'
EDITOR = 'C:/Program Files/Sublime Text 3/sublime_text.exe'

def getFunctionPath(addon, name):
    return "{}{}/functions/fnc_{}.sqf".format(ADDONS, addon, name)

def getPrepPath(addon):
    return "{}{}/{}".format(ADDONS, addon, PREP)

def appendPrep(addon, name):
    prepPath = getPrepPath(addon)
    prep = open(prepPath, "a")
    prep.write("PREP({});\n".format(name))
    prep.close()

def openFile(file):
    subprocess.Popen([EDITOR, file])

def replaceFunctionInCode(oldAddon, oldName, newAddon, newName):
    for subdir, dirs, files in os.walk(ADDONS):
        for addon in dirs:
            files = glob.iglob('{0}{1}/**/*.*'.format(ADDONS, addon), recursive=True)
            for file in files:
                if ".sqf" in file or ".cpp" in file or ".hpp" in file:
                    newContent = ''
                    with open(file, 'r') as script:
                        for line in script.readlines():
                            if re.search(r'EFUNC\({0},[\s\S]*{1}\)'.format(oldAddon, oldName), line, re.IGNORECASE):
                                newLine = re.sub(
                                    r'EFUNC\({0},[\s\S]*{1}\)'.format(oldAddon, oldName),
                                    "EFUNC({0}, {1})".format(newAddon, newName),
                                    line,
                                    flags=re.IGNORECASE
                                )

                                print("Replaced {0} with {1} in {2}".format(
                                    "EFUNC({0}, {1})".format(oldAddon, oldName),
                                    "EFUNC({0}, {1})".format(newAddon, newName),
                                    file
                                ))

                                newContent += newLine
                            else:
                                if addon == newAddon and "func({0})".format(oldName.lower()) in line.lower():
                                    newLine = line.replace(
                                        "FUNC({0})".format(oldName),
                                        "FUNC({0})".format(newName)
                                    )

                                    print("Replaced {0} with {1} in {2}".format(
                                        "FUNC({0})".format(oldName),
                                        "FUNC({0})".format(newName),
                                        file
                                    ))

                                    newContent += newLine
                                else:
                                    newContent += line

                    # Overwrite contents
                    f = open(file, "w")
                    f.write(newContent)
                    f.close()
        break

def createFunction(addon, name, contents=''):
    function = getFunctionPath(addon, name)

    if os.path.exists(function):
        print("Function already exists, exiting")
        return

    file = open(function, "w")

    if contents == '':
        file.write(textwrap.dedent('''\
            /*
             * Author: {0}
             * 
             *
             * Arguments:
             * 
             *
             * Return Value:
             * 
             *
             * Example:
             * [] call {3}_{1}_fnc_{2};
             *
             * Public: 
             */

            #include "script_component.hpp"
            ''').format(AUTHOR, addon, name, PREFIX))
    else:
        file.write(contents)

    file.close()

    appendPrep(addon, name)
    openFile(function)

def deleteFunction(addon, name):
    function = getFunctionPath(addon, name)

    if not os.path.exists(function):
        print("Function does not exist")
        return

    os.remove(function)

    file = open(getPrepPath(addon), 'r+')
    lines = file.readlines()
    file.seek(0)

    for line in lines:
        if line != "PREP({0});\n".format(name):
            file.write(line)

    file.truncate()
    file.close()

def moveFunction(addon, name, newAddon):
    contents = ''
    with open(getFunctionPath(addon, name)) as file:
        contents = file.read()
    deleteFunction(addon, name)
    createFunction(newAddon, name, contents)
    replaceFunctionInCode(addon, name, newAddon, name)

def renameFunction(addon, name, newName):
    contents = ''
    with open(getFunctionPath(addon, name)) as file:
        contents = file.read()
    deleteFunction(addon, name)
    createFunction(addon, newName, contents)
    replaceFunctionInCode(addon, name, addon, newName)

def main():
    args = sys.argv

    if "-c" in args:
        createFunction(args[2], args[3])
        sys.exit(2)

    if "-d" in args:
        deleteFunction(args[2], args[3])
        sys.exit(2)

    if "-r" in args:
        renameFunction(args[2], args[3], args[4])
        sys.exit(2)

    if "-m" in args:
        moveFunction(args[2], args[3], args[4])
        sys.exit(2)

if __name__ == '__main__':
    main()

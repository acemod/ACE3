import os
import sys
import re

un_capitalize = lambda s: s[:1].lower() + s[1:] if s else ''

def add_to_config(old, new):
    with open(add_to_config.file, "r+") as file:
        contents = file.read()

        events_class = re.search(r"class\s+ACE_newEvents\s+{\n",contents,re.I)

        if events_class:
            newline_index = events_class.end()
            insert = "    {0} = \"{1}\";\n".format(old,new)
        else:
            newline_index = len(contents)
            insert = "\nclass ACE_newEvents {{\n    {0} = \"{1}\";\n}};".format(old,new)

        contents = contents[:newline_index] + insert + contents[newline_index:]

        file.seek(0)
        file.write(contents)
        file.truncate()

def event_replace(match):
    event = un_capitalize(match.group(1))
    add_to_config(match.group(1), "ace_" + event)

    return "[\"ace_{0}\", {1}] call CBA_fnc_{2}".format(event,match.group(2),match.group(3))

def process_directory(dir, config=""):
    if not config:
        config = os.path.join(dir,"config.cpp")
        if os.path.isfile(config):
            add_to_config.file = config

    for p in os.listdir(dir):
        path = os.path.join(dir, p)
        if os.path.isdir(path):
            process_directory(path, config)
            continue

        ext = os.path.splitext(path)[1]
        if ext not in [".sqf",".hpp",".cpp"]:
            continue

        with open(path, "r+") as file:
            contents = file.read()

            # Simple single-line substitutions
            find = r"\[\s*\"(?!ace_)(\w+)\"\s*,\s*(.+?)\s*\]\s+call\s+CBA_fnc_((add|remove|local|global|target|server)Event(Handler)?)"
            contents, subbed = re.subn(find,event_replace,contents,0,re.I)

            # Handle multi-line code blocks
            for match in re.finditer(r"\[\s*\"(?!ace_)(\w+)\"\s*,\s*({.+?})\s*\]\s+call\s*CBA_fnc_(add|remove)EventHandler",contents,re.I|re.S):
                pair = 0
                for i, c in enumerate(contents[match.start(2):]):
                    if c == "{":
                        pair += 1
                    elif c == "}":
                        pair -= 1
                    if pair == 0:
                        pair = i
                        break
                if re.match(r"\s*\]\s+call\s+CBA_fnc_(add|remove)EventHandler",contents[pair+match.start(2)+1:],re.I):
                    event = un_capitalize(match.group(1))
                    add_to_config(match.group(1), "ace_" + event)

                    contents = contents[:match.start(1)] + "ace_" + event + contents[match.end(1):]
                    subbed += 1

            # Handle multi-line argument arrays
            for match in re.finditer(r"\[\s*\"(?!ace_)(\w+)\"\s*,\s*(\[.+?\])\s*\]\s+call\s*CBA_fnc_(local|global|server)Event",contents,re.I|re.S):
                pair = 0
                for i, c in enumerate(contents[match.start(2):]):
                    if c == "[":
                        pair += 1
                    elif c == "]":
                        pair -= 1
                    if pair == 0:
                        pair = i
                        break
                if re.match(r"\s*\]\s+call\s+CBA_fnc_(local|global|server)Event",contents[pair+match.start(2)+1:],re.I):
                    event = un_capitalize(match.group(1))
                    add_to_config(match.group(1), "ace_" + event)

                    contents = contents[:match.start(1)] + "ace_" + event + contents[match.end(1):]
                    subbed += 1

            if subbed > 0:
                print("Making {0} substitutions: {1}".format(subbed,path))

                file.seek(0)
                file.write(contents)
                file.truncate()

def main():
    scriptpath = os.path.realpath(sys.argv[0])
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    addonspath = os.path.join(projectpath, "addons")

    os.chdir(addonspath)

    for p in os.listdir(addonspath):
        path = os.path.join(addonspath, p)
        if not os.path.isdir(path):
            continue
        if p[0] == ".":
            continue

        process_directory(path)

if __name__ == "__main__":
    sys.exit(main())

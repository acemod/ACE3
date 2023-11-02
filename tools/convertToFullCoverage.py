#!/usr/bin/env python3
# PabstMirror
# Converts all addons so they are fully buildable/lintable by hemtt
# Clears "has_include" and "[rapify] enabled = false"


import re
import os.path

addon_base_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

token_from = r"#if __has_include\(.*\)"
token_to = r"#ifdef IGNORE_ME"

for root, _dirs, files in os.walk(os.path.join(addon_base_path, "addons")):
    for file in files:
        if file == "config.cpp":
            path_config = os.path.join(root, file)
            with open(path_config, "r", encoding="utf-8") as f:
                content = f.read()
            if (bool(re.search(token_from,content))):
                print(f"- Replacing {token_from} in {path_config}")
                content = re.sub(token_from, token_to, content)
                with open(path_config, "w", encoding="utf-8") as f:
                    f.write(content)
                path_toml = os.path.join(root, "addon.toml")
                os.remove(path_toml)

print(f"--- Removed all has_includes from project ---")

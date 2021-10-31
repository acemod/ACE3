#!/usr/bin/env python3
# Requires: https://github.com/LordGolias/sqf

import os
import sys
import argparse
import concurrent.futures
from sqf.parser import parse
import sqf.analyzer
from sqf.exceptions import SQFParserError

addon_base_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

files_to_ignore_lower = [
    x.lower() for x in ["initSettings.sqf", "initKeybinds.sqf", "XEH_PREP.sqf"]
]


def get_files_to_process(basePath):
    arma_files = []
    for (root, _dirs, files) in os.walk(basePath):
        for file in files:
            if file.endswith(".sqf"):
                if file.lower() in files_to_ignore_lower:
                    continue
                filePath = os.path.join(root, file)
                arma_files.append(filePath)
    return arma_files


def process_file(filePath):
    errors = []
    warnings = []
    try:
        with open(filePath, "r", encoding="utf-8", errors="ignore") as file:
            content = file.read()
            if "#ASC_ignoreFile" in content:
                return (filePath, errors, warnings)
        sqfLintParse = parse(content)
        exceptions = sqf.analyzer.analyze(sqfLintParse).exceptions
        if (exceptions):
            for e in exceptions:
                if ("assigned to an outer scope" in e.message):
                    warnings.append(f"[{e.position[0]},{e.position[1]}] {e.message}")
                if ("is not from this scope" in e.message):
                    warnings.append(f"[{e.position[0]},{e.position[1]}] {e.message}")
                if ("not used" in e.message):
                    warnings.append(f"[{e.position[0]},{e.position[1]}] {e.message}")

                # most of this is just noise about macro parsing:
                # if (e.message.startswith("error")):
                #   errors.append(f"[{e.position[0]},{e.position[1]}] {e.message}")
                # else:
                #   warnings.append(f"[{e.position[0]},{e.position[1]}] {e.message}")
    except Exception as e:
        # errors.append(f"Exception {e}")
        pass
    return (filePath, errors, warnings)


def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--module', help='only search specified module addon folder', required=False, default=".")
    args = parser.parse_args()

    error_count = 0
    addon_base_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
    if (args.module): addon_base_path = os.path.join(addon_base_path, "addons", args.module)
    arma_files = get_files_to_process(addon_base_path)
    print(f"Checking {len(arma_files)} files from {addon_base_path}")
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as executor:
        for (filePath, errors, warnings) in executor.map(process_file, arma_files):
            if errors or warnings:
                error_count += 1
                print(f"{filePath}")
                for e in errors:
                    print(f"  {e}")
                for e in warnings:
                    print(f"  {e}")

    print("Errors: {}".format(error_count))
    return error_count


if __name__ == "__main__":
    sys.exit(main())

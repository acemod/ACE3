#!/usr/bin/env python3
"""
Author: DartRuffian
Builds the current addon, intended to be executed from a VS Code task
"""

import sys
import os

def main() -> None:
    filepath = sys.argv[1]
    if not (filepath.startswith("addons")):
        sys.exit(os.system(f"echo Failed to build: {filepath} is not an addon path"))

    addon = filepath.split("\\")[1]
    os.system(f"echo Building addon: {addon}")
    os.system(f"hemtt build --just {addon}")

if __name__ == "__main__":
    main()

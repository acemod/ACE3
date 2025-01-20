#!/usr/bin/env python3

from argparse import ArgumentParser
from collections import Counter
from pathlib import Path
import re

def find_types(root_dir: Path) -> tuple[Counter, Counter]:
    """Collects the types used in the function header.

    Args:
        root_dir (Path): The path to the root directory where the search is started.

    Returns:
        tuple[Counter, Counter]: A collection for all types found inside < >
            and a collection where the found types are filtered to find the unique types.
    """
    # Search for types (<TYPE>) in function header
    type_regex = re.compile(r".*\*.*<(.*?)>")
    # Split by or, of or comma and trim whitespace left and right
    type_concat_regex = re.compile(r"\s*or\s*|\s*of\s*|\s*,\s*")

    all_types = Counter()
    single_types = Counter()
    for file in root_dir.glob("**/*.sqf"):
        if not file.is_file():
            continue

        with open(file, 'r') as f:
            content = f.read()

        matches = type_regex.findall(content)
        if not matches:
            continue

        all_types.update(matches)

        for match in matches:
            types_singular = [type.rstrip("s").rstrip("S") for type in type_concat_regex.split(match)]
            single_types.update([type for type in types_singular if type.isupper()])

    return all_types, single_types

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("-d", "--dir", dest="root_dir", type=Path, required=True, help="Path to the root directory.")

    args = parser.parse_args()

    all_types, single_types = find_types(args.root_dir)

    print("All types:")
    for type, count in all_types.most_common():
        print(f"{type:<30} {count:<30}")

    print()
    print()

    print("Filtered single types:")
    for type, count in single_types.most_common():
        print(f"{type:<30} {count:<30}")

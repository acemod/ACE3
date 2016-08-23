#!/usr/bin/env python3

# Author: Jonpas, SilentSpike

import os
import sys
import re

######## GLOBALS #########
WIKI_FRAMEWORK = "wiki/framework"
ACE3WEB_WIKI_FRAMEWORK = "http://ace3mod.com/{}".format(WIKI_FRAMEWORK)
EXCLUDE = ["events-framework.md"]
TEMP_LISTENABLE = "temp\\combined_events_listenable.md"
TEMP_CALLABLE = "temp\\combined_events_callable.md"
##########################

def extract(type, data, sourceLink):
    # Extract data
    match = re.match(r"(`"".+""`)\s*\|.*\|\s*(`\[.+\]`)\s*\|\s*(\w+)", data)
    name = match.group(1) # Event Name
    params = match.group(2) # Passed Parameters
    locality = match.group(3) # Locality
    print("- {} Event Data:\n  - Event Name: {}\n  - Parameters: {}\n  - Locality: {}\n".format(type, name, params, locality))

    # Write to file
    with open(eval("TEMP_{}".format(type.upper())), "a") as file:
        file.write("{} | {} | {} | {}\n".format(name, sourceLink, params, locality))


def main():
    print("""
    ############################
    # Combine ACE3 Events List #
    ############################
    """)

    scriptpath = os.path.realpath(__file__)
    projectpath = os.path.dirname(os.path.dirname(scriptpath))
    wikiframeworkpath = os.path.join(projectpath, WIKI_FRAMEWORK)

    # Prepare directory and files to write to
    if not os.path.exists("temp"):
        os.makedirs("temp")

    with open(TEMP_LISTENABLE, "w") as fileListenable:
        fileListenable.writelines([
            "Event Name | Source | Passed Parameter(s) | Locality\n"
            "---------- | ------ | ------------------- | --------\n"
        ])
    with open(TEMP_CALLABLE, "w") as fileCallable:
        fileCallable.writelines([
            "Event Name | Owner | Passed Parameter(s) | Locality\n"
            "---------- | ------ | ------------------- | --------\n"
        ])

    # Iterate through files in the framework directory
    for file in os.listdir(wikiframeworkpath):
        # Skip iteration if file in exclusion list
        if file in EXCLUDE:
            print("Excluding: {}\n".format(file))
            continue

        with open(os.path.join(wikiframeworkpath, file)) as fileOpen:
            for line in fileOpen:
                matchSubSection = re.match(r"###\s+\d+\.?\d*\s+(Listenable|Callable)", line)

                # Find main section, prepare data
                if re.match(r"##\s+\d+\.?\d*\s+Events", line):
                    print("Found Events: {}".format(file))

                    # Source module (cut out 13 characters at the end, stands for "-framework.md")
                    source = file[:-13]
                    print("- Source Module: {}".format(source))

                    # Website URL - remove 3 characters at the end (stands for ".md") and add ".html", format into URL
                    webURL = "{}/{}.{}".format(ACE3WEB_WIKI_FRAMEWORK, file[:-3], "html")
                    print("- Website URL: {}".format(webURL))

                    # Source with Website URL
                    sourceLink = "[{}]({})".format(source, webURL)

                # Find sub-section, prepare data
                elif matchSubSection:
                    # Skip 4 lines to get to table contents (sub-loop)
                    for i in range(4):
                        data = next(fileOpen)

                    # Iterate in sub-loop and extract data until empty line is reached
                    while data not in ["\n", "\r\n"]:
                        extract(matchSubSection.group(1), data, sourceLink)

                        # Move to next line, exit if EOF
                        try:
                            data = next(fileOpen)
                        except StopIteration:
                            break


if __name__ == "__main__":
    main()

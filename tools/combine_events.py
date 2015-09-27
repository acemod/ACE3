#!/usr/bin/env python3

# Author: Jonpas, SilentSpike

import os
import sys
import re
import shutil

######## GLOBALS #########
WIKI_FRAMEWORK = "wiki/framework"
ACE3WEB_WIKI_FRAMEWORK = "http://ace3mod.com/{}".format(WIKI_FRAMEWORK)
EXCLUDE = ["events-framework.md"]
TEMP_LISTENABLE = "temp\\combined_events_listenable.md"
TEMP_CALLABLE = "temp\\combined_events_callable.md"
##########################

def extract(type,filePath,sourceLink):
    lineNumberFound = -1
    for num, line in enumerate(open(filePath)):
        # Find start line
        if re.search(r"###\s+\d+\.?\d*\s+{}".format(type), line):
            lineNumberFound = num + 4

        # Use line
        if num == lineNumberFound:
            # Stop if empty line
            if line in ["\n", "\r\n"]:
                break

            # Extract info
            match = re.match(r"(`"".+""`)\s*\|.*\|\s*(`\[.+\]`)\s*\|\s*(\w+)", line)
            name = match.group(1) # Event Name
            params = match.group(2) # Passed Parameters
            locality = match.group(3) # Locality
            print("- Extracted Event Info:\n  - Event Name: {}\n  - Parameters: {}\n  - Locality: {}".format(name,params,locality))

            # Write to file
            if type == "Listenable":
                with open(TEMP_LISTENABLE, "a") as file:
                    file.write("{} | {} | {} | {}\n".format(name, sourceLink, params, locality))
            elif type == "Callable":
                with open(TEMP_CALLABLE, "a") as file:
                    file.write("{} | {} | {} | {}\n".format(name, sourceLink, params, locality))

            # Next line as well
            lineNumberFound += 1

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
        # Don't check files in exclusion list
        if file in EXCLUDE:
            print("Excluding: {}\n".format(file))
            continue

        # Save file contents to a string
        filePath = os.path.join(wikiframeworkpath, file)

        with open(filePath) as fileOpen:
            fileContents = fileOpen.read()

            # Find "Events" section
            if re.search(r"##\s+\d+\.?\d*\s+Events", fileContents):
                print("Found Events: {}".format(file))

                # Source module (cut out 13 characters at the end, stands for "-framework.md")
                source = file[:-13]
                print("- Source Module: {}".format(source))

                # Website URL - remove 3 characters at the end (stands for ".md") and add ".html", format into URL
                webURL = "{}/{}.{}".format(ACE3WEB_WIKI_FRAMEWORK, file[:-3], "html")
                print("- Website URL: {}".format(webURL))

                # Source with Website URL
                sourceLink = "[{}]({})".format(source, webURL)

                # Find "Listenable" or "Callable" events and extract values
                if re.search(r"###\s+\d+\.?\d*\s+Listenable", fileContents):
                    extract("Listenable",filePath,sourceLink)
                elif re.search(r"###\s+\d+\.?\d*\s+Callable", fileContents):
                    extract("Callable",filePath,sourceLink)

                # Space out printed information
                print("")


if __name__ == "__main__":
    main()

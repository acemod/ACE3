import os
import sys
import subprocess
import concurrent.futures

addonBasePath = os.path.dirname(os.getcwd())
v_paths = [
    "P:/a3|/a3",
    "P:/a3|/A3",
    "P:/x/cba|/x/cba",
    # "{}|/a3".format(os.path.join(addonBasePath, "include", "a3")),
    # "{}|/x/cba".format(os.path.join(addonBasePath, "include", "x", "cba")),
    "{}|/z/ace".format(addonBasePath),
]


def getFiles(basePath):
    arma_files = []
    for root, _dirs, files in os.walk(os.path.join(addonBasePath, "addons")):
        for file in files:
            if file.endswith(".sqf") or file == "config.cpp":
                filePath = os.path.join(root, file)
                arma_files.append(filePath)
    return arma_files


def processFile(filePath, skipA3Warnings=True):
    with open(filePath, "r", encoding="utf-8", errors="ignore") as file:
        content = file.read()
        if content.startswith("//pragma SKIP_COMPILE"):
            return False
    sqfvm = os.path.join(addonBasePath, "sqfvm.exe")
    cmd = [sqfvm, "--input", filePath, "--parse-only", "--automated"]
    for v in v_paths:
        cmd.append("-v")
        cmd.append(v)
    # cmd.append("-V")
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
    try:
        ret = proc.wait(7)  # max wait - seconds
    except Exception as _e:
        print("sqfvm timed out: {}".format(filePath))
        return True
    # print("{} = {}".format(filePath, ret))

    fileHasError = False
    keepReadingLines = True
    while keepReadingLines:
        line = proc.stdout.readline()
        if not line:
            keepReadingLines = False
        else:
            line = line.rstrip()
            if line.startswith("[ERR]"):
                fileHasError = True
            if not (
                skipA3Warnings
                and line.startswith("[WRN]")
                and ("a3/" in line)
                and (("Unexpected IFDEF" in line) or ("defined twice" in line))
            ):
                print("  {}".format(line))
    return fileHasError


def main():
    error_count = 0
    arma_files = getFiles(addonBasePath)
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as executor:
        for fileError in executor.map(processFile, arma_files):
            if fileError:
                error_count += 1

    print("Checked {} files - errors: {}".format(len(arma_files), error_count))
    return error_count


if __name__ == "__main__":
    sys.exit(main())

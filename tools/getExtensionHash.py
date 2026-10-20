import pathlib
import os
import hashlib

addon_base_path = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

extensions = {}

for file in os.listdir(addon_base_path):
    path = pathlib.Path(addon_base_path, file)
    extension_type = "dll"
    if path.suffix == ".dll":
        key = path.stem
        if key.endswith("_x64"):
            key = key.removesuffix("_x64")
            extension_type += "_x64"
        print(f"looking at {path}")
        with open(path, 'rb') as file_read:
            sha1 = hashlib.sha1()
            data = file_read.read()
            sha1.update(data)
            arr = extensions.get(key, {})
            arr[extension_type] = sha1.hexdigest()
            extensions[key] = arr

file_out = pathlib.Path(addon_base_path, "addons", "common", "ACE_ExtensionsHashes.hpp")
with open(file_out, 'w') as file_write:
    print(f"class ACE_ExtensionsHashes {{", file=file_write)
    for key, values in extensions.items():
        print(f"    class {key} {{", file=file_write)
        for type, hash in values.items():
            print(f"        {type} = \"{hash}\";", file=file_write)
        print(f"    }};", file=file_write)
    print(f"}};", file=file_write)

print(f"Wrote {len(extensions)} to {file_out}")

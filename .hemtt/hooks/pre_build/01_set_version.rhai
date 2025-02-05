let modcpp = HEMTT_VFS.join("mod.cpp").open_file().read();
modcpp.replace("0.0.0", HEMTT.project().version().to_string_short());
HEMTT_VFS.join("mod.cpp").create_file().write(modcpp);
print("mod.cpp version set");

let docs_readmes = ["README.zh-TW.md", "README_DE.md", "README_PL.md"];
for readme in docs_readmes {
    let readmemd = HEMTT_VFS.join("docs").join(readme).open_file().read();
    readmemd.replace("0.0.0", HEMTT.project().version().to_string_short());
    HEMTT_VFS.join("docs").join(readme).create_file().write(readmemd);
    print(readme + " version set");
}

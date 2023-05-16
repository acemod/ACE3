let docs_readmes = ["README.zh-TW.md", "README_DE.md", "README_PL.md"];
for readme in docs_readmes {
    HEMTT_VFS.join("docs").join(readme).move(HEMTT_VFS.join(readme));
}

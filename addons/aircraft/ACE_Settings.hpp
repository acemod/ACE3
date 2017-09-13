class ACE_Settings {
    class GVAR(enableLoadoutMenu) {
        category = CSTRING(Category_Aircraft);
        displayName = CSTRING(EnableLoadoutMenu);
        description = CSTRING(EnableLoadoutMenu_description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(makeNewPylonsEmpty) {
        category = CSTRING(Category_Aircraft);
        displayName = CSTRING(MakeNewPylonsEmpty);
        description = CSTRING(MakeNewPylonsEmpty_description);
        value = 0;
        typeName = "BOOL";
    };
};

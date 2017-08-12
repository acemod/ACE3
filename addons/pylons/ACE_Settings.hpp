class ACE_Settings {
    class GVAR(enableLoadoutMenu) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(EnableLoadoutMenu);
        description = CSTRING(EnableLoadoutMenu_description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(makeNewPylonsEmpty) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(MakeNewPylonsEmpty);
        description = CSTRING(MakeNewPylonsEmpty_description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(searchDistance) {
        category = CSTRING(Category_Pylons);
        displayName = CSTRING(SearchDistance);
        description = CSTRING(SearchDistance_description);
        value = 15;
        typeName = "SCALAR";
    };
};

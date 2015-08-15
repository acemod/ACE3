class ACE_Settings {
    class GVAR(zeusAscension) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(zeusBird) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(remoteWind) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(radioOrdnance) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(revealMines) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(revealMines_partial), CSTRING(revealMines_full)};
    };
    class GVAR(autoAddObjects) {
        displayName = CSTRING(AddObjectsToCurator);
        description = CSTRING(AddObjectsToCurator_descr);
        value = 0;
        typeName = "BOOL";
    };
};

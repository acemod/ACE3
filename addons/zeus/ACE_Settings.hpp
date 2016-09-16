class ACE_Settings {
    class GVAR(zeusAscension) {
        displayName = CSTRING(ascension_DisplayName);
        description = CSTRING(ascension_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(zeusBird) {
        displayName = CSTRING(bird_DisplayName);
        description = CSTRING(bird_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(remoteWind) {
        displayName = CSTRING(remoteWind_DisplayName);
        description = CSTRING(remoteWind_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(radioOrdnance) {
        displayName = CSTRING(radioOrdnance_DisplayName);
        description = CSTRING(radioOrdnance_Description);
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(revealMines) {
        displayName = CSTRING(revealMines_DisplayName);
        description = CSTRING(revealMines_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(revealMines_partial), CSTRING(revealMines_full)};
    };
    class GVAR(autoAddObjects) {
        typeName = "BOOL";
        value = 0;
        displayName = CSTRING(AddObjectsToCurator);
        description = CSTRING(AddObjectsToCurator_desc);
    };
};

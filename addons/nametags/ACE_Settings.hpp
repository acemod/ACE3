class ACE_Settings {
    class GVAR(defaultNametagColor) {
        value[] = {0.77, 0.51, 0.08, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(DefaultNametagColor);
    };
    class GVAR(showPlayerNames) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowPlayerNames);
        description = CSTRING(ShowPlayerNames_Desc);
        values[] = {CSTRING(Disabled), CSTRING(Enabled), CSTRING(OnlyCursor), CSTRING(OnlyKeypress), CSTRING(OnlyCursorAndKeypress)};
    };
    class GVAR(showPlayerRanks) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowPlayerRanks);
    };
    class GVAR(showVehicleCrewInfo) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowVehicleCrewInfo);
    };
    class GVAR(showNamesForAI) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowNamesForAI);
    };
    class GVAR(showCursorTagForVehicles) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
    };
    class GVAR(showSoundWaves) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowSoundWaves);
        description = CSTRING(ShowSoundWaves_Desc);
        values[] = {CSTRING(Disabled), CSTRING(NameTagSettings), CSTRING(AlwaysShowAll)};
    };
    class GVAR(playerNamesViewDistance) {
        value = 5;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class GVAR(playerNamesMaxAlpha) {
        value = 0.8;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class GVAR(tagSize) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(TagSize_Name);
        description = CSTRING(TagSize_Description);
        values[] = {"$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"};
    };
};

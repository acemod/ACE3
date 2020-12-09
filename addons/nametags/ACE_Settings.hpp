class ACE_Settings {
    class GVAR(defaultNametagColor) {
        movedToSQF = 1;
    };
    class GVAR(showPlayerNames) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowPlayerNames);
        description = CSTRING(ShowPlayerNames_Desc);
        values[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled), CSTRING(OnlyCursor), CSTRING(OnlyKeypress), CSTRING(OnlyCursorAndKeypress), CSTRING(FadeOnBorder)};
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showPlayerRanks) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowPlayerRanks);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showVehicleCrewInfo) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowVehicleCrewInfo);
        description = CSTRING(ShowVehicleCrewInfo_Desc);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showNamesForAI) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowNamesForAI);
        description = CSTRING(ShowNamesForAI_Desc);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showCursorTagForVehicles) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
        displayName = CSTRING(showCursorTagForVehicles_DisplayName);
        description = CSTRING(showCursorTagForVehicles_Description);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showSoundWaves) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowSoundWaves);
        description = CSTRING(ShowSoundWaves_Desc);
        values[] = {ECSTRING(common,Disabled), CSTRING(NameTagSettings), CSTRING(AlwaysShowAll)};
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(playerNamesViewDistance) {
        value = 5;
        typeName = "SCALAR";
        isClientSettable = 0;
        displayName = CSTRING(PlayerNamesViewDistance_DisplayName);
        description = CSTRING(PlayerNamesViewDistance_Description);
        category = CSTRING(Module_DisplayName);
        sliderSettings[] = {0, 50, 5, 1};
    };
    class GVAR(playerNamesMaxAlpha) {
        value = 0.8;
        typeName = "SCALAR";
        isClientSettable = 0;
        displayName = CSTRING(playerNamesMaxAlpha);
        category = CSTRING(Module_DisplayName);
        sliderSettings[] = {0, 1, 0.8, 2};
    };
    class GVAR(tagSize) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(TagSize_Name);
        description = CSTRING(TagSize_Description);
        values[] = {"$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"};
        category = CSTRING(Module_DisplayName);
    };
};

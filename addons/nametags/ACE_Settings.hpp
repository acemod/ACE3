class ACE_Settings {
    class GVAR(defaultNametagColor) {
        value[] = {0.77, 0.51, 0.08, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = "$STR_ACE_NameTags_DefaultNametagColor";
    };
    class GVAR(showPlayerNames) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_NameTags_ShowPlayerNames";
        description = "$STR_ACE_NameTags_ShowPlayerNames_Desc";
        values[] = {"$STR_ACE_Common_Disabled", "$STR_ACE_Common_Enabled", "$STR_ACE_Common_OnlyCursor", "$STR_ACE_Common_OnlyOnKeypress", "$STR_ACE_Common_OnlyCursorAndKeyPress"};
    };
    class GVAR(showPlayerRanks) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_NameTags_ShowPlayerRanks";
    };
    class GVAR(showVehicleCrewInfo) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_NameTags_ShowVehicleCrewInfo";
    };
    class GVAR(showNamesForAI) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_ACE_NameTags_ShowNamesForAI";
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
        displayName = "$STR_ACE_NameTags_ShowSoundWaves";
        description = "$STR_ACE_NameTags_ShowSoundWaves_Desc";
        values[] = {"$STR_ACE_Common_Disabled", "$STR_ACE_Common_NameTagSettings", "$STR_ACE_Common_AlwaysShowAll"};
    };
    class GVAR(PlayerNamesViewDistance) {
        value = 5;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
    class GVAR(PlayerNamesMaxAlpha) {
        value = 0.8;
        typeName = "SCALAR";
        isClientSettable = 0;
    };
};
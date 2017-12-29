class ACE_Settings {
    class GVAR(BFT_Interval) {
        category = CSTRING(Module_DisplayName);
        value = 1.0;
        typeName = "SCALAR";
        displayName = CSTRING(BFT_Interval_DisplayName);
        description = CSTRING(BFT_Interval_Description);
        sliderSettings[] = {0, 30, 1, 1};
    };
    class GVAR(BFT_Enabled) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(BFT_Enabled_DisplayName);
        description = CSTRING(BFT_Enabled_Description);
    };
    class GVAR(BFT_HideAiGroups) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(BFT_HideAiGroups_DisplayName);
        description = CSTRING(BFT_HideAiGroups_Description);
    };
    class GVAR(BFT_ShowPlayerNames) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(BFT_ShowPlayerNames_DisplayName);
        description = CSTRING(BFT_ShowPlayerNames_Description);
    };
};

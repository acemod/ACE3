class ACE_Settings {
    class GVAR(BFT_Interval) {
        category = CSTRING(Module_DisplayName);
        value = 1.0;
        typeName = "SCALAR";
        displayName = CSTRING(BFT_Interval_DisplayName);
        description = CSTRING(BFT_Interval_Description);
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
    class GVAR(mapIllumination) {
        category = CSTRING(Module_DisplayName);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MapIllumination_DisplayName);
        description = CSTRING(MapIllumination_Description);
    };
    class GVAR(mapGlow) {
        category = CSTRING(Module_DisplayName);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MapGlow_DisplayName);
        description = CSTRING(MapGlow_Description);
    };
    class GVAR(mapShake) {
        category = CSTRING(Module_DisplayName);
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MapShake_DisplayName);
        description = CSTRING(MapShake_Description);
    };
    class GVAR(mapLimitZoom) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MapLimitZoom_DisplayName);
        description = CSTRING(MapLimitZoom_Description);
    };
    class GVAR(mapShowCursorCoordinates) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MapShowCursorCoordinates_DisplayName);
        description = CSTRING(MapShowCursorCoordinates_Description);
    };
    class GVAR(defaultChannel) {
        category = CSTRING(Module_DisplayName);
        value = -1;
        typeName = "SCALAR";
        displayName = CSTRING(DefaultChannel_DisplayName);
        description = CSTRING(DefaultChannel_Description);
    };
};

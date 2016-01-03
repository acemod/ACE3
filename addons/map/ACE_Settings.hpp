class ACE_Settings {
    class GVAR(BFT_Interval) {
        value = 1.0;
        typeName = "SCALAR";
        displayName = CSTRING(BFT_Interval_DisplayName);
        description = CSTRING(BFT_Interval_Description);
    };
    class GVAR(BFT_Enabled) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(BFT_Enabled_DisplayName);
        description = CSTRING(BFT_Enabled_Description);
    };
    class GVAR(BFT_HideAiGroups) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(BFT_HideAiGroups_DisplayName);
        description = CSTRING(BFT_HideAiGroups_Description);
    };
    class GVAR(mapIllumination) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MapIllumination_DisplayName);
        description = CSTRING(MapIllumination_Description);
    };
    class GVAR(mapGlow) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MapGlow_DisplayName);
        description = CSTRING(MapGlow_Description);
    };
    class GVAR(mapShake) {
        value = 1;
        typeName = "BOOL";
        displayName = CSTRING(MapShake_DisplayName);
        description = CSTRING(MapShake_Description);
    };
    class GVAR(mapLimitZoom) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MapLimitZoom_DisplayName);
        description = CSTRING(MapLimitZoom_Description);
    };
    class GVAR(mapShowCursorCoordinates) {
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MapShowCursorCoordinates_DisplayName);
        description = CSTRING(MapShowCursorCoordinates_Description);
    };
    class GVAR(DefaultChannel) {
        value = -1;
        typeName = "SCALAR";
        displayName = CSTRING(DefaultChannel_DisplayName);
        description = CSTRING(DefaultChannel_Description);
    };
};

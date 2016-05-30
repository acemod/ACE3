
class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;
class CBA_Setting_Slider_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(Module_DisplayName);

        class GVAR(BFT_Interval): CBA_Setting_Slider_base {
            displayName = CSTRING(BFT_Interval_DisplayName);
            tooltip = CSTRING(BFT_Interval_Description);
            min = 0;
            max = 10; // ?
            defaultValue = 1.0;
            trailingDecimals = 1;
        };
        class GVAR(BFT_Enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(BFT_Enabled_DisplayName);
            tooltip = CSTRING(BFT_Enabled_Description);
            defaultValue = 0;
        };
        class GVAR(BFT_HideAiGroups): CBA_Setting_Boolean_base {
            displayName = CSTRING(BFT_HideAiGroups_DisplayName);
            tooltip = CSTRING(BFT_HideAiGroups_Description);
            defaultValue = 0;
        };
        class GVAR(BFT_ShowPlayerNames): CBA_Setting_Boolean_base {
            displayName = CSTRING(BFT_ShowPlayerNames_DisplayName);
            tooltip = CSTRING(BFT_ShowPlayerNames_Description);
            defaultValue = 0;
        };
        class GVAR(mapIllumination): CBA_Setting_Boolean_base {
            displayName = CSTRING(MapIllumination_DisplayName);
            tooltip = CSTRING(MapIllumination_Description);
            defaultValue = 1;
        };
        class GVAR(mapGlow): CBA_Setting_Boolean_base {
            displayName = CSTRING(MapGlow_DisplayName);
            tooltip = CSTRING(MapGlow_Description);
            defaultValue = 1;
        };
        class GVAR(mapShake): CBA_Setting_Boolean_base {
            displayName = CSTRING(MapShake_DisplayName);
            tooltip = CSTRING(MapShake_Description);
            defaultValue = 1;
        };
        class GVAR(mapLimitZoom): CBA_Setting_Boolean_base {
            displayName = CSTRING(MapLimitZoom_DisplayName);
            tooltip = CSTRING(MapLimitZoom_Description);
            defaultValue = 0;
        };
        class GVAR(mapShowCursorCoordinates): CBA_Setting_Boolean_base {
            displayName = CSTRING(MapShowCursorCoordinates_DisplayName);
            tooltip = CSTRING(MapShowCursorCoordinates_Description);
            defaultValue = 0;
        };
        class GVAR(defaultChannel): CBA_Setting_List_base {
            displayName = CSTRING(DefaultChannel_DisplayName);
            tooltip = CSTRING(DefaultChannel_Description);
            values[] = {-1,0,1,2,3,4,5,6,7,8,9}; // ?
            defaultIndex = 0;
        };
    };
};


class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;
class CBA_Setting_Slider_base;
class CBA_Setting_Slider_2_base;
class CBA_Setting_Color_Alpha_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(Module_DisplayName);

        class GVAR(defaultNametagColor): CBA_Setting_Color_Alpha_base {
            displayName = CSTRING(DefaultNametagColor);
            defaultValue[] = {0.77,0.51,0.08,1};
        };
        class GVAR(showPlayerNames): CBA_Setting_List_base {
            displayName = CSTRING(ShowPlayerNames);
            tooltip = CSTRING(ShowPlayerNames_Desc);
            values[] = {0,1,2,3,4};
            labels[] = {ECSTRING(common,Disabled),ECSTRING(common,Enabled),CSTRING(OnlyCursor),CSTRING(OnlyKeypress),CSTRING(OnlyCursorAndKeypress)};
            defaultIndex = 1;
        };
        class GVAR(showPlayerRanks): CBA_Setting_Boolean_base {
            displayName = CSTRING(ShowPlayerRanks);
            defaultValue = 1;
        };
        class GVAR(showSoundWaves): CBA_Setting_List_base {
            displayName = CSTRING(ShowSoundWaves);
            tooltip = CSTRING(ShowSoundWaves_Desc);
            values[] = {0,1,2};
            labels[] = {ECSTRING(common,Disabled),CSTRING(NameTagSettings),CSTRING(AlwaysShowAll)};
            defaultIndex = 1;
        };
        class GVAR(showVehicleCrewInfo): CBA_Setting_Boolean_base {
            displayName = CSTRING(ShowVehicleCrewInfo);
            defaultValue = 1;
        };
        class GVAR(showNamesForAI): CBA_Setting_Boolean_base {
            displayName = CSTRING(ShowNamesForAI);
            defaultValue = 0;
        };
        class GVAR(showCursorTagForVehicles): CBA_Setting_Boolean_base {
            displayName = "";
            defaultValue = 0;
            // not for client
        };
        class GVAR(playerNamesViewDistance): CBA_Setting_Slider_base {
            displayName = "";
            min = 0;
            max = 15000;
            defaultValue = 5;
            // not for client
        };
        class GVAR(playerNamesMaxAlpha): CBA_Setting_Slider_2_base {
            displayName = "";
            defaultValue = 0.8;
            // not for client
        };
        class GVAR(tagSize): CBA_Setting_List_base {
            displayName = CSTRING(TagSize_Name);
            tooltip = CSTRING(TagSize_Description);
            values[] = {0,1,2,3,4};
            labels[] = {"$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"};
            defaultIndex = 2;
        };
    };
};


class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(Module_DisplayName);

        class GVAR(zeusAscension): CBA_Setting_Boolean_base {
            displayName = CSTRING(ascension_DisplayName);
            tooltip = CSTRING(ascension_tooltip);
            defaultValue = 0;
        };
        class GVAR(zeusBird): CBA_Setting_Boolean_base {
            displayName = CSTRING(bird_DisplayName);
            tooltip = CSTRING(bird_tooltip);
            defaultValue = 0;
        };
        class GVAR(remoteWind): CBA_Setting_Boolean_base {
            displayName = CSTRING(remoteWind_DisplayName);
            tooltip = CSTRING(remoteWind_tooltip);
            defaultValue = 0;
        };
        class GVAR(radioOrdnance): CBA_Setting_Boolean_base {
            displayName = CSTRING(radioOrdnance_DisplayName);
            tooltip = CSTRING(radioOrdnance_tooltip);
            defaultValue = 0;
        };
        class GVAR(revealMines): CBA_Setting_List_base {
            displayName = CSTRING(revealMines_DisplayName);
            tooltip = CSTRING(revealMines_tooltip);
            values[] = {0,1,2};
            labels[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(revealMines_partial), CSTRING(revealMines_full)};
            defaultIndex = 0;
        };
        class GVAR(autoAddObjects): CBA_Setting_Boolean_base {
            displayName = CSTRING(AddObjectsToCurator);
            tooltip = CSTRING(AddObjectsToCurator_desc);
            defaultdefaultValue = 0;
        };
    };
};

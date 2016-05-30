
class CBA_Setting_List_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(filterUnits): CBA_Setting_List_base {
            displayName = CSTRING(units_DisplayName);
            tooltip = CSTRING(units_tooltip);
            values[] = {0,1,2,3};
            labels[] = {CSTRING(units_none), CSTRING(units_players), CSTRING(units_playable), CSTRING(units_all)};
            defaultIndex = 2;
        };
        class GVAR(filterSides): CBA_Setting_List_base {
            displayName = CSTRING(sides_DisplayName);
            tooltip = CSTRING(sides_tooltip);
            values[] = {0,1,2,3};
            labels[] = {CSTRING(sides_player), CSTRING(sides_friendly), CSTRING(sides_hostile), CSTRING(sides_all)};
            defaultIndex = 0;
        };
        class GVAR(restrictModes): CBA_Setting_List_base {
            displayName = CSTRING(modes_DisplayName);
            tooltip = CSTRING(modes_tooltip);
            values[] = {0,1,2,3,4};
            labels[] = {CSTRING(modes_all), CSTRING(modes_unit), CSTRING(modes_free), CSTRING(modes_internal), CSTRING(modes_external)};
            defaultIndex = 0;
        };
        class GVAR(restrictVisions): CBA_Setting_List_base {
            displayName = CSTRING(visions_DisplayName);
            tooltip = CSTRING(visions_tooltip);
            values[] = {0,1,2,3};
            labels[] = {CSTRING(modes_all), CSTRING(visions_nv), CSTRING(visions_ti), "$STR_Special_None"};
            defaultIndex = 0;
        };
    };
};

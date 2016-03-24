class ACE_Settings {
    class GVAR(filterUnits) {
        displayName = CSTRING(units_DisplayName);
        description = CSTRING(units_Description);
        typeName = "SCALAR";
        value = 2;
        values[] = {CSTRING(units_none), CSTRING(units_players), CSTRING(units_playable), CSTRING(units_all)};
    };
    class GVAR(filterSides) {
        displayName = CSTRING(sides_DisplayName);
        description = CSTRING(sides_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(sides_player), CSTRING(sides_friendly), CSTRING(sides_hostile), CSTRING(sides_all)};
    };
    class GVAR(restrictModes) {
        displayName = CSTRING(modes_DisplayName);
        description = CSTRING(modes_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(modes_unit), CSTRING(modes_free), CSTRING(modes_internal), CSTRING(modes_external)};
    };
    class GVAR(restrictVisions) {
        displayName = CSTRING(visions_DisplayName);
        description = CSTRING(visions_Description);
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(visions_nv), CSTRING(visions_ti), "$STR_Special_None"};
    };
};

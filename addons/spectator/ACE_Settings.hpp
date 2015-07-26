class ACE_Settings {
    class GVAR(onDeath) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(filterUnits) {
        typeName = "SCALAR";
        value = 1;
        values[] = {CSTRING(units_none), CSTRING(units_players), CSTRING(units_all)};
    };
    class GVAR(filterSides) {
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(sides_player), CSTRING(sides_friendly), CSTRING(sides_hostile), CSTRING(sides_all)};
    };
    class GVAR(restrictModes) {
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(modes_unit), CSTRING(modes_free), CSTRING(modes_internal), CSTRING(modes_external)};
    };
    class GVAR(restrictVisions) {
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(modes_all), CSTRING(visions_nv), CSTRING(visions_ti), "$STR_Special_None"};
    };
    class GVAR(unitIcons) {
        typeName = "BOOL";
        value = 1;
    };
};

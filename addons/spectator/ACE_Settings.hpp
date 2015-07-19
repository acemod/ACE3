class ACE_Settings {
    class GVAR(enabledSystem) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(filterUnits) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"$STR_Special_None", CSTRING(units_players), CSTRING(units_all)};
    };
    class GVAR(filterSides) {
        typeName = "SCALAR";
        value = 0;
        values[] = {CSTRING(sides_player), CSTRING(sides_friendly), CSTRING(sides_hostile), CSTRING(sides_all)};
    };
};

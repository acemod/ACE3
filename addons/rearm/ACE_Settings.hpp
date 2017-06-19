class ACE_Settings {
    class GVAR(level) {
        category = ECSTRING(OptionsMenu,CategoryLogistics);
        displayName = CSTRING(RearmSettings_level_DisplayName);
        description = CSTRING(RearmSettings_level_Description);
        value = 0;
        typeName = "SCALAR";
        values[] = {CSTRING(RearmSettings_vehicle), CSTRING(RearmSettings_magazine), CSTRING(RearmSettings_caliber)};
    };
    class GVAR(supply) {
        displayName = CSTRING(RearmSettings_supply_DisplayName);
        description = CSTRING(RearmSettings_supply_Description);
        value = 0;
        typeName = "SCALAR";
        values[] = {CSTRING(RearmSettings_unlimited), CSTRING(RearmSettings_limited), CSTRING(RearmSettings_magazineSupply)};
    };
};

class ACE_Settings {
    class GVAR(level) {
        displayName = LSTRING(RearmSettings_level_DisplayName);
        description = LSTRING(RearmSettings_level_Description);
        value = 1;
        typeName = "SCALAR";
        values[] = {LSTRING(RearmSettings_vehicle), LSTRING(RearmSettings_magazine), LSTRING(RearmSettings_caliber)};
    };
};

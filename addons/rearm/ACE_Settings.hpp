class ACE_Settings {
    class GVAR(level) {
        displayName = CSTRING(RearmSettings_level_DisplayName);
        description = CSTRING(RearmSettings_level_Description);
        value = 0;
        typeName = "SCALAR";
        values[] = {CSTRING(RearmSettings_vehicle), CSTRING(RearmSettings_magazine), CSTRING(RearmSettings_caliber)};
    };
};

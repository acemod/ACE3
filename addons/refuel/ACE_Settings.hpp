class ACE_Settings {
    class GVAR(rate) {
        displayName = CSTRING(RefuelSettings_speed_DisplayName);
        description = CSTRING(RefuelSettings_speed_Description);
        value = 1;
        typeName = "SCALAR";
        values[] = {CSTRING(RefuelSettings_basic), CSTRING(RefuelSettings_advanced)};
    };
};

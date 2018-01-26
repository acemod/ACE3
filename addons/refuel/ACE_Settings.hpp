class ACE_Settings {
    class GVAR(rate) {
        category = ECSTRING(OptionsMenu,CategoryLogistics);
        displayName = CSTRING(RefuelSettings_speed_DisplayName);
        description = CSTRING(RefuelSettings_speed_Description);
        value = 1;
        typeName = "SCALAR";
        sliderSettings[] = {0, 25, 1, 1};
    };
    class GVAR(hoseLength) {
        category = ECSTRING(OptionsMenu,CategoryLogistics);
        displayName = CSTRING(RefuelSettings_hoseLength_DisplayName);
        value = 12;
        typeName = "SCALAR";
        sliderSettings[] = {0, 50, 12, 1};
    };
};

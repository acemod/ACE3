class ACE_Settings {
    class GVAR(enable) {
        displayName = CSTRING(ModuleSettings_enable);
        description = CSTRING(ModuleSettings_enable_Description);
        typeName = "BOOL";
        value = 1;
        category = ECSTRING(OptionsMenu,CategoryLogistics);
    };
    class GVAR(paradropTimeCoefficent) {
        displayName = CSTRING(paradropTimeCoefficent);
        description = CSTRING(paradropTimeCoefficent_description);
        typeName = "SCALAR";
        value = 2.5;
        category = ECSTRING(OptionsMenu,CategoryLogistics);
    };
};

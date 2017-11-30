class ACE_Settings {
    //These settings effect gameplay difficutly:  defaults will leave the mortar the same as vanilla
    class GVAR(airResistanceEnabled) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(airResistanceEnabled_DisplayName);
        description = CSTRING(airResistanceEnabled_Description);
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(allowComputerRangefinder) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(allowComputerRangefinder_DisplayName);
        description = CSTRING(allowComputerRangefinder_Description);
        value = 1;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(allowCompass) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(allowCompass_DisplayName);
        description = CSTRING(allowCompass_Description);
        value = 1;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(useAmmoHandling) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(useAmmoHandling_DisplayName);
        description = CSTRING(useAmmoHandling_Description);
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
};

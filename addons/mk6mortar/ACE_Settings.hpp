class ACE_Settings {
    //These settings effect gameplay difficutly:  defaults will leave the mortar the same as vanilla
    class GVAR(airResistanceEnabled) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(allowComputerRangefinder) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(allowCompass) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 0;
    };
};

class ACE_Settings {
    class GVAR(airResistanceEnabled) {
        movedToSQF = 1;
    };
    class GVAR(allowComputerRangefinder) {
        movedToSQF = 1;
    };
    class GVAR(allowCompass) {
        movedToSQF = 1;
    };
    class GVAR(useAmmoHandling) {
        movedToSQF = 1;
    };
    class GVAR(useChargeSystem) {
        category = CSTRING(DisplayName);
        displayName = CSTRING(useChargeSystem_DisplayName);
        description = CSTRING(useChargeSystem_Description);
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
};

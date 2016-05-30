
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);

        //These settings effect gameplay difficutly:  defaults will leave the mortar the same as vanilla
        class GVAR(airResistanceEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(airResistanceEnabled_DisplayName);
            tooltip = CSTRING(airResistanceEnabled_tooltip);
            defaultValue = 0;
        };
        class GVAR(allowComputerRangefinder): CBA_Setting_Boolean_base {
            displayName = CSTRING(allowComputerRangefinder_DisplayName);
            tooltip = CSTRING(allowComputerRangefinder_tooltip);
            defaultValue = 1;
        };
        class GVAR(allowCompass): CBA_Setting_Boolean_base {
            displayName = CSTRING(allowCompass_DisplayName);
            tooltip = CSTRING(allowCompass_tooltip);
            defaultValue = 1;
        };
        class GVAR(useAmmoHandling): CBA_Setting_Boolean_base {
            displayName = CSTRING(useAmmoHandling_DisplayName);
            tooltip = CSTRING(useAmmoHandling_tooltip);
            defaultValue = 0;
        };
    };
};

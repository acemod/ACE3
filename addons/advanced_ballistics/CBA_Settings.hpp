
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(DisplayName);

        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(enabled_DisplayName);
            tooltip = CSTRING(enabled_tooltip);
            defaultValue = 0;
        };
        class GVAR(simulateForSnipers): CBA_Setting_Boolean_base {
            displayName = CSTRING(simulateForSnipers_DisplayName);
            tooltip = CSTRING(simulateForSnipers_tooltip);
            defaultValue = 1;
        };
        class GVAR(simulateForGroupMembers): CBA_Setting_Boolean_base {
            displayName = CSTRING(simulateForGroupMembers_DisplayName);
            tooltip = CSTRING(simulateForGroupMembers_tooltip);
            defaultValue = 0;
        };
        class GVAR(simulateForEveryone): CBA_Setting_Boolean_base {
            displayName = CSTRING(simulateForEveryone_DisplayName);
            tooltip = CSTRING(simulateForEveryone_tooltip);
            defaultValue = 0;
        };
        class GVAR(disabledInFullAutoMode): CBA_Setting_Boolean_base {
            displayName = CSTRING(disabledInFullAutoMod_DisplayName);
            tooltip = CSTRING(disabledInFullAutoMod_tooltip);
            defaultValue = 0;
        };
        /* // TODO: We currently do not have firedEHs on vehicles
        class GVAR(vehicleGunnerEnabled): CBA_Setting_Boolean_base {
            displayName = "Enabled For Vehicle Gunners";
            tooltip = "Enables advanced ballistics for vehicle gunners";
            defaultValue = 0;
        };
        */
        class GVAR(ammoTemperatureEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(ammoTemperatureEnabled_DisplayName);
            tooltip = CSTRING(ammoTemperatureEnabled_tooltip);
            defaultValue = 1;
        };
        class GVAR(barrelLengthInfluenceEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(barrelLengthInfluenceEnabled_DisplayName);
            tooltip = CSTRING(barrelLengthInfluenceEnabled_tooltip);
            defaultValue = 1;
        };
        class GVAR(bulletTraceEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(bulletTraceEnabled_DisplayName);
            tooltip = CSTRING(bulletTraceEnabled_tooltip);
            defaultValue = 1;
        };
        class GVAR(simulationInterval): CBA_Setting_Slider_2_base {
            displayName = CSTRING(simulationInterval_DisplayName);
            tooltip = CSTRING(simulationInterval_tooltip);
            defaultValue = 0;
        };
        class GVAR(simulationRadius): CBA_Setting_Slider_base {
            displayName = CSTRING(simulationRadius_DisplayName);
            tooltip = CSTRING(simulationRadius_tooltip);
            min = 200;
            max = 10000;
            defaultValue = 3000;
        };
    };
};

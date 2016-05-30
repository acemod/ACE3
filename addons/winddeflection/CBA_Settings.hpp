
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(deflectionModule_DisplayName);
            tooltip = CSTRING(deflectionModule_Description);
            defaultValue = 1;
        };
        class GVAR(vehicleEnabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(vehicleEnabled_DisplayName);
            tooltip = CSTRING(vehicleEnabled_Description);
            defaultValue = 1;
        };
        class GVAR(simulationInterval): CBA_Setting_Slider_2_base {
            displayName = CSTRING(simulationInterval_DisplayName);
            tooltip = CSTRING(simulationInterval_Description);
            defaultValue = 0.05;
        };
        class GVAR(simulationRadius): CBA_Setting_Slider_base {
            displayName = CSTRING(simulationRadius_DisplayName);
            tooltip = CSTRING(simulationRadius_Description);
            min = 200;
            max = 10000;
            defaultValue = 3000;
        };
    };
};

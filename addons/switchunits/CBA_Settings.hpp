
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);

        class GVAR(enableSwitchUnits): CBA_Setting_Boolean_base {
            defaultValue = 0;
        };
        class GVAR(switchToWest): CBA_Setting_Boolean_base {
            displayName = CSTRING(SwitchToWest_DisplayName);
            tooltip = CSTRING(SwitchToWest_tooltip);
            defaultValue = 0;
        };
        class GVAR(switchToEast): CBA_Setting_Boolean_base {
            displayName = CSTRING(SwitchToEast_DisplayName);
            tooltip = CSTRING(SwitchToEast_tooltip);
            defaultValue = 0;
        };
        class GVAR(switchToIndependent): CBA_Setting_Boolean_base {
            displayName = CSTRING(SwitchToIndependent_DisplayName);
            tooltip = CSTRING(SwitchToIndependent_tooltip);
            defaultValue = 0;
        };
        class GVAR(switchToCivilian): CBA_Setting_Boolean_base {
            displayName = CSTRING(SwitchToCivilian_DisplayName);
            tooltip = CSTRING(SwitchToCivilian_tooltip);
            defaultValue = 0;
        };
        class GVAR(enableSafeZone): CBA_Setting_Boolean_base {
            displayName = CSTRING(EnableSafeZone_DisplayName);
            tooltip = CSTRING(EnableSafeZone_tooltip);
            defaultValue = 1;
        };
        class GVAR(safeZoneRadius): CBA_Setting_Slider_base {
            displayName = CSTRING(SafeZoneRadius_DisplayName);
            tooltip = CSTRING(SafeZoneRadius_tooltip);
            min = 0;
            max = 10000;
            defaultValue = 100;
        };
    };
};

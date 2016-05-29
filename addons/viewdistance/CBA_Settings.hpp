
class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;
class CBA_Setting_Slider_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(Module_DisplayName);

        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(enabled_DisplayName);
            tooltip = CSTRING(enabled_tooltip);
            defaultValue = 1;
        };
        class GVAR(viewDistanceOnFoot): CBA_Setting_Slider_base {
            displayName = CSTRING(onFoot_DisplayName);
            tooltip = CSTRING(onFoot_tooltip);
            min = 200;
            max = 15000;
            defaultValue = 3000; // Values also need to be changed in functions/fnc_returnValue.sqf
        };
        class GVAR(viewDistanceLandVehicle): CBA_Setting_Slider_base { // Values also need to be changed in functions/fnc_returnValue.sqf
            displayName = CSTRING(landVehicle_DisplayName);
            tooltip = CSTRING(landVehicle_tooltip);
            min = 200;
            max = 15000;
            defaultValue = 3000; // Values also need to be changed in functions/fnc_returnValue.sqf
        };
        class GVAR(viewDistanceAirVehicle): CBA_Setting_Slider_base {
            displayName = CSTRING(airVehicle_DisplayName);
            tooltip = CSTRING(airVehicle_tooltip);
            min = 200;
            max = 15000;
            defaultValue = 3000; // Values also need to be changed in functions/fnc_returnValue.sqf
        };
        class GVAR(limitViewDistance): CBA_Setting_Slider_base {
            displayName = CSTRING(limit_DisplayName);
            tooltip = CSTRING(limit_setting);
            min = 200;
            max = 15000;
            defaultValue = 15000;
            serverOnly = 1;
        };
        class GVAR(objectViewDistanceCoeff): CBA_Setting_List_base {
            displayName = CSTRING(object_DisplayName);
            tooltip = CSTRING(object_tooltip);
            values[] = {0,1,2,3,4,5,6};
            labels[] = {CSTRING(object_off), CSTRING(object_verylow), CSTRING(object_low), CSTRING(object_medium),CSTRING(object_high), CSTRING(object_veryhigh), CSTRING(object_fovBased)};
            defaultValue = 0; // index. Actual coefficient is given by functions/fnc_returnObjectCoeff.sqf
        };
    };
};

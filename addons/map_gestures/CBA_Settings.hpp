
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;
class CBA_Setting_Slider_2_base;
class CBA_Setting_Color_Alpha_base;

class CBA_Settings {
    class ADDON {
        displayName = CSTRING(mapGestures_category);

        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(enabled_displayName);
            tooltip = CSTRING(enabled_tooltip);
            defaultValue = 1;
        };
        class GVAR(maxRange): CBA_Setting_Slider_base {
            displayName = CSTRING(maxRange_displayName);
            tooltip = CSTRING(maxRange_tooltip);
            min = 0;
            max = 30;
            defaultValue = 7;
        };
        class GVAR(interval): CBA_Setting_Slider_2_base {
            displayName = CSTRING(interval_displayName);
            tooltip = CSTRING(interval_tooltip);
            typeName = "SCALAR";
            defaultValue = 0.03;
        };
        class GVAR(nameTextColor): CBA_Setting_Color_Alpha_base {
            displayName = CSTRING(nameTextColor_displayName);
            tooltip = CSTRING(nameTextColor_tooltip);
            defaultValue[] = {0.2, 0.2, 0.2, 0.3};
        };
        class GVAR(defaultLeadColor): CBA_Setting_Color_Alpha_base {
            displayName = CSTRING(defaultLeadColor_displayName);
            tooltip = CSTRING(defaultLeadColor_tooltip);
            defaultValue[] = {1, 0.88, 0, 0.95};
        };
        class GVAR(defaultColor): CBA_Setting_Color_Alpha_base {
            displayName = CSTRING(defaultColor_displayName);
            tooltip = CSTRING(defaultColor_tooltip);
            defaultValue[] = {1, 0.88, 0, 0.7};
        };
        /*class GVAR(groupColorConfigurations) { @todo
            displayName = CSTRING(groupColorConfigurations_displayName);
            tooltip = CSTRING(groupColorConfigurations_tooltip);
            typeName = "ARRAY";
            defaultValue[] = {};
        };
        class GVAR(groupColorConfigurationMapping) {
            displayName = CSTRING(groupColorConfigurationMapping_displayName);
            tooltip = CSTRING(groupColorConfigurationMapping_tooltip);
            typeName = "ARRAY";
            defaultValue[] = {{}, {}};
        };*/
    };
};

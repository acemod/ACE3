
class CBA_Setting_Boolean_base;
class CBA_Setting_Slider_base;
class CBA_Setting_Color_Alpha_base;

class CBA_Settings {
    class PREFIX {
        class GVAR(enabled): CBA_Setting_Boolean_base {
            displayName = CSTRING(enabled_displayName);
            defaultValue = 0;
            serverOnly = 1;
        };
        class GVAR(maxRange): CBA_Setting_Slider_base {
            typeName = "SCALAR";
            displayName = CSTRING(maxRange_displayName);
            tooltip = CSTRING(maxRange_description);
            min = 0;
            max = 100;
            defaultValue = 4;
            serverOnly = 1;
        };
        class GVAR(indicatorForSelf): CBA_Setting_Boolean_base {
            displayName = CSTRING(indicatorForSelf_name);
            tooltip = CSTRING(indicatorForSelf_description);
            defaultValue = 1;
        };
        class GVAR(indicatorColor): CBA_Setting_Color_Alpha_base {
            displayName = CSTRING(indicatorColor_name);
            tooltip = CSTRING(indicatorColor_description);
            defaultValue[] = {0.83, 0.68, 0.21, 0.75};
        };
    };
};

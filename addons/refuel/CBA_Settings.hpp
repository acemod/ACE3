
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class GVARMAIN(OptionsMenu,CategoryLogistics) {
        class GVAR(rate): CBA_Setting_Slider_2_base {
            displayName = CSTRING(RefuelSettings_speed_DisplayName);
            tooltip = CSTRING(RefuelSettings_speed_Description);
            min = 1;
            max = 10;
            defaultValue = 1;
        };
    };
};

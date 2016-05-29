
class CBA_Setting_Slider_2_base;

class CBA_Settings {
    class PREFIX {
        ´//displayName = CSTRING(Module_DisplayName);

        class GVAR(minDamageToTrigger) {: CBA_Setting_Slider_2_base {
            //Minimum mamage needed to trigger falling down while moving. Set to -1 to disable completely.
            defaultValue = 0.1;
        };
    };
};

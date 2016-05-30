
class CBA_Setting_Slider_base;

class CBA_Settings {
    class PREFIX {
        //displayName = CSTRING(Module_DisplayName);

        //Time to move a round from one magazine to another
        class GVAR(timePerAmmo): CBA_Setting_Slider_base {
            min = 0;
            max = 10;
            defaultValue = 1.5;
            trailingDecimals = 1;
        };
        //Time to swap between magazines when repacking
        class GVAR(timePerMagazine): CBA_Setting_Slider_base {
            min = 0;
            max = 10;
            defaultValue = 2.0;
            trailingDecimals = 1;
        };
        //Time to relink 2 belts together
        class GVAR(timePerBeltLink): CBA_Setting_Slider_base {
            min = 0;
            max = 10;
            defaultValue = 8.0;
            trailingDecimals = 1;
        };
    };
};

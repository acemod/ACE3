
class CfgSFX {
    class GVAR(CookOff_low) {
        name = QGVAR(cookoff_low);
        sound[] = {QPATHTOF(sounds\cookoff_low_pressure.ogg),6,1,400,1,0,0,0};
        sounds[] = {"sound"};
        titles[] = {};
        empty[] = {"",0,0,0,0,0,0,0};
    };
    class GVAR(CookOff_mid): GVAR(CookOff_low) {
        name = QGVAR(cookoff_mid);
        sound[] = {QPATHTOF(sounds\cookoff_mid_pressure.ogg),6,1,400,1,0,0,0};
    };
    class GVAR(CookOff_high): GVAR(CookOff_low) {
        name = QGVAR(cookoff_high);
        sound[] = {QPATHTOF(sounds\cookoff_high_pressure.ogg),6,1,400,1,0,0,0};
    };
};

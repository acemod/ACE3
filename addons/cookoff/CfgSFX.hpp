
class CfgSFX {
    class GVAR(CookOff_low) {
        name = QGVAR(cookoff_low);
        // Index 4 is percentage chance to play, in theory high pressure is way more likely
        sound[] = {QPATHTOF(sounds\cookoff_low_pressure.ogg),6,1,400,1,0,0,0};
        sounds[] = {"sound"};
        titles[] = {};
        empty[] = {"",0,0,0,0,0,0,0};
    };
    class GVAR(CookOff_mid) {
        name = QGVAR(cookoff_mid);
        // Index 4 is percentage chance to play, in theory high pressure is way more likely
        sound[] = {QPATHTOF(sounds\cookoff_mid_pressure.ogg),6,1,400,1,0,0,0};
        sounds[] = {"sound"};
        titles[] = {};
        empty[] = {"",0,0,0,0,0,0,0};
    };
    class GVAR(CookOff_high) {
        name = QGVAR(cookoff_high);
        // Index 4 is percentage chance to play, in theory high pressure is way more likely
        sound[] = {QPATHTOF(sounds\cookoff_high_pressure.ogg),6,1,400,1,0,0,0};
        sounds[] = {"sound"};
        titles[] = {};
        empty[] = {"",0,0,0,0,0,0,0};
    };
};

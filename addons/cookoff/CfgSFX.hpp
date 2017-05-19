
class CfgSFX {
    class GVAR(CookOff) {
        name = QGVAR(cookoff);
        // Index 4 is percentage chance to play, in theory high pressure is way more likely
        varient0[] = {PATHTOF(sounds\cookoff_low_pressure.ogg),6,1,400,0.1,0,0,0};
        varient1[] = {PATHTOF(sounds\cookoff_mid_pressure.ogg),6,1,400,0.25,0,0,0};
        varient2[] = {PATHTOF(sounds\cookoff_high_pressure.ogg),6,1,400,0.65,0,0,0};
        sounds[] = {"varient0","varient1","varient2"};
        titles[] = {};
        empty[] = {"",0,0,0,0,0,0,0};
    };
};

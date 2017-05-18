
class CfgSFX {
    class GVAR(CookOff) {
        name = QGVAR(cookoff);
        sounds[] = {QGVAR(cookoff)};
        GVAR(cookoff)[] = {PATHTOF(sounds\cookoff.wss),6,1.8,400,1,0,0,0};
        empty[] = {"",0,0,0,0,0,0,0};
    };
    class GVAR(CookOff1): GVAR(cookOff) {
        GVAR(cookoff)[] = {PATHTOF(sounds\Cook_Off_Flames_1.ogg),6,1.8,400,1,0,0,0};
    };
    class GVAR(CookOff2): GVAR(cookOff) {
        GVAR(cookoff)[] = {PATHTOF(sounds\Cook_Off_Flames_2.ogg),6,1.8,400,1,0,0,0};
    };
    class GVAR(CookOff3): GVAR(cookOff) {
        GVAR(cookoff)[] = {PATHTOF(sounds\Cook_Off_Flames_3.ogg),6,1.8,400,1,0,0,0};
    };
    class GVAR(CookOff4): GVAR(cookOff) {
        GVAR(cookoff)[] = {PATHTOF(sounds\Cook_Off_Flames_4.ogg),6,1.8,400,1,0,0,0};
    };
    class GVAR(CookOff5): GVAR(cookOff) {
        GVAR(cookoff)[] = {PATHTOF(sounds\Cook_Off_Flames_5.ogg),6,1.8,400,1,0,0,0};
    };
};

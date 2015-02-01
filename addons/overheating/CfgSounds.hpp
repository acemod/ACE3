class CfgSounds {
    class ACE_BarrelSwap {
        sound[] = {QUOTE(PATHTOF(sounds\barrelswap.ogg)),5,1,200};
        titles[] = {};
    };
    class GVAR(jamming_rifle) {
        name=QGVAR(jamming_rifle);
        sound[]={QUOTE(PATHTOF(sounds\jamming_rifle.wav)),1,1};
        titles[]={};
    };
    class GVAR(jamming_pistol) {
        name=QGVAR(jamming_pistol);
        sound[]={QUOTE(PATHTOF(sounds\jamming_pistol.wav)),1,1};
        titles[]={};
    };
    class GVAR(fixing_rifle) {
        name=QGVAR(fixing_rifle);
        sound[]={QUOTE(PATHTOF(sounds\fixing_rifle.wav)),1,1};
        titles[]={};
    };
    class GVAR(fixing_pistol) {
        name= QGVAR(fixing_pistol);
        sound[]={QUOTE(PATHTOF(sounds\fixing_pistol.wav)),1,1};
        titles[]={};
    };
};

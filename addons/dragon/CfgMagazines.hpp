class CfgMagazines {
    class 1Rnd_GAA_missiles;
    class GVAR(super): 1Rnd_GAA_missiles {
        sound[] = {};
        soundFly[] = {};
        soundHit[] = {};
        model = QPATHTOF(models\dragon.p3d);
        ammo = QGVAR(super);
        initSpeed = 65;
        scope = 1;
        displayName = CSTRING(dragonName);
        displayNameShort = CSTRING(dragonName);
        descriptionShort = CSTRING(dragonDescription);
    };
    class GVAR(2): GVAR(super) {
        ammo = QGVAR(2_M);
    };
    class GVAR(1): GVAR(super) {
        ammo = QGVAR(1_M);
    };
};


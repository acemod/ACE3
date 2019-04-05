class CfgMagazines {
    class 1Rnd_GAA_missiles;
    class GVAR(super) : 1Rnd_GAA_missiles {
        sound[] = {};
        soundFly[] = {};
        soundHit[] = {};
        model = QPATHTOF(models\dragon.p3d);
        ammo = QGVAR(super);
        initSpeed = 120;
        scope = 1;
        displayName = CSTRING(dragonName);
        displayNameShort = CSTRING(dragonName);
        descriptionShort = CSTRING(dragonDescription);
    };
};


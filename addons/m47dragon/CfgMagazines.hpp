//CfgMagazines.hpp

class CfgMagazines {
    class 1Rnd_GAA_missiles;
    class ace_m47_dragon : 1Rnd_GAA_missiles {
        sound[] = {};
        soundFly[] = {};
        soundHit[] = {};
        model = QUOTE(PATHTOF(models\dragon.p3d));
        ammo = "ace_missile_dragon";
        initSpeed = 100;
        count = 1;
        descriptionShort = "M222 HEAT Round for the M47 Dragon ATGM Missile";
        displayName = "M47 Dragon M222 HEAT";
        displayNameShort = "M222 HEAT";
    };
};
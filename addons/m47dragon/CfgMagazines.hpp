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
    };
};
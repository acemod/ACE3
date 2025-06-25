class CfgMagazines {
    class magazine_Missile_rim116_x21;
    class GVAR(rim116): magazine_Missile_rim116_x21 {
        author = "tcvm";
        displayName = CSTRING(rim116_21x);
        ammo = QGVAR(rim116);
    };

    class 4Rnd_70mm_SAAMI_missiles;
    class GVAR(stinger): 4Rnd_70mm_SAAMI_missiles {
        author = "tcvm";
        displayName = CSTRING(stinger_4x);
        ammo = QGVAR(stinger);
    };

    class Titan_AA;
    class GVAR(stinger_man): Titan_AA {
        author = "tcvm";
        displayName = CSTRING(stinger);
        ammo = QGVAR(stinger);
    };
};

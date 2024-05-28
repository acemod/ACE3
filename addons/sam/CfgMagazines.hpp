class CfgMagazines {
    class magazine_Missile_mim145_x4;
    class GVAR(patriot): magazine_Missile_mim145_x4 {
        displayName = CSTRING(patriot_missile);
        ammo = QGVAR(patriot);
    };

    class magazine_Missile_rim162_x8;
    class GVAR(RIM162): magazine_Missile_rim162_x8 {
        displayName = CSTRING(essm_missile);
        ammo = QGVAR(RIM162);
    };

    class magazine_Missile_s750_x4;
    class GVAR(s400): magazine_Missile_s750_x4 {
        displayName = CSTRING(s400_missile);
        ammo = QGVAR(s400);
    };
};


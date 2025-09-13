class CfgMagazines {
    class 2Rnd_GBU12_LGB;
    // GBU
    class GVAR(2Rnd_12): 2Rnd_GBU12_LGB {
        displayName = CSTRING(12_2x);
        author = "tcvm";
        ammo = QGVAR(12);
    };

    class 4Rnd_Bomb_04_F;
    class GVAR(4Rnd_GBU12): 4Rnd_Bomb_04_F {
        displayName = CSTRING(12_4x);
        author = "tcvm";
        ammo = QGVAR(12);
    };

    class magazine_Bomb_GBU12_x1;
    class GVAR(gbu12): magazine_Bomb_GBU12_x1 {
        displayName = CSTRING(12_1x);
        author = "tcvm";
        ammo = QGVAR(12);
    };

    class PylonMissile_1Rnd_Bomb_04_F;
    class GVAR(1_PylonMissile_1Rnd_12): PylonMissile_1Rnd_Bomb_04_F {
        displayName = CSTRING(12_1x);
        author = "tcvm";
        ammo = QGVAR(12);
        pylonWeapon = QGVAR(12);
    };

    class 2Rnd_GBU12_LGB_MI10;
    class GVAR(2Rnd_GBU12_LGB_MI10): 2Rnd_GBU12_LGB_MI10 {
        displayName = CSTRING(12_2x);
        author = "tcvm";
        ammo = QGVAR(12);
        pylonWeapon = QGVAR(12);
    };

    class PylonMissile_Bomb_GBU12_x1;
    class GVAR(PylonMissile_Bomb_GBU12_x1): PylonMissile_Bomb_GBU12_x1 {
        displayName = CSTRING(12_1x);
        author = "tcvm";
        ammo = QGVAR(12);
        pylonWeapon = QGVAR(12);
    };

    class PylonRack_Bomb_GBU12_x2;
    class GVAR(PylonRack_Bomb_GBU12_x2): PylonRack_Bomb_GBU12_x2 {
        displayName = CSTRING(12_2x);
        author = "tcvm";
        ammo = QGVAR(12);
        pylonWeapon = QGVAR(12);
    };

    // KAB
    class magazine_Bomb_KAB250_x1;
    class GVAR(1Rnd_FAB250): magazine_Bomb_KAB250_x1 {
        displayName = CSTRING(fab250_1x);
        author = "tcvm";
        ammo = QGVAR(FAB250);
    };

    class PylonMissile_Bomb_KAB250_x1;
    class GVAR(1_PylonMissile_1Rnd_FAB250): PylonMissile_Bomb_KAB250_x1 {
        displayName = CSTRING(fab250_1x);
        author = "tcvm";
        ammo = QGVAR(FAB250);
        pylonWeapon = QGVAR(FAB250);
    };

    class 2Rnd_Bomb_03_F;
    class GVAR(2Rnd_FAB250): 2Rnd_Bomb_03_F {
        displayName = CSTRING(fab250_2x);
        author = "tcvm";
        ammo = QGVAR(FAB250);
    };

    class PylonMissile_1Rnd_Bomb_03_F;
    class GVAR(PylonMissile_1Rnd_FAB250): PylonMissile_1Rnd_Bomb_03_F {
        displayName = CSTRING(fab250_1x);
        author = "tcvm";
        ammo = QGVAR(FAB250);
        pylonWeapon = QGVAR(FAB250);
    };
};


class CfgMagazines {
    class 2Rnd_GBU12_LGB;
    class GVAR(2Rnd_12): 2Rnd_GBU12_LGB {
        displayName = "GBU-12 [ACE]";
        author = "Brandon (TCVM)";
        ammo = QGVAR(12);
    };

    class PylonMissile_1Rnd_Bomb_04_F;
    class GVAR(1_PylonMissile_1Rnd_12): PylonMissile_1Rnd_Bomb_04_F {
        displayName = "GBU-12 [ACE]";
        author = "Brandon (TCVM)";
        ammo = QGVAR(12);
        pylonWeapon = QGVAR(12);
    };

    class magazine_Bomb_KAB250_x1;
    class GVAR(1Rnd_FAB250): magazine_Bomb_KAB250_x1 {
        displayName = "KAB-250M-54 [ACE]";
        author = "Brandon (TCVM)";
        ammo = QGVAR(FAB250);
    };

    class PylonMissile_Bomb_KAB250_x1;
    class GVAR(1_PylonMissile_1Rnd_FAB250): PylonMissile_Bomb_KAB250_x1 {
        displayName = "KAB-250M-54 [ACE]";
        author = "Brandon (TCVM)";
        ammo = QGVAR(FAB250);
        pylonWeapon = QGVAR(FAB250);
    };
};


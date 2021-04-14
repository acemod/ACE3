class CfgMagazines {
    class 2Rnd_Missile_AA_04_F;
    class PylonRack_1Rnd_Missile_AA_04_F;
    class PylonMissile_1Rnd_Missile_AA_04_F;

    class GVAR(2Rnd_Missile_9m): 2Rnd_Missile_AA_04_F {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-9M [ACE]";
        ammo = QGVAR(m);
    };

    class GVAR(PylonRack_1Rnd_Missile_9m): PylonRack_1Rnd_Missile_AA_04_F {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-9M [ACE]";
        ammo = QGVAR(m);
        pylonWeapon = QGVAR(m);
    };

    class GVAR(PylonMissile_1Rnd_Missile_9m): PylonMissile_1Rnd_Missile_AA_04_F {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-9M [ACE]";
        ammo = QGVAR(m);
        pylonWeapon = QGVAR(m);
    };
};


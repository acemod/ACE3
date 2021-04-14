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

    class magazine_Missile_BIM9X_x1;
    class PylonMissile_Missile_BIM9X_x1;
    class PylonRack_Missile_BIM9X_x1;
    class PylonRack_Missile_BIM9X_x2;

    class GVAR(magazine_Missile_9x): magazine_Missile_BIM9X_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-9X [ACE]";
        ammo = QGVAR(x);
    };

    class GVAR(PylonMissile_Missile_9x): PylonMissile_Missile_BIM9X_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-9X [ACE]";
        ammo = QGVAR(x);
        pylonWeapon = QGVAR(x);
    };

    class GVAR(PylonRack_Missile_9x): PylonRack_Missile_BIM9X_x1 {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-9X [ACE]";
        ammo = QGVAR(x);
        pylonWeapon = QGVAR(x);
    };

    class GVAR(PylonRack_Missile_9x_2): PylonRack_Missile_BIM9X_x2 {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-9X [ACE]";
        ammo = QGVAR(x);
        pylonWeapon = QGVAR(x);
    };
};


class CfgMagazines {
    class 2Rnd_Missile_AA_04_F;
    class PylonRack_1Rnd_Missile_AA_04_F;
    class PylonMissile_1Rnd_Missile_AA_04_F;

    // AIM-9
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

    // AIM-132
    class 2Rnd_AAA_missiles;
    class 2Rnd_AAA_missiles_MI02;
    class 2Rnd_AAA_missiles_MI06;
    class 4Rnd_AAA_missiles;
    class 4Rnd_AAA_missiles_MI02;
    class PylonRack_1Rnd_AAA_missiles;
    class PylonMissile_1Rnd_AAA_missiles;

    class GVAR(aim132_2Rnd): 2Rnd_AAA_missiles {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_2Rnd_MI02): 2Rnd_AAA_missiles_MI02 {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_2Rnd_MI06): 2Rnd_AAA_missiles_MI06 {
        author = "Brandon (TCVM)";
        displayName = "2x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_4Rnd): 4Rnd_AAA_missiles {
        author = "Brandon (TCVM)";
        displayName = "4x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_4Rnd_MI02): 4Rnd_AAA_missiles_MI02 {
        author = "Brandon (TCVM)";
        displayName = "4x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
    };

    class GVAR(PylonRack_1Rnd_aim132): PylonRack_1Rnd_AAA_missiles {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
        pylonWeapon = QGVAR(aim132);
    };

    class GVAR(PylonMissile_1Rnd_aim132): PylonMissile_1Rnd_AAA_missiles {
        author = "Brandon (TCVM)";
        displayName = "1x AIM-132 [ACE]";
        ammo = QGVAR(aim132);
        pylonWeapon = QGVAR(aim132);
    };
};


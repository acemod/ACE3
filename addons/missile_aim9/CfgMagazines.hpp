class CfgMagazines {
    class 2Rnd_Missile_AA_04_F;
    class PylonRack_1Rnd_Missile_AA_04_F;
    class PylonMissile_1Rnd_Missile_AA_04_F;

    // AIM-9
    class GVAR(2Rnd_Missile_9m): 2Rnd_Missile_AA_04_F {
        author = "tcvm";
        displayName = CSTRING(m_2x);
        ammo = QGVAR(m);
    };

    class GVAR(PylonRack_1Rnd_Missile_9m): PylonRack_1Rnd_Missile_AA_04_F {
        author = "tcvm";
        displayName = CSTRING(m_1x);
        ammo = QGVAR(m);
        pylonWeapon = QGVAR(m);
    };

    class GVAR(PylonMissile_1Rnd_Missile_9m): PylonMissile_1Rnd_Missile_AA_04_F {
        author = "tcvm";
        displayName = CSTRING(m_1x);
        ammo = QGVAR(m);
        pylonWeapon = QGVAR(m);
    };

    class magazine_Missile_BIM9X_x1;
    class PylonMissile_Missile_BIM9X_x1;
    class PylonRack_Missile_BIM9X_x1;
    class PylonRack_Missile_BIM9X_x2;

    class GVAR(magazine_Missile_9x): magazine_Missile_BIM9X_x1 {
        author = "tcvm";
        displayName = CSTRING(x_1x);
        ammo = QGVAR(x);
    };

    class GVAR(PylonMissile_Missile_9x): PylonMissile_Missile_BIM9X_x1 {
        author = "tcvm";
        displayName = CSTRING(x_1x);
        ammo = QGVAR(x);
        pylonWeapon = QGVAR(x);
    };

    class GVAR(PylonRack_Missile_9x): PylonRack_Missile_BIM9X_x1 {
        author = "tcvm";
        displayName = CSTRING(x_1x);
        ammo = QGVAR(x);
        pylonWeapon = QGVAR(x);
    };

    class GVAR(PylonRack_Missile_9x_2): PylonRack_Missile_BIM9X_x2 {
        author = "tcvm";
        displayName = CSTRING(x_2x);
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
        author = "tcvm";
        displayName = CSTRING(aim132_2x);
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_2Rnd_MI02): 2Rnd_AAA_missiles_MI02 {
        author = "tcvm";
        displayName = CSTRING(aim132_2x);
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_2Rnd_MI06): 2Rnd_AAA_missiles_MI06 {
        author = "tcvm";
        displayName = CSTRING(aim132_2x);
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_4Rnd): 4Rnd_AAA_missiles {
        author = "tcvm";
        displayName = CSTRING(aim132_4x);
        ammo = QGVAR(aim132);
    };

    class GVAR(aim132_4Rnd_MI02): 4Rnd_AAA_missiles_MI02 {
        author = "tcvm";
        displayName = CSTRING(aim132_4x);
        ammo = QGVAR(aim132);
    };

    class GVAR(PylonRack_1Rnd_aim132): PylonRack_1Rnd_AAA_missiles {
        author = "tcvm";
        displayName = CSTRING(aim132_1x);
        ammo = QGVAR(aim132);
        pylonWeapon = QGVAR(aim132);
    };

    class GVAR(PylonMissile_1Rnd_aim132): PylonMissile_1Rnd_AAA_missiles {
        author = "tcvm";
        displayName = CSTRING(aim132_1x);
        ammo = QGVAR(aim132);
        pylonWeapon = QGVAR(aim132);
    };

    // R-73
    class PylonMissile_Missile_AA_R73_x1;
    class magazine_Missile_AA_R73_x1;
    class 2Rnd_Missile_AA_03_F;
    class PylonRack_1Rnd_Missile_AA_03_F;
    class PylonMissile_1Rnd_Missile_AA_03_F;

    class GVAR(r73): magazine_Missile_AA_R73_x1 {
        author = "tcvm";
        displayName = CSTRING(r73_1x);
        ammo = QGVAR(r73);
    };

    class GVAR(PylonMissile_Missile_R73_x1): PylonMissile_Missile_AA_R73_x1 {
        author = "tcvm";
        displayName = CSTRING(r73_1x);
        ammo = QGVAR(r73);
        pylonWeapon = QGVAR(r73);
    };

    class GVAR(2Rnd_Missile_R74): 2Rnd_Missile_AA_03_F {
        author = "tcvm";
        displayName = CSTRING(r74_2x);
        ammo = QGVAR(r74);
    };

    // R-74 -- improved R-73, same missile in the way that an AIM-9X is the same as an AIM-9M
    class GVAR(PylonRack_1Rnd_Missile_R74): PylonRack_1Rnd_Missile_AA_03_F {
        author = "tcvm";
        displayName = CSTRING(r74_1x);
        ammo = QGVAR(r74);
        pylonWeapon = QGVAR(r74);
    };

    class GVAR(PylonMissile_1Rnd_Missile_R74): PylonMissile_1Rnd_Missile_AA_03_F {
        author = "tcvm";
        displayName = CSTRING(r74_1x);
        ammo = QGVAR(r74);
        pylonWeapon = QGVAR(r74);
    };
};


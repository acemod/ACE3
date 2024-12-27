class CfgMagazines {
    class 12Rnd_PG_missiles;

    // HOT1 - HEAT (anti-tank)
    class GVAR(1_6Rnd): 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = QGVAR(HOT1);
        displayName = CSTRING(hot1);
        displayNameShort = CSTRING(hot1);
        descriptionShort = CSTRING(missileType);
    };

    class GVAR(1_2Rnd): GVAR(1_6Rnd) {
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(1_PylonMissile_1Rnd): GVAR(1_6Rnd) { // Bare missle
        displayName = CSTRING(hot1_1);
        count = 1;
        mass = 70;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class GVAR(1_PylonRack_1Rnd): GVAR(1_6Rnd) { // 1x Launcher Support Rack
        displayName = CSTRING(hot1_1);
        count = 1;
        mass = 85;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(1_PylonRack_3Rnd): GVAR(1_6Rnd) { // 3x Launcher Support Rack
        displayName = CSTRING(hot1_3);
        count = 3;
        mass = 250;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(1_PylonRack_4Rnd): GVAR(1_6Rnd) { // 4x Launcher Support Rack
        displayName = CSTRING(hot1_4);
        count = 4;
        mass = 340;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };

    // HOT2 - HEAT (anti-tank)
    class GVAR(2_6Rnd): 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = QGVAR(HOT2);
        displayName = CSTRING(hot2);
        displayNameShort = CSTRING(hot2);
        descriptionShort = CSTRING(missileType);
    };

    class GVAR(2_2Rnd): GVAR(2_6Rnd) {
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(2_PylonMissile_1Rnd): GVAR(2_6Rnd) { // Bare missle
        displayName = CSTRING(hot2_1);
        pylonWeapon = QGVAR(2_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class GVAR(2_PylonRack_1Rnd): GVAR(2_6Rnd) { // 1x Launcher Support Rack
        displayName = CSTRING(hot2_1);
        pylonWeapon = QGVAR(2_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(2_PylonRack_3Rnd): GVAR(2_6Rnd) { // 3x Launcher Support Rack
        displayName = CSTRING(hot2_3);
        pylonWeapon = QGVAR(2_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(2_PylonRack_4Rnd): GVAR(2_6Rnd) { // 4x Launcher Support Rack
        displayName = CSTRING(hot2_4);
        pylonWeapon = QGVAR(2_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };

    // HOT2MP - HE Anti-Infantry
    class GVAR(2MP_6Rnd): 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = QGVAR(HOT2MP);
        displayName = CSTRING(hot2mp);
        displayNameShort = CSTRING(hot2mp);
        descriptionShort = CSTRING(missileType);
    };

    class GVAR(2MP_2Rnd): GVAR(2MP_6Rnd) {
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(2MP_PylonMissile_1Rnd): GVAR(2MP_6Rnd) { // Bare missle
        displayName = CSTRING(hot2mp_1);
        pylonWeapon = QGVAR(2mp_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class GVAR(2MP_PylonRack_1Rnd): GVAR(2MP_6Rnd) { // 1x Launcher Support Rack
        displayName = CSTRING(hot2mp_1);
        pylonWeapon = QGVAR(2mp_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(2MP_PylonRack_3Rnd): GVAR(2MP_6Rnd) { // 3x Launcher Support Rack
        displayName = CSTRING(hot2mp_3);
        pylonWeapon = QGVAR(2mp_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(2MP_PylonRack_4Rnd): GVAR(2MP_6Rnd) { // 4x Launcher Support Rack
        displayName = CSTRING(hot2mp_4);
        pylonWeapon = QGVAR(2mp_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };

    // HOT3 - tandem shaped charge HEAT (anti-tank)
    class GVAR(3_6Rnd): 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = QGVAR(HOT3);
        displayName = CSTRING(hot3);
        displayNameShort = CSTRING(hot3);
        descriptionShort = CSTRING(missileType);
    };

    class GVAR(3_2Rnd): GVAR(3_6Rnd) { // Old style vehicle magazine
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(3_PylonMissile_1Rnd): GVAR(3_6Rnd) { // Bare missle
        displayName = CSTRING(hot3_1);
        pylonWeapon = QGVAR(3_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };

    class GVAR(3_PylonRack_1Rnd): GVAR(3_6Rnd) { // 1x Launcher Support Rack
        displayName = CSTRING(hot3_1);
        pylonWeapon = QGVAR(3_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(3_PylonRack_3Rnd): GVAR(3_6Rnd) { // 3x Launcher Support Rack
        displayName = CSTRING(hot3_3);
        pylonWeapon = QGVAR(3_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(3_PylonRack_4Rnd): GVAR(3_6Rnd) { // 4x Launcher Support Rack
        displayName = CSTRING(hot3_4);
        pylonWeapon = QGVAR(3_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
};


class CfgMagazines {
    class 12Rnd_PG_missiles;
    
    // HOT1 - tandem shaped charge HEAT (anti-tank)
    class GVAR(1_6Rnd): 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = QGVAR(HOT1);
        displayName = "HOT 1 [ACE]";
        displayNameShort = "HOT1";
        descriptionShort = "HOT1";
    };
    
    class GVAR(1_2Rnd): GVAR(1_6Rnd) {
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(1_PylonMissile_1Rnd): GVAR(1_6Rnd) { // Bare missle
        displayName = "1x HOT 1 [ACE]";
        count = 1;
        mass = 70;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class GVAR(1_PylonRack_1Rnd): GVAR(1_6Rnd) { // 1x Launcher Support Rack
        displayName = "1x HOT 1 [ACE]";
        count = 1;
        mass = 85;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(1_PylonRack_3Rnd): GVAR(1_6Rnd) { // 3x Launcher Support Rack
        displayName = "3x HOT 1 [ACE]";
        count = 3;
        mass = 250;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(1_PylonRack_4Rnd): GVAR(1_6Rnd) { // 4x Launcher Support Rack
        displayName = "4x HOT 1 [ACE]";
        count = 4;
        mass = 340;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
    
    // HOT2 - tandem shaped charge HEAT (anti-tank)
    class GVAR(2_6Rnd): 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = QGVAR(HOT2);
        displayName = "HOT 1 [ACE]";
        displayNameShort = "HOT2";
        descriptionShort = "HOT2";
    };
    
    class GVAR(2_2Rnd): GVAR(2_6Rnd) {
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(2_PylonMissile_1Rnd): GVAR(2_6Rnd) { // Bare missle
        displayName = "1x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class GVAR(2_PylonRack_1Rnd): GVAR(2_6Rnd) { // 1x Launcher Support Rack
        displayName = "1x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(2_PylonRack_3Rnd): GVAR(2_6Rnd) { // 3x Launcher Support Rack
        displayName = "3x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(2_PylonRack_4Rnd): GVAR(2_6Rnd) { // 4x Launcher Support Rack
        displayName = "4x HOT 2 [ACE]";
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
        displayName = "HOT 2MP [ACE]";
        displayNameShort = "HOT2MP";
        descriptionShort = "HOT2MP";
    };
    
    class GVAR(2MP_2Rnd): GVAR(2MP_6Rnd) {
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(2MP_PylonMissile_1Rnd): GVAR(2MP_6Rnd) { // Bare missle
        displayName = "1x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class GVAR(2MP_PylonRack_1Rnd): GVAR(2MP_6Rnd) { // 1x Launcher Support Rack
        displayName = "1x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(2MP_PylonRack_3Rnd): GVAR(2MP_6Rnd) { // 3x Launcher Support Rack
        displayName = "3x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(2MP_PylonRack_4Rnd): GVAR(2MP_6Rnd) { // 4x Launcher Support Rack
        displayName = "4x HOT 2MP [ACE]";
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
        displayName = "HOT 1 [ACE]";
        displayNameShort = "HOT3";
        descriptionShort = "HOT3";
    };
    
    class GVAR(3_2Rnd): GVAR(3_6Rnd) { // Old style vehicle magazine
        count = 2;
    };

    // 1.70 pylon magazines:
    class GVAR(3_PylonMissile_1Rnd): GVAR(3_6Rnd) { // Bare missle
        displayName = "1x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    
    class GVAR(3_PylonRack_1Rnd): GVAR(3_6Rnd) { // 1x Launcher Support Rack
        displayName = "1x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class GVAR(3_PylonRack_3Rnd): GVAR(3_6Rnd) { // 3x Launcher Support Rack
        displayName = "3x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class GVAR(3_PylonRack_4Rnd): GVAR(3_6Rnd) { // 4x Launcher Support Rack
        displayName = "4x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
};


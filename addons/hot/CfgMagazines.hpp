class CfgMagazines {
    class 12Rnd_PG_missiles;
    
    // HOT1 - tandem shaped charge HEAT (anti-tank)
    class 6Rnd_ACE_HOT1: 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = "ACE_HOT_HOT1";
        displayName = "HOT 1 [ACE]";
        displayNameShort = "HOT1";
        descriptionShort = "HOT1";
    };
    
    class 2Rnd_ACE_HOT1: 6Rnd_ACE_HOT1 {
        count = 2;
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_HOT1: 6Rnd_ACE_HOT1 { // Bare missle
        displayName = "1x HOT 1 [ACE]";
        count = 1;
        mass = 70;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class PylonRack_1Rnd_ACE_HOT1: 6Rnd_ACE_HOT1 { // 1x Launcher Support Rack
        displayName = "1x HOT 1 [ACE]";
        count = 1;
        mass = 85;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class PylonRack_3Rnd_ACE_HOT1: 6Rnd_ACE_HOT1 { // 3x Launcher Support Rack
        displayName = "3x HOT 1 [ACE]";
        count = 3;
        mass = 250;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class PylonRack_4Rnd_ACE_HOT1: 6Rnd_ACE_HOT1 { // 4x Launcher Support Rack
        displayName = "4x HOT 1 [ACE]";
        count = 4;
        mass = 340;
        pylonWeapon = QGVAR(1_launcher);
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
    
    // HOT2 - tandem shaped charge HEAT (anti-tank)
    class 6Rnd_ACE_HOT2: 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = "ACE_HOT_HOT2";
        displayName = "HOT 1 [ACE]";
        displayNameShort = "HOT2";
        descriptionShort = "HOT2";
    };
    
    class 2Rnd_ACE_HOT2: 6Rnd_ACE_HOT2 {
        count = 2;
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_HOT2: 6Rnd_ACE_HOT2 { // Bare missle
        displayName = "1x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class PylonRack_1Rnd_ACE_HOT2: 6Rnd_ACE_HOT2 { // 1x Launcher Support Rack
        displayName = "1x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class PylonRack_3Rnd_ACE_HOT2: 6Rnd_ACE_HOT2 { // 3x Launcher Support Rack
        displayName = "3x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class PylonRack_4Rnd_ACE_HOT2: 6Rnd_ACE_HOT2 { // 4x Launcher Support Rack
        displayName = "4x HOT 2 [ACE]";
        pylonWeapon = QGVAR(2_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
    
    // HOT2MPMP - HE Anti-Infantry
    class 6Rnd_ACE_HOT2MP: 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = "ACE_HOT_HOT2MP";
        displayName = "HOT 2MP [ACE]";
        displayNameShort = "HOT2MP";
        descriptionShort = "HOT2MP";
    };
    
    class 2Rnd_ACE_HOT2MP: 6Rnd_ACE_HOT2MP {
        count = 2;
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_HOT2MP: 6Rnd_ACE_HOT2MP { // Bare missle
        displayName = "1x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class PylonRack_1Rnd_ACE_HOT2MP: 6Rnd_ACE_HOT2MP { // 1x Launcher Support Rack
        displayName = "1x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class PylonRack_3Rnd_ACE_HOT2MP: 6Rnd_ACE_HOT2MP { // 3x Launcher Support Rack
        displayName = "3x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class PylonRack_4Rnd_ACE_HOT2MP: 6Rnd_ACE_HOT2MP { // 4x Launcher Support Rack
        displayName = "4x HOT 2MP [ACE]";
        pylonWeapon = QGVAR(2mp_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
    
        // HOT3 - tandem shaped charge HEAT (anti-tank)
    class 6Rnd_ACE_HOT3: 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        initSpeed = 100;
        ammo = "ACE_HOT_HOT3";
        displayName = "HOT 1 [ACE]";
        displayNameShort = "HOT3";
        descriptionShort = "HOT3";
    };
    
    class 2Rnd_ACE_HOT3: 6Rnd_ACE_HOT3 { // Old style vehicle magazine
        count = 2;
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_HOT3: 6Rnd_ACE_HOT3 { // Bare missle
        displayName = "1x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 1;
        mass = 70;
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    
    class PylonRack_1Rnd_ACE_HOT3: 6Rnd_ACE_HOT3 { // 1x Launcher Support Rack
        displayName = "1x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 1;
        mass = 85;
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class PylonRack_3Rnd_ACE_HOT3: 6Rnd_ACE_HOT3 { // 3x Launcher Support Rack
        displayName = "3x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 3;
        mass = 250;
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class PylonRack_4Rnd_ACE_HOT3: 6Rnd_ACE_HOT3 { // 4x Launcher Support Rack
        displayName = "4x HOT 3 [ACE]";
        pylonWeapon = QGVAR(3_launcher);
        count = 4;
        mass = 340;
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE", "RHS_HP_HELLFIRE_RACK", "RHS_HP_LONGBOW_RACK"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };
};


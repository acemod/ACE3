class CfgMagazines {
    class 12Rnd_PG_missiles;
    
    // Kilo - tandem shaped charge HEAT (anti-tank)
    class 6Rnd_ACE_Hellfire_AGM114K: 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        ammo = "ACE_Hellfire_AGM114K";
        displayName = "AGM-114K [ACE]";
        displayNameShort = "AGM-114K";
        descriptionShort = "AGM-114K";
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_Hellfire_AGM114K: 6Rnd_ACE_Hellfire_AGM114K { // Bare missle
        displayName = "1x AGM-114K [ACE]";
        count = 1;
        mass = 70;
        pylonWeapon = QGVAR(launcher);
        hardpoints[] = {"SCALPEL_1RND"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class PylonRack_1Rnd_ACE_Hellfire_AGM114K: 6Rnd_ACE_Hellfire_AGM114K { // 1x Launcher Support Rack
        displayName = "1x AGM-114K [ACE]";
        count = 1;
        mass = 85;
        pylonWeapon = QGVAR(launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_1x_Missile_AA_04_F.p3d";
    };
    class PylonRack_3Rnd_ACE_Hellfire_AGM114K: 6Rnd_ACE_Hellfire_AGM114K { // 3x Launcher Support Rack
        displayName = "3x AGM-114K [ACE]";
        count = 3;
        mass = 250;
        pylonWeapon = QGVAR(launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "UNI_SCALPEL", "CUP_NATO_HELO_LARGE"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_3x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 3};
    };
    class PylonRack_4Rnd_ACE_Hellfire_AGM114K: 6Rnd_ACE_Hellfire_AGM114K { // 4x Launcher Support Rack
        displayName = "4x AGM-114K [ACE]";
        count = 4;
        mass = 340;
        pylonWeapon = QGVAR(launcher);
        hardpoints[] = {"UNI_SCALPEL", "CUP_NATO_HELO_LARGE"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonPod_4x_Missile_LG_scalpel_F.p3d";
        mirrorMissilesIndexes[] = {2, 1, 4, 3};
    };

    // November - Metal augmented charge (Thermobaric) (Enclosures, ships, urban targets, air defense units)
    class 6Rnd_ACE_Hellfire_AGM114N: 6Rnd_ACE_Hellfire_AGM114K { // Old style vehicle magazine
        count = 6;
        ammo = "ACE_Hellfire_AGM114N";
        displayName = "AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = "AGM-114N";
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_Hellfire_AGM114N: PylonMissile_1Rnd_ACE_Hellfire_AGM114K { // Bare missle
        displayName = "1x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = "AGM-114N";
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
    class PylonRack_1Rnd_ACE_Hellfire_AGM114N: PylonRack_1Rnd_ACE_Hellfire_AGM114K { // 1x Launcher Support Rack
        displayName = "1x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = "AGM-114N";
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
    class PylonRack_3Rnd_ACE_Hellfire_AGM114N: PylonRack_3Rnd_ACE_Hellfire_AGM114K { // 3x Launcher Support Rack
        displayName = "3x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = "AGM-114N";
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
    class PylonRack_4Rnd_ACE_Hellfire_AGM114N: PylonRack_4Rnd_ACE_Hellfire_AGM114K { // 4x Launcher Support Rack
        displayName = "4x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = "AGM-114N";
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
};

class CfgMagazines {
    class 12Rnd_PG_missiles;

    // Kilo - tandem shaped charge HEAT (anti-tank)
    class 6Rnd_ACE_Hellfire_AGM114K: 12Rnd_PG_missiles { // Old style vehicle magazine
        count = 6;
        ammo = "ACE_Hellfire_AGM114K";
        displayName = "AGM-114K [ACE]";
        displayNameShort = "AGM-114K";
        descriptionShort = CSTRING(KDescriptionShort);
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_Hellfire_AGM114K: 6Rnd_ACE_Hellfire_AGM114K { // Bare missle
        displayName = "1x AGM-114K [ACE]";
        count = 1;
        mass = 70;
        pylonWeapon = QGVAR(launcher);
        hardpoints[] = {"SCALPEL_1RND", "HellfireRail_MELB"};
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d";
    };
    class PylonRack_1Rnd_ACE_Hellfire_AGM114K: 6Rnd_ACE_Hellfire_AGM114K { // 1x Launcher Support Rack
        displayName = "1x AGM-114K [ACE]";
        count = 1;
        mass = 85;
        pylonWeapon = QGVAR(launcher);
        hardpoints[] = {"B_MISSILE_PYLON", "SCALPEL_1RND_EJECTOR", "B_ASRRAM_EJECTOR", "UNI_SCALPEL", "CUP_NATO_HELO_SMALL", "CUP_NATO_HELO_LARGE", "RHS_HP_MELB"};
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
        descriptionShort = CSTRING(NDescriptionShort);
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_Hellfire_AGM114N: PylonMissile_1Rnd_ACE_Hellfire_AGM114K { // Bare missle
        displayName = "1x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = CSTRING(NDescriptionShort);
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
    class PylonRack_1Rnd_ACE_Hellfire_AGM114N: PylonRack_1Rnd_ACE_Hellfire_AGM114K { // 1x Launcher Support Rack
        displayName = "1x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = CSTRING(NDescriptionShort);
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
    class PylonRack_3Rnd_ACE_Hellfire_AGM114N: PylonRack_3Rnd_ACE_Hellfire_AGM114K { // 3x Launcher Support Rack
        displayName = "3x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = CSTRING(NDescriptionShort);
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };
    class PylonRack_4Rnd_ACE_Hellfire_AGM114N: PylonRack_4Rnd_ACE_Hellfire_AGM114K { // 4x Launcher Support Rack
        displayName = "4x AGM-114N [ACE]";
        displayNameShort = "AGM-114N";
        descriptionShort = CSTRING(NDescriptionShort);
        ammo = "ACE_Hellfire_AGM114N";
        pylonWeapon = QGVAR(launcher_N);
    };

    // Lima - tandem shaped charge HEAT (anti-tank) Fire and Forget Active Radar Homing
    class 6Rnd_ACE_Hellfire_AGM114L: 6Rnd_ACE_Hellfire_AGM114K { // Old style vehicle magazine
        count = 6;
        ammo = "ACE_Hellfire_AGM114L";
        displayName = "AGM-114L [ACE]";
        displayNameShort = "AGM-114L";
        descriptionShort = CSTRING(LDescriptionShort);
    };

    // 1.70 pylon magazines:
    class PylonMissile_1Rnd_ACE_Hellfire_AGM114L: PylonMissile_1Rnd_ACE_Hellfire_AGM114K { // Bare missle
        displayName = "1x AGM-114L [ACE]";
        displayNameShort = "AGM-114L";
        descriptionShort = CSTRING(LDescriptionShort);
        ammo = "ACE_Hellfire_AGM114L";
        pylonWeapon = QGVAR(launcher_L);
    };
    class PylonRack_1Rnd_ACE_Hellfire_AGM114L: PylonRack_1Rnd_ACE_Hellfire_AGM114K { // 1x Launcher Support Rack
        displayName = "1x AGM-114L [ACE]";
        displayNameShort = "AGM-114L";
        descriptionShort = CSTRING(LDescriptionShort);
        ammo = "ACE_Hellfire_AGM114L";
        pylonWeapon = QGVAR(launcher_L);
    };
    class PylonRack_3Rnd_ACE_Hellfire_AGM114L: PylonRack_3Rnd_ACE_Hellfire_AGM114K { // 3x Launcher Support Rack
        displayName = "3x AGM-114L [ACE]";
        displayNameShort = "AGM-114L";
        descriptionShort = CSTRING(LDescriptionShort);
        ammo = "ACE_Hellfire_AGM114L";
        pylonWeapon = QGVAR(launcher_L);
    };
    class PylonRack_4Rnd_ACE_Hellfire_AGM114L: PylonRack_4Rnd_ACE_Hellfire_AGM114K { // 4x Launcher Support Rack
        displayName = "4x AGM-114L [ACE]";
        displayNameShort = "AGM-114L";
        descriptionShort = CSTRING(LDescriptionShort);
        ammo = "ACE_Hellfire_AGM114L";
        pylonWeapon = QGVAR(launcher_L);
    };
};


class CfgMagazines {
    class VehicleMagazine;
    class 24Rnd_PG_missiles;

    class 12Rnd_PG_missiles: 24Rnd_PG_missiles {
        count = 12;
        displayName = "$STR_A3_CfgMagazines_12Rnd_PG_missiles0";
        displayNameShort = "$STR_A3_CfgMagazines_12Rnd_PG_missiles_dns";
        descriptionShort = "$STR_A3_CfgMagazines_12Rnd_PG_missiles1";
    };
    class 12Rnd_missiles: VehicleMagazine {
        scope = 2;
        count = 12;
        ammo = "M_AT";
        displayName = "$STR_A3_CfgMagazines_24Rnd_PuG_missiles0";
        displayNameShort = "$STR_A3_CfgMagazines_24Rnd_PuG_missiles_dns";
        descriptionShort = "$STR_A3_CfgMagazines_24Rnd_PuG_missiles0";
        initSpeed = 44;
        maxLeadSpeed = 800;
        nameSound = "rockets";
        sound[] = {"A3\sounds_f\weapons\rockets\explosion_missile_01",1,1,1200};
        reloadSound[] = {"",0.000316228,1};
    };

    //minigun magazines, muzzle velocities and tracercounts
    class 200Rnd_65x39_Belt: VehicleMagazine {};
    class 2000Rnd_65x39_Belt: 200Rnd_65x39_Belt {};
    class 2000Rnd_65x39_Belt_Tracer_Red: 2000Rnd_65x39_Belt {
    };
    class 2000Rnd_65x39_Belt_Green: 2000Rnd_65x39_Belt {};
    class 2000Rnd_65x39_Belt_Tracer_Green: 2000Rnd_65x39_Belt_Green {
        tracersEvery = 1;
    };
    class 2000Rnd_65x39_Belt_Yellow: 2000Rnd_65x39_Belt {
        tracersEvery = 1;
    };
    class 2000Rnd_65x39_Belt_Tracer_Yellow: 2000Rnd_65x39_Belt_Yellow {
        tracersEvery = 1;
    };

    class 5000Rnd_762x51_Belt: 2000Rnd_65x39_Belt {
        tracersEvery = 1;
        count = 5000;
    };
    class 5000Rnd_762x51_Yellow_Belt: 5000Rnd_762x51_Belt {};
    class 4000Rnd_762x51_M134 : 5000Rnd_762x51_Belt {
        count = 4000;
        tracersEvery = 1;
    };
    class 2000Rnd_762x51_M134 : 4000Rnd_762x51_M134 {
        count = 2000;
        tracersEvery = 1;
    };

    class 2Rnd_AAA_missiles: VehicleMagazine {
        scope = 2;
        displayName = "$STR_A3_CfgMagazines_2Rnd_AAA_missiles0";
        displayNameShort = "$STR_A3_CfgMagazines_2Rnd_AAA_missiles_dns";
        ammo = "M_Air_AA";
        count = 2;
        maxLeadSpeed = 950;
        nameSound = "missiles";
    };
    class 2Rnd_AAA_missiles_MI02: 2Rnd_AAA_missiles {
        ammo = "M_Air_AA_MI02";
    };
    class 4Rnd_AAA_missiles: 2Rnd_AAA_missiles {
        displayName = "$STR_A3_CfgMagazines_4Rnd_AAA_missiles0";
        displayNameShort = "$STR_A3_CfgMagazines_4Rnd_AAA_missiles_dns";
        count = 4;
    };
    class 4Rnd_AAA_missiles_MI02: 4Rnd_AAA_missiles {
        ammo = "M_Air_AA_MI02";
    };

    class 4Rnd_GAA_missiles: VehicleMagazine {
        scope = 2;
        displayName = "$STR_A3_CfgMagazines_4Rnd_GAA_missiles0";
        displayNameShort = "$STR_A3_CfgMagazines_4Rnd_GAA_missiles_dns";
        count = 4;
        ammo = "M_Zephyr";
        maxLeadSpeed = 950;
        nameSound = "missiles";
    };

    class 300Rnd_20mm_shells: VehicleMagazine {
        scope = 2;
        displayName = "$STR_A3_CfgMagazines_300Rnd_20mm_shells0";
        displayNameShort = "$STR_A3_CfgMagazines_300Rnd_20mm_shells_dns";
        ammo = "B_20mm";
        count = 300;
        deflecting = 3;
        maxLeadSpeed = 300;
        tracersEvery = 5;
        nameSound = "cannon";
    };

    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
        scope = 2;
        displayNameShort = "";
        ammo = "ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy";
        count = 1170;
        //count = 390;
        //initSpeed = 3852;
        maxLeadSpeed = 300;
        nameSound = "cannon";
        tracersEvery = 1;
    };

    class 2Rnd_Missile_AA_04_F: VehicleMagazine {
        scope = 2;
        displayNameShort = "$STR_A3_CFGMAGAZINES_4RND_AAA_MISSILES_DNS";
        ammo = "Missile_AA_04_F";
        count = 2;
        maxLeadSpeed = 220;
        nameSound = "missiles";
    };
    class 6Rnd_Missile_AGM_02_F: VehicleMagazine {
        scope = 2;
        displayNameShort = "$STR_A3_CFGMAGAZINES_38RND_80MM_ROCKETS_DNS";
        ammo = "Missile_AGM_02_F";
        count = 6;
        maxLeadSpeed = 450;
        nameSound = "missiles";
    };
    class 2Rnd_Missile_AGM_02_F: VehicleMagazine {
        scope = 2;
        displayNameShort = "$STR_A3_CFGMAGAZINES_38RND_80MM_ROCKETS_DNS";
        ammo = "Missile_AGM_02_F";
        count = 2;
        maxLeadSpeed = 450;
        nameSound = "missiles";
    };

    class 7Rnd_Rocket_04_HE_F: VehicleMagazine {
        scope = 2;
        displayNameShort = "$STR_A3_CFGMAGAZINES_40RND_20MM_G_BELT_DNS";
        ammo = "Rocket_04_HE_F";
        count = 7;
        maxLeadSpeed = 200;
        nameSound = "rockets";
    };
    class 7Rnd_Rocket_04_AP_F: 7Rnd_Rocket_04_HE_F {
        displayNameShort = "$STR_A3_CFGMAGAZINES_TITAN_AP_DNS";
        ammo = "Rocket_04_AP_F";
    };

    class 4Rnd_Bomb_04_F: VehicleMagazine {
        scope = 2;
        displayNameShort = "$STR_A3_CFGVEHICLES_BOMB0";
        ammo = "Bomb_04_F";
        count = 4;
        maxLeadSpeed = 1000;
        nameSound = "cannon";
    };

    class 500Rnd_Cannon_30mm_Plane_CAS_02_F: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        displayNameShort = "";
        ammo = "Cannon_30mm_HE_Plane_CAS_02_F";
        count = 500;
    };

    class 2Rnd_Missile_AA_03_F: 2Rnd_Missile_AA_04_F {
        displayNameShort = "$STR_A3_CFGMAGAZINES_4RND_AAA_MISSILES_DNS";
        ammo = "Missile_AA_03_F";
        count = 2;
    };
    class 4Rnd_Missile_AGM_01_F: 6Rnd_Missile_AGM_02_F {
        displayNameShort = "$STR_A3_CFGMAGAZINES_38RND_80MM_ROCKETS_DNS";
        ammo = "Missile_AGM_01_F";
        count = 4;
    };

    class 20Rnd_Rocket_03_HE_F: 7Rnd_Rocket_04_HE_F {
        displayNameShort = "$STR_A3_CFGMAGAZINES_40RND_20MM_G_BELT_DNS";
        ammo = "Rocket_03_HE_F";
        count = 20;
    };
    class 20Rnd_Rocket_03_AP_F: 7Rnd_Rocket_04_AP_F {
        displayNameShort = "$STR_A3_CFGMAGAZINES_TITAN_AP_DNS";
        ammo = "Rocket_03_AP_F";
        count = 20;
    };

    class 2Rnd_Bomb_03_F: 4Rnd_Bomb_04_F {
        displayNameShort = "$STR_A3_CFGVEHICLES_BOMB0";
        ammo = "Bomb_03_F";
        count = 2;
    };

    class ACE_500Rnd_20mm_shells_Comanche: 300Rnd_20mm_shells {
        displayName = "20mm";
        displayNameShort = "20mm";
        ammo = "B_20mm";
        count = 500;
        deflecting = 3;
        initSpeed = 1030;
        maxLeadSpeed = 300;
        tracersEvery = 5;
    };
};

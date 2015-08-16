class CfgMagazines {
    class CA_Magazine;
    class 60Rnd_CMFlareMagazine : CA_Magazine {
        displayName = CSTRING(60Rnd_CMFlareMagazine);
    };

    class VehicleMagazine;
    class SmokeLauncherMag : VehicleMagazine {
        displayName = CSTRING(SmokeLauncherMag);
    };
    class SmokeLauncherMag_boat : VehicleMagazine {
        displayName = CSTRING(SmokeLauncherMag);
    };
    
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F : VehicleMagazine {
        displayName = CSTRING(1000Rnd_Gatling_30mm_Plane_CAS_01_F);
    };
    class 500Rnd_Cannon_30mm_Plane_CAS_02_F : 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        displayName = CSTRING(500Rnd_Cannon_30mm_Plane_CAS_02_F);
    };

    class 2Rnd_Missile_AA_04_F : VehicleMagazine {
       displayName = CSTRING(2Rnd_Missile_AA_04_F);
    };
    class 2Rnd_Missile_AA_03_F : 2Rnd_Missile_AA_04_F {
        displayName = CSTRING(2Rnd_Missile_AA_03_F);
    };

    class 6Rnd_Missile_AGM_02_F : VehicleMagazine {
        displayName = CSTRING(6Rnd_Missile_AGM_02_F);
    };
    class 4Rnd_Missile_AGM_01_F : 6Rnd_Missile_AGM_02_F {
        displayName = CSTRING(4Rnd_Missile_AGM_01_F);
    };

    class 7Rnd_Rocket_04_HE_F : VehicleMagazine {
        displayName = CSTRING(7Rnd_Rocket_04_HE_F);
    };
    class 20Rnd_Rocket_03_HE_F : 7Rnd_Rocket_04_HE_F {
        displayName = CSTRING(20Rnd_Rocket_03_HE_F);
    };

    class 7Rnd_Rocket_04_AP_F : 7Rnd_Rocket_04_HE_F {
        displayName = CSTRING(7Rnd_Rocket_04_AP_F);
    };
    class 20Rnd_Rocket_03_AP_F : 7Rnd_Rocket_04_AP_F {
        displayName = CSTRING(20Rnd_Rocket_03_AP_F);
    };

    class 4Rnd_Bomb_04_F : VehicleMagazine {
        displayName = CSTRING(4Rnd_Bomb_04_F);
    };
    class 2Rnd_Bomb_03_F : 4Rnd_Bomb_04_F {
        displayName = CSTRING(2Rnd_Bomb_03_F);
    };
};
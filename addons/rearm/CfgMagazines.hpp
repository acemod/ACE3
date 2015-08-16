class CfgMagazines {
    class CA_Magazine;
    class 60Rnd_CMFlareMagazine : CA_Magazine {
        displayName = CSTRING(flarelauncher);
    };

    class VehicleMagazine;
    class SmokeLauncherMag : VehicleMagazine {
        displayName = CSTRING(smokelauncher);
    };
    class SmokeLauncherMag_boat : VehicleMagazine {
        displayName = CSTRING(smokelauncher);
    };
    
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F : VehicleMagazine {
        displayName = "30mm HEI";
    };
    class 500Rnd_Cannon_30mm_Plane_CAS_02_F : 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        displayName = "30mm HEI-T";
    };

    class 2Rnd_Missile_AA_04_F : VehicleMagazine {
       displayName = "AIM-9 Sidewinder";
    };
    class 2Rnd_Missile_AA_03_F : 2Rnd_Missile_AA_04_F {
        displayName = "Wympel R-73";
    };

    class 6Rnd_Missile_AGM_02_F : VehicleMagazine {
        displayName = "AGM-65 Maverick";
    };
    class 4Rnd_Missile_AGM_01_F : 6Rnd_Missile_AGM_02_F {
        displayName = "Kh-25MTP";
    };

    class 7Rnd_Rocket_04_HE_F : VehicleMagazine {
        displayName = "Hydra 70 HE";
    };
    class 20Rnd_Rocket_03_HE_F : 7Rnd_Rocket_04_HE_F {
        displayName = "S-8 HE";
    };

    class 7Rnd_Rocket_04_AP_F : 7Rnd_Rocket_04_HE_F {
        displayName = "Hydra 70 AP";
    };
    class 20Rnd_Rocket_03_AP_F : 7Rnd_Rocket_04_AP_F {
        displayName = "S-8 AP";
    };

    class 4Rnd_Bomb_04_F : VehicleMagazine {
        displayName = "GBU-12"
    };
    class 2Rnd_Bomb_03_F : 4Rnd_Bomb_04_F {
        displayName = "FAB-250M-54"
    };
};
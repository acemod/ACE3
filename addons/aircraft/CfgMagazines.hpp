class CfgMagazines {
    // shoot helper object to tripple rof
    class VehicleMagazine;
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
        ammo = "ACE_Gatling_30mm_HE_Plane_CAS_01_Deploy";
        count = 1170;
    };
    class ACE_1174Rnd_GAU8_30mm_Plane_CAS_01_F: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_GAU8_30mm_Mix_Plane_CAS_01_F";
        displayNameShort = "30mm MIX";
        initSpeed = 1036;
        tracersEvery = 0;
        count = 1174;
        nameSound = "cannon";
    };

    // an extended magazine for the comanche
    class 300Rnd_20mm_shells;
    class ACE_500Rnd_20mm_shells_Comanche: 300Rnd_20mm_shells {
        ammo = "ACE_20mm_HE";
        count = 500;
    };
};

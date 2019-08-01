class CfgMagazines {
    // shoot helper object to tripple rof
    class VehicleMagazine;
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
        count = 1170;
    };
    
    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM: VehicleMagazine {
        count = 1170;
        ammo = "ACE_30mm_mix";
    };

    // an extended magazine for the comanche
    class 300Rnd_20mm_shells;
    class ACE_500Rnd_20mm_shells_Comanche: 300Rnd_20mm_shells {
        ammo = "ACE_20mm_HE";
        count = 500;
    };
};

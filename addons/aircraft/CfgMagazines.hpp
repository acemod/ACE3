class CfgMagazines {
    // shoot helper object to tripple rof
    class VehicleMagazine;
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
		ammo = "ACE_Gatling_30mm_Sub_HEI";
        count = 1170;
    };

    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_AP: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_AP";
		displayName = "30mm DU Armor Piercing";
		displayNameShort = "30mm DUAP";
    };
    
    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM41: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_CM41";
		displayName = "30mm Combat Mix 4:1 DU:HEI";
		displayNameShort = "30mm 4:1 DU:HEI";
    };
	
	 class ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM51: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_CM51";
		displayName = "30mm Combat Mix 5:1 DU:HEI";
		displayNameShort = "30mm 5:1 DU:HEI";
    };

    // an extended magazine for the comanche
    class 300Rnd_20mm_shells;
    class ACE_500Rnd_20mm_shells_Comanche: 300Rnd_20mm_shells {
        ammo = "ACE_20mm_HE";
        count = 500;
    };
};

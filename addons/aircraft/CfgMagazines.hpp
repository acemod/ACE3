class CfgMagazines {
    // shoot helper object to tripple rof
    class VehicleMagazine;
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {
        ammo = "ACE_Gatling_30mm_Sub_CM51";
        displayName = CSTRING(GatlingDescriptionCM51);
        displayNameShort = CSTRING(GatlingDescriptionShortCM51);
        count = 1170;
    };

    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_HEI: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_HEI";
        displayName = CSTRING(GatlingDescriptionHEI);
        displayNameShort = CSTRING(GatlingDescriptionShortHEI);
    };

    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_AP: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_AP";
        displayName = CSTRING(GatlingDescriptionAP);
        displayNameShort = CSTRING(GatlingDescriptionShortAP);
    };
    
    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM41: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_CM41";
        displayName = CSTRING(GatlingDescriptionCM41);
        displayNameShort = CSTRING(GatlingDescriptionShortCM41);
    };
   
    class ACE_1000Rnd_Gatling_30mm_Plane_CAS_CM51: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "ACE_Gatling_30mm_Sub_CM51";
        displayName = CSTRING(GatlingDescriptionCM51);
        displayNameShort = CSTRING(GatlingDescriptionShortCM51);
    };

    // an extended magazine for the comanche
    class 300Rnd_20mm_shells;
    class ACE_500Rnd_20mm_shells_Comanche: 300Rnd_20mm_shells {
        ammo = "ACE_20mm_HE";
        count = 500;
    };
};

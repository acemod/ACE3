class CfgMagazines {
    // shoot helper object to tripple rof
    class VehicleMagazine;
    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F: VehicleMagazine {};
    class ACE_1000Rnd_Gatling_30mm_Plane_DEBUG: 1000Rnd_Gatling_30mm_Plane_CAS_01_F {
        ammo = "Gatling_30mm_DEBUG";
        displayName = "DEBUG";
        displayNameShort = "DEBUG";
    };

    class 8Rnd_82mm_Mo_shells;
    class 8Rnd_82mm_Mo_DEBUG: 8Rnd_82mm_Mo_shells {
        ammo = "Sh_82mm_DEBUG";
        displayName = "DEBUG";
        displayNameShort = "DEBUG";
    };
    
    class 1Rnd_HE_Grenade_shell;
    class 1Rnd_HE_Grenade_DEBUG: 1Rnd_HE_Grenade_shell{
        ammo = "G_40mm_DEBUG";
        displayName = "DEBUG";
        displayNameShort = "DEBUG";
        initSpeed = 160;
    };
    
    class magazine_Missiles_Cruise_01_x18;
    class magazine_Missiles_Cruise_DEBUG: magazine_Missiles_Cruise_01_x18 {
        ammo = "ammo_Missile_Cruise_DEBUG";
        displayName = "DEBUG";
        displayNameShort = "DEBUG";
    };
};
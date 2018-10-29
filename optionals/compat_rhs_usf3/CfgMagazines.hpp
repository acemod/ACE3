class cfgMagazines {
    class CA_Magazine;
    class VehicleMagazine;
    class rhs_mag_30Rnd_556x45_M855A1_Stanag;

    class rhsusf_100Rnd_556x45_soft_pouch: rhs_mag_30Rnd_556x45_M855A1_Stanag {
        ace_isbelt = 1;
    };
    class rhsusf_50Rnd_762x51: CA_Magazine {
        ace_isbelt = 1;
    };
    class rhs_mag_100rnd_127x99_mag: VehicleMagazine {
        ace_isbelt = 1;
    };
    class RHS_48Rnd_40mm_MK19: VehicleMagazine {
        ace_isbelt = 1;
    };

    class CA_LauncherMagazine;
    class rhs_mag_smaw_SR: CA_LauncherMagazine {
        EGVAR(overpressure,priority) = 99;
        EGVAR(overpressure,angle) = 0;
        EGVAR(overpressure,range) = 0;
        EGVAR(overpressure,damage) = 0;
    };

    class ACE_PreloadedMissileDummy_Base;
    class ACE_PreloadedMissileDummy_M136HEAT: ACE_PreloadedMissileDummy_Base {
        ammo = "rhs_ammo_M136_rocket";
        type = "6 * 256";
        initSpeed = 290;
        mass = 0;
    };

    class ACE_PreloadedMissileDummy_M136HEDP: ACE_PreloadedMissileDummy_M136HEAT {
        ammo = "rhs_ammo_M136_hedp_rocket";
    };

    class ACE_PreloadedMissileDummy_M136HP: ACE_PreloadedMissileDummy_M136HEAT {
        ammo = "rhs_ammo_M136_hp_rocket";
    };

    class ACE_PreloadedMissileDummy_M72: ACE_PreloadedMissileDummy_M136HEAT {
        ammo = "rhs_ammo_m72a7_rocket";
    };
};

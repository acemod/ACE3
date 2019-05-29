class cfgMagazines {
    class CA_Magazine;
    class VehicleMagazine;
    class rhsusf_mag_40Rnd_46x30_AP: CA_Magazine {
        descriptionShort = "Caliber: 4.6x30 mm<br/>Rounds: 40<br/>Used in: MP7A2";
        initSpeed = 680; // according with the ACE_muzzleVelocities at 15°C, default RHS value 680.1
    };
    class rhsusf_mag_40Rnd_46x30_FMJ: CA_Magazine {
        descriptionShort = "Caliber: 4.6x30 mm<br/>Rounds: 40<br/>Used in: MP7A2";
        initSpeed = 620; // default RHS value according with the ACE_muzzleVelocities at 15°C
        lastRoundsTracer = 0;
        picture = "\rhsusf\addons\rhsusf_weapons2\glock17g4\data\rhs_mag1_glock17g4_ca.paa";
        tracersEvery = 0;
    };
    class rhsusf_mag_40Rnd_46x30_JHP: CA_Magazine {
        descriptionShort = "Caliber: 4.6x30 mm<br/>Rounds: 40<br/>Used in: MP7A2";
        initSpeed = 690; // according with the ACE_muzzleVelocities at 15°C, default RHS value 620
    };
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

    class rhs_mag_AGM114K_2;
    class GVAR(pylon_mag_2rnd_hellfire_k): rhs_mag_AGM114K_2 {
        displayName = "2x AGM-114K [ACE]";
        pylonWeapon = "ace_hellfire_launcher";
        ammo = "ACE_Hellfire_AGM114K";
    };
    class GVAR(pylon_mag_2rnd_hellfire_n): rhs_mag_AGM114K_2 {
        displayName = "2x AGM-114N [ACE]";
        pylonWeapon = "ace_hellfire_launcher_N";
        ammo = "ACE_Hellfire_AGM114N";
    };

};

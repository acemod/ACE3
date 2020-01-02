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
    class GVAR(pylon_mag_2rnd_hellfire_l): rhs_mag_AGM114K_2 {
        displayName = "2x AGM-114L [ACE]";
        pylonWeapon = "ace_hellfire_launcher_L";
        ammo = "ACE_Hellfire_AGM114L";
    };

    class rhsusf_m112_mag: CA_Magazine {
        ace_explosives_DelayTime = 1;
        ace_explosives_Placeable = 1;
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhsusf_m112_DemoCharge";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
            class DeadmanSwitch: Command {};
        };
    };

    class rhsusf_m112x4_mag: rhsusf_m112_mag {
        ace_explosives_DelayTime = 1;
        ace_explosives_Placeable = 1;
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhsusf_m112x4_DemoCharge";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
            class DeadmanSwitch: Command {};
        };
    };

    class ATMine_Range_Mag;
    class rhs_mine_M19_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_M19_Mine";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.075;
            };
        };
    };

    class rhsusf_mine_m14_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhsusf_mine_m14_mag_Mine";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.03;
            };
        };
    };

   // RHS magazines for crew handled ammo
    class rhs_mag_TOW;
    class GVAR(mag_TOW): rhs_mag_TOW {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200; // Actually should be 440 but ARMA uses weight and volume in the same number
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOWB;
    class GVAR(mag_TOWB): rhs_mag_TOWB {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_ITOW;
    class GVAR(mag_ITOW): rhs_mag_ITOW {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2;
    class GVAR(mag_TOW2): rhs_mag_TOW2 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2A;
    class GVAR(mag_TOW2A): rhs_mag_TOW2A {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2b;
    class GVAR(mag_TOW2b): rhs_mag_TOW2b {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2b_aero;
    class GVAR(mag_TOW2b_aero): rhs_mag_TOW2b_aero {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };
    class rhs_mag_TOW2bb;
    class GVAR(mag_TOW2bb): rhs_mag_TOW2bb {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_CA.paa";
    };

    class GVAR(48Rnd_40mm_MK19): RHS_48Rnd_40mm_MK19 {
        scope = 2;
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_48Rnd_40mm_MK19_M430I;
    class GVAR(48Rnd_40mm_MK19_M430I): RHS_48Rnd_40mm_MK19_M430I {
        scope = 2;
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_48Rnd_40mm_MK19_M1001;
    class GVAR(48Rnd_40mm_MK19_M1001): RHS_48Rnd_40mm_MK19_M1001 {
        scope = 2;
        type = 256;
        count = 48;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d"; // ammo can instead of any special model so no one gets especially confused over what it is
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
};

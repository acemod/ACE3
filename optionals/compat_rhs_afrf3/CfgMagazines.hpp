class cfgMagazines {
    class VehicleMagazine;
    class rhs_30Rnd_545x39_7N6_AK;

    class rhs_100Rnd_762x54mmR: rhs_30Rnd_545x39_7N6_AK {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_50: VehicleMagazine {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_150: rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };
    class rhs_mag_127x108mm_1470 : rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };
    class RHS_mag_VOG30_30: VehicleMagazine {
        ace_isbelt = 1;
    };
    class RHS_mag_GPD30_30: RHS_mag_VOG30_30 {};

    // RHS magazines for crew handled ammo
    class rhs_mag_9M131M;
    class GVAR(mag_9M131M): rhs_mag_9M131M {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_metis_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9M131F;
    class GVAR(mag_9M131F): rhs_mag_9M131F {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_metis_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m133;
    class GVAR(mag_9m133): rhs_mag_9m133 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m133f;
    class GVAR(mag_9m133f): rhs_mag_9m133f {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m1331;
    class GVAR(mag_9m1331): rhs_mag_9m1331 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m133m2;
    class GVAR(mag_9m133m2): rhs_mag_9m133m2 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_PG9V;
    class GVAR(mag_PG9V): rhs_mag_PG9V {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_PG9N;
    class GVAR(mag_PG9N): rhs_mag_PG9N {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_PG9VNT;
    class GVAR(mag_PG9VNT): rhs_mag_PG9VNT {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_OG9VM;
    class GVAR(mag_OG9VM): rhs_mag_OG9VM {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_OG9V;
    class GVAR(mag_OG9V): rhs_mag_OG9V {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };

    class GVAR(mag_VOG30_30): RHS_mag_VOG30_30 {
        scope = 2;
        type = 256;
        count = 30;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class GVAR(mag_GPD30_30): RHS_mag_GPD30_30 {
        scope = 2;
        type = 256;
        count = 30;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_mag_VOG17m_30;
    class GVAR(mag_VOG17m_30): RHS_mag_VOG17m_30 {
        scope = 2;
        type = 256;
        count = 30;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };

    // ACE Explosives
    class ATMine_Range_Mag;
    class rhs_mine_tm62m_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_tm62m";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.09;
            };
        };
    };

    class rhs_mine_pmn2_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_pmn2";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.02;
            };
        };
    };

    class rhs_mag_mine_ptm1: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_ptm1";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.04;
            };
        };
    };

    class rhs_mag_mine_pfm1: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_pfm1";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.02;
            };
        };
    };

    class rhs_ec75_mag: ATMine_Range_Mag {
        ace_explosives_DelayTime = 1;
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_ec75";
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

    class rhs_ec75_sand_mag: rhs_ec75_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_ec75_sand";
    };

    class rhs_ec200_mag: rhs_ec75_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_ec200";
    };

    class rhs_ec200_sand_mag: rhs_ec200_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_ec200_sand";
    };

    class rhs_ec400_mag: rhs_ec75_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_ec400";
    };

    class rhs_ec400_sand_mag: rhs_ec400_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_ec400_sand";
    };

    class rhs_mine_msk40p_white_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_msk40p_white";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.07;
            };
        };
    };

    class rhs_mine_msk40p_red_mag: rhs_mine_msk40p_white_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_msk40p_red";
    };

    class rhs_mine_msk40p_green_mag: rhs_mine_msk40p_white_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_msk40p_green";
    };

    class rhs_mine_msk40p_blue_mag: rhs_mine_msk40p_white_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_msk40p_blue";
    };

    class rhs_mine_sm320_white_mag: rhs_mine_msk40p_white_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_sm320_white";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.05;
            };
        };
    };

    class rhs_mine_sm320_red_mag: rhs_mine_sm320_white_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_sm320_red";
    };

    class rhs_mine_sm320_green_mag: rhs_mine_sm320_white_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_sm320_green";
    };

    class rhs_mine_ozm72_a_mag: ATMine_Range_Mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_ozm72_a";
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.04;
            };
        };
    };

    class rhs_mine_ozm72_b_mag: rhs_mine_ozm72_a_mag {
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_ozm72_b";
    };

    class rhs_mine_ozm72_c_mag: rhs_mine_ozm72_a_mag {
        ace_explosives_DelayTime = 1;
        ace_explosives_SetupObject = "ACE_Explosives_Place_rhs_mine_ozm72_c";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Command", "MK16_Transmitter"};
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
        };
    };
};

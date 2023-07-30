class CfgMagazines {
    // ACE Explosives
    class ATMine_Range_Mag;
    class rhs_mine_tm62m_mag: ATMine_Range_Mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_tm62m);
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.09;
            };
        };
    };

    class rhs_mine_pmn2_mag: ATMine_Range_Mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_pmn2);
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.02;
            };
        };
    };

    class rhs_mag_mine_ptm1: ATMine_Range_Mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_ptm1);
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.04;
            };
        };
    };

    class rhs_mag_mine_pfm1: ATMine_Range_Mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_pfm1);
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.02;
            };
        };
    };

    class rhs_ec75_mag: ATMine_Range_Mag {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_ec75);
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
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_ec75_sand);
    };

    class rhs_ec200_mag: rhs_ec75_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_ec200);
    };

    class rhs_ec200_sand_mag: rhs_ec200_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_ec200_sand);
    };

    class rhs_ec400_mag: rhs_ec75_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_ec400);
    };

    class rhs_ec400_sand_mag: rhs_ec400_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_ec400_sand);
    };

    class rhs_mine_msk40p_white_mag: ATMine_Range_Mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_msk40p_white);
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.07;
            };
        };
    };

    class rhs_mine_msk40p_red_mag: rhs_mine_msk40p_white_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_msk40p_red);
    };

    class rhs_mine_msk40p_green_mag: rhs_mine_msk40p_white_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_msk40p_green);
    };

    class rhs_mine_msk40p_blue_mag: rhs_mine_msk40p_white_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_msk40p_blue);
    };

    class rhs_mine_sm320_white_mag: rhs_mine_msk40p_white_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_sm320_white);
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.05;
            };
        };
    };

    class rhs_mine_sm320_red_mag: rhs_mine_sm320_white_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_sm320_red);
    };

    class rhs_mine_sm320_green_mag: rhs_mine_sm320_white_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_sm320_green);
    };

    class rhs_mine_ozm72_a_mag: ATMine_Range_Mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_ozm72_a);
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.04;
            };
        };
    };

    class rhs_mine_ozm72_b_mag: rhs_mine_ozm72_a_mag {
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_ozm72_b);
    };

    class rhs_mine_ozm72_c_mag: rhs_mine_ozm72_a_mag {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,SetupObject) = QEGVAR(explosives,Place_rhs_mine_ozm72_c);
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

class CfgVehicles {
    // ACE Explosives
    class Items_base_F;
    class EGVAR(explosives,Place): Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class EGVAR(explosives,Place_rhs_mine_tm62m): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_CFGMAGAZINES_TM62M0";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_tm62m";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.005, -0.025, 0.06]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_mine_pmn2): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_CFGMAGAZINES_PMN20";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_pmn2";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.012]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_mine_ptm1): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_PTM1_NAME";
        model = "\rhsafrf\addons\rhs_airweapons\rhs_m_ptm1_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.17, 0.02]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_mine_pfm1): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_PFM1_NAME";
        model = "\rhsafrf\addons\rhs_airweapons\rhs_m_pfm1_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.015, 0.018, 0]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_ec75): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_CFGMAGAZINES_EC75";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec75_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.04, 0.02]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_ec75_sand): EGVAR(explosives,Place_rhs_ec75) {
        displayName = "$STR_RHS_CFGMAGAZINES_EC75_SAND";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec75_sand_e";
    };

    class EGVAR(explosives,Place_rhs_ec200): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_CFGMAGAZINES_EC200";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec200_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.05, 0.008]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_ec200_sand): EGVAR(explosives,Place_rhs_ec200) {
        displayName = "$STR_RHS_CFGMAGAZINES_EC200_SAND";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec200_sand_e";
    };

    class EGVAR(explosives,Place_rhs_ec400): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_CFGMAGAZINES_EC400";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec400_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.03, 0.02]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_ec400_sand): EGVAR(explosives,Place_rhs_ec400) {
        displayName = "$STR_RHS_CFGMAGAZINES_EC400_SAND";
        model = "\rhsafrf\addons\rhs_weapons2\explosives\rhs_ec400_sand_e";
    };

    class EGVAR(explosives,Place_rhs_mine_msk40p_white): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_MINE_MSK40P_W_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_white_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[-0.025, 0, 0.4]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_mine_msk40p_red): EGVAR(explosives,Place_rhs_mine_msk40p_white) {
        displayName = "$STR_RHS_MINE_MSK40P_R_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_red_e";
    };

    class EGVAR(explosives,Place_rhs_mine_msk40p_green): EGVAR(explosives,Place_rhs_mine_msk40p_white) {
        displayName = "$STR_RHS_MINE_MSK40P_G_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_green_e";
    };

    class EGVAR(explosives,Place_rhs_mine_msk40p_blue): EGVAR(explosives,Place_rhs_mine_msk40p_white) {
        displayName = "$STR_RHS_MINE_MSK40P_B_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_msk40p_blue_e";
    };

    class EGVAR(explosives,Place_rhs_mine_sm320_white): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_MINE_SM320_W_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_sm320_white_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[-0.01, 0, 0.25]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_mine_sm320_red): EGVAR(explosives,Place_rhs_mine_sm320_white) {
        displayName = "$STR_RHS_MINE_SM320_R_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_sm320_red_e";
    };

    class EGVAR(explosives,Place_rhs_mine_sm320_green): EGVAR(explosives,Place_rhs_mine_sm320_white) {
        displayName = "$STR_RHS_MINE_SM320_G_MAG_DISPLAYNAME";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_sm320_green_e";
    };

    class EGVAR(explosives,Place_rhs_mine_ozm72_a): EGVAR(explosives,Place) {
        displayName = "$STR_RHS_CFGMAGAZINES_OZM72A";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_ozm72_a_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[0, 0.125, 0.11]";
            };
        };
    };

    class EGVAR(explosives,Place_rhs_mine_ozm72_b): EGVAR(explosives,Place_rhs_mine_ozm72_a) {
        displayName = "$STR_RHS_CFGMAGAZINES_OZM72B";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_ozm72_b_e";
    };

    class EGVAR(explosives,Place_rhs_mine_ozm72_c): EGVAR(explosives,Place_rhs_mine_ozm72_a) {
        displayName = "$STR_RHS_CFGMAGAZINES_OZM72C";
        model = "\rhsafrf\addons\rhs_weapons\mines\rhs_ozm72_c_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
               position = "[0, 0.015, 0.12]";
            };
        };
    };
};

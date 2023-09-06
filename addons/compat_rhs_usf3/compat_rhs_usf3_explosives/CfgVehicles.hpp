class CfgVehicles {
    class Items_base_F;
    class EGVAR(explosives,Place): Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    // ACE Explosives
    class EGVAR(explosives,Place_rhsusf_explosive_m112): EGVAR(explosives,Place) {
        displayName = "$STR_RHSUSF_M112_EXPLOSIVE_DISPLAY_NAME";
        model = "\rhsusf\addons\rhsusf_weapons\explosives\rhsusf_m112x1_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.055, 0, 0.038]";
            };
        };
    };

    class EGVAR(explosives,Place_rhsusf_explosive_m112x4): EGVAR(explosives,Place) {
        displayName = "$STR_RHSUSF_M112X4_EXPLOSIVE_DISPLAY_NAME";
        model = "\rhsusf\addons\rhsusf_weapons\explosives\rhsusf_m112x4_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.055, 0.025, 0.102]";
            };
        };
    };

    class EGVAR(explosives,Place_rhsusf_mine_M19): EGVAR(explosives,Place) {
        displayName = "$STR_RHSUSF_M19_ATMINE_DISPLAY_NAME";
        model = "\rhsusf\addons\rhsusf_weapons\mines\rhsusf_m19_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.014, -0.002, 0.046]";
            };
        };
    };

    class EGVAR(explosives,Place_rhsusf_mine_m14): EGVAR(explosives,Place) {
        displayName = "$STR_RHSUSF_M14_APMINE_DISPLAY_NAME";
        model = "\rhsusf\addons\rhsusf_weapons\mines\rhsusf_m14_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    class EGVAR(explosives,Place_rhsusf_mine_m49a1_3m): EGVAR(explosives,Place) {
        displayName = "M49A1 (3m)";
        model = "\rhsusf\addons\rhsusf_weapons\mines\rhsusf_m49a1_a_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.016, 0.296]";
            };
        };
    };

    class EGVAR(explosives,Place_rhsusf_mine_m49a1_6m): EGVAR(explosives,Place_rhsusf_mine_m49a1_3m) {
        displayName = "M49A1 (6m)";
        model = "\rhsusf\addons\rhsusf_weapons\mines\rhsusf_m49a1_b_e";
    };

    class EGVAR(explosives,Place_rhsusf_mine_m49a1_10m): EGVAR(explosives,Place_rhsusf_mine_m49a1_3m) {
        displayName = "M49A1 (10m)";
        model = "\rhsusf\addons\rhsusf_weapons\mines\rhsusf_m49a1_c_e";
    };
};

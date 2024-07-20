class CfgVehicles {

    // ACE Explosives
    class Items_base_F;
    class EGVAR(explosives,Place): Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class EGVAR(explosives,Place_rhssaf_mine_mrud_a): EGVAR(explosives,Place) {
        displayName = "$STR_RHSSAF_MRUD_A_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_a_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.034, 0, 0.202]";
            };
        };
    };

    class EGVAR(explosives,Place_rhssaf_mine_mrud_b): EGVAR(explosives,Place_rhssaf_mine_mrud_a) {
        displayName = "$STR_RHSSAF_MRUD_B_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_b_e";
    };

    class EGVAR(explosives,Place_rhssaf_mine_mrud_c): EGVAR(explosives,Place_rhssaf_mine_mrud_a) {
        displayName = "$STR_RHSSAF_MRUD_C_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_c_e";
    };

    class EGVAR(explosives,Place_rhssaf_mine_mrud_d): EGVAR(explosives,Place_rhssaf_mine_mrud_a) {
        displayName = "$STR_RHSSAF_MRUD_D_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_d_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.0325, 0, 0.18]";
            };
        };
    };

    class EGVAR(explosives,Place_rhssaf_mine_pma3): EGVAR(explosives,Place) {
        displayName = "$STR_RHSSAF_PMA3_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\pma\rhssaf_pma3_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.02]";
            };
        };
    };

    class EGVAR(explosives,Place_rhssaf_mine_tma4): EGVAR(explosives,Place) {
        displayName = "$STR_RHSSAF_TMA4_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_at\tma4\rhssaf_tma4_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.024]";
            };
        };
    };

    class EGVAR(explosives,Place_rhssaf_tm100): EGVAR(explosives,Place) {
        displayName = "$STR_RHSSAF_TM100_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\tm500\rhssaf_tm100_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.055, 0, 0.014]";
            };
        };
    };

    class EGVAR(explosives,Place_rhssaf_tm200): EGVAR(explosives,Place) {
        displayName = "$STR_RHSSAF_TM200_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\tm500\rhssaf_tm200_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.055, 0, 0.018]";
            };
        };
    };

    class EGVAR(explosives,Place_rhssaf_tm500): EGVAR(explosives,Place) {
        displayName = "$STR_RHSSAF_TM500_DISPLAYNAME";
        model = "\rhssaf\addons\rhssaf_m_explosives\tm500\rhssaf_tm500_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.056, 0, 0.028]";
            };
        };
    };
};

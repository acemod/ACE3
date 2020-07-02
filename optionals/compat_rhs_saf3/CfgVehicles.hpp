class CfgVehicles {

    //ACE Explosives
    class Items_base_F;
    class ACE_Explosives_Place: Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class ACE_Explosives_Place_rhssaf_mine_mrud_a: ACE_Explosives_Place {
        displayName = $STR_RHSSAF_MRUD_A_DISPLAYNAME;
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_a_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.034, 0, 0.202]";
            };
        };
    };

    class ACE_Explosives_Place_rhssaf_mine_mrud_b: ACE_Explosives_Place_rhssaf_mine_mrud_a {
        displayName = $STR_RHSSAF_MRUD_B_DISPLAYNAME;
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_b_e";
    };

    class ACE_Explosives_Place_rhssaf_mine_mrud_c: ACE_Explosives_Place_rhssaf_mine_mrud_a {
        displayName = $STR_RHSSAF_MRUD_C_DISPLAYNAME;
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_c_e";
    };

    class ACE_Explosives_Place_rhssaf_mine_mrud_d: ACE_Explosives_Place_rhssaf_mine_mrud_a {
        displayName = $STR_RHSSAF_MRUD_D_DISPLAYNAME;
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\mrud\rhssaf_mrud_d_e";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.0325, 0, 0.18]";
            };
        };
    };

    class ACE_Explosives_Place_rhssaf_mine_pma3: ACE_Explosives_Place {
        displayName = $STR_RHSSAF_PMA3_DISPLAYNAME;
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_ap\pma\rhssaf_pma3_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.02]";
            };
        };
    };

    class ACE_Explosives_Place_rhssaf_mine_tma4: ACE_Explosives_Place {
        displayName = $STR_RHSSAF_TMA4_DISPLAYNAME;
        model = "\rhssaf\addons\rhssaf_m_explosives\mines_at\tma4\rhssaf_tma4_d";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.024]";
            };
        };
    };
};

class CfgVehicles {

    class Items_base_F;
    class EGVAR(explosives,Place): Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    // CHARGE
    class EGVAR(explosives,Place_gm_explosive_petn): EGVAR(explosives,Place) {
        displayName = "$STR_DN_GM_EXPLOSIVE_PETN_CHARGE";
        model = "gm\gm_weapons\gm_put\gm_explosive_charge_petn";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
    class EGVAR(explosives,Place_gm_explosive_plnp): EGVAR(explosives,Place) {
        displayName = "$STR_DN_GM_EXPLOSIVE_PLNP_CHARGE";
        model = "gm\gm_weapons\gm_put\gm_explosive_charge_plnp";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
    // AT MINE
    class EGVAR(explosives,Place_gm_mine_tm46): EGVAR(explosives,Place) {
        displayName = "$STR_DN_GM_MINE_AT_TM46";
        model = "gm\gm_weapons\gm_put\gm_mine_at_tm46";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
    class EGVAR(explosives,Place_gm_explosive_dm21): EGVAR(explosives,Place) {
        displayName = "$STR_DN_GM_MINE_AT_DM21";
        model = "gm\gm_weapons\gm_put\gm_mine_at_dm21";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
    class EGVAR(explosives,Place_gm_explosive_m111): EGVAR(explosives,Place) {
        displayName = "$STR_DN_GM_MINE_AT_MN111";
        model = "gm\gm_weapons\gm_launchers\gm_platan\gm_mine_at_mn111_disarmed";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
    // AP
    class EGVAR(explosives,Place_gm_explosive_dm31): EGVAR(explosives,Place) {
        displayName = "$STR_DN_GM_MINE_AP_DM31";
        model = "gm\gm_weapons\gm_put\gm_mine_ap_dm31";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
};

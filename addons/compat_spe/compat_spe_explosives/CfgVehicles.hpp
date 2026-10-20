class CfgVehicles {
    class Items_base_F;
    class EGVAR(explosives,Place): Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    // 4 Pound TNT Charge
    class EXPLOSIVES_PLACE(4LBTNT): EGVAR(explosives,Place) {
        displayName = "$STR_DN_SPE_US_TNT_4POUND";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_TNT_4pound";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // Half Pound TNT Charge
    class EXPLOSIVES_PLACE(halfLBTNT): EGVAR(explosives,Place) {
        displayName = "$STR_DN_SPE_US_TNT_HALF_POUND";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_TNT_Half_Pound";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // M1A1 Bangalore Torpedo
    class EXPLOSIVES_PLACE(bangalore): EGVAR(explosives,Place) {
        displayName = "$STR_DN_SPE_US_BANGALORE";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Bangalore";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // 1 Kg Charge
    class EXPLOSIVES_PLACE(smallLadung): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_Ladung_Small";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Ladung";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // 3 Kg Charge
    class EXPLOSIVES_PLACE(bigLadung): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_Ladung_Big";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Ladung_Big";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // M1A1 AT Mine
    class EXPLOSIVES_PLACE(M1A1at): EGVAR(explosives,Place) {
        displayName = "$STR_DN_SPE_US_M1A1_ATMINE";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_M1A1_AT";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // Shg24x7 Improvised AT Mine
    class EXPLOSIVES_PLACE(Shg24x7): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_Shg24x7_Improvised_Mine";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_GER_Improvised_Mine";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // TMI-42 AT Mine
    class EXPLOSIVES_PLACE(TMI42): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_TMI_42";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Tmi42";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // M3 AP Tripwire Mine
    class EXPLOSIVES_PLACE(M3ap): EGVAR(explosives,Place) {
        displayName = "$STR_DN_SPE_US_M3";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_M3_AP";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // M3 AP Mine
    class EXPLOSIVES_PLACE(M3Pressure): EGVAR(explosives,Place) {
        displayName = "$STR_DN_SPE_US_M3_Pressure";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_M3_AP_Pressure";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // SMi-35 AP Mine
    class EXPLOSIVES_PLACE(SMI35Pressure): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_SMI_35_Pressure";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Smi35";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // SMi-35 Tripwire Mine
    class EXPLOSIVES_PLACE(SMI35): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_SMI_35";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Smi35_1";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // SMi-35 Tripwire (x2) Mine
    class EXPLOSIVES_PLACE(SMI35_1): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_SMI_35_1";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Smi35_2";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // StMi Mine
    class EXPLOSIVES_PLACE(STMI): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_STMI";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Stmi";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };

    // Schuetzenmine 42
    class EXPLOSIVES_PLACE(shumine42): EGVAR(explosives,Place) {
        displayName = "$STR_SPE_shumine42";
        model = "\WW2\SPE_Assets_m\Weapons\Mines_m\SPE_Shumine42";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.002, 0.022, 0.02]";
            };
        };
    };
};

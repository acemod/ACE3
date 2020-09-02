class CfgVehicles {
    class Rubber_duck_base_F;
    class rhsgref_canoe_base: Rubber_duck_base_F {
        // Canoes are propelled by paddlers
        EGVAR(refuel,canReceive) = 0;
    };

    class StaticMGWeapon;
    class rhs_DSHKM_base: StaticMGWeapon {
        // ENABLE_CSW_ATTRIBUTE;
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_DSHKM);
            magazineLocation = "_target selectionPosition 'otocvez'";
            disassembleWeapon = QGVAR(dshkm_carry);
            disassembleTurret = QEGVAR(csw,kordTripod);
            desiredAmmo = 50;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };
    class rhs_DSHkM_Mini_TriPod_base: rhs_DSHKM_base {
        class ACE_CSW: ACE_CSW {
            enabled = 1;
            disassembleTurret = QEGVAR(csw,kordTripodLow);
        };
    };

    // ACE Explosives
    class Items_base_F;
    class ACE_Explosives_Place: Items_base_F {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class ACE_Explosives_Place_rhs_mine_a200_bz: ACE_Explosives_Place {
        displayName = "Beh.Schu.Mi.A200 (B.Z.) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\A200\A200_BZ_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.095]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_a200_dz35: ACE_Explosives_Place_rhs_mine_a200_bz {
        displayName = "Beh.Schu.Mi.A200 (D.Z.35) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\A200\A200_DZ35_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.125]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_glasmine43_hz: ACE_Explosives_Place {
        displayName = "Gl.Mi.43 (H.Z.44) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Glasmine43\GLMI43_HZ_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.105]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_glasmine43_bz: ACE_Explosives_Place_rhs_mine_glasmine43_hz {
        displayName = "Gl.Mi.43 (B.Z.) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Glasmine43\GLMI43_BZ_ITEM";
    };

    class ACE_Explosives_Place_rhs_mine_m2a3b_press: ACE_Explosives_Place {
        displayName = "M2A3B APB Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M2A3B\M2A3_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.052, 0, 0.225]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_m2a3b_trip: ACE_Explosives_Place_rhs_mine_m2a3b_press {
        displayName = "M2A3B (Tripwire) APB Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M2A3B\M2A3_HELPER_TRIPWIRE";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, -0.046, 0.06]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_m3_pressure: ACE_Explosives_Place {
        displayName = "M3 AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M3\M3_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.23]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_M3_tripwire: ACE_Explosives_Place_rhs_mine_m3_pressure {
        displayName = "M3 (Tripwire) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M3\M6M7FUZE_HELPER_TRIPWIRE";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.055]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_TM43: ACE_Explosives_Place {
        displayName = "Tellermine 43";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\TM43\TM43";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.072]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_M7A2: ACE_Explosives_Place {
        displayName = "M7A2 AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M7A2\M7A2_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.066]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_mk2_pressure: ACE_Explosives_Place {
        displayName = "Mk 2 AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\MKII_BOOBYTRAP\MKII_TRAP_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.09, 0, 0.011]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_Mk2_tripwire: ACE_Explosives_Place {
        displayName = "Mk 2 (Tripwire) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M3\M6M7FUZE_HELPER_TRIPWIRE";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.055]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_smine35_press: ACE_Explosives_Place {
        displayName = "S.Mi.35 (S.Mi.Z.35) APB Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Smine35\SMI35_ITEM_PRESS";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.217]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_smine35_trip: ACE_Explosives_Place {
        displayName = "S.Mi.35 (W) APB Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Smine35\SMI35_HELPER_TRIP";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0, 0, 0.02]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_smine44_trip: ACE_Explosives_Place {
        displayName = "S.Mi.44 (W) APB Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Smine44\SMI44_HELPER_TRIP";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.03, 0, 0.015]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_smine44_press: ACE_Explosives_Place {
        displayName = "S.Mi.44 (S.Mi.Z.44) APB Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Smine44\SMI44_ITEM_PRESS";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[0.02, 0, 0.21]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_stockmine43_2m: ACE_Explosives_Place {
        displayName = "St.Mi.43/I (2m) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Stockmine43\STMI43_HELPER_2M";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[1, 0, 0.25]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_mine_stockmine43_4m: ACE_Explosives_Place {
        displayName = "St.Mi.43/II (4m) AP Mine";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\Stockmine43\STMI43_HELPER_4M";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[2, 0, 0.25]";
            };
        };
    };

    class ACE_Explosives_Place_rhs_charge_M2tet_x2: ACE_Explosives_Place {
        displayName = "Tetrytol Charge (2.5lb Placed)";
        model = "\rhsgref\addons\rhsgref_weapons2\mines\M2_TETRYTOL_x2\M2TET_x2_ITEM";
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "[-0.125, 0, 0.055]";
            };
        };
    };
};

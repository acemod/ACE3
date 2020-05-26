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
};

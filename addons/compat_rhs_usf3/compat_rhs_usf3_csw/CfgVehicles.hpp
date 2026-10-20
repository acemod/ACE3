class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class StaticMortar: StaticWeapon {};
    class RHS_M252_Base: StaticMortar {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "main_gun";
            };
        };

        class ace_csw {
            enabled = 1;
            magazineLocation = "";
            proxyWeapon = QGVAR(rhs_mortar_81mm);
            disassembleWeapon = QGVAR(m252_carry); // carry weapon [CfgWeapons]
            disassembleTurret = QEGVAR(csw,mortarBaseplate); // turret [CfgVehicles]
            desiredAmmo = 1;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            allowFireOnLoad = 2;
        };
    };

    class StaticMGWeapon;
    class rhs_m2staticmg_base: StaticMGWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_M2);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(m2_carry);
            disassembleTurret = QEGVAR(csw,m3Tripod);
            desiredAmmo = 100;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class RHS_M2StaticMG_MiniTripod_base: rhs_m2staticmg_base {
        class ace_csw: ace_csw {
            enabled = 1;
            disassembleTurret = QEGVAR(csw,m3TripodLow);
        };
    };

    class StaticGrenadeLauncher;
    class RHS_MK19_TriPod_base: StaticGrenadeLauncher {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_MK19);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(mk19_carry);
            disassembleTurret = QEGVAR(csw,m3TripodLow);
            desiredAmmo = 48;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class StaticATWeapon;
    class RHS_TOW_TriPod_base: StaticATWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_TOW_Launcher_static);
            magazineLocation = "_target selectionPosition 'tube'";
            disassembleWeapon = QGVAR(tow_carry);
            disassembleTurret = QEGVAR(csw,m220Tripod);
            desiredAmmo = 1;
            ammoLoadTime = 8;
            ammoUnloadTime = 5;
        };
    };
};

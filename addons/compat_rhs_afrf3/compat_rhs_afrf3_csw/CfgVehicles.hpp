class CfgVehicles {
    class AT_01_base_F;
    class StaticMortar;
    class StaticMGWeapon;
    class StaticGrenadeLauncher;

    class rhs_SPG9_base: AT_01_base_F {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_SPG9);
            magazineLocation = "_target selectionPosition 'breach'";
            disassembleWeapon = QGVAR(spg9_carry);
            disassembleTurret = QEGVAR(csw,spg9Tripod);
            desiredAmmo = 1;
            ammoLoadTime = 5;
            ammoUnloadTime = 3;
        };
    };

    class rhs_SPG9M_base: rhs_SPG9_base {
        class ace_csw: ace_csw {
            enabled = 1;
            disassembleWeapon = QGVAR(spg9m_carry);
        };
    };

    class rhs_Kornet_Base: AT_01_base_F {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_9K133_launcher);
            magazineLocation = "_target selectionPosition 'gun'";
            disassembleWeapon = QGVAR(kornet_carry);
            disassembleTurret = "";
            desiredAmmo = 1;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class rhs_Metis_Base: AT_01_base_F {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_9K115_2_launcher);
            magazineLocation = "_target selectionPosition 'gun'";
            disassembleWeapon = QGVAR(metis_carry);
            disassembleTurret = "";
            desiredAmmo = 1;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class rhs_2b14_82mm_Base: StaticMortar {
        class ace_csw {
            enabled = 1;
            magazineLocation = "";
            proxyWeapon = QGVAR(rhs_weap_2b14);
            disassembleWeapon = QGVAR(2b14_carry); // carry weapon [CfgWeapons]
            disassembleTurret = QEGVAR(csw,mortarBaseplate); // turret [CfgVehicles]
            desiredAmmo = 1;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            allowFireOnLoad = 2;
        };
    };

    class rhs_nsv_tripod_base: StaticMGWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_nsvt_effects);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(nsv_carry);
            disassembleTurret = QEGVAR(csw,kordTripodLow);
            desiredAmmo = 50;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class RHS_KORD_Base: rhs_nsv_tripod_base {
        class ace_csw: ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_KORD);
            disassembleWeapon = QGVAR(kord_carry);
            disassembleTurret = QEGVAR(csw,kordTripodLow);
        };
    };

    class RHS_KORD_high_base: RHS_KORD_Base {
        class ace_csw: ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_KORD);
            disassembleWeapon = QGVAR(kord_carry);
            disassembleTurret = QEGVAR(csw,kordTripod);
        };
    };

    class RHS_AGS30_TriPod_base: StaticGrenadeLauncher {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(rhs_weap_AGS30);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(ags30_carry);
            disassembleTurret = QEGVAR(csw,sag30Tripod);
            desiredAmmo = 30;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };
};

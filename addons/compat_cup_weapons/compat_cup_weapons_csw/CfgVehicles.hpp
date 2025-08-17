class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    class StaticMortar: StaticWeapon {};
    class CUP_2b14_82mm_Base: StaticMortar {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = ""; // no good selections for this mortar
            };
        };
        class ace_csw {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'otochlaven'";
            proxyWeapon = "CUP_proxy_mortar_82mm";
            disassembleWeapon = "CUP_2b14_carry";
            disassembleTurret = QEGVAR(csw,mortarBaseplate);
            desiredAmmo = 1;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            allowFireOnLoad = 2;
        };
    };

    class CUP_M252_base: CUP_2b14_82mm_Base {
        class ace_csw: ace_csw {
            disassembleWeapon = "CUP_m252_carry";
            disassembleTurret = QEGVAR(csw,mortarBaseplate);
            allowFireOnLoad = 2;
        };
    };

    class CUP_L16A2_base: CUP_M252_base {
        class ace_csw: ace_csw {
            disassembleWeapon = "CUP_l16a2_carry";
            disassembleTurret = QEGVAR(csw,mortarBaseplate);
        };
    };

    class StaticMGWeapon;
    class CUP_M2StaticMG_base: StaticMGWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_m2";
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = "CUP_m2_carry";
            disassembleTurret = QEGVAR(csw,m3Tripod);
            desiredAmmo = 100;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class CUP_M2StaticMG_MiniTripod_base: CUP_M2StaticMG_base {
        class ace_csw: ace_csw {
            enabled = 1;
            disassembleTurret = QEGVAR(csw,m3TripodLow);
        };
    };

    class CUP_DSHKM_base: StaticMGWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_DSHKM";
            magazineLocation = "_target selectionPosition 'otocvez'";
            disassembleWeapon = "CUP_DSHKM_carry";
            disassembleTurret = QEGVAR(csw,kordTripod);
            desiredAmmo = 100;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class CUP_DSHKM_MiniTripod_base: CUP_DSHKM_base {
        class ace_csw: ace_csw {
            enabled = 1;
            disassembleTurret = "ace_csw_kordTripodLow";
        };
    };

    class CUP_KORD_Base: StaticMGWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_KORD";
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = "CUP_KORD_carry";
            disassembleTurret = QEGVAR(csw,kordTripod);
            desiredAmmo = 100;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class CUP_KORD_MiniTripod_Base: CUP_KORD_Base {
        class ace_csw: ace_csw {
            enabled = 1;
            disassembleTurret = QEGVAR(csw,kordTripodLow);
        };
    };

    class StaticGrenadeLauncher;
    class CUP_AGS_base: StaticGrenadeLauncher {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_AGS30";
            magazineLocation = "_target selectionPosition 'otochlaven'";
            disassembleWeapon = "CUP_AGS30_carry";
            disassembleTurret = QEGVAR(csw,sag30Tripod);
            desiredAmmo = 29;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class CUP_MK19_TriPod_base: StaticGrenadeLauncher {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_MK19";
            magazineLocation = "_target selectionPosition 'otochlaven'";
            disassembleWeapon = "CUP_MK19_carry";
            disassembleTurret = QEGVAR(csw,m3TripodLow);
            desiredAmmo = 48;
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
        };
    };

    class StaticATWeapon;
    class CUP_Metis_Base: StaticATWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_AT13";
            magazineLocation = "_target selectionPosition 'gun'";
            disassembleWeapon = "CUP_launch_Metis";
            disassembleTurret = "";
            desiredAmmo = 1;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class CUP_TOW_TriPod_base: StaticATWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_TOW";
            magazineLocation = "_target selectionPosition 'otochlaven'";
            disassembleWeapon = "CUP_TOW_carry";
            disassembleTurret = QEGVAR(csw,m220Tripod);
            desiredAmmo = 1;
            ammoLoadTime = 8;
            ammoUnloadTime = 5;
        };
    };

    class CUP_TOW2_TriPod_base: CUP_TOW_TriPod_base {
        class ace_csw: ace_csw {
            disassembleWeapon = "CUP_TOW2_carry";
        };
    };

    class CUP_SPG9_base: StaticATWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_SPG9";
            magazineLocation = "_target selectionPosition 'handle'";
            disassembleWeapon = "CUP_SPG9_carry";
            disassembleTurret = QEGVAR(csw,spg9Tripod);
            desiredAmmo = 1;
            ammoLoadTime = 5;
            ammoUnloadTime = 3;
        };
    };

    class StaticCannon;
    class CUP_D30_base: StaticCannon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "CUP_proxy_D30";
            magazineLocation = "_target selectionPosition 'otochlaven'";
            desiredAmmo = 1;
            ammoLoadTime = 5;
            ammoUnloadTime = 5;
        };
    };

    class CUP_D30_AT_base: CUP_D30_base {
        class ace_csw: ace_csw {
            proxyWeapon = "CUP_proxy_D30AT";
        };
    };

    class CUP_M119_base: CUP_D30_base {
        class ace_csw: ace_csw {
            proxyWeapon = "CUP_proxy_M119";
        };
    };
};

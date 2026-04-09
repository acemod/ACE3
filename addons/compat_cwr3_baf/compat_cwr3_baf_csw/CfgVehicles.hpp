class CfgVehicles {
    class StaticMGWeapon;
    class cwr3_b_uk_l7a2_low: StaticMGWeapon {
        class ace_csw {
            enabled = 1;
            proxyWeapon = "cwr3_proxy_l7a2";
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = "CUP_lmg_l7a2_flat"; //cwr3_l7a2_carry
            disassembleTurret = QEGVAR(csw,m3TripodLow);
            desiredAmmo = 200;
            ammoLoadTime = 8;
            ammoUnloadTime = 6;
        };
    };
};

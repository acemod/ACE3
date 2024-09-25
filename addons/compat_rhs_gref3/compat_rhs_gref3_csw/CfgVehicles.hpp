class CfgVehicles {
    class StaticMGWeapon;
    class rhs_DSHKM_base: StaticMGWeapon {
        class ace_csw {
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
        class ace_csw: ace_csw {
            enabled = 1;
            disassembleTurret = QEGVAR(csw,kordTripodLow);
        };
    };
};

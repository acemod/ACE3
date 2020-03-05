class CfgVehicles {
    class Rubber_duck_base_F;
    class rhsgref_canoe_base: Rubber_duck_base_F {
        // Canoes are propelled by paddlers
        EGVAR(refuel,canReceive) = 0;
    };

    class Wheeled_APC_F;
    class rhsgref_BRDM2: Wheeled_APC_F {
        GVAR(hullDetonationProb) = 0.2;
        GVAR(turretDetonationProb) = 0.2;
        GVAR(engineDetonationProb) = 0;
        GVAR(hullFireProb) = 0.7;
        GVAR(turretFireProb) = 0.7;
        GVAR(engineFireProb) = 0.7;
        GVAR(detonationDuringFireProb) = 0.5;
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
};

class LandVehicle;
class StaticWeapon: LandVehicle {
    class ACE_Actions {
        class ACE_MainActions;
    };
};
class StaticCannon: StaticWeapon {};
class StaticMGWeapon: StaticWeapon {};

// --- Gun Turrets -------------------------------------------------------------

// M2 Browning - High
class vn_static_m2_high_base: StaticMGWeapon {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            selection = "mg1_otochlaven";
        };
    };

    class ace_csw {
        enabled = 1;
        proxyWeapon = "vn_m2_v_01";
        magazineLocation = "_target selectionPosition 'mg1_magazine'";
        disassembleWeapon = QGVAR(m2_carry);
        disassembleTurret = QEGVAR(csw,m3Tripod);
        ammoLoadTime = 4;
        ammoUnloadTime = 8;
        desiredAmmo = 100;
    };
};

// M2 Browning - Low
class vn_static_m2_low_base: vn_static_m2_high_base {
    class ace_csw: ace_csw {
        disassembleTurret = QEGVAR(csw,m3TripodLow);
    };
};

// M1919A6 - No tripod
class vn_static_m1919a6_base: vn_static_m2_low_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "mg1_otochlaven_recoil";
        };
    };

    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = "vn_m1919_v_01";
        magazineLocation = "_target selectionPosition 'mg1_magazine' vectorAdd [-0.3, 0, 0]";
        disassembleWeapon = QGVAR(m1919A6_carry);
        disassembleTurret = "";
        ammoLoadTime = 2;
        ammoUnloadTime = 8;
        desiredAmmo = 250;
    };
};

// M1919A4 - High
class vn_static_m1919a4_high_base: vn_static_m1919a6_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "mg1_otochlaven_recoil";
        };
    };

    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = "vn_m1919_v_01";
        magazineLocation = "_target selectionPosition 'mg1_magazine'";
        disassembleWeapon = QGVAR(m1919A4_carry);
        disassembleTurret = QEGVAR(csw,m3Tripod);
        ammoLoadTime = 2;
        ammoUnloadTime = 8;
        desiredAmmo = 250;
    };
};

// M1919A4 - Low
class vn_static_m1919a4_low_base: vn_static_m1919a4_high_base {
    class ace_csw: ace_csw {
        disassembleTurret = QEGVAR(csw,m3TripodLow);
    };
};

// M60 - High
class vn_static_m60_high_base: vn_static_m2_low_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.15, 0.532, -1.06]";
        };
    };

    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = "vn_m60_v_01";
        magazineLocation = "_target selectionPosition 'mg1_trigger'";
        disassembleWeapon = QGVAR(m60_carry);
        disassembleTurret = QEGVAR(csw,m3Tripod);
        ammoLoadTime = 3;
        ammoUnloadTime = 8;
        desiredAmmo = 250;
    };
};

// M60 - Low
class vn_static_m60_low_base: vn_static_m60_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.25, 0.15, -1.06]";
        };
    };

    class ace_csw: ace_csw {
        magazineLocation = "_target selectionPosition 'mg1_otochlaven_recoil'";
        disassembleTurret = QEGVAR(csw,m3TripodLow);
    };
};

// TOW
class vn_static_at3_base: StaticMGWeapon {};
class vn_static_tow_base: vn_static_at3_base {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,dragPosition)[] = {0.8, 1.3, 0};

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-1.04, 0.3, -0.5]";
        };
    };

    class ace_csw {
        enabled = 1;
        proxyWeapon = "vn_missile_tow_launcher";
        magazineLocation = "_target selectionPosition 'magazine'";
        disassembleWeapon = QGVAR(tow_carry);
        disassembleTurret = QEGVAR(csw,m220Tripod);
        ammoLoadTime = 2;
        ammoUnloadTime = 5;
        desiredAmmo = 1;
    };
};

// DShKM - High
class vn_static_dp28_high_base: vn_static_m2_high_base {
    class ace_csw: ace_csw {
        enabled = 0;
    };
};
class vn_static_dshkm_high_01_base: vn_static_dp28_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.15, 0.532, -1.06]";
        };
    };

    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = "vn_dshkm_v_01";
        magazineLocation = "_target selectionPosition 'mg1_boxmag'";
        disassembleWeapon = QGVAR(dshkm_carry);
        disassembleTurret = QEGVAR(csw,kordTripod);
        ammoLoadTime = 1;
        ammoUnloadTime = 8;
        desiredAmmo = 50;
    };
};

// DShKM - High, with AA sight
class vn_static_dshkm_high_02_base: vn_static_dshkm_high_01_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(dshkm_AA_carry);
    };
};

// DShKM - Low, with shield
class vn_static_dshkm_low_01_base: vn_static_dshkm_high_01_base {
    EGVAR(dragging,canCarry) = 0;

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.3, 0.75, -1]";
        };
    };

    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(dshkm_shield_carry);
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};

// DShKM - Low
class vn_static_dshkm_low_02_base: vn_static_dshkm_low_01_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(dshkm_carry);
    };
};

// RPD - High
class vn_static_rpd_high_base: vn_static_dp28_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.158, 0.745, -0.7]";
        };
    };

    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = "vn_rpd_v_01";
        magazineLocation = "_target selectionPosition 'mg1_otochlaven_recoil'";
        disassembleWeapon = QGVAR(rpd_carry);
        disassembleTurret = QEGVAR(csw,kordTripod);
        ammoLoadTime = 10;
        ammoUnloadTime = 8;
        desiredAmmo = 100;
    };
};

// PK - High
class vn_static_pk_high_base: vn_static_rpd_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.156, 0.755, -1.05]";
        };
    };

    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = "vn_pk_v_01";
        magazineLocation = "_target selectionPosition 'mg1_otochlaven_recoil'";
        disassembleWeapon = QGVAR(pk_carry);
        disassembleTurret = QEGVAR(csw,kordTripod);
        ammoLoadTime = 2;
        ammoUnloadTime = 8;
        desiredAmmo = 100;
    };
};

// PK - Low
class vn_static_pk_low_base: vn_static_pk_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.35, 0.43, -0.9]";
        };
    };

    class ace_csw: ace_csw {
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};

// MG42 - High
class vn_static_mg42_high_base: vn_static_rpd_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.18, 0.5, -0.3]";
        };
    };

    class ace_csw {
        enabled = 1;
        proxyWeapon = "vn_mg42_v_01";
        magazineLocation = "_target selectionPosition 'mg1_otochlaven_recoil'";
        disassembleWeapon = QGVAR(mg42_carry);
        disassembleTurret = QEGVAR(csw,kordTripod);
        ammoLoadTime = 2;
        ammoUnloadTime = 8;
        desiredAmmo = 250;
    };
};

class vn_static_mg42_low_base: vn_static_mg42_high_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[-0.1, 0.3, -0.9]";
        };
    };

    class ace_csw: ace_csw {
        disassembleTurret = "";
    };
};

// SGM - High
class vn_static_sgm_base: StaticMGWeapon {
    class ACE_Actions: ACE_Actions {};
};
class vn_static_sgm_high_base: vn_static_sgm_base {
    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            selection = "mg1_otocvez";
        };
    };

    class ace_csw {
        enabled = 1;
        proxyWeapon = "vn_sgm_v_01";
        magazineLocation = "_target selectionPosition 'mg1_otochlaven_recoil'";
        disassembleWeapon = QGVAR(sgm_carry);
        disassembleTurret = QEGVAR(csw,kordTripod);
        ammoLoadTime = 2;
        ammoUnloadTime = 8;
        desiredAmmo = 250;
    };
};

// SGM - Low
class vn_static_sgm_low_base: vn_static_sgm_high_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(sgm_carry);
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};

// SGM - Shield
class vn_o_pl_static_sgm_low_01: vn_static_sgm_low_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(sgm_shield_carry);
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};
class vn_o_nva_65_static_sgm_low_01: vn_static_sgm_low_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(sgm_shield_carry);
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};
class vn_o_nva_static_sgm_low_01: vn_static_sgm_low_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(sgm_shield_carry);
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};
class vn_o_nva_navy_static_sgm_low_01: vn_static_sgm_low_base {
    class ace_csw: ace_csw {
        disassembleWeapon = QGVAR(sgm_shield_carry);
        disassembleTurret = QEGVAR(csw,kordTripodLow);
    };
};

// Mk18 Grenade laucher
class vn_static_mk18_base: StaticCannon {
    EGVAR(dragging,canCarry) = 1;
    EGVAR(dragging,canDrag) = 1;

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            selection = "mg1_otochlaven";
        };
    };

    class ace_csw {
        enabled = 1;
        proxyWeapon = "vn_mk18_v_01";
        magazineLocation = "_target selectionPosition 'mg1_magazine'";
        disassembleWeapon = QGVAR(mk18_carry);
        disassembleTurret = QEGVAR(csw,m3TripodLow);
        ammoLoadTime = 1;
        ammoUnloadTime = 8;
        desiredAmmo = 24;
    };
};

// --- Mortars -----------------------------------------------------------------

// M29 Mortar
class StaticMortar: StaticWeapon {};
class Mortar_01_base_F: StaticMortar {};
class vn_static_mortar_m29_base: Mortar_01_base_F {
    EGVAR(dragging,canCarry) = 0;

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "otochlaven";
        };
    };

    class ace_csw {
        enabled = 1;
        proxyWeapon = QGVAR(vn_mortar_m29);
        magazineLocation = "_target selectionPosition 'pohon'";
        disassembleWeapon = QGVAR(mortar_m29_carry);
        disassembleTurret = QEGVAR(csw,mortarBaseplate);
        ammoLoadTime = 3;
        ammoUnloadTime = 3;
        desiredAmmo = 1;
        allowFireOnLoad = 2;
    };
};

// M2 / Type 63 Mortar
class vn_static_mortar_m2_base: vn_static_mortar_m29_base {
    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = QGVAR(vn_mortar_m2);
        magazineLocation = "_target selectionPosition 'pohon'";
        disassembleWeapon = QGVAR(mortar_m2_carry);
        disassembleTurret = QEGVAR(csw,mortarBaseplate);
        ammoLoadTime = 3;
        ammoUnloadTime = 3;
        desiredAmmo = 1;
        allowFireOnLoad = 2;
    };
};

// Type 53 Mortar
class vn_static_mortar_type53_base: vn_static_mortar_m29_base {
    class ace_csw: ace_csw {
        enabled = 1;
        proxyWeapon = QGVAR(vn_mortar_type53);
        magazineLocation = "_target selectionPosition 'pohon'";
        disassembleWeapon = QGVAR(mortar_type53_carry);
        disassembleTurret = QEGVAR(csw,mortarBaseplate);
        ammoLoadTime = 3;
        ammoUnloadTime = 3;
        desiredAmmo = 1;
        allowFireOnLoad = 2;
    };
};

// H-12 MLRS
class vn_static_h12_base: Mortar_01_base_F {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,canDrag) = 1;
    EGVAR(dragging,dragPosition)[] = {0.4, 2.1, 0};
    EGVAR(overpressure,noReflection) = 1;

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            selection = "damagegun";
        };
    };

    class ace_csw {
        enabled = 0;
    };
};

// --- Non-CSW Static Weapons --------------------------------------------------

class vn_static_m45_base: vn_static_m2_high_base {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,canDrag) = 0;

    class ace_csw: ace_csw {
        enabled = 0;
    };
};

class vn_static_zpu4_base: vn_static_m2_high_base {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,canDrag) = 0;

    class ace_csw: ace_csw {
        enabled = 0;
    };
};

class vn_o_static_rsna75: StaticMGWeapon {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,canDrag) = 0;

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "";
            selection = "mainturret";
        };
    };

    class ace_csw {
        enabled = 0;
    };
};

class vn_sa2: StaticMGWeapon {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,canDrag) = 0;
};

class vn_static_m40a1rr_base: StaticCannon {
    EGVAR(dragging,canDrag) = 1;
    EGVAR(dragging,dragPosition)[] = {-0.3, 1.9, 0};

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            selection = "mg1_otochlaven";
        };
    };
};

class vn_static_type56rr_base: StaticCannon {
    EGVAR(dragging,canDrag) = 1;
    EGVAR(dragging,dragPosition)[] = {-0.1, 0.5, 0};

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            selection = "mg1_otocvez";
        };
    };
};

// --- Spiderholes -------------------------------------------------------------

class vn_o_vc_spiderhole_01: StaticWeapon {
    EGVAR(dragging,canCarry) = 0;
    EGVAR(dragging,canDrag) = 0;

    EGVAR(cargo,canLoad) = 0;
};

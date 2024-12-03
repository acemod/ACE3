#include "\z\ace\addons\csw\script_config_macros_csw.hpp"

CREATE_CSW_PROXY(vn_mortar_m29);
CREATE_CSW_PROXY(vn_mortar_m2);
CREATE_CSW_PROXY(vn_mortar_type53);

class Launcher;
class Launcher_Base_F: Launcher {
    class WeaponSlotsInfo;
};

// --- Gun Turrets -------------------------------------------------------------

class GVAR(m2_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = ECSTRING(csw,m2_gun);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_m2b_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,m3Tripod) = "vn_b_army_static_m2_high";
            EGVAR(csw,m3TripodLow) = "vn_b_army_static_m2_low";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 840;
    };
};

class GVAR(m1919a4_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_m1919a4);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_m1919a4_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,m3Tripod) = "vn_b_army_static_m1919a4_high";
            EGVAR(csw,m3TripodLow) = "vn_b_sf_static_m1919a4_low";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 310;
    };
};

class GVAR(m1919a6_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_m1919a6);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_m1919a6_ca.paa);

    class ace_csw {
        type = "mount";
        deployTime = 2;
        pickupTime = 2;
        deploy = "vn_b_army_static_m1919a6";
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 320;
    };
};

class GVAR(m60_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_m60);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_m60_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,m3Tripod) = "vn_b_army_static_m60_high";
            EGVAR(csw,m3TripodLow) = "vn_b_army_static_m60_low";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 232;
    };
};

class GVAR(tow_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = ECSTRING(csw,tow_tube);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_tow_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,m220Tripod) = "vn_b_army_static_tow";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 500;
    };
};

class GVAR(dshkm_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = ECSTRING(csw,dshk_gun);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_dshkm_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripod) = "vn_o_nva_static_dshkm_high_01";
            EGVAR(csw,kordTripodLow) = "vn_o_nva_static_dshkm_low_02";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 750;
    };
};

class GVAR(dshkm_shield_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_dshkm_shield);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_dshkm_shield_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripodLow) = "vn_o_nva_static_dshkm_low_01";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 850;
    };
};

class GVAR(dshkm_AA_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_dshkm_aa);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_dshkm_aa_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripod) = "vn_o_nva_static_dshkm_high_02";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 750;
    };
};

class GVAR(rpd_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_rpd);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_rpd_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripod) = "vn_o_nva_static_rpd_high";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 163;
    };
};

class GVAR(pk_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_pk);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_pk_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripod) = "vn_o_nva_static_pk_high";
            EGVAR(csw,kordTripodLow) = "vn_o_nva_static_pk_low";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 198;
    };
};

class GVAR(mortar_m29_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_m29);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_m29_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 20;
        pickupTime = 25;

        class assembleTo {
            EGVAR(csw,mortarBaseplate) = "vn_b_army_static_mortar_m29";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 730;
    };
};

class GVAR(mg42_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_mg42);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_mg42_ca.paa);

    class ace_csw {
        type = "mount";
        deployTime = 4;
        pickupTime = 4;
        deploy = "vn_o_vc_static_mg42_low";

        class assembleTo {
            EGVAR(csw,kordTripod) = "vn_o_vc_static_mg42_high";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 310;
    };
};

class GVAR(sgm_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_sgm);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_sgm_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripod) = "vn_o_vc_static_sgm_high_01";
            EGVAR(csw,kordTripodLow) = "vn_o_vc_static_sgm_low_02";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 310;
    };
};
class GVAR(sgm_shield_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_sgm_shield);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_sgm_shield_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,kordTripodLow) = "vn_o_vc_static_sgm_low_01";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 310;
    };
};

class GVAR(mk18_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_mk18);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_mk18_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 4;
        pickupTime = 4;

        class assembleTo {
            EGVAR(csw,m3TripodLow) = "vn_b_army_static_mk18";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 310;
    };
};

// --- Mortars -----------------------------------------------------------------

class GVAR(mortar_m2_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_m2);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_m2_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 20;
        pickupTime = 25;

        class assembleTo {
            EGVAR(csw,mortarBaseplate) = "vn_b_army_static_mortar_m2";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 300;
    };
};

class GVAR(mortar_type53_carry): Launcher_Base_F {
    dlc = "ace";
    displayName = CSTRING(csw_type53);
    author = ECSTRING(common,ACETeam);
    scope = 2;
    model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
    modes[] = {};
    picture = QPATHTOF(UI\csw_type53_ca.paa);

    class ace_csw {
        type = "weapon";
        deployTime = 20;
        pickupTime = 25;

        class assembleTo {
            EGVAR(csw,mortarBaseplate) = "vn_o_nva_static_mortar_type53";
        };
    };

    class WeaponSlotsInfo: WeaponSlotsInfo {
        class MuzzleSlot {
            iconScale = 0.1;
        };
        mass = 860;
    };
};

class CfgWeapons {

    // ACE Ballistics
    class rhs_weap_kar98k_Base_F;
    class rhs_weap_kar98k: rhs_weap_kar98k_Base_F {
        ACE_barrelTwist = 240;
        ACE_barrelLength = 600;
    };

    class rhs_weap_m38_Base_F;
    class rhs_weap_m38: rhs_weap_m38_Base_F {
        ACE_barrelTwist = 250;
        ACE_barrelLength = 315;
    };

    class rhs_weap_m38_rail;
    class rhs_weap_mosin_sbr: rhs_weap_m38_rail {
        ACE_barrelTwist = 240;
        ACE_barrelLength = 254;
    };

    class rhs_weap_m70_base;
    class rhs_weap_m70ab2: rhs_weap_m70_base {
        ACE_barrelTwist = 240;
        ACE_barrelLength = 415;
    };

    class rhs_weap_m92: rhs_weap_m70_base {
        ACE_barrelTwist = 240;
        ACE_barrelLength = 254;
    };

    class rhs_weap_m76: rhs_weap_m70_base {
        ACE_barrelTwist = 250;
        ACE_barrelLength = 200;
    };

    class rhs_weap_m21_base: rhs_weap_m70_base {
        ACE_barrelLength = 460;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_m21s: rhs_weap_m21_base {
        ACE_barrelLength = 375;
    };

    class rhs_weap_m21a_pr;
    class rhs_weap_m21s_pr: rhs_weap_m21a_pr {
        ACE_barrelLength = 375;
    };

    class Rifle_Base_F;
    class rhs_weap_savz58_base: Rifle_Base_F {
        ACE_barrelTwist = 240;
        ACE_barrelLength = 390;
    };

    class rhs_weap_stgw57_base;
    class rhs_weap_stgw57: rhs_weap_stgw57_base {
        ACE_barrelTwist = 270;
        ACE_barrelLength = 583;
    };

    class rhs_weap_vhs2_base;
    class rhs_weap_vhsd2: rhs_weap_vhs2_base {
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 500.0;
    };

    class rhs_weap_vhsk2: rhs_weap_vhsd2 {
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 410.0;
    };
    class rhs_weap_vhsd2_ct15x: rhs_weap_vhs2_base {
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 500.0;
    };
    class rhs_weap_vhsd2_bg: rhs_weap_vhs2_base {
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 500.0;
    };

    class rhs_weap_fnfal_base;
    class rhs_weap_l1a1_base: rhs_weap_fnfal_base {
        ACE_barrelTwist = 302.26;
        ACE_barrelLength = 554.4;
    };

    class rhs_weap_mg42_base: Rifle_Base_F {
        ACE_Overheating_allowSwapBarrel = 1;
        ACE_barrelTwist = 305.0;
        ACE_barrelLength = 530.0;
    };

    class rhs_weap_MP44_base: Rifle_Base_F {
        ACE_barrelTwist = 240.0;
        ACE_barrelLength = 420.0;
    };

    class rhs_weap_m3a1_base: Rifle_Base_F {
        ACE_barrelTwist = 406.0;
        ACE_barrelLength = 203.2;
    };

    class rhs_weap_M1garand_Base_F: Rifle_Base_F {
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 610.0;
    };

    class rhs_weap_Izh18 : Rifle_Base_F {
        ace_overheating_jamTypesAllowed = ["Fire","Dud"];
    };

    class rhs_weap_m79 : Rifle_Base_F {
        ace_overheating_jamTypesAllowed = ["Fire","Dud"];
    };

    CREATE_CSW_PROXY(rhs_weap_DSHKM);

    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };
    class GVAR(dshkm_carry): Launcher_Base_F {
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,kordTripod) = "rhsgref_ins_DSHKM";
                EGVAR(csw,kordTripodLow) = "rhsgref_ins_DSHKM_Mini_TriPod";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            // One WeaponSlot with a positive value for iconScale forces game to use icon overlay method.
            // Required, because the inventory icon has no accessory variants.
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 740;
        };
        displayName = ECSTRING(csw,dshk_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\mapico\icomap_DShKM_CA.paa";
    };
};

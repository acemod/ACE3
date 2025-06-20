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
        EGVAR(overheating,closedBolt) = 0;
        EGVAR(overheating,allowSwapBarrel) = 1;
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

    class rhs_weap_Izh18: Rifle_Base_F {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };

    class rhs_weap_m79: Rifle_Base_F {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };

    class Launcher_Base_F;

    class rhs_weap_panzerfaust60: Launcher_Base_F {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 30;
        EGVAR(overpressure,damage) = 0.4;
    };

    class rhs_weap_rpg75: Launcher_Base_F {
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,offset) = 0.9;
    };
};

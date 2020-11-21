class CfgWeapons {

    // ACE Ballistics
    class rhs_weap_g36_base;
    class rhs_weap_g36c: rhs_weap_g36_base {
        ACE_barrelLength = 228;
        ACE_barrelTwist = 178;
    };

    class rhs_weap_g36kv: rhs_weap_g36_base {
        ACE_barrelLength = 318;
        ACE_barrelTwist = 178;
    };

    class rhs_weap_m21_base;
    class rhs_weap_m21a: rhs_weap_m21_base {
        ACE_barrelLength = 460;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_m21a_pr: rhs_weap_m21_base {
        ACE_barrelLength = 460;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_m21a_pr_pbg40: rhs_weap_m21_base {
        ACE_barrelLength = 460;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_m21s: rhs_weap_m21_base {
        ACE_barrelLength = 375;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_m21s_pr: rhs_weap_m21a_pr {
        ACE_barrelLength = 375;
        ACE_barrelTwist = 177.8;
    };

    class Rifle_Base_F;
    class rhs_weap_m70_base: Rifle_Base_F {
        ACE_barrelLength = 415;
        ACE_barrelTwist = 240;
    };

    class rhs_weap_m92: rhs_weap_m70_base {
        ACE_barrelLength = 254;
    };

    class rhs_weap_m76: rhs_weap_m70_base {
        ACE_barrelLength = 550;
    };

    class Rifle_Long_Base_F;
    class rhs_weap_m84: Rifle_Long_Base_F {
        ACE_barrelLength = 658;
        ACE_barrelTwist = 240;
        ACE_Overheating_allowSwapBarrel = 1;
    };

    class hgun_P07_F;
    class rhs_weap_cz99: hgun_P07_F {
        ACE_barrelLength = 108;
    };
};

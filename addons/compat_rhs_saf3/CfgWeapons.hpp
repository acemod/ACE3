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
        EGVAR(overheating,allowSwapBarrel) = 1;
    };

    class hgun_P07_F;
    class rhs_weap_cz99: hgun_P07_F {
        ACE_barrelLength = 108;
    };

    class Uniform_Base;
    class rhssaf_uniform_mig29_pilot: Uniform_Base {
        ACE_GForceCoef = 0.8;
        ace_fire_protection = 0.5;
    };
    class rhssaf_uniform_heli_pilot: Uniform_Base {
        ACE_GForceCoef = 0.8;
        ace_fire_protection = 0.5;
    };

    // Launchers
    class Launcher_Base_F;
    class rhs_weap_m80: Launcher_Base_F {
        EGVAR(overpressure,range) = 8;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.7;
        EGVAR(overpressure,offset) = 1.15;
    };
};

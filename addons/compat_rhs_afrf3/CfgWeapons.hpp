class CfgWeapons {
    class hgun_Rook40_F;
    class rhs_weap_pya: hgun_Rook40_F {
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 111.76;
    };
    class rhs_weap_makarov_pm: rhs_weap_pya {
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 93.472;
    };
    class rhs_weap_ak74m_Base_F;
    class rhs_weap_ak74m: rhs_weap_ak74m_Base_F {
        ACE_RailHeightAboveBore = -0.456233;
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };
    class rhs_weap_ak103_base;
    class rhs_weap_ak104: rhs_weap_ak103_base {
        ACE_barrelLength = 314.96;
    };
    class rhs_weap_ak105: rhs_weap_ak74m {
        ACE_barrelLength = 314.96;
    };
    class rhs_weap_akm: rhs_weap_ak74m {
        ACE_RailHeightAboveBore = -0.456233;//from rhs_weap_akmn and rhs_weap_ak74m
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };
    class rhs_weap_aks74;
    class rhs_weap_aks74u: rhs_weap_aks74 {
        ACE_RailHeightAboveBore = -0.30262;
        ACE_barrelTwist = 160.02;
        ACE_barrelLength = 210.82;
    };
    class rhs_weap_asval: rhs_weap_ak74m {
        ACE_barrelTwist = 210.82;
        ACE_barrelLength = 200.66;
    };
    class rhs_weap_svd: rhs_weap_ak74m {
        ACE_RailHeightAboveBore = -0.617396;
        ACE_barrelTwist = 238.76;
        ACE_barrelLength = 619.76;
    };
    class rhs_weap_svdp;
    class rhs_weap_svdp_npz: rhs_weap_svdp {
        ACE_RailHeightAboveBore = 4.3348;
    };
    class rhs_weap_svdp_wd: rhs_weap_svdp {
        ACE_RailHeightAboveBore = -0.617396;
    };
    class rhs_weap_svdp_wd_npz: rhs_weap_svdp_wd {
        ACE_RailHeightAboveBore = 4.3348;
    };
    class rhs_weap_svds: rhs_weap_svdp {
        ACE_RailHeightAboveBore = -0.617396;
        ACE_barrelTwist = 238.76;
        ACE_barrelLength = 563.88;
    };
    class rhs_weap_svds_npz: rhs_weap_svds {
        ACE_RailHeightAboveBore = 4.3348;
    };
    class rhs_weap_rpk_base;
    class rhs_weap_rpk74_base: rhs_weap_rpk_base {
        ACE_barrelLength = 590.00;
        ACE_barrelTwist = 195.072;
    };
    class rhs_pkp_base;
    class rhs_weap_pkp: rhs_pkp_base {
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 657.86;
    };
    class rhs_weap_pkm: rhs_weap_pkp {
        EGVAR(overheating,allowSwapBarrel) = 1;
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 645.16;
    };
    class rhs_weap_orsis_Base_F;
    class rhs_weap_t5000: rhs_weap_orsis_Base_F { // http://en.orsis.com/production/catalog/19046/
        ACE_barrelTwist = 254.0; // 1:10"
        ACE_barrelLength = 698.5; // 27.5"
        ACE_RailHeightAboveBore = 2.12198;
    };

    class Launcher_Base_F;
    class rhs_weap_rpg7: Launcher_Base_F {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,offset) = 0.9;
    };
    class rhs_weap_rpg26: Launcher_Base_F {
        EGVAR(overpressure,range) = 10;
        EGVAR(overpressure,angle) = 50;
        EGVAR(overpressure,offset) = 0.65;
    };
    class rhs_weap_rpg18: rhs_weap_rpg26 {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,offset) = 1;
    };
    class rhs_weap_strela;
    class rhs_weap_igla: rhs_weap_strela {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.65;
    };
    class missiles_titan_static;
    class rhs_Igla_AA_pod_Base: missiles_titan_static { // Soft-launched Igla missile
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.8;
    };
    class RocketPods;
    class rhs_weap_SPG9: RocketPods {
        EGVAR(overpressure,offset) = 1.2;
    };
    class rhs_weap_grad;
    class rhs_weap_bm21: rhs_weap_grad {
        EGVAR(overpressure,offset) = 0;
    };
    class rhs_weap_d81;
    class rhs_weap_2a70: rhs_weap_d81 { // "Low pressure" 100mm cannon
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,damage) = 0.5;
    };
    class cannon_120mm;
    class rhs_weap_2a28_base: cannon_120mm { // "Low pressure"
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,damage) = 0.5;
    };
    class mortar_82mm;
    class rhs_weap_2b14: mortar_82mm {
        EGVAR(overpressure,offset) = 0.4;
    };

    class rhs_zsh7a;
    class rhs_zsh7a_alt: rhs_zsh7a {
        ACE_Protection = 1;
    };
    class rhs_zsh7a_mike;
    class rhs_zsh7a_mike_alt: rhs_zsh7a_mike {
        ACE_Protection = 1;
    };
    class rhs_zsh7a_mike_green;
    class rhs_zsh7a_mike_green_alt: rhs_zsh7a_mike_green {
        ACE_Protection = 1;
    };

    class rhs_uniform_flora;
    class rhs_uniform_df15: rhs_uniform_flora {
        ACE_GForceCoef = 0.8;
        ace_fire_protection = 0.5;
    };
    //rhs_uniform_df15_tan inherits from rhs_uniform_df15
};

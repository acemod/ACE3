class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class rhs_weap_m14ebrri_base;
    class GM6_base_F;
    class rhs_weap_M107_Base_F: GM6_base_F {
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        ACE_RailHeightAboveBore = 4.18639;
    };
    class rhs_weap_XM2010_Base_F: Rifle_Base_F {
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 609.6;
        EGVAR(overheating,dispersion) = 0.75;
        ACE_RailHeightAboveBore = 3.1028;
    };
    class rhs_weap_m24sws: rhs_weap_XM2010_Base_F {
        ACE_barrelTwist = 285.75;
        ACE_barrelLength = 609.6;
        ACE_RailHeightAboveBore = 2.41891;
    };
    class rhs_weap_m40a5: rhs_weap_XM2010_Base_F {
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 635.0; // 25"
        ACE_RailHeightAboveBore = 2.46368;
    };
    class arifle_MX_Base_F;
    class rhs_weap_m4_Base: arifle_MX_Base_F {
        ACE_RailHeightAboveBore = 2.56518;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.3;
    };
    class rhs_weap_m4a1;
    class rhs_weap_hk416d10: rhs_weap_m4a1 {
        ACE_RailHeightAboveBore = 3.56139;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 254;
    };
    class rhs_weap_hk416d145: rhs_weap_hk416d10 {
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.3;
    };
    class rhs_weap_m27iar: rhs_weap_m4a1 {
        ACE_RailHeightAboveBore = 3.56139;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 419.1;
    };
    class rhs_weap_m4a1_blockII;
    class rhs_weap_mk18: rhs_weap_m4a1_blockII {
        ACE_RailHeightAboveBore = 2.6068;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 261.62;
    };
    class rhs_weap_m16a4: rhs_weap_m4_Base {
        ACE_RailHeightAboveBore = 2.59324;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 508.0;
    };
    class rhs_weap_saw_base: Rifle_Base_F { // Base class for all Minimi
        EGVAR(overheating,allowSwapBarrel) = 1;
        EGVAR(overheating,closedBolt) = 0;
    };
    class rhs_weap_lmg_minimi_railed;
    class rhs_weap_m249_pip_S: rhs_weap_lmg_minimi_railed {
        ACE_RailHeightAboveBore = 4.11044;
        ACE_barrelLength = 348;
        ACE_barrelTwist = 177.8;
    };
    class rhs_weap_m249_pip_L: rhs_weap_lmg_minimi_railed {
        ACE_RailHeightAboveBore = 4.34899;
        ACE_barrelLength = 464.8;
        ACE_barrelTwist = 177.8;
    };
    class rhs_weap_m249: rhs_weap_lmg_minimi_railed {
        ACE_barrelLength = 464.8;
        ACE_barrelTwist = 177.8;
    };
    class rhs_weap_m249_pip: rhs_weap_lmg_minimi_railed {
        ACE_barrelLength = 464.8;
        ACE_barrelTwist = 177.8;
    };
    class rhs_weap_M249_base;
    class rhs_weap_m240_base: rhs_weap_M249_base {
        ACE_RailHeightAboveBore = 4.3987;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 629.92;
    };
    class rhs_weap_m14_base;
    class rhs_weap_m14: rhs_weap_m14_base {
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 558.8;
        EGVAR(overheating,dispersion) = 0.75;
    };
    class rhs_weap_m14ebrri: rhs_weap_m14ebrri_base {
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 558.8;
        EGVAR(overheating,dispersion) = 0.75;
        ACE_RailHeightAboveBore = 3.08341;
    };
    class rhs_weap_m14_socom_base: rhs_weap_m14_base {
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 413; //16.25 in (413 mm)
        EGVAR(overheating,dispersion) = 0.75;
    };
    class rhs_weap_sr25: rhs_weap_m14ebrri {
        ACE_barrelTwist = 285.75;
        ACE_barrelLength = 609.6;
        ACE_RailHeightAboveBore = 3.13162;
    };
    class rhs_weap_sr25_ec: rhs_weap_sr25 {
        ACE_barrelLength = 508.0;
        ACE_RailHeightAboveBore = 3.13689;
    };
    class rhs_weap_sr25_d;
    class rhs_weap_sr25_ec_d: rhs_weap_sr25_d {
        ACE_barrelLength = 508.0;
        ACE_RailHeightAboveBore = 3.13689;
    };
    class rhs_weap_sr25_wd;
    class rhs_weap_sr25_ec_wd: rhs_weap_sr25_wd {
        ACE_barrelLength = 508.0;
        ACE_RailHeightAboveBore = 3.13689;
    };
    class rhs_weap_SCAR_H_Base;
    class rhs_weap_SCAR_H_CQC_Base: rhs_weap_SCAR_H_Base {
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 330.0;
    };
    class rhs_weap_SCAR_H_LB_Base: rhs_weap_SCAR_H_Base {
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 508.0;
    };
    class rhs_weap_SCAR_H_STD_Base: rhs_weap_SCAR_H_Base {
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 406.0;
    };
    class rhs_weap_M590_5RD: Rifle_Base_F {
        ACE_barrelTwist = 0.0;
        ACE_twistDirection = 0;
        ACE_barrelLength = 469.9;
    };
    class rhs_weap_M590_8RD: rhs_weap_M590_5RD {
        ACE_barrelTwist = 0.0;
        ACE_twistDirection = 0;
        ACE_barrelLength = 508.0;
    };
    class rhs_weap_m32_Base_F: Rifle_Base_F {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };
    class SMG_02_base_F;
    class rhsusf_weap_MP7A1_base_f: SMG_02_base_F {
        ACE_barrelLength = 180;
        ACE_barrelTwist = 160;
        ACE_IronSightBaseAngle = -0.286479; // 5 mRad POA = POI at the default discreteDistance 100 m, SMG_02_base_F default value 0.434847
        ACE_RailBaseAngle = 0; // SMG_02_base_F default value 0.0217724
        ACE_RailHeightAboveBore = 5;
    };
    // RHS pistols
    class hgun_ACPC2_F;
    class rhsusf_weap_m1911a1: hgun_ACPC2_F {
        ACE_barrelTwist = 406.4;
        ACE_barrelLength = 127.0;
    };
    class hgun_P07_F;
    class rhsusf_weap_glock17g4: hgun_P07_F {
        ACE_barrelTwist = 248.92;
        ACE_barrelLength = 114.046;
    };
    class rhsusf_weap_m9: rhsusf_weap_glock17g4 {
        ACE_barrelTwist = 248.92;
        ACE_barrelLength = 124.46;
    };
    class rhs_weap_M320_Base_F: Pistol_Base_F {
        EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
    };

    // RHS launchers
    class Launcher_Base_F;

    class rhs_weap_smaw: Launcher_Base_F {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,offset) = 1.3;
    };

    class rhs_weap_maaws: Launcher_Base_F {
        EGVAR(reloadlaunchers,enabled) = 1;
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,angle) = 70;
        EGVAR(overpressure,damage) = 0.75;
        EGVAR(overpressure,offset) = 0.95;
    };

    class rhs_weap_M136: Launcher_Base_F {
        EGVAR(overpressure,range) = 10;
        EGVAR(overpressure,angle) = 50;
        EGVAR(overpressure,offset) = 0.9;
    };

    class launch_O_Titan_F;
    class rhs_weap_fim92: launch_O_Titan_F {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.45;
    };

    class rhs_weap_stinger_Launcher;
    class rhs_weap_stinger_Launcher_static: rhs_weap_stinger_Launcher {
        EGVAR(overpressure,range) = 6;
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,damage) = 0.6;
        EGVAR(overpressure,offset) = 1.2;
    };

    class missiles_titan;
    class Rhs_weap_TOW_Launcher_static: missiles_titan {
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,range) = 4;
        EGVAR(overpressure,damage) = 0.7;
        EGVAR(overpressure,offset) = 0.8;
    };

    class rockets_230mm_GAT;
    class rhs_weap_mlrs: rockets_230mm_GAT {
        EGVAR(overpressure,offset) = 3.8;
    };

    class mortar_82mm;
    class rhs_mortar_81mm: mortar_82mm {
        EGVAR(overpressure,offset) = 0.2;
    };

    class rhsusf_hgu56p;
    class rhsusf_hgu56p_visor: rhsusf_hgu56p {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_black;
    class rhsusf_hgu56p_visor_black: rhsusf_hgu56p_black {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_green;
    class rhsusf_hgu56p_visor_green: rhsusf_hgu56p_green {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_visor_mask: rhsusf_hgu56p {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_visor_mask_black: rhsusf_hgu56p_black {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_visor_mask_Empire_black: rhsusf_hgu56p_black {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_visor_mask_green: rhsusf_hgu56p_green {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_mask_smiley;
    class rhsusf_hgu56p_visor_mask_smiley: rhsusf_hgu56p_mask_smiley {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_pink;
    class rhsusf_hgu56p_visor_mask_pink: rhsusf_hgu56p_pink {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_visor_pink: rhsusf_hgu56p_pink {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_saf;
    class rhsusf_hgu56p_visor_saf: rhsusf_hgu56p_saf {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_usa;
    class rhsusf_hgu56p_visor_usa: rhsusf_hgu56p_usa {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_white;
    class rhsusf_hgu56p_visor_white: rhsusf_hgu56p_white {
        ACE_Protection = 1;
    };
    class rhsusf_hgu56p_visor_mask_black_skull;
    class rhsusf_hgu56p_mask_black_skull: rhsusf_hgu56p_visor_mask_black_skull {
        ACE_Protection = 0;
    };

    class H_HelmetB;
    class RHS_jetpilot_usaf: H_HelmetB {
        ACE_Protection = 1;
    };

    //Fire Protection
    class rhs_uniform_cu_ocp;
    class rhs_uniform_FROG01_d: rhs_uniform_cu_ocp {
        ace_fire_protection = 0.2;
    };
    //rhs_uniform_FROG01_wd inherits from rhs_uniform_FROG01_d
};

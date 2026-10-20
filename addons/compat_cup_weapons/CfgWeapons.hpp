class CfgWeapons {
    class Launcher_Base_F;
    class Pistol_Base_F;
    class Rifle_Base_F;
    class Rifle_Short_Base_F;
    class Rifle_Long_Base_F;

    class CUP_arifle_ACR_BASE_556: Rifle_Base_F {
        ace_barrelLength = 368.3;
        ace_barrelTwist = 228.6;
        ace_RailHeightAboveBore = 4.05666;
    };

    class CUP_arifle_ACR_Short_BASE_556: CUP_arifle_ACR_BASE_556 {
        ace_barrelLength = 266.7;
    };

    class CUP_arifle_ACR_DMR_BASE_556: CUP_arifle_ACR_BASE_556 {
        ace_barrelLength = 469.9;
    };

    class CUP_arifle_ACR_EGLM_BASE_556: CUP_arifle_ACR_BASE_556 {
        ace_barrelLength = 368.3;
    };

    class CUP_arifle_ACR_BASE_68: Rifle_Base_F {
        ace_barrelLength = 368.3;
        ace_barrelTwist = 279.4;
        ace_RailHeightAboveBore = 4.05666;
    };

    class CUP_arifle_ACR_Short_BASE_68: CUP_arifle_ACR_BASE_68 {
        ace_barrelLength = 266.7;
    };

    class CUP_arifle_ACR_DMR_BASE_68: CUP_arifle_ACR_BASE_68 {
        ace_barrelLength = 469.9;
    };

    class CUP_arifle_ACR_EGLM_BASE_68: CUP_arifle_ACR_BASE_68 {
        ace_barrelLength = 368.3;
    };

    class CUP_arifle_AK_Base: Rifle_Base_F {
        ace_barrelLength = 415;
        ace_barrelTwist = 240;
    };
    class CUP_arifle_AKM: CUP_arifle_AK_Base {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKM_GL: CUP_arifle_AKM {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKM_top_rail: CUP_arifle_AKM {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKM_GL_top_rail: CUP_arifle_AKM_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKMN_railed: CUP_arifle_AKM {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKMN_railed_afg: CUP_arifle_AKM {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKMS: CUP_arifle_AKM {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKMS_top_rail: CUP_arifle_AKMS {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKMS_GL: CUP_arifle_AKM_GL {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKMS_GL_top_rail: CUP_arifle_AKMS_GL {
        ace_RailHeightAboveBore = 4.94803;
    };

    class CUP_arifle_AKS_Base: CUP_arifle_AK_Base {
        ace_barrelTwist = 199.898;
    };
    class CUP_arifle_AKS74U: CUP_arifle_AKS_Base {
        ace_barrelLength = 210.82;
        ace_barrelTwist = 160.02;
        ace_RailHeightAboveBore = -0.34859;
    };
    class CUP_arifle_AKS74U_top_rail: CUP_arifle_AKS74U {
        ace_RailHeightAboveBore = 4.69842;
    };
    class CUP_arifle_AKS74U_railed: CUP_arifle_AKS74U {
        ace_RailHeightAboveBore = 3.56851;
    };
    class CUP_arifle_AK47: CUP_arifle_AK_Base {
        ace_overheating_dispersion = 1.5;
        ace_overheating_mrbs = 1000;
        ace_overheating_slowdownFactor = 1.5;
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK47_GL: CUP_arifle_AK47 {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK47_top_rail: CUP_arifle_AK47 {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK47_GL_top_rail: CUP_arifle_AK47_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKS: CUP_arifle_AKM {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKS_Gold: CUP_arifle_AKS {
        ace_RailHeightAboveBore = -0.757819;
    };
    class CUP_arifle_AKS_top_rail: CUP_arifle_AKS {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74: CUP_arifle_AK_Base {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_overheating_dispersion = 1.0;
        ace_overheating_mrbs = 3000;
        ace_overheating_slowdownFactor = 1.0;
        ace_RailHeightAboveBore = -0.199182;
    };
    class CUP_arifle_AK74_GL: CUP_arifle_AK_Base {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_overheating_dispersion = 1.0;
        ace_overheating_mrbs = 3000;
        ace_overheating_slowdownFactor = 1.0;
        ace_RailHeightAboveBore = -0.199182;
    };
    class CUP_arifle_AK74_top_rail: CUP_arifle_AK74 {
        ace_RailHeightAboveBore = 4.84783;
    };
    class CUP_arifle_AK74_GL_top_rail: CUP_arifle_AK74_GL {
        ace_RailHeightAboveBore = 4.84783;
    };
    class CUP_arifle_AKS74: CUP_arifle_AKS_Base {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKS74_GL: CUP_arifle_AK74_GL {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AKS74_top_rail: CUP_arifle_AKS74 {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AKS74_GL_top_rail: CUP_arifle_AKS74_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M: CUP_arifle_AK_Base {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK74M_GL: CUP_arifle_AK_Base {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK74M_top_rail: CUP_arifle_AK74M {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_GL_top_rail: CUP_arifle_AK74M_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_railed: CUP_arifle_AK74M {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_GL_railed: CUP_arifle_AK74M_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_railed_afg: CUP_arifle_AK74M_railed {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_desert: CUP_arifle_AK74M {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK74M_top_rail_desert: CUP_arifle_AK74M_desert {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_railed_desert: CUP_arifle_AK74M_desert {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_GL_desert: CUP_arifle_AK74M_GL {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK74M_GL_top_rail_desert: CUP_arifle_AK74M_GL_desert {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_GL_railed_desert: CUP_arifle_AK74M_GL_desert {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_camo;
    class CUP_arifle_AK74M_top_rail_camo: CUP_arifle_AK74M_camo {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_railed_camo: CUP_arifle_AK74M_camo {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_GL_camo;
    class CUP_arifle_AK74M_GL_top_rail_camo: CUP_arifle_AK74M_GL_camo {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK74M_GL_railed_camo: CUP_arifle_AK74M_GL_camo {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK101: CUP_arifle_AK74M {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK101_GL: CUP_arifle_AK74M_GL {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK101_top_rail: CUP_arifle_AK101 {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK101_GL_top_rail: CUP_arifle_AK101_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK101_railed: CUP_arifle_AK101 {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK101_GL_railed: CUP_arifle_AK101_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK103: CUP_arifle_AK74M {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK103_GL: CUP_arifle_AK74M_GL {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_AK103_top_rail: CUP_arifle_AK103 {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK103_GL_top_rail: CUP_arifle_AK103_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK103_railed: CUP_arifle_AK103 {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK103_GL_railed: CUP_arifle_AK103_GL {
        ace_RailHeightAboveBore = 4.94803;
    };
    class CUP_arifle_AK107_Base: CUP_arifle_AK_Base {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_RailHeightAboveBore = 0.124405;
    };
    class CUP_arifle_AK107: CUP_arifle_AK107_Base {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK107_top_rail: CUP_arifle_AK107 {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK107_GL: CUP_arifle_AK107_Base {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK107_GL_top_rail: CUP_arifle_AK107_GL {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK107_railed: CUP_arifle_AK107 {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK107_GL_railed: CUP_arifle_AK107_GL {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK108: CUP_arifle_AK107 {
        ace_RailHeightAboveBore = 0.124405;
    };
    class CUP_arifle_AK108_GL: CUP_arifle_AK107_GL {
        ace_RailHeightAboveBore = 0.124405;
    };
    class CUP_arifle_AK108_top_rail: CUP_arifle_AK108 {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK108_GL_top_rail: CUP_arifle_AK108_GL {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK108_railed: CUP_arifle_AK108 {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK108_GL_railed: CUP_arifle_AK108_GL {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK109: CUP_arifle_AK107 {
        ace_RailHeightAboveBore = 0.124405;
    };
    class CUP_arifle_AK109_GL: CUP_arifle_AK107_GL {
        ace_RailHeightAboveBore = 0.124405;
    };
    class CUP_arifle_AK109_top_rail: CUP_arifle_AK109 {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK109_GL_top_rail: CUP_arifle_AK109_GL {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK109_railed: CUP_arifle_AK109 {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK109_GL_railed: CUP_arifle_AK109_GL {
        ace_RailHeightAboveBore = 5.17141;
    };
    class CUP_arifle_AK102: CUP_arifle_AK_Base {
        ace_barrelLength = 314.02;
        ace_barrelTwist = 240;
        ace_RailHeightAboveBore = -0.0530094;
    };
    class CUP_arifle_AK102_top_rail: CUP_arifle_AK102 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_AK102_railed: CUP_arifle_AK102 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_AK104: CUP_arifle_AK_Base {
        ace_barrelLength = 314.02;
        ace_barrelTwist = 240;
        ace_RailHeightAboveBore = -0.0530094;
    };
    class CUP_arifle_AK104_top_rail: CUP_arifle_AK104 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_AK104_railed: CUP_arifle_AK104 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_AK105: CUP_arifle_AK_Base {
        ace_barrelLength = 314.02;
        ace_barrelTwist = 240;
        ace_RailHeightAboveBore = -0.0530094;
    };
    class CUP_arifle_AK105_top_rail: CUP_arifle_AK105 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_AK105_railed: CUP_arifle_AK105 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_RPK74: CUP_arifle_AK_Base {
        ace_barrelLength = 589.28;
        ace_barrelTwist = 195.072;
        ace_RailHeightAboveBore = -0.0652395;
    };
    class CUP_arifle_RPK74_top_rail: CUP_arifle_RPK74 {
        ace_RailHeightAboveBore = 4.98177;
    };
    class CUP_arifle_RPK74_45: CUP_arifle_RPK74 {
        ace_RailHeightAboveBore = -0.0652395;
    };
    class CUP_arifle_RPK74_45_top_rail: CUP_arifle_RPK74_45 {
        ace_RailHeightAboveBore = 4.98177;
    };
    class CUP_arifle_RPK74M: CUP_arifle_RPK74 {
        ace_RailHeightAboveBore = -0.0652395;
    };
    class CUP_arifle_RPK74M_top_rail: CUP_arifle_RPK74M {
        ace_RailHeightAboveBore = 4.98177;
    };
    class CUP_arifle_RPK74M_railed: CUP_arifle_RPK74M_top_rail {
        ace_RailHeightAboveBore = 4.98177;
    };
    class CUP_arifle_SAIGA_MK03: CUP_arifle_AK104 {
        ace_barrelLength = 336;
        ace_barrelTwist = 228.6;
        ace_RailHeightAboveBore = -0.0530094;
    };
    class CUP_arifle_SAIGA_MK03_top_rail: CUP_arifle_SAIGA_MK03 {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_SAIGA_MK03_Wood: CUP_arifle_SAIGA_MK03 {
        ace_RailHeightAboveBore = -0.0530094;
    };
    class CUP_arifle_SIAGE_MK03_Wood_top_rail: CUP_arifle_SAIGA_MK03_Wood {
        ace_RailHeightAboveBore = 4.994;
    };
    class CUP_arifle_TYPE_56_2: CUP_arifle_AKM {
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_arifle_TYPE_56_2_top_rail: CUP_arifle_TYPE_56_2 {
        ace_RailHeightAboveBore = 4.94803;
    };

    class CUP_arifle_AK12_Base: Rifle_Base_F {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 199.898;
        ace_RailHeightAboveBore = 13.73152;
    };
    class CUP_arifle_AK12_VG_Base: CUP_arifle_AK12_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK12_AFG_Base: CUP_arifle_AK12_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK12_GP34_Base: CUP_arifle_AK12_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK15_Base: CUP_arifle_AK12_Base {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 265;
    };
    class CUP_arifle_AK19_Base: Rifle_Base_F {
        ace_barrelLength = 414.02;
        ace_barrelTwist = 178;
    };
    class CUP_arifle_AK19_black: CUP_arifle_AK19_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_lush: CUP_arifle_AK19_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_arid: CUP_arifle_AK19_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_VG_Base;
    class CUP_arifle_AK19_VG_black: CUP_arifle_AK19_VG_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_VG_lush: CUP_arifle_AK19_VG_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_VG_arid: CUP_arifle_AK19_VG_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_AFG_Base;
    class CUP_arifle_AK19_AFG_black: CUP_arifle_AK19_AFG_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_AFG_lush: CUP_arifle_AK19_AFG_Base {
        ace_RailHeightAboveBore = 3.73152;
    };
    class CUP_arifle_AK19_AFG_arid: CUP_arifle_AK19_AFG_Base {
        ace_RailHeightAboveBore = 3.73152;
    };

    class CUP_arifle_AUG_Base: Rifle_Base_F {
        ace_barrelTwist = 228.6;
        ace_barrelLength = 508.0;
    };

    class CUP_arifle_CZ805_Base: Rifle_Base_F {
        ace_barrelLength = 355.6;
        ace_barrelTwist = 304.8;
    };
    class CUP_arifle_CZ805_A2: CUP_arifle_CZ805_Base {
        ace_RailHeightAboveBore = 4.05253;
        ace_barrelLength = 276.86;
        ace_barrelTwist = 304.8;
    };
    class CUP_arifle_CZ805_A1: CUP_arifle_CZ805_Base {
        ace_barrelLength = 355.6;
        ace_barrelTwist = 304.8;
    };

    class CUP_arifle_FNFAL: Rifle_Base_F {
        ace_barrelLength = 435.864;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 3.5;
    };
    class CUP_arifle_FNFAL5060: CUP_arifle_FNFAL {
        ace_barrelLength = 533.4;
    };
    class CUP_arifle_FNFAL5061: CUP_arifle_FNFAL {
        ace_barrelLength = 533.4;
    };
    class CUP_arifle_FNFAL5062: CUP_arifle_FNFAL {
        ace_barrelLength = 457.2;
    };
    class CUP_arifle_FNFAL_OSW: CUP_arifle_FNFAL {
        ace_barrelLength = 330.2;
    };

    class CUP_arifle_DSA_SA58: CUP_arifle_FNFAL {
        ace_barrelLength = 533.4;
        ace_barrelTwist = 254;
    };
    class CUP_arifle_DSA_SA58_OSW: CUP_arifle_DSA_SA58 {
        ace_barrelLength = 330.2;
    };
    class CUP_arifle_DSA_SA58_DMR: CUP_arifle_DSA_SA58 {
        ace_barrelLength = 412.75;
    };

    class CUP_arifle_Gewehr1: CUP_arifle_FNFAL {
        ace_barrelLength = 533.4;
    };
    class CUP_arifle_Gewehr1_railed: CUP_arifle_Gewehr1 {
        ace_RailHeightAboveBore = 3.50892;
    };
    class CUP_arifle_Steyr_Stg58: CUP_arifle_FNFAL {
        ace_barrelLength = 533.4;
    };
    class CUP_arifle_Steyr_Stg58_railed: CUP_arifle_Steyr_Stg58 {
        ace_RailHeightAboveBore = 3.50892;
    };

    class CUP_arifle_IMI_Romat: CUP_arifle_FNFAL {
        ace_barrelLength = 533.4;
    };

    class CUP_arifle_G3_Base: Rifle_Base_F {
        ace_barrelLength = 449.58;
        ace_barrelTwist = 304.8;
    };

    class CUP_arifle_G36_Base;
    class CUP_arifle_G36C: CUP_arifle_G36_Base {
        ace_barrelLength = 228;
        ace_barrelTwist = 177.8;
    };

    class CUP_arifle_G36_Base_CarryhandleOptics;
    class CUP_arifle_G36A: CUP_arifle_G36_Base_CarryhandleOptics {
        ace_barrelLength = 480;
        ace_barrelTwist = 177.8;
    };
    class CUP_arifle_G36E: CUP_arifle_G36_Base_CarryhandleOptics {
        ace_barrelLength = 480;
    };
    class CUP_arifle_G36K: CUP_arifle_G36_Base_CarryhandleOptics {
        ace_barrelLength = 318;
    };
    class CUP_arifle_G36K_RIS: CUP_arifle_G36_Base {
        ace_barrelLength = 318;
    };
    class CUP_arifle_MG36: CUP_arifle_G36_Base {
        ace_barrelTwist = 177.8;
        ace_barrelLength = 480;
    };

    class CUP_arifle_GALIL_BASE;
    class CUP_arifle_Galil_black: CUP_arifle_GALIL_BASE {
        ace_barrelLength = 533.4;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 6.45192;
    };
    class CUP_arifle_Galil_556_black: CUP_arifle_GALIL_BASE {
        ace_barrelLength = 457.2;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 6.45188;
    };
    class CUP_arifle_Galil_SAR_black: CUP_arifle_GALIL_BASE {
        ace_barrelLength = 330.2;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 6.45188;
    };

    class CUP_arifle_HK416_145_Base: Rifle_Base_F {
        ace_barrelLength = 368;
        ace_barrelTwist = 177.8;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 3000;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_arifle_HK416_Black: CUP_arifle_HK416_145_Base {
        ace_RailHeightAboveBore = 2.9771;
    };
    class CUP_arifle_HK416_11_Base: CUP_arifle_HK416_145_Base {
        ace_barrelLength = 279;
        ace_barrelTwist = 177.8;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 3600;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_arifle_HK416_CQB_Black: CUP_arifle_HK416_11_Base {
        ace_RailHeightAboveBore = 2.9771;
    };

    class CUP_arifle_HK_M27: CUP_arifle_HK416_Black {
        ace_barrelLength = 419.1;
    };
    class CUP_arifle_HK_M27_AG36: CUP_arifle_HK416_Black {
        ace_barrelLength = 419.1;
    };

    class CUP_arifle_HK417_Base: CUP_arifle_HK416_145_Base {
        ace_barrelLength = 508;
        ace_barrelTwist = 279.4;
    };
    class CUP_arifle_HK417_20: CUP_arifle_HK417_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 279.4;
        ace_RailHeightAboveBore = 2.92351;
    };
    class CUP_arifle_HK417_12: CUP_arifle_HK417_20 {
        ace_barrelLength = 330.2;
        ace_barrelTwist = 279.4;
        ace_RailHeightAboveBore = 2.92351;
    };

    class CUP_arifle_OTS14_GROZA_Base: Rifle_Base_F {
        ace_barrelTwist = 230;
        ace_RailHeightAboveBore = 8.68069;
    };
    class CUP_arifle_OTS14_GROZA_GL: CUP_arifle_OTS14_GROZA_Base {
        ace_barrelLength = 340;
        ace_RailHeightAboveBore = 8.68109;
    };
    class CUP_arifle_OTS14_GROZA_Grip: CUP_arifle_OTS14_GROZA_Base {
        ace_barrelLength = 290;
        ace_RailHeightAboveBore = 8.52852;
    };
    class CUP_arifle_OTS14_GROZA: CUP_arifle_OTS14_GROZA_Base {
        ace_barrelLength = 230;
        ace_RailHeightAboveBore = 8.52852;
    };
    class CUP_arifle_OTS14_GROZA_762_base;
    class CUP_arifle_OTS14_GROZA_762_Grip: CUP_arifle_OTS14_GROZA_762_base {
        ace_barrelLength = 300;
        ace_RailHeightAboveBore = 8.52852;
    };
    class CUP_arifle_OTS14_GROZA_762: CUP_arifle_OTS14_GROZA_762_base {
        ace_barrelLength = 240;
        ace_RailHeightAboveBore = 8.52852;
    };
    class CUP_arifle_OTS14_GROZA_762_GL: CUP_arifle_OTS14_GROZA_762_base {
        ace_barrelLength = 350;
        ace_RailHeightAboveBore = 8.52852;
    };

    class CUP_arifle_M16_Base: Rifle_Base_F {
        ace_barrelLength = 508;
        ace_barrelTwist = 178;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 3000;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_arifle_M16A2: CUP_arifle_M16_Base {
        ace_RailHeightAboveBore = 6.87756;
    };
    class CUP_arifle_M16A2_GL: CUP_arifle_M16_Base {
        ace_RailHeightAboveBore = 6.90567;
    };
    class CUP_arifle_XM16E1: CUP_arifle_M16_Base {
        ace_barrelTwist = 305;
        ace_RailHeightAboveBore = 7.2107;
    };
    class CUP_arifle_Colt727: CUP_arifle_M16_Base {
        ace_barrelLength = 368;
        ace_barrelTwist = 178;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 3600;
        ace_overheating_slowdownFactor = 1;
        ace_RailHeightAboveBore = 6.87756;
    };
    class CUP_arifle_Colt727_M203: CUP_arifle_Colt727 {
        ace_RailHeightAboveBore = 6.85537;
    };

    class CUP_arifle_M4_Base: CUP_arifle_M16_Base {
        ace_barrelLength = 368;
        ace_barrelTwist = 178;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 3600;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_srifle_Mk12SPR: CUP_arifle_M4_Base {
        ace_barrelLength = 457.2;
        ace_barrelTwist = 177.8;
        //ace_overheating_Dispersion[] = {0, 0.001, 0.002, 0.004};
        //ace_overheating_SlowdownFactor[] = {1, 1, 1, 0.9};
        //ace_overheating_JamChance[] = {0, 0.0003, 0.0015, 0.0075};
        ace_RailHeightAboveBore = 3.78232;
    };
    class CUP_arifle_M4A1_BUIS_Base;
    class CUP_arifle_mk18_black: CUP_arifle_M4A1_BUIS_Base {
        ace_RailHeightAboveBore = 2.58007;
    };
    class CUP_arifle_SBR_black: CUP_arifle_M4A1_BUIS_Base {
        ace_RailHeightAboveBore = 2.37934;
    };
    class CUP_arifle_M4A1_SOMMOD_black: CUP_arifle_M4A1_BUIS_Base {
        ace_RailHeightAboveBore = 2.52428;
    };
    class CUP_arifle_M4A1_SOMMOD_Grip_black: CUP_arifle_M4A1_BUIS_Base {
        ace_RailHeightAboveBore = 2.52428;
    };

    class CUP_arifle_M4A1_BUIS_NoUnder_Base;
    class CUP_arifle_M4A1_MOE_black: CUP_arifle_M4A1_BUIS_NoUnder_Base {
        ace_RailHeightAboveBore = 2.52428;
    };
    class CUP_arifle_M4A1_MOE_short_black: CUP_arifle_M4A1_BUIS_NoUnder_Base {
        ace_barrelLength = 287.02;
        ace_RailHeightAboveBore = 2.52428;
    };
    class CUP_arifle_M4A1_standard_black: CUP_arifle_M4A1_BUIS_NoUnder_Base {
        ace_RailHeightAboveBore = 2.52428;
    };
    class CUP_arifle_M4A1_standard_short_black: CUP_arifle_M4A1_BUIS_NoUnder_Base {
        ace_barrelLength = 287.02;
        ace_RailHeightAboveBore = 2.52428;
    };
    class CUP_arifle_M4_MOE_BW: CUP_arifle_M4A1_BUIS_NoUnder_Base {
        ace_RailHeightAboveBore = 2.52428;
    };

    class CUP_arifle_Sa58_base: Rifle_Base_F {
        ace_barrelLength = 391.16;
        ace_barrelTwist = 240.03;
    };
    class CUP_arifle_Sa58P_frontris: CUP_arifle_Sa58_base {
        ace_RailHeightAboveBore = 3.29712;
    };
    class CUP_arifle_Sa58P_RIS1: CUP_arifle_Sa58_base {
        ace_RailHeightAboveBore = 3.29712;
    };
    class CUP_arifle_Sa58P_rearris: CUP_arifle_Sa58_base {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58V_rearris: CUP_arifle_Sa58_base {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58V_frontris: CUP_arifle_Sa58_base {
        ace_RailHeightAboveBore = 3.29712;
    };
    class CUP_arifle_Sa58RIS1: CUP_arifle_Sa58_base {
        ace_RailHeightAboveBore = 3.29712;
    };
    class CUP_arifle_Sa58RIS2_gl: CUP_arifle_Sa58RIS1 {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58RIS2: CUP_arifle_Sa58RIS1 {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58P;
    class CUP_arifle_Sa58Pi: CUP_arifle_Sa58P {
        ace_RailHeightAboveBore = 0.694091;
    };
    class CUP_arifle_Sa56_carbine_base: CUP_arifle_Sa58_base {
        ace_barrelLength = 300;
        ace_barrelTwist = 240.03;
    };
    class CUP_arifle_Sa58_Carbine_RIS_VFG: CUP_arifle_Sa56_carbine_base {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58_short_base: CUP_arifle_Sa58_base {
        ace_barrelTwist = 240.03;
        ace_barrelLength = 190.5;
    };
    class CUP_arifle_Sa58s_rearris: CUP_arifle_Sa58_short_base {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58_sporter_compact_rearris: CUP_arifle_Sa58_short_base {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58_LMG_base: CUP_arifle_Sa58_base {
        ace_barrelTwist = 240.03;
        ace_barrelLength = 589.28;
    };
    class CUP_arifle_Sa58_Klec: CUP_arifle_Sa58_LMG_base {
        ace_RailHeightAboveBore = 0.694091;
    };
    class CUP_arifle_Sa58_Klec_frontris: CUP_arifle_Sa58_LMG_base {
        ace_RailHeightAboveBore = 3.29712;
    };
    class CUP_arifle_Sa58_Klec_rearris: CUP_arifle_Sa58_LMG_base {
        ace_RailHeightAboveBore = 3.20905;
    };
    class CUP_arifle_Sa58_Klec_ris: CUP_arifle_Sa58_LMG_base {
        ace_RailHeightAboveBore = 3.20905;
    };

    class CUP_arifle_SCAR_Base: Rifle_Base_F {
        ace_overheating_mrbs = 5000;
        ace_overheating_dispersion = 1;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_arifle_SCAR_L_Base;
    class CUP_arifle_Mk16_STD: CUP_arifle_SCAR_L_Base {
        ace_barrelLength = 355.6;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 4.48566;
    };
    class CUP_arifle_Mk16_SV: CUP_arifle_SCAR_L_Base {
        ace_barrelLength = 457.2;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 4.48566;
    };
    class CUP_arifle_Mk16_CQC: CUP_arifle_SCAR_L_Base {
        ace_barrelLength = 254.0;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 4.48566;
    };
    class CUP_arifle_Mk17_Base;
    class CUP_arifle_Mk17_CQC: CUP_arifle_Mk17_Base {
        ace_barrelLength = 330.2;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 4.46076;
    };
    class CUP_arifle_Mk17_STD: CUP_arifle_Mk17_Base {
        ace_barrelLength = 406.4;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 4.46076;
    };
    class CUP_arifle_Mk20: CUP_arifle_Mk17_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 4.46076;
    };

    class CUP_arifle_SR3M_Vikhr: Rifle_Base_F {
        ace_barrelLength = 154.3;
        ace_barrelTwist = 210.82;
        ace_RailHeightAboveBore = 0.473668;
    };
    class CUP_arifle_SR3M_Vikhr_top_rail: CUP_arifle_SR3M_Vikhr {
        ace_RailHeightAboveBore = 5.39713;
    };
    class CUP_arifle_SR3M_Vikhr_VFG: CUP_arifle_SR3M_Vikhr {
        ace_RailHeightAboveBore = 0.473668;
    };
    class CUP_arifle_SR3M_Vikhr_VFG_top_rail: CUP_arifle_SR3M_Vikhr_top_rail {
        ace_RailHeightAboveBore = 5.39713;
    };

    class Tavor_base_F;
    class CUP_arifle_X95: Tavor_base_F {
        ace_barrelLength = 330;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.08939;
    };

    class CUP_arifle_XM8_Base: Rifle_Base_F {
        ace_barrelLength = 317.5;
        ace_barrelTwist = 177.8;
    };
    class CUP_arifle_XM8_Carbine: CUP_arifle_XM8_Base {
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_Carbine_GL: CUP_arifle_XM8_Base {
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_Carbine_GL_Rail: CUP_arifle_XM8_Base {
        ace_RailHeightAboveBore = 6.67633;
    };
    class CUP_arifle_XM8_Compact: CUP_arifle_XM8_Base {
        ace_barrelLength = 228.6;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_Compact_Rail: CUP_arifle_XM8_Compact {
        ace_RailHeightAboveBore = 6.67633;
    };
    class CUP_arifle_XM8_Compact_FG: CUP_arifle_XM8_Base {
        ace_barrelLength = 228.6;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_Sharpshooter: CUP_arifle_XM8_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_Sharpshooter_FG: CUP_arifle_XM8_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_SAW_FG: CUP_arifle_XM8_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.1913;
    };

    class CUP_arifle_XM8_Railed_Base: Rifle_Base_F {
        ace_barrelLength = 317.5;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 6.67633;
    };
    class CUP_arifle_XM8_Compact_FG_Rail: CUP_arifle_XM8_Railed_Base {
        ace_barrelLength = 228.6;
        ace_barrelTwist = 177.8;
    };
    class CUP_arifle_XM8_Sharpshooter_Rail: CUP_arifle_XM8_Railed_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
    };
    class CUP_arifle_XM8_Sharpshooter_FG_Rail: CUP_arifle_XM8_Railed_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
    };
    class CUP_arifle_XM8_SAW_Rail: CUP_arifle_XM8_Railed_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = 5.1913;
    };
    class CUP_arifle_XM8_SAW_FG_Rail: CUP_arifle_XM8_Railed_Base {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 177.8;
    };

    class CUP_arifle_xm29_ke_base: Rifle_Base_F {
        ace_barrelLength = 241.3;
        ace_barrelTwist = 177.8;
        ace_RailHeightAboveBore = -7.67857;
    };
    class CUP_arifle_xm29_ke_rail_base: CUP_arifle_xm29_ke_base {
        ace_RailHeightAboveBore = 5.51916;
    };
    class CUP_arifle_m29_ke_caseless_base: CUP_arifle_xm29_ke_base {
        ace_RailHeightAboveBore = 5.51916;
    };

    class CUP_CZ_BREN2_Base: Rifle_Base_F {
        ace_RailHeightAboveBore = 3.91245;
        ace_barrelLength = 355.6;
        ace_barrelTwist = 177.8;
    };
    class CUP_CZ_BREN2_556_14: CUP_CZ_BREN2_Base {
    };
    class CUP_CZ_BREN2_556_11: CUP_CZ_BREN2_Base {
        ace_barrelLength = 279.4;
    };
    class CUP_CZ_BREN2_556_8: CUP_CZ_BREN2_Base {
        ace_barrelLength = 203.2;
    };

    class CUP_CZ_BREN2_762_Base: CUP_CZ_BREN2_Base {
        ace_barrelTwist = 240;
    };
    class CUP_CZ_BREN2_762_8: CUP_CZ_BREN2_762_Base {
        ace_barrelLength = 203.2;
    };

    class CUP_CZ_BREN2_762_GL_Base: CUP_CZ_BREN2_762_Base {
        ace_barrelTwist = 240;
    };

    class CUP_CZ_BREN2_GL_Base;
    class CUP_CZ_BREN2_556_11_GL: CUP_CZ_BREN2_GL_Base {
        ace_barrelLength = 279.4;
    };

    class CUP_hgun_BallisticShield_Armed: Rifle_Base_F {
        ace_barrelLength = 124.46;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_Browning_HP: Pistol_Base_F {
        ace_barrelLength = 119.89;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_Colt1911: Pistol_Base_F {
        ace_barrelLength = 127.0;
        ace_barrelTwist = 406.4;
    };

    class CUP_hgun_Compact: Pistol_Base_F {
        ace_barrelLength = 94.996;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_CZ75: Pistol_Base_F {
        ace_barrelLength = 124.46;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_Deagle: Pistol_Base_F {
        ace_barrelLength = 127.0;
        ace_barrelTwist = 406.4;
    };

    class CUP_hgun_Duty: Pistol_Base_F {
        ace_barrelLength = 94.996;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_Glock17: Pistol_Base_F {
        ace_barrelLength = 114.3;
        ace_barrelTwist = 254;
    };

    class CUP_hgun_M9: Pistol_Base_F {
        ace_barrelLength = 124.46;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_M17_Coyote: Pistol_Base_F {
        ace_barrelLength = 119.38;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_Mac10_Base: Pistol_Base_F {
        ace_barrelLength = 139.7;
        ace_barrelTwist = 406.4;
    };

    class CUP_hgun_Makarov: Pistol_Base_F {
        ace_barrelLength = 93.472;
        ace_barrelTwist = 240.03;
    };

    class CUP_hgun_Mk23: Pistol_Base_F {
        ace_barrelLength = 149.098;
        ace_barrelTwist = 377.952;
    };

    class CUP_hgun_MicroUzi: Pistol_Base_F {
        ace_barrelLength = 127.0;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_MP7: Pistol_Base_F {
        ace_barrelLength = 180;
        ace_barrelTwist = 160.02;
    };

    class CUP_hgun_P30_Base: Pistol_Base_F {
        ace_barrelLength = 124.46;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_PB6P9: Pistol_Base_F {
        ace_barrelLength = 104.14;
        ace_barrelTwist = 240.03;
    };

    class CUP_hgun_Phantom: Pistol_Base_F {
        ace_barrelLength = 119.38;
        ace_barrelTwist = 246.38;
    };

    class CUP_hgun_TaurusTracker455: Pistol_Base_F {
        ace_barrelLength = 101.6;
        ace_barrelTwist = 304.8;
    };

    class CUP_hgun_SA61: Pistol_Base_F {
        ace_barrelLength = 114.3;
        ace_barrelTwist = 406.4;
    };

    class CUP_hgun_SWM327MP: Pistol_Base_F {
        ace_barrelLength = 101.6;
        ace_barrelTwist = 304.8;
    };

    class CUP_hgun_TEC9: Pistol_Base_F {
        ace_barrelLength = 127;
        ace_barrelTwist = 254;
    };

    class CUP_hgun_TT: Pistol_Base_F {
        ace_barrelLength = 130.0;
        ace_barrelTwist = 248.92;
    };

    class CUP_hgun_UZI_Base: Pistol_Base_F {
        ace_barrelTwist = 406.4;
        ace_barrelLength = 139.7;
    };

    class CUP_Famas_Base: Rifle_Base_F {
        ace_barrelLength = 488;
        ace_barrelTwist = 180;
        ace_twistDirection = 1;
    };
    class CUP_Famas_F1_Rail: CUP_Famas_Base {
        ace_RailHeightAboveBore = 9.75832;
    };

    class CUP_l85a2_base: Rifle_Base_F {
        ace_barrelLength = 518;
        ace_barrelTwist = 180;
        ace_twistDirection = 1;
    };
    class CUP_l85a2: CUP_l85a2_base {
        ace_RailHeightAboveBore = 3.00035;
    };
    class CUP_l85a2_ris: CUP_l85a2_base {
        ace_RailHeightAboveBore = 3.00035;
    };
    class CUP_l85a2_ris_ng: CUP_l85a2_base {
        ace_RailHeightAboveBore = 3.00035;
    };
    class CUP_l85a2_ugl: CUP_l85a2_base {
        ace_RailHeightAboveBore = 3.00035;
    };
    class CUP_arifle_L86A2: CUP_l85a2 {
        ace_barrelLength = 646;
    };

    class CUP_lmg_M240: Rifle_Long_Base_F {
        ace_barrelLength = 630;
        ace_barrelTwist = 304.8;
        ace_overheating_allowSwapBarrel = 1;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 1750;
        ace_overheating_slowdownFactor = 1;
        ace_RailHeightAboveBore = 4.01268;
    };

    class CUP_saw_base: Rifle_Long_Base_F {
        ace_overheating_allowSwapBarrel = 1;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 23000;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_lmg_minimipara: CUP_saw_base {
        ace_barrelLength = 380;
        ace_barrelTwist = 178;
    };
    class CUP_lmg_minimi: CUP_lmg_minimipara {
        ace_barrelLength = 465;
        ace_barrelTwist = 178;
    };
    class CUP_lmg_m249_para: CUP_lmg_minimipara {
        ace_barrelLength = 349;
        ace_barrelTwist = 305;
    };
    class CUP_lmg_m249_para_gl: CUP_lmg_minimipara {
        ace_barrelLength = 349;
        ace_barrelTwist = 305;
    };
    class CUP_lmg_M249_E2: CUP_lmg_minimipara {
        ace_barrelLength = 465;
        ace_barrelTwist = 305;
    };
    class CUP_lmg_minimi_railed: CUP_lmg_minimipara {
        ace_barrelLength = 465;
        ace_barrelTwist = 178;
    };
    class CUP_lmg_m249_pip1: CUP_lmg_minimi_railed {
        ace_barrelLength = 465;
        ace_barrelTwist = 305;
    };
    class CUP_lmg_m249_pip2: CUP_lmg_minimi_railed {
        ace_barrelLength = 349;
        ace_barrelTwist = 305;
    };
    class CUP_lmg_m249_pip3: CUP_lmg_minimi_railed {
        ace_barrelLength = 349;
        ace_barrelTwist = 305;
    };
    class CUP_lmg_m249_pip4: CUP_lmg_minimi_railed {
        ace_barrelLength = 465;
        ace_barrelTwist = 305;
    };

    class CUP_M60E4_base: Rifle_Long_Base_F {
        ace_barrelLength = 431.8;
        ace_barrelTwist = 304.8;
        ace_overheating_allowSwapBarrel = 1;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 850;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_lmg_M60: CUP_M60E4_base {
        ace_barrelLength = 558.8;
    };

    class CUP_lmg_MG3: Rifle_Long_Base_F {
        ace_barrelLength = 630;
        ace_barrelTwist = 304.8;
        ace_overheating_allowSwapBarrel = 1;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 2750;
        ace_overheating_slowdownFactor = 2;
    };

    class CUP_lmg_Mk48_Base: Rifle_Long_Base_F {
        ace_barrelLength = 501.65;
        ace_barrelTwist = 304.8;
        ace_overheating_allowSwapBarrel = 1;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 1750;
        ace_overheating_slowdownFactor = 1;
    };
    class CUP_lmg_Mk48: CUP_lmg_Mk48_Base {
        ace_RailHeightAboveBore = 4.11044;
    };

    class CUP_lmg_PKM: Rifle_Long_Base_F {
        ace_barrelLength = 645.16;
        ace_barrelTwist = 240.03;
        ace_overheating_allowSwapBarrel = 1;
    };
    class CUP_lmg_PKMN: CUP_lmg_PKM {
        ace_RailHeightAboveBore = 1.2264;
    };
    class CUP_lmg_PKM_top_rail: CUP_lmg_PKM {
        ace_RailHeightAboveBore = 6.67219;
    };
    class CUP_lmg_PKM_B50_vfg;
    class CUP_lmg_PKM_front_rail_B50_vfg: CUP_lmg_PKM_B50_vfg {
        ace_RailHeightAboveBore = 2.67933;
    };
    class CUP_lmg_Pecheneg: CUP_lmg_PKM {
        ace_barrelLength = 657.86;
        ace_barrelTwist = 240.03;
        ace_overheating_allowSwapBarrel = 0;
    };

    class CUP_lmg_UK59: Rifle_Long_Base_F {
        ace_barrelLength = 551.18;
        ace_barrelTwist = 381.0;
        ace_overheating_allowSwapBarrel = 1;
    };

    class CUP_sgun_AA12: Rifle_Base_F {
        ace_barrelTwist = 0.0;
        ace_twistDirection = 0;
        ace_barrelLength = 457.2;
    };

    class CUP_sgun_CZ584: Rifle_Base_F {
        ace_twistDirection = 0;
        ace_barrelLength = 599.999;
        ace_barrelTwist = 0.0;
        class CUP_rifle_CZ584: Rifle_Base_F {
            ace_barrelLength = 599.999;
            ace_barrelTwist = 304.8;
        };
    };
    class CUP_sgun_CZ584_RIS: CUP_sgun_CZ584 {
        ace_RailHeightAboveBore = 2.04133;
    };

    class CUP_sgun_M1014_base: Rifle_Base_F {
        ace_barrelLength = 469.9;
        ace_barrelTwist = 0.0;
        ace_twistDirection = 0;
        ace_RailHeightAboveBore = 2.21675;
    };
    class CUP_sgun_M1014_Entry: CUP_sgun_M1014_base {
        ace_barrelLength = 355.6;
    };

    class CUP_sgun_Saiga12K: Rifle_Base_F {
        ace_barrelLength = 429.26;
        ace_barrelTwist = 0.0;
        ace_twistDirection = 0;
        ace_RailHeightAboveBore = -0.098981;
    };
    class CUP_sgun_Saiga12K_top_rail: CUP_sgun_Saiga12K {
        ace_RailHeightAboveBore = 4.89803;
    };

    class CUP_sgun_slamfire: Rifle_Base_F {
        ace_twistDirection = 0;
        ace_barrelTwist = 0.0;
        ace_barrelLength = 299.999;
    };

    class CUP_sgun_SPAS12: Rifle_Base_F {
        ace_twistDirection = 0;
        ace_barrelTwist = 0.0;
        ace_barrelLength = 469.9;
    };

    class CUP_SKS: Rifle_Base_F {
        ace_barrelLength = 619.76;
        ace_barrelTwist = 238.76;
    };
    class CUP_SKS_rail: CUP_SKS {
        ace_RailHeightAboveBore = 4.21276;
    };

    class CUP_smg_bizon: Rifle_Base_F {
        ace_barrelLength = 231.14;
        ace_barrelTwist = 240.03;
        ace_RailHeightAboveBore = -0.0905365;
    };
    class CUP_smg_vityaz: CUP_smg_bizon {
        ace_barrelLength = 237;
        ace_barrelTwist = 240.03;
        ace_RailHeightAboveBore = -0.203267;
    };
    class CUP_smg_vityaz_top_rail: CUP_smg_vityaz {
        ace_RailHeightAboveBore = 3.65585;
    };
    class CUP_smg_vityaz_vfg_front_rail: CUP_smg_vityaz_top_rail {
        ace_RailHeightAboveBore = 3.95649;
    };
    class CUP_smg_saiga9: CUP_smg_vityaz_top_rail {
        ace_barrelLength = 367;
        ace_RailHeightAboveBore = 3.65585;
    };

    class CUP_smg_EVO: Rifle_Short_Base_F {
        ace_barrelLength = 195.58;
        ace_barrelTwist = 254.0;
        ace_RailHeightAboveBore = 4.75088;
    };

    class CUP_smg_M3A1: Rifle_Base_F {
        ace_barrelTwist = 240.03;
        ace_barrelLength = 231.14;
    };

    class CUP_Mac10_Base: Rifle_Base_F {
        ace_barrelLength = 139.7;
        ace_barrelTwist = 406.4;
    };
    class CUP_smg_Mac10_rail: CUP_Mac10_Base {
        ace_RailHeightAboveBore = 3.75853;
    };

    class CUP_smg_MP5SD6: Rifle_Base_F {
        ace_barrelLength = 144.78;
        ace_barrelTwist = 254.0;
        ace_RailHeightAboveBore = 3.82074;
    };
    class CUP_smg_MP5A5: CUP_smg_MP5SD6 {
        ace_barrelLength = 226.06;
        ace_barrelTwist = 254.0;
    };

    class CUP_smg_MP7: Rifle_Short_Base_F {
        ace_barrelTwist = 160.02;
        ace_barrelLength = 180;
        ace_RailHeightAboveBore = 4.76803;
    };

    class CUP_smg_P90_BASE;
    class CUP_smg_p90_olive: CUP_smg_P90_BASE {
        ace_barrelLength = 264.16;
        ace_barrelTwist = 228.6;
        ace_RailHeightAboveBore = 8.43769;
    };
    class CUP_smg_PS90_olive: CUP_smg_p90_olive {
        ace_barrelLength = 406.4;
    };

    class CUP_smg_SA61: Rifle_Base_F {
        ace_barrelLength = 114.3;
        ace_barrelTwist = 406.4;
    };
    class CUP_smg_SA61_RIS: CUP_smg_SA61 {
        ace_RailHeightAboveBore = 2.70802;
    };

    class CUP_UZI_Base: Rifle_Base_F {
        ace_barrelLength = 139.7;
        ace_barrelTwist = 406.4;
    };
    class CUP_smg_UZI: CUP_UZI_Base {
        ace_RailHeightAboveBore = 4.89473;
    };

    class CUP_srifle_AS50: Rifle_Long_Base_F {
        ace_barrelLength = 690;
        ace_barrelTwist = 381.0;
        ace_RailHeightAboveBore = 5.24301;
    };

    class CUP_srifle_AWM_Base: Rifle_Long_Base_F {
        ace_barrelTwist = 279.4;
        ace_barrelLength = 685.8;
    };
    class CUP_srifle_AWM_des: CUP_srifle_AWM_Base {
        ace_RailHeightAboveBore = 1.68761;
    };

    class CUP_srifle_CZ550_base: Rifle_Base_F {
        ace_barrelLength = 599.999;
        ace_barrelTwist = 304.8;
    };
    class CUP_srifle_CZ550: CUP_srifle_CZ550_base {
        ace_barrelLength = 599.999;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 2.08789;
    };
    class CUP_srifle_CZ550_rail: CUP_srifle_CZ550_base {
        ace_barrelLength = 599.999;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 2.08789;
    };

    class CUP_srifle_CZ750_Base: Rifle_Long_Base_F {
        ace_barrelLength = 660.4;
        ace_barrelTwist = 304.8;
        ace_RailHeightAboveBore = 2.379;
    };

    class CUP_srifle_ksvk: Rifle_Base_F {
        ace_barrelLength = 999.998;
        ace_barrelTwist = 457.2;
        ace_RailHeightAboveBore = -0.576029;
    };

    class CUP_srifle_L129A1: Rifle_Base_F {
        ace_barrelLength = 410;
        ace_barrelTwist = 285.75;
        ace_twistDirection = 1;
        ace_RailHeightAboveBore = 2.65033;
    };
    class CUP_srifle_L129A1_HG: CUP_srifle_L129A1 {
        ace_RailHeightAboveBore = 2.65033;
    };

    class CUP_srifle_LeeEnfield: Rifle_Long_Base_F {
        ace_barrelLength = 640.08;
        ace_barrelTwist = 254.0;
        ace_RailHeightAboveBore = 1.95255;
    };

    class CUP_srifle_M107_Base: Rifle_Long_Base_F {
        ace_barrelLength = 736.6;
        ace_barrelTwist = 381.0;
        ace_RailHeightAboveBore = 3.35897;
    };

    class CUP_srifle_M110: Rifle_Base_F {
        ace_barrelLength = 508.0;
        ace_barrelTwist = 279.4;
        ace_RailHeightAboveBore = 2.74546;
    };

    class CUP_srifle_M14: Rifle_Base_F {
        ace_barrelLength = 559;
        ace_barrelTwist = 305;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 2000;
        ace_overheating_slowdownFactor = 1;
        ace_RailHeightAboveBore = 2.88451;
    };
    class CUP_srifle_M21: CUP_srifle_M14 {
        ace_RailHeightAboveBore = 0.186893;
    };
    class CUP_srifle_M21_ris: CUP_srifle_M21 {
        ace_RailHeightAboveBore = 2.88451;
    };

    class CUP_srifle_M14_DMR: Rifle_Base_F {
        ace_barrelLength = 559;
        ace_barrelTwist = 305;
        ace_overheating_dispersion = 1;
        ace_overheating_mrbs = 2000;
        ace_overheating_slowdownFactor = 1;
        ace_RailHeightAboveBore = 2.92019;
    };

    class CUP_srifle_M24_des: Rifle_Base_F {
        ace_barrelTwist = 285.75;
        ace_barrelLength = 609.6;
        ace_RailHeightAboveBore = 1.64835;
    };
    class CUP_srifle_M40A3: CUP_srifle_M24_des {
        ace_RailHeightAboveBore = 1.89858;
    };

    class CUP_srifle_M2010_BASE: Rifle_Base_F {
        ace_barrelLength = 640.08;
        ace_barrelTwist = 254.0;
        ace_RailHeightAboveBore = 2.65444;
    };

    class CUP_srifle_Mosin_Nagant: Rifle_Long_Base_F {
        ace_barrelLength = 730;
        ace_barrelTwist = 254;
        ace_RailHeightAboveBore = 0.425619;
    };

    class CUP_srifle_Remington700: Rifle_Long_Base_F {
        ace_barrelTwist = 304.8;
        ace_barrelLength = 660;
        ace_RailHeightAboveBore = 2.3;
    };

    class CUP_srifle_RSASS_BASE: Rifle_Base_F {
        ace_barrelLength = 264.16;
        ace_barrelTwist = 254;
        ace_RailHeightAboveBore = 3.00265;
    };

    class CUP_srifle_SVD: Rifle_Base_F {
        ace_barrelTwist = 238.76;
        ace_barrelLength = 619.76;
        ace_RailHeightAboveBore = -0.435486;
    };
    class CUP_srifle_SVD_top_rail: CUP_srifle_SVD {
        ace_RailHeightAboveBore = 4.18992;
    };

    class CUP_srifle_VSSVintorez: Rifle_Base_F {
        ace_barrelLength = 200.66;
        ace_barrelTwist = 210.82;
        ace_RailHeightAboveBore = 0.228429;
    };
    class CUP_srifle_VSSVintorez_top_rail: CUP_srifle_VSSVintorez {
        ace_RailHeightAboveBore = 5.12993;
    };
    class CUP_srifle_VSSVintorez_VFG: CUP_srifle_VSSVintorez {
        ace_RailHeightAboveBore = 0.228429;
    };
    class CUP_srifle_VSSVintorez_flash: CUP_srifle_VSSVintorez {
        ace_RailHeightAboveBore = 0.228429;
    };
    class CUP_srifle_VSSVintorez_flash_top: CUP_srifle_VSSVintorez_top_rail {
        ace_RailHeightAboveBore = 5.12993;
    };
    class CUP_arifle_AS_VAL: CUP_srifle_VSSVintorez {
        ace_RailHeightAboveBore = 0.228429;
    };
    class CUP_arifle_AS_VAL_top_rail: CUP_arifle_AS_VAL {
        ace_RailHeightAboveBore = 5.12993;
    };
    class CUP_arifle_AS_VAL_VFG: CUP_arifle_AS_VAL {
        ace_RailHeightAboveBore = 0.228429;
    };
    class CUP_arifle_AS_VAL_VFG_top_rail: CUP_arifle_AS_VAL_top_rail {
        ace_RailHeightAboveBore = 5.12993;
    };
    class CUP_arifle_AS_VAL_flash: CUP_arifle_AS_VAL {
        ace_RailHeightAboveBore = 0.228429;
    };
    class CUP_arifle_AS_VAL_flash_top: CUP_arifle_AS_VAL_top_rail {
        ace_RailHeightAboveBore = 5.12993;
    };

    class CUP_launch_APILAS_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 60;
        ace_overpressure_damage = 0.8;
        ace_overpressure_range = 50;
    };

    class CUP_launch_FIM92Stinger_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_damage = 0.3;
        ace_overpressure_range = 15;
    };

    class CUP_launch_Igla_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 30;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 2;
    };

    class CUP_launch_Javelin: Launcher_Base_F {
        class Single: Mode_SemiAuto {
            ace_missileGuidance_attackProfile = "JAV_DIR";
        };
        class TopDown: Single {
            ace_missileGuidance_attackProfile = "JAV_TOP";
        };
    };

    class CUP_launch_M47: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 8;
    };

    class CUP_launch_M72A6_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 40;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 15;
    };

    class CUP_launch_M136_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 10;
    };

    class CUP_launch_Mk153Mod0: Launcher_Base_F {
        ace_overpressure_angle = 30;
        ace_overpressure_damage = 0.7;
        ace_overpressure_range = 15;
        ace_reloadlaunchers_enabled = 1;
        class SMAW_spottingRifle: Launcher_Base_F {
            ace_overpressure_angle = 0;
            ace_overpressure_damage = 0;
            ace_overpressure_range = 0;
        };
    };
    class CUP_launch_Mk153Mod0_SMAWOptics: CUP_launch_Mk153Mod0 {};

    class CUP_launch_MAAWS: Launcher_Base_F {
        ace_overpressure_angle = 60;
        ace_overpressure_damage = 0.7;
        ace_overpressure_range = 15;
        ace_reloadlaunchers_enabled = 1;
    };
    class CUP_launch_MAAWS_Scope: CUP_launch_MAAWS {};

    class CUP_launch_NLAW_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 30;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 2;
        ace_nlaw_enabled = 1;
        canLock = 1;
        class Single: Mode_SemiAuto {
            ace_missileGuidance_attackProfile = "ace_nlaw_directAttack";
        };
        class Overfly: Single {
            ace_missileGuidance_attackProfile = "ace_nlaw_overflyTopAttack";
        };
    };

    class CUP_launch_RPG7V: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 6;
        ace_reloadlaunchers_enabled = 1;
    };

    class CUP_launch_9K32Strela_Loaded: Launcher_Base_F {
        ace_overpressure_angle = 30;
        ace_overpressure_damage = 0.5;
        ace_overpressure_range = 2;
    };


    // Vehicle weapons are still from @CUP Weapons
    class rockets_230mm_GAT;
    class CUP_Vmlauncher_GRAD_veh: rockets_230mm_GAT {
        EGVAR(overpressure,offset) = 2.8;
    };
    class CUP_Vmlauncher_MLRS_veh: rockets_230mm_GAT {
        EGVAR(overpressure,offset) = 1.9;
    };
    class mortar_155mm_AMOS;
    class CUP_Vcannon_D30_veh: mortar_155mm_AMOS {
        EGVAR(overpressure,offset) = 2;
    };
    class CUP_Vcannon_M119_veh: CUP_Vcannon_D30_veh {
        EGVAR(overpressure,offset) = 3;
    };
    class cannon_120mm;
    class CUP_Vcannon_D30AT_veh: cannon_120mm {
        EGVAR(overpressure,offset) = 2;
    };
    class weapon_ShipCannon_120mm;
    class CUP_Vmortar_M121: weapon_ShipCannon_120mm {
        EGVAR(overpressure,offset) = 0.6;
    };


    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class CUP_optic_1P87_1P90_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 5.89907;
    };

    class CUP_optic_1P87_1P90_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.89907;
    };

    class CUP_optic_1P87_RIS: ItemCore {
        ace_ScopeHeightAboveRail = 5.89907;
    };

    class CUP_optic_1p63: ItemCore {
        ace_ScopeHeightAboveRail = 5.26527;
    };

    class CUP_optic_AC11704_Black: ItemCore {
        ace_ScopeHeightAboveRail = 4.22284;
    };

    class CUP_optic_ACOG: ItemCore {
        ace_ScopeHeightAboveRail = 4.49234;
    };

    class CUP_optic_ACOG_3D: ItemCore {
        ace_ScopeHeightAboveRail = 4.49234;
    };

    class CUP_optic_ACOG_TA01NSN_Black_3D: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA01NSN_RMR_Black: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA01NSN_RMR_Black_3D: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA01B_Black: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA01B_Black_3D: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA01B_RMR_Black: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA01B_RMR_Black_3D: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_ACOG_TA648_308_Black: ItemCore {
        ace_ScopeHeightAboveRail = -0.421926;
    };

    class CUP_optic_ACOG_TA648_308_RDS_Black: ItemCore {
        ace_ScopeHeightAboveRail = -0.988276;
    };

    class CUP_optic_AIMM_COMPM2_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };

    class CUP_optic_AIMM_COMPM2_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };

    class CUP_optic_AIMM_COMPM2_OD: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };

    class CUP_optic_AIMM_COMPM2_OD_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };

    class CUP_optic_AIMM_COMPM2_TAN: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };

    class CUP_optic_AIMM_COMPM2_TAN_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };

    class CUP_optic_AIMM_COMPM4_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 4.22769;
    };

    class CUP_optic_AIMM_COMPM4_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.22769;
    };

    class CUP_optic_AIMM_M68_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_AIMM_M68_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_AIMM_M68_TAN: ItemCore {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_AIMM_M68_TAN_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_AIMM_M68_OD: ItemCore {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_AIMM_M68_OD_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_AIMM_MARS_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_AIMM_MARS_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_AIMM_MARS_TAN: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_AIMM_MARS_TAN_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_AIMM_MARS_OD: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_AIMM_MARS_OD_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_AIMM_MICROT1_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };

    class CUP_optic_AIMM_MICROT1_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };

    class CUP_optic_AIMM_MICROT1_TAN: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };

    class CUP_optic_AIMM_MICROT1_TAN_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };

    class CUP_optic_AIMM_MICROT1_OD: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };

    class CUP_optic_AIMM_MICROT1_OD_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };

    class CUP_optic_AIMM_ZDDOT_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 2.87389;
    };

    class CUP_optic_AIMM_ZDDOT_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 2.87389;
    };

    class CUP_optic_AMO_PCAP: ItemCore {
        ace_ScopeHeightAboveRail = 6.37684;
    };

    class CUP_optic_AN_PAS_13c1: ItemCore {
        ace_ScopeHeightAboveRail = 9.04382;
    };

    class CUP_optic_AN_PAS_13c2: ItemCore {
        ace_ScopeHeightAboveRail = 5.98104;
    };

    class CUP_optic_AN_PVS_4: ItemCore {
        ace_ScopeZeroRange = 100;
        ace_ScopeAdjust_HorizontalIncrement = 0;
        ace_ScopeAdjust_Horizontal[] = {0,0};
        ace_ScopeAdjust_VerticalIncrement = 0;
        ace_ScopeAdjust_Vertical[] = {0,0};
        ace_ScopeHeightAboveRail = 5.54325;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ANPVS4 {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class CUP_optic_AN_PVS_4_M14: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0;
        ace_ScopeAdjust_Horizontal[] = {0,0};
        ace_ScopeAdjust_VerticalIncrement = 0;
        ace_ScopeAdjust_Vertical[] = {0,0};
        ace_ScopeHeightAboveRail = 5.54325;
    };

    class CUP_optic_AN_PVS_4_M16: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0;
        ace_ScopeAdjust_Horizontal[] = {0,0};
        ace_ScopeAdjust_VerticalIncrement = 0;
        ace_ScopeAdjust_Vertical[] = {0,0};
        ace_ScopeHeightAboveRail = 5.54325;
    };

    class CUP_optic_Aimpoint_5000: ItemCore {
        ace_ScopeHeightAboveRail = 3.02758;
    };

    class CUP_optic_AN_PVS_10: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 2.5;
    };

    class CUP_optic_artel_m14: ItemCore {
        ace_ScopeHeightAboveRail = 4.60876;
    };

    class CUP_optic_CWS: ItemCore {
        ace_ScopeHeightAboveRail = 6.27351;
    };

    class CUP_optic_CWS_NV: ItemCore {
        ace_ScopeHeightAboveRail = 6.27351;
    };

    class CUP_optic_CompM2_Black: ItemCore {
        ace_ScopeHeightAboveRail = 5.49649;
    };
    class CUP_optic_CompM2_low: CUP_optic_CompM2_Black {
        ace_ScopeHeightAboveRail = 4.51236;
    };
    class CUP_optic_CompM2_low_OD: CUP_optic_CompM2_Black {
        ace_ScopeHeightAboveRail = 4.51236;
    };
    class CUP_optic_CompM2_low_coyote: CUP_optic_CompM2_Black {
        ace_ScopeHeightAboveRail = 4.51236;
    };

    class CUP_optic_CompM4: ItemCore {
        ace_ScopeHeightAboveRail = 4.22769;
    };

    class CUP_optic_ekp_8_02: ItemCore {
        ace_ScopeHeightAboveRail = 9.10403;
    };

    class CUP_optic_Elcan: ItemCore {
        ace_ScopeHeightAboveRail = 4.17443;
    };

    class CUP_optic_Elcan_3D: ItemCore {
        ace_ScopeHeightAboveRail = 4.17443;
    };

    class CUP_optic_ElcanM145: ItemCore {
        ace_ScopeHeightAboveRail = 5.18802;
    };

    class CUP_optic_ElcanM145_3D: ItemCore {
        ace_ScopeHeightAboveRail = 5.18802;
    };

    class CUP_optic_Elcan_SpecterDR: ItemCore {
        ace_ScopeHeightAboveRail = 4.64101;
    };

    class CUP_optic_HoloBlack: ItemCore {
        ace_ScopeHeightAboveRail = 4.45865;
    };

    class CUP_optic_Eotech533: CUP_optic_HoloBlack {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_BLK: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_BLK_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_TAN: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_TAN_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_OD: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_OD_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_COYOTE: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G33_HWS_COYOTE_DWN: ItemCore {
        ace_ScopeHeightAboveRail = 4.52949;
    };

    class CUP_optic_G36DualOptics: ItemCore {
        ace_ScopeHeightAboveRail = 14.1273;
    };

    class CUP_optic_G36Optics: ItemCore {
        ace_ScopeHeightAboveRail = 14.1273;
    };

    class CUP_optic_G36Optics15x: ItemCore {
        ace_ScopeHeightAboveRail = 14.1273;
    };

    class CUP_optic_G36Optics_Holo: ItemCore {
        ace_ScopeHeightAboveRail = 14.1273;
    };

    class CUP_optic_G36Optics_RDS: ItemCore {
        ace_ScopeHeightAboveRail = 14.1273;
    };

    class CUP_optic_GOSHAWK: ItemCore {
        ace_ScopeHeightAboveRail = 10.1349;
    };

    class CUP_optic_GOSHAWK_RIS: CUP_optic_GOSHAWK {
        ace_ScopeHeightAboveRail = 5.71584;
    };

    class CUP_optic_GrozaScope: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 2.4;
    };

    class CUP_optic_HensoldtZO: ItemCore {
        ace_ScopeHeightAboveRail = 4.34664;
    };

    class CUP_optic_HensoldtZO_low: CUP_optic_HensoldtZO {
        ace_ScopeHeightAboveRail = 3.3;
    };

    class CUP_optic_HensoldtZO_low_3D;
    class CUP_optic_HensoldtZO_low_desert_3D: CUP_optic_HensoldtZO_low_3D {
        ace_ScopeHeightAboveRail = 4.34664;
    };
    class CUP_optic_HensoldtZO_low_hex_3D: CUP_optic_HensoldtZO_low_3D {
        ace_ScopeHeightAboveRail = 4.34664;
    };
    class CUP_optic_HensoldtZO_low_coyote_3D: CUP_optic_HensoldtZO_low_3D {
        ace_ScopeHeightAboveRail = 4.34664;
    };
    class CUP_optic_HensoldtZO_low_od_3D: CUP_optic_HensoldtZO_low_3D {
        ace_ScopeHeightAboveRail = 4.34664;
    };

    class CUP_optic_ISM1400A7: ItemCore {
        ace_ScopeHeightAboveRail = 4.73835;
    };

    class CUP_optic_ISM_PCAP: ItemCore {
        ace_ScopeHeightAboveRail = 5.15111;
    };

    class CUP_optic_Kobra: ItemCore {
        ace_ScopeHeightAboveRail = 7.38029;
    };

    class CUP_optic_LeupoldM3LR: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 4.75556;
    };

    class CUP_optic_LeupoldMk4: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 3.9;
    };

    class CUP_optic_LeupoldMk4_20x40_LRT: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 4.75556;
    };

    class CUP_optic_LeupoldMk4_25x50_LRT: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 4.2;
    };

    class CUP_optic_LeupoldMk4_CQ_T: ItemCore {
        ace_ScopeHeightAboveRail = 4.82012;
    };

    class CUP_optic_LeupoldMk4_MRT_tan: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 3.1311;
    };

    class CUP_optic_Leupold_VX3: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 4.3;
    };

    class CUP_optic_MARS: ItemCore {
        ace_ScopeHeightAboveRail = 5.85967;
    };

    class CUP_optic_MEPRO: ItemCore {
        ace_ScopeHeightAboveRail = 4.45363;
    };

    class CUP_optic_MRad: ItemCore {
        ace_ScopeHeightAboveRail = 2.77934;
    };

    class CUP_optic_MicroT1: ItemCore {
        ace_ScopeHeightAboveRail = 4.44613;
    };
    class CUP_optic_MicroT1_low: CUP_optic_MicroT1 {
        ace_ScopeHeightAboveRail = 2.94613;
    };
    class CUP_optic_MicroT1_low_OD: CUP_optic_MicroT1 {
        ace_ScopeHeightAboveRail = 2.94613;
    };
    class CUP_optic_MicroT1_low_coyote: CUP_optic_MicroT1 {
        ace_ScopeHeightAboveRail = 2.94613;
    };

    class CUP_optic_no23mk2: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 2.1;
    };

    class CUP_optic_NSPU: ItemCore {
        ace_ScopeHeightAboveRail = 10.5413;
    };

    class CUP_optic_OKP_7: ItemCore {
        ace_ScopeHeightAboveRail = 7.1017;
    };

    class CUP_optic_OKP_7_rail: ItemCore {
        ace_ScopeHeightAboveRail = 1.01974;
    };

    class CUP_optic_PEM: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 4.96232;
    };

    class CUP_optic_PEM_3D: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 4.96278;
    };

    class CUP_optic_PGO7V: ItemCore {
        ace_ScopeHeightAboveRail = 5.19093;
    };
    class CUP_optic_NSPU_RPG: CUP_optic_PGO7V {
        ace_ScopeHeightAboveRail = 9.88603;
    };

    class CUP_optic_PSO_1: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 7.68535;
    };

    class CUP_optic_PSO_1_open: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 7.68535;
    };

    class CUP_optic_PSO_1_AK: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail =8.40594;
    };

    class CUP_optic_PSO_1_AK_open: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 6.18207;
    };

    class CUP_optic_PSO_1_1: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 7.68535;
    };

    class CUP_optic_PSO_1_1_open: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 7.68535;
    };

    class CUP_optic_PSO_3: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 7.63919;
    };

    class CUP_optic_PSO_3_open: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.5;
        ace_ScopeAdjust_Horizontal[] = {-10, 10};
        ace_ScopeAdjust_VerticalIncrement = 0.5;
        ace_ScopeAdjust_Vertical[] = {0, 0};
        ace_ScopeHeightAboveRail = 7.63919;
    };

    class CUP_optic_PechenegScope: ItemCore {
        ace_ScopeHeightAboveRail = 8.3192;
    };

    class CUP_optic_PechenegScope_3D: ItemCore {
        ace_ScopeHeightAboveRail = 8.3192;
    };

    class CUP_optic_RCO: ItemCore {
        ace_ScopeHeightAboveRail = 4.685;
    };

    class CUP_optic_RCO_PCAP: ItemCore {
        ace_ScopeHeightAboveRail = 5.21531;
    };

    class CUP_optic_Remington: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 2.79768;
    };

    class CUP_optic_SB_3_12x50_PMII: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-6, 6};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-4, 30};
        ace_ScopeHeightAboveRail = 4.5;
    };

    class CUP_optic_SB_11_4x20_PM: ItemCore {
        ace_ScopeAdjust_HorizontalIncrement = 0.1;
        ace_ScopeAdjust_Horizontal[] = {-5.1, 5.1};
        ace_ScopeAdjust_VerticalIncrement = 0.1;
        ace_ScopeAdjust_Vertical[] = {-0.1, 10.1};
        ace_ScopeHeightAboveRail = 3.96246;
    };

    class CUP_optic_SERedDot: ItemCore {
        ace_ScopeHeightAboveRail = 0.560472;
    };

    class CUP_optic_SUSAT: ItemCore {
        ace_ScopeHeightAboveRail = 5.79787;
    };

    class CUP_optic_SUSAT_3D: ItemCore {
        ace_ScopeHeightAboveRail = 5.79787;
    };

    class CUP_optic_TrijiconRx01_desert: ItemCore {
        ace_ScopeHeightAboveRail = 5.14944;
    };

    class CUP_optic_VortexRazor_UH1_Black: ItemCore {
        ace_ScopeHeightAboveRail = 4.21245;
    };

    class CUP_optic_ZDDot: ItemCore {
        ace_ScopeHeightAboveRail = 2.87389;
    };

    class CUP_optic_ZeissZPoint: ItemCore {
        ace_ScopeHeightAboveRail = 2.75748;
    };
};

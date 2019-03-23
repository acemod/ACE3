class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
    class LMG_RCWS;
    class MGun;
    class MGunCore;
    class MMG_01_base_F;
    class MMG_02_base_F;
    class Rifle_Base_F;
    class Rifle_Short_Base_F: Rifle_Base_F {};
    class Rifle_Long_Base_F: Rifle_Base_F {};

    // GM6 Lynx
    class GM6_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.45);
        };
    };

    // M200 Intervention
    class LRR_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.50);
        };
    };

    // MX
    class arifle_MX_Base_F: Rifle_Base_F {
        magazineWell[] = {"CBA_65x39_MX", "CBA_65x39_MX_XL"};

        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // KH2002 Sama
    class arifle_katiba_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // CTAR-21
    class Tavor_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // F2000
    class mk20_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // P90 (1.86)
    class SMG_03_TR_BASE: Rifle_Base_F {
        ACE_barrelTwist = 228.6; // 1:9 inch twist
        ACE_barrelLength = 407;
        ACE_twistDirection = 1;
        modes[] = {"Single"};
    };
    class SMG_03C_BASE: SMG_03_TR_BASE {
        ACE_barrelLength = 264;
        modes[] = {"Single", "FullAuto"};
    };

    // Noreen "Bad News" ULR
    class DMR_02_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.61);
        };
    };

    // VS-121
    class DMR_01_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // Mk14 Mod 1 EBR
    class EBR_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // SIG 556
    class DMR_03_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // ASP-1 Kir
    class DMR_04_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.0);
        };
    };

    // Cyrus
    class DMR_05_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.67);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.67);
        };
    };

    // M14
    class DMR_06_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // MX LSW
    class arifle_MX_SW_F: arifle_MX_Base_F {
        magazines[] = {
            "100Rnd_65x39_caseless_mag_Tracer",
            "100Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_100Rnd_65x39_caseless_mag_Tracer_Dim",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.981912;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 406.4;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // MXM
    class arifle_MXM_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",
            "ACE_30Rnd_65x47_Scenar_mag",
            "ACE_30Rnd_65_Creedmor_mag"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 457.2;
        class Single: Single {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // HK416A5 11"
    class arifle_SPAR_01_base_F: Rifle_Base_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_green",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -0.869636;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 264.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // HK416A5 14.5"
    class arifle_SPAR_02_base_F: Rifle_Base_F {
        initSpeed = -0.999864;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // HK417A2 20"
    class arifle_SPAR_03_base_F: Rifle_Base_F {
        magazines[] = {
            "20Rnd_762x51_Mag",
            "ACE_20Rnd_762x51_Mag_Tracer",
            "ACE_20Rnd_762x51_Mag_Tracer_Dim",
            "ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
            "ACE_20Rnd_762x51_M118LR_Mag",
            "ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
            "ACE_20Rnd_762x51_M993_AP_Mag",
            "ACE_20Rnd_762x51_Mag_SD"
        };
        initSpeed = -0.991536;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 508.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // Stoner 99 LMG
    class LMG_Mk200_F: Rifle_Long_Base_F {
        magazines[] = {
            "200Rnd_65x39_cased_Box",
            "200Rnd_65x39_cased_Box_Tracer",
            "ACE_200Rnd_65x39_cased_Box_Tracer_Dim"
        };
        initSpeed = -0.999327;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 317.5;
    };

    // Negev NG7
    class LMG_Zafir_F: Rifle_Long_Base_F {
        initSpeed = -1.00048;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 459.74;
    };

    // M249 SPW
    class LMG_03_base_F: Rifle_Long_Base_F {
        initSpeed = -1.00051;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 414.02;
    };

    // RFB SDAR
    class SDAR_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(3.0);
        };

        class Burst: Mode_Burst {
            dispersion = MOA_TO_RAD(3.0);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(3.0);
        };
    };

    class Pistol;
    class Pistol_Base_F: Pistol {};

    // P99
    class hgun_P07_F: Pistol_Base_F {
        initSpeed = -0.906977;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 101.6;
    };

    // MP-443 Grach
    class hgun_Rook40_F: Pistol_Base_F {
        initSpeed = -0.934884;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 111.76;
    };

    // Custom Covert II
    class hgun_ACPC2_F: Pistol_Base_F {
        initSpeed = -0.984252;
        ACE_barrelTwist = 406.4;
        ACE_barrelLength = 127.0;
    };

    // FNX-45 Tactical
    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        initSpeed = -0.944882;
        ACE_barrelTwist = 406.4;
        ACE_barrelLength = 114.3;
    };

    // Chiappa Rhino 60DS
    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        initSpeed = -0.905512;
        ACE_barrelTwist = 406.4;
        ACE_barrelLength = 76.2;
    };

    // Makarov PM
    class hgun_Pistol_01_F: Pistol_Base_F {
        initSpeed = -0.883721;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 93.5;
    };

    class pdw2000_base_F: Rifle_Short_Base_F {};

    // CPW
    class hgun_PDW2000_F: pdw2000_base_F {
        initSpeed = -0.994186;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 177.8;
    };

    // AKS
    class arifle_AKS_base_F: Rifle_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 160.02;
        ACE_barrelLength = 206.5;
    };

    // AKM
    class arifle_AKM_base_F: Rifle_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };

    // AK12
    class arifle_AK12_base_F: Rifle_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };

    // QBZ-95-1
    class arifle_CTAR_base_F: Rifle_Base_F {
        initSpeed = -0.978947;
        ACE_barrelTwist = 244.0;
        ACE_barrelLength = 463.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // QBU-88
    class DMR_07_base_F: Rifle_Long_Base_F {
        initSpeed = -0.99998;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 640.0;
        magazines[] = {
            "20Rnd_650x39_Cased_Mag_F",
            "ACE_20Rnd_65x47_Scenar_mag",
            "ACE_20Rnd_65_Creedmor_mag"
        };
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.01);
        };
    };

    // QBZ-95-1 LSW
    class arifle_CTARS_base_F: Rifle_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 244.0;
        ACE_barrelLength = 600.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // Type 115
    class arifle_ARX_base_F: Rifle_Base_F {
        initSpeed = -0.984262;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 463.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // KH2002 Sama
    class arifle_Katiba_F: arifle_katiba_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_green",
            "30Rnd_65x39_caseless_green_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 203.2;
        ACE_barrelLength = 508.0;
    };

    // KH2002C Sama
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_green",
            "30Rnd_65x39_caseless_green_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim"
        };
        initSpeed = -0.961294;
        ACE_barrelTwist = 203.2;
        ACE_barrelLength = 393.7;
        class Single: Single {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // KH2002 Sama KGL
    class arifle_Katiba_GL_F: arifle_katiba_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_green",
            "30Rnd_65x39_caseless_green_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 203.2;
        ACE_barrelLength = 508.0;
    };

    // MX
    class arifle_MX_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.972222;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 368.3;
    };

    // MX 3GL
    class arifle_MX_GL_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.972222;
        ACE_barrelTwist = 228.6;
        ACE_barrelLength = 368.3;
    };

    // MXC
    class arifle_MXC_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.946382;
        ACE_barrelTwist = 203.2;
        ACE_barrelLength = 266.7;
        class Single: Single {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // RFB SDAR
    class arifle_SDAR_F: SDAR_base_F {
        magazines[] = {
            "20Rnd_556x45_UW_mag",
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -0.998321;
        ACE_barrelTwist = 285.75;
        ACE_barrelLength = 457.2;
    };

    class SMG_02_base_F: Rifle_Short_Base_F  {};

    // Scorpion Evo 3 A1
    class SMG_02_F: SMG_02_base_F  {
        initSpeed = -1.00029;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 195.58;
    };

    // MP5K
    class SMG_05_base_F: Rifle_Short_Base_F {
        initSpeed = -0.943783;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 115.0;
    };

    // CTAR-21
    class arifle_TRG20_F: Tavor_base_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -0.961496;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 381.0;
    };

    // TAR-21
    class arifle_TRG21_F: Tavor_base_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 459.74;
        class Single: Single {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // TAR-21 EGLM
    class arifle_TRG21_GL_F: arifle_TRG21_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 459.74;
    };

    // F2000
    class arifle_Mk20_F: mk20_base_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -0.992849;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 441.96;
    };

    // F2000 Tactical
    class arifle_Mk20C_F: mk20_base_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -0.974297;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 406.4;
        class Single: Single {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // F2000 EGLM
    class arifle_Mk20_GL_F: mk20_base_F {
        magazines[] = {
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow",
            "30Rnd_556x45_Stanag_red",
            "30Rnd_556x45_Stanag_green",
            "ACE_30Rnd_556x45_Stanag_M995_AP_mag",
            "ACE_30Rnd_556x45_Stanag_Mk262_mag",
            "ACE_30Rnd_556x45_Stanag_Mk318_mag",
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim"
        };
        initSpeed = -0.974297;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 406.4;
    };

    class SMG_01_Base: Rifle_Short_Base_F {};

    // Vector SMG
    class SMG_01_F: SMG_01_Base {
        initSpeed = -1.00148;
        ACE_barrelTwist = 406.4;
        ACE_barrelLength = 139.7;
    };

    // VS-121
    class srifle_DMR_01_F: DMR_01_base_F {
        magazines[] = {
            "10Rnd_762x54_Mag",
            "ACE_10Rnd_762x54_Tracer_mag"
        };
        initSpeed = -1.00019;
        ACE_barrelTwist = 241.3;
        ACE_barrelLength = 609.6;
    };

    // Mk14 Mod 1 EBR
    class srifle_EBR_F: EBR_base_F {
        magazines[] = {
            "20Rnd_762x51_Mag",
            "ACE_20Rnd_762x51_Mag_Tracer",
            "ACE_20Rnd_762x51_Mag_Tracer_Dim",
            "ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
            "ACE_20Rnd_762x51_M118LR_Mag",
            "ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
            "ACE_20Rnd_762x51_M993_AP_Mag",
            "ACE_20Rnd_762x51_Mag_SD"
        };
        initSpeed = -0.979444;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 457.2;
    };

    // M200 Intervention
    class srifle_LRR_F: LRR_base_F {
        magazines[] = {
            "7Rnd_408_Mag",
            "ACE_7Rnd_408_305gr_Mag"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 330.2;
        ACE_barrelLength = 736.6;
    };

    // GM6 Lynx
    class srifle_GM6_F: GM6_base_F {
        magazines[] = {
            "5Rnd_127x108_Mag",
            "5Rnd_127x108_APDS_Mag",
            "ACE_5Rnd_127x99_Mag",
            "ACE_5Rnd_127x99_API_Mag",
            "ACE_5Rnd_127x99_AMAX_Mag"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 730;
    };

    // Noreen "Bad News" ULR
    class srifle_DMR_02_F: DMR_02_base_F {
        magazines[] = {
            "10Rnd_338_Mag",
            "ACE_10Rnd_338_300gr_HPBT_Mag",
            "ACE_10Rnd_338_API526_Mag",
            "ACE_20Rnd_762x67_Mk248_Mod_0_Mag",
            "ACE_20Rnd_762x67_Mk248_Mod_1_Mag",
            "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag"
        };
        initSpeed = -1.0;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 508.0;
    };

    // SIG 556
    class srifle_DMR_03_F: DMR_03_base_F {
        magazines[] = {
            "20Rnd_762x51_Mag",
            "ACE_20Rnd_762x51_Mag_Tracer",
            "ACE_20Rnd_762x51_Mag_Tracer_Dim",
            "ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
            "ACE_20Rnd_762x51_M118LR_Mag",
            "ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
            "ACE_20Rnd_762x51_M993_AP_Mag",
            "ACE_20Rnd_762x51_Mag_SD"
        };
        initSpeed = -0.991536;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 508.0;
    };

    // ASP-1 Kir
    class srifle_DMR_04_F: DMR_04_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 203.2;
        ACE_barrelLength = 450.088;
    };

    // Cyrus
    class srifle_DMR_05_blk_F: DMR_05_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 359.918;
        ACE_barrelLength = 620.014;
    };

    // M14
    class srifle_DMR_06_camo_F: DMR_06_base_F {
        magazines[] = {
            "20Rnd_762x51_Mag",
            "ACE_20Rnd_762x51_Mag_Tracer",
            "ACE_20Rnd_762x51_Mag_Tracer_Dim",
            "ACE_20Rnd_762x51_Mk316_Mod_0_Mag",
            "ACE_20Rnd_762x51_M118LR_Mag",
            "ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
            "ACE_20Rnd_762x51_M993_AP_Mag",
            "ACE_20Rnd_762x51_Mag_SD"
        };
        initSpeed = -0.999395;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 558.8;
    };

    // HK121
    class MMG_01_hex_F: MMG_01_base_F {
        initSpeed = -0.985613;
        ACE_barrelTwist = 359.918;
        ACE_barrelLength = 549.91;
    };

    // LWMMG
    class MMG_02_camo_F: MMG_02_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist = 234.95;
        ACE_barrelLength = 609.6;
    };

    class HMG_127 : LMG_RCWS {
    };
    class HMG_01: HMG_127 {
    };
    class HMG_M2: HMG_01 {
        initSpeed = -1.0;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 1143.0;
    };

    /* Silencers */

    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    class muzzle_snds_H: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_L: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_M: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_B: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_H_MG: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_H_SW: muzzle_snds_H_MG {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_acp: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_338_black: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_93mmg: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };
};

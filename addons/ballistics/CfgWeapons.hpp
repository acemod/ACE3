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
    class MuzzleSlot;

    /* Long Rifles */

    class GM6_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };
    };

    class LRR_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00020; // radians. Equal to 0.70 MOA.
        };
    };

    class DMR_06_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };
    };

    class DMR_05_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };
    };

    class DMR_04_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };
    };

    class DMR_03_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00032; // radians. Equal to 1.10 MOA.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00032; // radians. Equal to 1.10 MOA.
        };
    };

    class DMR_02_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.000262; // radians. Equal to 0.90 MOA.
        };
    };

    class DMR_01_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.0004; // radians. Equal to 1.375 MOA.
        };
    };

    class EBR_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00029; // radians. Equal to 1.00 MOA.
        };
    };

    /* MX */

    class arifle_MX_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {};
        class FullAuto: Mode_FullAuto {};
    };
    class arifle_MX_SW_F: arifle_MX_Base_F {
        magazines[] = {
            "100Rnd_65x39_caseless_mag_Tracer",
            "100Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_100Rnd_65x39_caseless_mag_Tracer_Dim",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -1.0;
        ACE_barrelTwist=228.6;
        ACE_barrelLength=406.4;
    };
    class arifle_MXM_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",
            "ACE_30Rnd_65x47_Scenar_mag",
            "ACE_30Rnd_65_Creedmor_mag"
        };
        initSpeed = -1.018;
        ACE_barrelTwist=228.6;
        ACE_barrelLength=457.2;
        class Single: Single {
            dispersion = 0.000436; // radians. Equal to 1.50 MOA.
        };

        class FullAuto: FullAuto {
            dispersion = 0.000436; // radians. Equal to 1.50 MOA.
        };
    };


    /* Katiba */
    class arifle_katiba_Base_F: Rifle_Base_F {};

    /* SPAR */
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
    };
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
    };

    /* Other */
    class LMG_Mk200_F: Rifle_Long_Base_F {
        magazines[] = {
            "200Rnd_65x39_cased_Box",
            "200Rnd_65x39_cased_Box_Tracer",
            "ACE_200Rnd_65x39_cased_Box_Tracer_Dim"
        };
        initSpeed = -0.9763;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=317.5;
    };
    class LMG_Zafir_F: Rifle_Long_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=304.8;
        ACE_barrelLength=459.74;
    };
    class Tavor_base_F: Rifle_Base_F {};
    class mk20_base_F: Rifle_Base_F {};

    /* SMGs */
    class SDAR_base_F: Rifle_Base_F {
        initSpeed = -0.989;
        class Single: Mode_SemiAuto {
            dispersion = 0.0008727; // radians. Equal to 3 MOA.
        };

        class Burst: Mode_Burst {
            dispersion = 0.0008727; // radians. Equal to 3 MOA.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.0008727; // radians. Equal to 3 MOA.
        };
    };
    class pdw2000_base_F: Rifle_Short_Base_F {};
    class SMG_01_Base: Rifle_Short_Base_F {};
    class SMG_02_base_F: Rifle_Base_F {};

    /* Pistols */

    class Pistol;
    class Pistol_Base_F: Pistol {};

    class hgun_P07_F: Pistol_Base_F {
        initSpeed = -0.9778;
        ACE_barrelTwist=254.0;
        ACE_barrelLength=101.6;
    };

    class hgun_Rook40_F: Pistol_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=254.0;
        ACE_barrelLength=111.76;
    };

    class hgun_ACPC2_F: Pistol_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=406.4;
        ACE_barrelLength=127.0;
    };

    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        initSpeed = -0.96;
        ACE_barrelTwist=406.4;
        ACE_barrelLength=114.3;
    };

    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        initSpeed = -0.92;
        ACE_barrelTwist=406.4;
        ACE_barrelLength=76.2;
    };
    class hgun_PDW2000_F: pdw2000_base_F {
        initSpeed = -1.157;
        ACE_barrelTwist=228.6;
        ACE_barrelLength=177.8;
    };
    class arifle_Katiba_F: arifle_katiba_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_green",
            "30Rnd_65x39_caseless_green_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim"
        };
        initSpeed = -1.08;
        ACE_barrelTwist=203.2;
        ACE_barrelLength=728.98;
    };
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_green",
            "30Rnd_65x39_caseless_green_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim"
        };
        initSpeed = -1.07;
        ACE_barrelTwist=203.2;
        ACE_barrelLength=680.72;
    };
    class arifle_Katiba_GL_F: arifle_katiba_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_green",
            "30Rnd_65x39_caseless_green_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim"
        };
        initSpeed = -1.08;
        ACE_barrelTwist=203.2;
        ACE_barrelLength=728.98;
    };
    class arifle_MX_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.99;
        ACE_barrelTwist=228.6;
        ACE_barrelLength=368.3;
    };
    class arifle_MX_GL_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.99;
        ACE_barrelTwist=228.6;
        ACE_barrelLength=368.3;
    };
    /*
    class arifle_MX_SW_F: arifle_MX_Base_F {
        ACE_barrelTwist=228.6;
        ACE_barrelLength=406.4;
    };
    */
    class arifle_MXC_F: arifle_MX_Base_F {
        magazines[] = {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer",
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim"
        };
        initSpeed = -0.965;
        ACE_barrelTwist=203.2;
        ACE_barrelLength=266.7;
    };
    /*
    class arifle_MXM_F: arifle_MX_Base_F {
        ACE_barrelTwist=228.6;
        ACE_barrelLength=457.2;
    };
    */
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
        initSpeed = -0.989;
        ACE_barrelTwist=285.75;
        ACE_barrelLength=457.2;
    };
    class SMG_02_F: SMG_02_base_F {
        initSpeed = -1.054;
        ACE_barrelTwist=254.0;
        ACE_barrelLength=195.58;
    };
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
        initSpeed = -0.95;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=381.0;
    };
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
        initSpeed = -0.989;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=459.74;
    };
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
        initSpeed = -0.989;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=459.74;
    };
    /*
    class LMG_Zafir_F: Rifle_Long_Base_F {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=459.74;
    };
    */
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
        initSpeed = -0.98;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=441.96;
    };
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
        initSpeed = -0.956;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=406.4;
    };
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
        initSpeed = -0.956;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=406.4;
    };
    class SMG_01_F: SMG_01_Base {
        initSpeed = -1.016;
        ACE_barrelTwist=406.4;
        ACE_barrelLength=139.7;
    };
    class srifle_DMR_01_F: DMR_01_base_F {
        magazines[] = {
            "10Rnd_762x54_Mag",
            "ACE_10Rnd_762x54_Tracer_mag"
        };
        initSpeed = -1.025;
        ACE_barrelTwist=241.3;
        ACE_barrelLength=609.6;
    };
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
        initSpeed = -0.9724;
        ACE_barrelTwist=304.8;
        ACE_barrelLength=457.2;
    };
    /*
    class LMG_Mk200_F: Rifle_Long_Base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=177.8;
        ACE_barrelLength=317.5;
    };
    */
    class srifle_LRR_F: LRR_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=330.2;
        ACE_barrelLength=736.6;
    };
    class srifle_GM6_F: GM6_base_F {
        magazines[] = {
            "5Rnd_127x108_Mag",
            "5Rnd_127x108_APDS_Mag",
            "ACE_5Rnd_127x99_Mag",
            "ACE_5Rnd_127x99_API_Mag",
            "ACE_5Rnd_127x99_AMAX_Mag"
        };
        initSpeed = -1.0;
        ACE_barrelTwist=381.0;
        ACE_barrelLength=730;
    };
    class srifle_DMR_02_F: DMR_02_base_F {
        magazines[] = {
            "10Rnd_338_Mag",
            "ACE_10Rnd_338_300gr_HPBT_Mag",
            "ACE_10Rnd_338_API526_Mag",
            "ACE_20Rnd_762x67_Mk248_Mod_0_Mag",
            "ACE_20Rnd_762x67_Mk248_Mod_1_Mag",
            "ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag"
        };
        initSpeed = -0.962;
        ACE_barrelTwist=254.0;
        ACE_barrelLength=508.0;
    };
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
        initSpeed = -0.9843;
        ACE_barrelTwist=254.0;
        ACE_barrelLength=508.0;
    };
    class srifle_DMR_04_F: DMR_04_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=203.2;
        ACE_barrelLength=450.088;
    };
    class srifle_DMR_05_blk_F: DMR_05_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=359.918;
        ACE_barrelLength=620.014;
    };
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
        initSpeed = -0.9916;
        ACE_barrelTwist=304.8;
        ACE_barrelLength=558.8;
    };
    class MMG_01_hex_F: MMG_01_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=359.918;
        ACE_barrelLength=549.91;
    };
    class MMG_02_camo_F: MMG_02_base_F {
        initSpeed = -1.0;
        ACE_barrelTwist=234.95;
        ACE_barrelLength=609.6;
    };

    class HMG_127 : LMG_RCWS {
    };
    class HMG_01: HMG_127 {
    };
    class HMG_M2: HMG_01 {
        initSpeed = -1.0;
        ACE_barrelTwist=304.8;
        ACE_barrelLength=1143.0;
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

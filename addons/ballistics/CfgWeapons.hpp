class CfgWeapons {
    class HMG_01;
    class Pistol_Base_F;
    class Rifle_Base_F;
    class Rifle_Short_Base_F: Rifle_Base_F {};
    class Rifle_Long_Base_F: Rifle_Base_F {};

    // Rifle_Long_Base_F Sniper Marksman
    // GM6 Lynx
    class GM6_base_F: Rifle_Long_Base_F {};
    class srifle_GM6_F: GM6_base_F {
        ACE_barrelLength = 730;
        ACE_barrelTwist = 381.0;
        initSpeed = -1.0;
        magazineWell[] += {
            "CBA_50BMG_AS50"
        }; // empty in vanilla
    };

    // M200 Intervention
    class LRR_base_F: Rifle_Long_Base_F {};
    class srifle_LRR_F: LRR_base_F {
        ACE_barrelLength = 736.6;
        ACE_barrelTwist = 330.2;
        initSpeed = -1.0;
        magazineWell[] += {
            "CBA_408CT_Inter"
        }; // vanilla magazineWell[] = {"M320_408"};
    };

    // Mk14 Mod 1 EBR
    class EBR_base_F: Rifle_Long_Base_F {};
    class srifle_EBR_F: EBR_base_F {
        ACE_barrelLength = 457.2;
        ACE_barrelTwist = 304.8;
        initSpeed = -0.979444;
    };

    // VS-121
    class DMR_01_base_F: Rifle_Long_Base_F {};
    class srifle_DMR_01_F: DMR_01_base_F {
        ACE_barrelLength = 609.6;
        ACE_barrelTwist = 241.3;
        initSpeed = -1.00019;
    };

    // Noreen "Bad News" ULR
    class DMR_02_base_F: Rifle_Long_Base_F {};
    class srifle_DMR_02_F: DMR_02_base_F {
        ACE_barrelLength = 508.0;
        ACE_barrelTwist = 254.0;
        initSpeed = -1.0;
    };

    // SIG 556
    class DMR_03_base_F: Rifle_Long_Base_F {};
    class srifle_DMR_03_F: DMR_03_base_F {
        ACE_barrelLength = 508.0;
        ACE_barrelTwist = 254.0;
        initSpeed = -0.991536;
        magazineWell[] += {
            "CBA_762x51_SR25"
        }; // vanilla magazineWell[] = {"M14_762x51"};
    };

    // ASP-1 Kir
    class DMR_04_base_F: Rifle_Long_Base_F {};
    class srifle_DMR_04_F: DMR_04_base_F {
        ACE_barrelLength = 450.088;
        ACE_barrelTwist = 203.2;
        initSpeed = -1.0;
    };

    // Cyrus
    class DMR_05_base_F: Rifle_Long_Base_F {};
    class srifle_DMR_05_blk_F: DMR_05_base_F {
        ACE_barrelLength = 620.0;
        ACE_barrelTwist = 360.0;
        initSpeed = -1.0; // 780 m/s according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C)
    };

    // M14
    class DMR_06_base_F: Rifle_Long_Base_F {
        ACE_barrelLength = 558.8;
        ACE_barrelTwist = 304.8;
        initSpeed = -0.999395;
    };

    // QBU-88
    class DMR_07_base_F: Rifle_Long_Base_F {
        ACE_barrelLength = 640.0;
        ACE_barrelTwist = 206; // https://en.wikipedia.org/wiki/QBU-88
        initSpeed = -1;
        magazines[] += { //No Vanilla magwell
            "ACE_20Rnd_65x47_Scenar_mag",
            "ACE_20Rnd_65_Creedmor_mag",
            "ACE_10Rnd_580x42_DBP88_Mag"
        };
    };

    // Rifle_Long_Base_F MG
    // Stoner 99 LMG
    class LMG_Mk200_F: Rifle_Long_Base_F {
        ACE_barrelLength = 317.5;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.999327;
    };

    // Negev NG7
    class LMG_Zafir_F: Rifle_Long_Base_F {
        ACE_barrelLength = 459.74;
        ACE_barrelTwist = 304.8;
        initSpeed = -1.00048;
    };

    // M249 SPW
    class LMG_03_base_F: Rifle_Long_Base_F {
        ACE_barrelLength = 414.02;
        ACE_barrelTwist = 177.8;
        initSpeed = -1.00051;
    };

    // HK121
    class MMG_01_base_F: Rifle_Long_Base_F {}; // https://www.heckler-koch.com/en/products/military/machine-guns/mg5/mg5/technical-data.html
    class MMG_01_hex_F: MMG_01_base_F {
        ACE_barrelLength = 550.0;
        ACE_barrelTwist = 360.0;
        initSpeed = -1.0; // 768 m/s according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C)
    };

    // LWMMG
    class MMG_02_base_F: Rifle_Long_Base_F {};
    class MMG_02_camo_F: MMG_02_base_F {
        ACE_barrelLength = 609.6;
        ACE_barrelTwist = 234.95;
        initSpeed = -1.0;
    };

    // Rifle_Base_F
    // MX variants
    class arifle_MX_Base_F: Rifle_Base_F {};

    // MX LSW
    class arifle_MX_SW_F: arifle_MX_Base_F {
        ACE_barrelLength = 406.4;
        ACE_barrelTwist = 228.6;
        initSpeed = -0.981912;
    };

    // MXM
    class arifle_MXM_F: arifle_MX_Base_F {
        ACE_barrelLength = 457.2;
        ACE_barrelTwist = 228.6;
        initSpeed = -1.0;
        magazines[] += { // 6.5C Rechambering, MXM only
            "ACE_30Rnd_65_Creedmor_mag",
            "ACE_30Rnd_65x47_Scenar_mag",
            "ACE_30Rnd_65_Creedmor_black_mag",
            "ACE_30Rnd_65_Creedmor_khaki_mag",
            "ACE_30Rnd_65x47_Scenar_black_mag",
            "ACE_30Rnd_65x47_Scenar_khaki_mag"
        };
    };
    class arifle_MXM_Black_F: arifle_MXM_F { // bleh inheritance
        magazines[] += {
            "ACE_30Rnd_65_Creedmor_mag",
            "ACE_30Rnd_65x47_Scenar_mag",
            "ACE_30Rnd_65_Creedmor_black_mag",
            "ACE_30Rnd_65_Creedmor_khaki_mag",
            "ACE_30Rnd_65x47_Scenar_black_mag",
            "ACE_30Rnd_65x47_Scenar_khaki_mag"
        };
    };
    class arifle_MXM_khk_F: arifle_MXM_Black_F {
        magazines[] += {
            "ACE_30Rnd_65_Creedmor_mag",
            "ACE_30Rnd_65x47_Scenar_mag",
            "ACE_30Rnd_65_Creedmor_black_mag",
            "ACE_30Rnd_65_Creedmor_khaki_mag",
            "ACE_30Rnd_65x47_Scenar_black_mag",
            "ACE_30Rnd_65x47_Scenar_khaki_mag"
        };
    };

    // MX
    class arifle_MX_F: arifle_MX_Base_F {
        ACE_barrelLength = 368.3;
        ACE_barrelTwist = 228.6;
        initSpeed = -0.972222;
    };

    // MX 3GL
    class arifle_MX_GL_F: arifle_MX_Base_F {
        ACE_barrelLength = 368.3;
        ACE_barrelTwist = 228.6;
        initSpeed = -0.972222;
    };

    // MXC
    class arifle_MXC_F: arifle_MX_Base_F {
        ACE_barrelLength = 266.7;
        ACE_barrelTwist = 203.2;
        initSpeed = -0.946382;
    };

    // KH2002 Sama variants
    class arifle_katiba_Base_F: Rifle_Base_F {};

    // KH2002 Sama
    class arifle_Katiba_F: arifle_katiba_Base_F {
        ACE_barrelLength = 508.0;
        ACE_barrelTwist = 203.2;
        initSpeed = -1.0;
    };

    // KH2002C Sama
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        ACE_barrelLength = 393.7;
        ACE_barrelTwist = 203.2;
        initSpeed = -0.961294;
    };

    // KH2002 Sama KGL
    class arifle_Katiba_GL_F: arifle_katiba_Base_F {
        ACE_barrelLength = 508.0;
        ACE_barrelTwist = 203.2;
        initSpeed = -1.0;
    };

    // CTAR-21 variants
    class Tavor_base_F: Rifle_Base_F {};

     // CTAR-21
    class arifle_TRG20_F: Tavor_base_F {
        ACE_barrelLength = 381.0;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.961496;
    };

    // TAR-21
    class arifle_TRG21_F: Tavor_base_F {
        ACE_barrelLength = 459.74;
        ACE_barrelTwist = 177.8;
        initSpeed = -1.0;
    };

    // TAR-21 EGLM
    class arifle_TRG21_GL_F: arifle_TRG21_F {
        initSpeed = -1.0;
    };

    // F2000 variants
    class mk20_base_F: Rifle_Base_F {};

    // F2000
    class arifle_Mk20_F: mk20_base_F {
        ACE_barrelLength = 441.96;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.992849;
    };

    // F2000 Tactical
    class arifle_Mk20C_F: mk20_base_F {
        ACE_barrelLength = 406.4;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.974297;
    };

    // F2000 EGLM
    class arifle_Mk20_GL_F: mk20_base_F {
        ACE_barrelLength = 406.4;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.974297;
    };

    // P90 (1.86) variants
    class SMG_03_TR_BASE: Rifle_Base_F {
        ACE_barrelLength = 407;
        ACE_barrelTwist = 228.6; // 1:9 inch twist
        initSpeed = -1.083916; // 775 m/s according with the ACE_muzzleVelocities at 15°C, default BI value -1.1 (786 m/s)
        modes[] = {"Single"};
    };

    class SMG_03C_BASE: SMG_03_TR_BASE {
        ACE_barrelLength = 264;
        modes[] = {"Single", "FullAuto"};
    };

    // HK416 variants
    // HK416A5 11"
    class arifle_SPAR_01_base_F: Rifle_Base_F {
        ACE_barrelLength = 264.0;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.869636;
    };

    // HK416A5 14.5"
    class arifle_SPAR_02_base_F: Rifle_Base_F {
        ACE_barrelLength = 368.0;
        ACE_barrelTwist = 177.8;
        initSpeed = -0.999864;
    };

    // HK417A2 20"
    class arifle_SPAR_03_base_F: Rifle_Base_F {
        ACE_barrelLength = 508.0;
        ACE_barrelTwist = 279.4;
        initSpeed = -0.991536;
    };

    // RFB SDAR
    class SDAR_base_F: Rifle_Base_F {};
    class arifle_SDAR_F: SDAR_base_F {
        ACE_barrelLength = 457.2;
        ACE_barrelTwist = 285.75;
        initSpeed = -0.998321;
    };

    // AKS
    class arifle_AKS_base_F: Rifle_Base_F {
        ACE_barrelLength = 210;
        ACE_barrelTwist = 160;
        initSpeed = -1; // 735 m/s according with the ACE_muzzleVelocities at 15°C
    };

    // AKM
    class arifle_AKM_base_F: Rifle_Base_F {
        ACE_barrelLength = 415;
        ACE_barrelTwist = 240;
        initSpeed = -1; // 715 m/s according with the ACE_muzzleVelocities at 15°C
    };

    // AK15,AK15K,RPK (AK12)
    class arifle_AK12_base_F: Rifle_Base_F {
        ACE_barrelLength = 415;
        ACE_barrelTwist = 240;
        initSpeed = -1; // 715 m/s according with the ACE_muzzleVelocities at 15°C
    };

    class arifle_AK12U_base_F: arifle_AK12_base_F {
        ACE_barrelLength = 314;
        initSpeed = -0.937063; // 715*0.937063= 670 m/s according with the ACE_muzzleVelocities at 15°C
    };

    class arifle_RPK12_base_F: arifle_AK12_base_F {
        ACE_barrelLength = 590;
        initSpeed = -1.041958; // 715*1.041958= 745 m/s according with the ACE_muzzleVelocities at 15°C
    };

    // MSBS GROT (Promet)
    class arifle_MSBS65_base_F: Rifle_Base_F {
        ACE_barrelLength = 406.4; // 16"
        ACE_barrelTwist = 228.6;
        initSpeed = -0.971576; // 774*0.971576= 752 m/s according with the ACE_muzzleVelocities at 15°C
    };

    class arifle_MSBS65_Mark_base_F: arifle_MSBS65_base_F {
        ACE_barrelLength = 508; // 20"
        initSpeed = -1.007752; // 774*1.007752= 780 m/s according with the ACE_muzzleVelocities at 15°C
        magazines[] += { // 6.5C Rechambering, only available for Grot MR
            "ACE_30Rnd_65_Creedmor_msbs_mag",
            "ACE_30Rnd_65x47_Scenar_msbs_mag"
        };
    };

    // QBZ-95-1
    class arifle_CTAR_base_F: Rifle_Base_F {
        ACE_barrelLength = 463.0;
        ACE_barrelTwist = 244.0;
        initSpeed = -0.978947;
    };

    // QBZ-95-1 LSW
    class arifle_CTARS_base_F: Rifle_Base_F {
        ACE_barrelLength = 600.0;
        ACE_barrelTwist = 244.0;
        initSpeed = -1.0;
    };

    // Type 115
    class arifle_ARX_base_F: Rifle_Base_F {
        ACE_barrelLength = 508.0;
        ACE_barrelTwist = 203.2;
        initSpeed = -1.0;
        class Secondary: Rifle_Base_F {
            ACE_barrelLength = 304.8;
            ACE_barrelTwist = 508.0;
            initSpeed = -1.0;
        };
    };

    // Rifle_Short_Base_F
    // CPW
    class pdw2000_base_F: Rifle_Short_Base_F {};
    class hgun_PDW2000_F: pdw2000_base_F {
        ACE_barrelLength = 177.8;
        ACE_barrelTwist = 228.6;
        initSpeed = -0.994186;
    };

    // Vector SMG
    class SMG_01_Base: Rifle_Short_Base_F {};
    class SMG_01_F: SMG_01_Base {
        ACE_barrelLength = 139.7;
        ACE_barrelTwist = 406.4;
        initSpeed = -1.00148;
    };

    // Scorpion Evo 3 A1
    class SMG_02_base_F: Rifle_Short_Base_F  {};
    class SMG_02_F: SMG_02_base_F  {
        ACE_barrelLength = 195.58;
        ACE_barrelTwist = 254.0;
        initSpeed = -1.00029;
    };

    // MP5K
    class SMG_05_base_F: Rifle_Short_Base_F {
        ACE_barrelLength = 115.0;
        ACE_barrelTwist = 254.0;
        initSpeed = -0.943783;
    };

    // Pistol_Base_F
    // P99
    class hgun_P07_F: Pistol_Base_F {
        ACE_barrelLength = 101.6;
        ACE_barrelTwist = 254.0;
        initSpeed = -0.906977;
    };

    // MP-443 Grach
    class hgun_Rook40_F: Pistol_Base_F {
        ACE_barrelLength = 111.76;
        ACE_barrelTwist = 254.0;
        initSpeed = -0.934884;
    };

    // Custom Covert II
    class hgun_ACPC2_F: Pistol_Base_F {
        ACE_barrelLength = 127.0;
        ACE_barrelTwist = 406.4;
        initSpeed = -0.984252;
    };

    // FNX-45 Tactical
    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        ACE_barrelLength = 114.3;
        ACE_barrelTwist = 406.4;
        initSpeed = -0.944882;
    };

    // Chiappa Rhino 60DS
    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        ACE_barrelLength = 76.2;
        ACE_barrelTwist = 406.4;
        initSpeed = -0.905512;
    };

    // Makarov PM
    class hgun_Pistol_01_F: Pistol_Base_F {
        ACE_barrelLength = 93.5;
        ACE_barrelTwist = 254.0;
        initSpeed = -0.883721;
    };

    // M2_Turret
    class HMG_M2: HMG_01 {
        ACE_barrelLength = 1143.0;
        ACE_barrelTwist = 304.8;
        initSpeed = -1.0;
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

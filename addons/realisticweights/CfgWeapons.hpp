class CfgWeapons {
    class Rifle;
    class Rifle_Base_F: Rifle {
        class WeaponSlotsInfo;
    };
    class Rifle_Long_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class Rifle_Short_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };
    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };


// - Assault rifles -----------------------------------------------------------

    // - MX - weights taken from the ACR --------------------------------------
    class arifle_MX_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class arifle_MX_F: arifle_MX_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 79;
        };
    };
    class arifle_MXC_F: arifle_MX_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 72;
        };
    };
    // 3GL weight with stock 5lb, estimated without stock 4lb
    class arifle_MX_GL_F: arifle_MX_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 119;
        };
    };
    // Estimated difference to MX by comparing M27 to M416 (~100g)
    class arifle_MX_SW_F: arifle_MX_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 81;
        };
    };
    // Estimated difference to MX by comparing M416 D16.5RS to M416 D20RS
    class arifle_MXM_F: arifle_MX_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 85;
        };
    };

    // - KH2002 ---------------------------------------------------------------
    class arifle_Katiba_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class arifle_Katiba_F: arifle_Katiba_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 81;
        };
    };
    class arifle_Katiba_C_F: arifle_Katiba_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 73;
        };
    };
    // GL weight taken from M203
    class arifle_Katiba_GL_F: arifle_Katiba_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 111;
        };
    };

    // - F2000 ----------------------------------------------------------------
    class mk20_base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class arifle_Mk20_F: mk20_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 75;
        };
    };
    class arifle_Mk20C_F: mk20_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 74;
        };
    };
    class arifle_Mk20_GL_F: mk20_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 105;
        };
    };

    // - Tavor ----------------------------------------------------------------
    class Tavor_base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class arifle_TRG21_F: Tavor_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 72;
        };
    };
    class arifle_TRG20_F: Tavor_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 70;
        };
    };
    class arifle_TRG21_GL_F: arifle_TRG21_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 102;
        };
    };

    // - HK416A5 --------------------------------------------------------------
    class arifle_SPAR_01_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 68.8;
        };
    };
    class arifle_SPAR_01_GL_base_F: arifle_SPAR_01_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 96.8;
        };
    };
    class arifle_SPAR_02_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 76.9;
        };
    };

    // - HK417A2 --------------------------------------------------------------
    class arifle_SPAR_03_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 104.5;
        };
    };

    // - AK15 - Weights taken from the 2020 AK-15 -----------------------------
    class arifle_AK12_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 82.5;
        };
    };
    class arifle_AK12_GL_base_F: arifle_AK12_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 113.5;
        };
    };
    class arifle_AK12U_base_F: arifle_AK12_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 65;
        };
    };
    class arifle_RPK12_base_F: arifle_AK12_base_F { // Estimated difference by comparing RPK to AKM (+1.5kg)
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 115.5;
        };
    };

    // - AKM ------------------------------------------------------------------
    class arifle_AKM_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 67;
        };
    };

    // - AKS-74U --------------------------------------------------------------
    class arifle_AKS_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 60;
        };
    };

    // - MSBS -----------------------------------------------------------------
    class arifle_MSBS65_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 82.7;
        };
    };
    class arifle_MSBS65_GL_base_F: arifle_MSBS65_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 124.5;
        };
    };
    class arifle_MSBS65_UBS_base_F: arifle_MSBS65_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 115.7;
        };
    };
    class arifle_MSBS65_Mark_base_F: arifle_MSBS65_base_F {
        class WeaponSlotsInfo {
            mass = 101;
        };
    };

// - LMGs ---------------------------------------------------------------------

    // - Stoner LMG -----------------------------------------------------------
    class LMG_Mk200_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 100;
        };
    };

    // - Negev ----------------------------------------------------------------
    class LMG_Zafir_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 163;
        };
    };

    // - FN Minimi SPW --------------------------------------------------------
    class LMG_03_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
          mass = 154.4;
        };
    };


// - DMRs ---------------------------------------------------------------------

    // - VS-121 ---------------------------------------------------------------
    class DMR_01_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_DMR_01_F: DMR_01_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 100;
        };
    };

    // - Mk14 EBR -------------------------------------------------------------
    class EBR_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_EBR_F: EBR_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 112;
        };
    };


// - Sniper rifles ------------------------------------------------------------

    // - GM6 Lynx -------------------------------------------------------------
    class GM6_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_GM6_F: GM6_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 253;
        };
    };

    // - CheyTac Intervention -------------------------------------------------
    class LRR_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_LRR_F: LRR_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 310;
        };
    };


// - SMGs ---------------------------------------------------------------------

    // - CPW ------------------------------------------------------------------
    class pdw2000_base_F: Rifle_Short_Base_F {
        class WeaponSlotsInfo;
    };
    class hgun_PDW2000_F: pdw2000_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 33;
        };
    };

    // - KRISS Vector ---------------------------------------------------------
    class SMG_01_Base: Rifle_Short_Base_F {
        class WeaponSlotsInfo;
    };
    class SMG_01_F: SMG_01_Base {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 60;
        };
    };

    // - CZ Scorpion ----------------------------------------------------------
    class SMG_02_base_F: Rifle_Short_Base_F  {
        class WeaponSlotsInfo;
    };
    class SMG_02_F: SMG_02_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 61;
        };
    };


// - Launchers ----------------------------------------------------------------

    // - NLAW -----------------------------------------------------------------
    class launch_NLAW_F: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 275;
        };
    };

    class ACE_launch_NLAW_ready_F: launch_NLAW_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 195; // 275 - 80
        };
    };

    class ACE_launch_NLAW_used_F: launch_NLAW_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 195; // 275 - 80
        };
    };

    // - RPG-32 ---------------------------------------------------------------
    class launch_RPG32_F: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 66;
        };
    };

    // - Mini-Spike -----------------------------------------------------------
    class launch_Titan_base: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 110;
        };
    };
    // IRL there's no short version, estimate 1kg lighter
    class launch_Titan_short_base: launch_Titan_base {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 88;
        };
    };

    // - RPG-7 ----------------------------------------------------------------
    class launch_RPG7_F: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 139;
        };
    };

    // - MAAWS Mk4 ------------------------------------------------------------
    class launch_MRAWS_base_F: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 145.5;
        };
    };

    // - Metis-M --------------------------------------------------------------
    class launch_Vorona_base_F: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 224.8;
        };
    };


// - Pistols ------------------------------------------------------------------

    // - M1911 ----------------------------------------------------------------
    class hgun_ACPC2_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 24;
        };
    };

    // - P99 ------------------------------------------------------------------
    class hgun_P07_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 13;
        };
    };

    // - FNX ------------------------------------------------------------------
    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 21;
        };
    };

    // - Chiappa Rhino --------------------------------------------------------
    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 20;
        };
    };

    // - MP-443 Grach ---------------------------------------------------------
    class hgun_Rook40_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 20;
        };
    };


// - Marksmen DLC DMRs --------------------------------------------------------

    // - Noreen Bad News ------------------------------------------------------
    class DMR_02_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_DMR_02_F: DMR_02_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 130;
        };
    };

    // - Cyrus ------------------------------------------------------
    class DMR_05_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_DMR_05_blk_F: DMR_05_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 140;
        };
    };

    // - SIG 556 --------------------------------------------------------------
    class DMR_03_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo;
    };
    class srifle_DMR_03_F: DMR_03_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 90;
        };
    };

    // - M14 ------------------------------------------------------------------
    class DMR_06_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 92;
        };
    };


// - Marksmen DLC MMGs --------------------------------------------------------

    // - MG5 ------------------------------------------------------------------
    class MMG_01_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 218;
        };
    };

    // - LWMMG ----------------------------------------------------------------
    class MMG_02_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 240;
        };
    };
};

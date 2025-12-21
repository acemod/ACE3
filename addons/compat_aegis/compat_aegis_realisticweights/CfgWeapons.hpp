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
    class Launcher_Base_F: Launcher {};
    class launch_RPG7_F: Launcher_Base_F {
        class WeaponSlotsInfo;
    };
    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };
    class arifle_AKM_base_F;
    class arifle_AKM_F: arifle_AKM_base_F {};
    class arifle_RPK_base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    class Aegis_arifle_RPK74_base_F: arifle_RPK_base_F {
        class WeaponSlotsInfo;
    };
    class GM6_base_F: Rifle_Long_Base_F {};
    class Aegis_srifle_GM6B_base_F: GM6_base_F {
        class WeaponSlotsInfo;
    };
    class arifle_SPAR_02_base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };

// - Assault rifles -----------------------------------------------------------

    // - AK-74M ---------------------------------------------------------------
    class Aegis_arifle_AKM74_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 70;
        };
    };
    
    class Aegis_arifle_AKM74_GL_F: Aegis_arifle_AKM74_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 103;
        };
    };
    
    // - AK-74 ----------------------------------------------------------------
    class Aegis_arifle_AK74_F: Aegis_arifle_AKM74_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 68;
        };
    };
    
    class Aegis_arifle_AK74_GL_F: Aegis_arifle_AKM74_GL_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 101;
        };
    };
    
    class Aegis_arifle_AK74_gold_F: Aegis_arifle_AK74_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 68;
        };
    };
    
    // - AKS-74 ---------------------------------------------------------------
    class Aegis_arifle_AKS74_F: Aegis_arifle_AK74_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 65.5;
        };
    };
    
    class Aegis_arifle_AKS74_gold_F: Aegis_arifle_AKS74_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 65.5;
        };
    };
    
    // - AK-103 ---------------------------------------------------------------
    class Aegis_arifle_AK103_F: Aegis_arifle_AKM74_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 73.9;
        };
    };
    
    class Aegis_arifle_AK103_GL_F: Aegis_arifle_AK103_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 112;
        };
    };
    
    // - M4A1 -----------------------------------------------------------------
    class Aegis_arifle_M4A1_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 64.3;
        };
    };
    
    class Aegis_arifle_M4A1_GL_base_F: Aegis_arifle_M4A1_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 97.3;
        };
    };
    
    class Aegis_arifle_M4A1_Grip_base_F: Aegis_arifle_M4A1_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 67.3;
        };
    };
    
    class Aegis_arifle_M4A1_short_base_F: Aegis_arifle_M4A1_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 60;
        };
    };
    
    // - M16 ------------------------------------------------------------------
    class Aegis_arifle_M16A4_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 75;
        };
    };
    
    class Aegis_arifle_M16A4_FG_base_F: Aegis_arifle_M16A4_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 78;
        };
    };
    
    class Aegis_arifle_M16A4_GL_base_F: Aegis_arifle_M16A4_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 105;
        };
    };
    
    // - L85A3 ----------------------------------------------------------------
    class arifle_SA80_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 85.2;
        };
    };
    
    class arifle_SA80_GL_base_F: arifle_SA80_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 118.3;
        };
    };
    
    class arifle_SA80_C_base_F: arifle_SA80_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 72.6;
        };
    };
    
    // - SCAR-H ---------------------------------------------------------------
    class arifle_SCAR_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 79;
        };
    };
    
    class arifle_SCAR_grip_base_F: arifle_SCAR_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 82;
        };
    };
    
    class arifle_SCAR_GL_base_F: arifle_SCAR_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 112;
        };
    };
    
    class arifle_SCAR_short_base_F: arifle_SCAR_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 77;
        };
    };
    
    // - SCAR-L ---------------------------------------------------------------
    class arifle_SCAR_L_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 73;
        };
    };
    
    class arifle_SCAR_L_grip_base_F: arifle_SCAR_L_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 76;
        };
    };
    
    class arifle_SCAR_L_GL_base_F: arifle_SCAR_L_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 106;
        };
    };
    
    class arifle_SCAR_L_short_base_F: arifle_SCAR_L_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 67;
        };
    };
    
    // - HK-416A5 14.5" -------------------------------------------------------
    class Aegis_arifle_SPAR_02_Inf_base_F: arifle_SPAR_02_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 73.4;
        };
    };
    
// - LMGs ---------------------------------------------------------------------

    // - RPK-74M --------------------------------------------------------------
    class Aegis_arifle_RPK74M_F: Aegis_arifle_RPK74_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 104.9;
        };
    };
    
    // - RPK ------------------------------------------------------------------
    class arifle_RPK_F: arifle_RPK_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 106;
        };
    };
    
    // - FN MAG ---------------------------------------------------------------
    class Aegis_MMG_FNMAG_Base: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 256;
        };
    };
    
    class Aegis_MMG_FNMAG_old_F: Aegis_MMG_FNMAG_Base {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 260;
        };
    };
    
    class Aegis_MMG_FNMAG_240_F: Aegis_MMG_FNMAG_Base {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 218;
        };
    };


// - Sniper rifles ------------------------------------------------------------

    // - GM6 .50 BMG ----------------------------------------------------------
    class Aegis_srifle_GM6B_F: Aegis_srifle_GM6B_base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 253;
        };
    };
    
    // - SVD ------------------------------------------------------------------
    class Aegis_srifle_SVD_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 81;
        };
    };
    
// - SMGs ---------------------------------------------------------------------

    // - MP7 ------------------------------------------------------------------
    class SMG_04_base_F: Rifle_Short_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 42;
        };
    };

// - Shotguns -----------------------------------------------------------------

    // - KSG-12 ---------------------------------------------------------------
    class sgun_KSG_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 69;
        };
    };
    
    // - Benelli M4 -----------------------------------------------------------
    class sgun_M4_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 84;
        };
    };
    
    // Mp-153 -----------------------------------------------------------------
    class sgun_Mp153_black_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 70; 
            //Roughly?
        };
    };
    
    class sgun_Mp153_classic_F: sgun_Mp153_black_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 76;
        };
    };

// - Launchers ----------------------------------------------------------------

    // M32 --------------------------------------------------------------------
    class GL_M32_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 132;
        };
    };
    
    // XM25 -------------------------------------------------------------------
    class GL_XM25_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 140;
        };
    };
    
    // RPG-7M -----------------------------------------------------------------
    class Aegis_launch_RPG7M_F: launch_RPG7_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 100; 
            //it's a fictional polymer RPG, 6 lbs still felt too light
        };
    };

// - Pistols ------------------------------------------------------------------

    // - P320 -----------------------------------------------------------------
    class Aegis_hgun_P320_base_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 20;
        };
    };
    
    // - Ruger 57 -------------------------------------------------------------
    class Aegis_hgun_Pistol_R57_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 14.4;
        };
    };
    
    // - Desert Eagle XIX .44 -------------------------------------------------
    class hgun_Mk26_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 44;
        };
    };
};



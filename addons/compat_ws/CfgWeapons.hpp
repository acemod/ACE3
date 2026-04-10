class CfgWeapons {
    // AA40
    class Rifle_Base_F;
    class sgun_aa40_base_lxWS: Rifle_Base_F {
        ACE_barrelLength = 457;
        ACE_barrelTwist = 0.0;
        ACE_twistDirection = 0;
        ACE_RailHeightAboveBore = 4.99572; // checkScopes.sqf
        initSpeed = -0.940574; // 0.940574x488= 459m/s according to ACE_muzzleVelocities ASM conditions (15°C, 999.916hPa, 78%)
    };

    // Galat Arm
    class arifle_Galat_base_lxWS: Rifle_Base_F {
        ACE_barrelLength = 535;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
        ACE_RailHeightAboveBore = 4.28793; // checkScopes.sqf
    };

    // SA-77
    class Rifle_Long_Base_F;
    class LMG_S77_base_lxWS: Rifle_Long_Base_F {
        ACE_barrelLength = 550;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
        ACE_RailHeightAboveBore = 4.82762; // checkScopes.sqf
        EGVAR(overheating,allowSwapBarrel) = 1;
    };
    class LMG_S77_Compact_base_lxWS: LMG_S77_base_lxWS {
        ACE_barrelLength = 500;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
        EGVAR(overheating,allowSwapBarrel) = 1;
    };

    class glaunch_GLX_base_lxWS: Rifle_Base_F {
        ACE_RailHeightAboveBore = 4.88889; // checkScopes.sqf
    };

    // SLR
    class DMR_06_base_F;
    class arifle_SLR_lxWS: DMR_06_base_F {
        ACE_barrelLength = 533;
        ACE_barrelTwist = 279.4;
        ACE_twistDirection = 1;
    };

    class arifle_SLR_V_lxWS;
    class arifle_SLR_Para_lxWS: arifle_SLR_V_lxWS {
        ACE_barrelLength = 266.7;
    };

    // Velko R4/R5
    class arifle_Velko_base_lxWS: arifle_Galat_base_lxWS {
        ACE_barrelLength = 460;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
        ACE_RailHeightAboveBore = 4.28793; // checkScopes.sqf
    };
    class arifle_VelkoR5_lxWS: arifle_Velko_base_lxWS {
        ACE_barrelLength = 332;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
    };

    // XMS - Weird off-shoot from the XM8 rifles so there is no data for barrel lengths or twists. Used the vanilla CTAR as a baseline for the values.
    class arifle_SPAR_01_base_F;
    class arifle_XMS_Base_lxWS: arifle_SPAR_01_base_F {
        ACE_barrelLength = 406.4;
        ACE_barrelTwist = 178.0;
        ACE_twistDirection = 1;
        ACE_IronSightBaseAngle = 0; // arifle_SPAR_01_base_F 0.002856
        ACE_RailHeightAboveBore = 6; // no value checkScopes.sqf, estimation based on arifle_MSBS65_UBS_F 5.1754, arifle_SPAR_01_base_F 3.20768
        initSpeed = -0.971576; // Western Sahara 900
    };

    // 20 inch barrel for the marksman/autorifle
    class arifle_XMS_lxWS;
    class arifle_XMS_M_lxWS: arifle_XMS_lxWS {
        ACE_barrelLength = 508.0;
        initSpeed = -1; // Western Sahara 925
    };

    class arifle_XMS_Shot_lxWS: arifle_XMS_Base_lxWS {
        // initSpeed = -0.971576;
        class UBS_lxWS: Rifle_Base_F {
            ACE_barrelLength = 317; // https://modernfirearms.net/en/shotguns/u-s-a-shotguns/crye-six12-eng/
            ACE_twistDirection = 0;
            // initSpeed = 0; // tested with -2 and 1000 w/o effect on secondary UBS_lxWS muzzle velocity
        };
    };

    // Headgear
    // ION Cap (Headphones)
    class lxWS_H_CapB_rvs_blk;
    class lxWS_H_CapB_rvs_blk_ION: lxWS_H_CapB_rvs_blk {
        ace_hearing_protection = 0.75;
        ace_hearing_lowerVolume = 0.2;
        ace_hearing_hasEHP = 1;
    };

    // Tank helmet
    class HelmetBase;
    class lxWS_H_Tank_tan_F: HelmetBase {
        ace_hearing_protection = 0.85;
        ace_hearing_lowerVolume = 0.6;
    };

    // Headphones, inherited hearing protection
    class H_Cap_headphones;
    class lxWS_H_Headset: H_Cap_headphones {
        ace_hearing_protection = 0;
        ace_hearing_lowerVolume = 0;
        ace_hearing_hasEHP = 0;
    };

    class ItemCore;
    class optic_r1_high_lxWS: ItemCore {
        ACE_ScopeHeightAboveRail = 4.07748; // checkScopes.sqf
    };

    class optic_r1_low_lxWS: optic_r1_high_lxWS {
        ACE_ScopeHeightAboveRail = 2.4921; // checkScopes.sqf
    };

    class optic_r1_low_khaki_lxWS: optic_r1_high_lxWS {
        ACE_ScopeHeightAboveRail = 2.4921; // checkScopes.sqf
    };

    class optic_r1_low_sand_lxWS: optic_r1_high_lxWS {
        ACE_ScopeHeightAboveRail = 2.4921; // checkScopes.sqf
    };

    class optic_r1_low_snake_lxWS: optic_r1_high_lxWS {
        ACE_ScopeHeightAboveRail = 2.4921; // checkScopes.sqf
    };

    class optic_r1_low_arid_lxWS: optic_r1_high_lxWS {
        ACE_ScopeHeightAboveRail = 2.4921; // checkScopes.sqf
    };

    class optic_r1_low_lush_lxWS: optic_r1_high_lxWS {
        ACE_ScopeHeightAboveRail = 2.4921; // checkScopes.sqf
    };
};

class CfgWeapons {
    // AA40
    class Rifle_Base_F;
    class sgun_aa40_base_lxWS: Rifle_Base_F {
        ACE_barrelLength = 457;
        ACE_barrelTwist = 0.0;
        ACE_twistDirection = 0;
    };

    // Galat Arm
    class arifle_Galat_base_lxWS: Rifle_Base_F {
        ACE_barrelLength = 535;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
    };

    // SA-77
    class Rifle_Long_Base_F;
    class LMG_S77_base_lxWS: Rifle_Long_Base_F {
        ACE_barrelLength = 550;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
        EGVAR(overheating,allowSwapBarrel) = 1;
    };
    class LMG_S77_Compact_base_lxWS: LMG_S77_base_lxWS {
        ACE_barrelLength = 500;
        ACE_barrelTwist = 304.8;
        ACE_twistDirection = 1;
        EGVAR(overheating,allowSwapBarrel) = 1;
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
    };

    // Headgear
    // ION Cap (Headphones)
    class lxWS_H_CapB_rvs_blk;
    class lxWS_H_CapB_rvs_blk_ION: lxWS_H_CapB_rvs_blk {
        ace_hearing_protection = 0.75;
        ace_hearing_lowerVolume = 0.2;
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
    };
};

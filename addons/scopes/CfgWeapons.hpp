class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
    class optic_Yorris : ItemCore {
        ACE_ScopeHeightAboveRail = 2.77224;
    };
    
    class optic_MRD : ItemCore {
        ACE_ScopeHeightAboveRail = 2.8;
    };
    
    class optic_Aco : ItemCore {
        ACE_ScopeHeightAboveRail = 3.69248;
    };
    
    class optic_ACO_grn : ItemCore {
        ACE_ScopeHeightAboveRail = 3.69248;
    };
    
    class optic_ACO_grn_smg : ItemCore {
        ACE_ScopeHeightAboveRail = 3.69248;
    };
    
    class optic_ACO_smg : ItemCore {
        ACE_ScopeHeightAboveRail = 3.69248;
    };
    
    class optic_Holosight : ItemCore {
        ACE_ScopeHeightAboveRail = 4.66933;
    };
    
    class optic_Holosight_smg : ItemCore {
        ACE_ScopeHeightAboveRail = 4.66933;
    };
    
    class optic_Arco : ItemCore {
        ACE_ScopeHeightAboveRail = 4.89287;
    };
    
    class optic_ERCO_blk_F : optic_Arco {
        ACE_ScopeHeightAboveRail = 3.48836;
    };
    
    class optic_Hamr : ItemCore {
        ACE_ScopeHeightAboveRail = 4.48584;
    };
    
    class optic_MRCO : ItemCore {
        ACE_ScopeHeightAboveRail = 3.88405;
    };
    
    class optic_Nightstalker : ItemCore {
        ACE_ScopeHeightAboveRail = 5.54325;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NCTALKEP {
                    discreteDistance[] = {200};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class optic_NVS : ItemCore {
        ACE_ScopeHeightAboveRail = 5.54325;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NVS {
                    discreteDistance[] = {300};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class optic_TWS : ItemCore {
        ACE_ScopeHeightAboveRail = 5.52874;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class TWS {
                    discreteDistance[] = {300};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class optic_LRPS : ItemCore {
        ACE_ScopeHeightAboveRail = 4.2098;
        ACE_ScopeAdjust_Vertical[] = {0, 27};
        ACE_ScopeAdjust_Horizontal[] = {-8, 8};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    opticsZoomMin = 0.011;
                    opticsZoomMax = 0.045;
                    opticsZoomInit = 0.045;
                    discretefov[] = {0.045, 0.011};
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_SOS : ItemCore {
        ACE_ScopeHeightAboveRail = 4.41328;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_DMS : ItemCore {
        ACE_ScopeHeightAboveRail = 3.86253;
        ACE_ScopeAdjust_Vertical[] = {-4, 20};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_AMS_base : ItemCore {
        ACE_ScopeHeightAboveRail = 3.8933;
        ACE_ScopeAdjust_Vertical[] = {0, 16};
        ACE_ScopeAdjust_Horizontal[] = {-11, 11};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class AMS {
                    opticsZoomMin = 0.0285;
                    opticsZoomMax = 0.085;
                    opticsZoomInit = 0.085;
                    discretefov[] = {0.085, 0.0285};
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_KHS_base : ItemCore {
        ACE_ScopeHeightAboveRail = 4.30723;
        ACE_ScopeAdjust_Vertical[] = {0, 19};
        ACE_ScopeAdjust_Horizontal[] = {-9, 9};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS {
                    opticsZoomMin = 0.026;
                    opticsZoomMax = 0.06;
                    opticsZoomInit = 0.06;
                    discretefov[] = {0.06, 0.026};
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_KHS_old : ItemCore {
        ACE_ScopeHeightAboveRail = 4.30723;
        ACE_ScopeAdjust_Vertical[] = {0, 19};
        ACE_ScopeAdjust_Horizontal[] = {-9, 9};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS {
                    opticsZoomMin = 0.026;
                    opticsZoomMax = 0.06;
                    opticsZoomInit = 0.06;
                    discretefov[] = {0.06, 0.026};
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class Rifle_Base_F;
    class Rifle_Short_Base_F: Rifle_Base_F {};
    class Rifle_Long_Base_F: Rifle_Base_F {};

    class DMR_06_base_F: Rifle_Long_Base_F {
        ACE_IronSightBaseAngle = 0.010313;
        ACE_RailHeightAboveBore = 3.27488;
    };

    class DMR_07_base_F: Rifle_Long_Base_F {
        ACE_RailHeightAboveBore = 5.07109;
        ACE_IronSightBaseAngle = 0;
    };

    class arifle_MX_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {};
        class FullAuto: Mode_FullAuto {};
    };
    class arifle_MX_SW_F: arifle_MX_Base_F {
        ACE_RailHeightAboveBore = 2.40874;
        ACE_IronSightBaseAngle = -0.004011;
    };
    class arifle_MXM_F: arifle_MX_Base_F {
        ACE_RailHeightAboveBore = 2.40323;
        ACE_IronSightBaseAngle = -0.004011;
    };

    class arifle_SPAR_01_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.20768;
        ACE_IronSightBaseAngle = 0.002856;
    };
    class arifle_SPAR_02_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.22175;
        ACE_IronSightBaseAngle = -0.018908;
    };
    class arifle_SPAR_03_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.71491;
        ACE_IronSightBaseAngle = 0;
    };

    class LMG_Mk200_F: Rifle_Long_Base_F {
        ACE_RailHeightAboveBore = 2.68925;
        ACE_IronSightBaseAngle = 0.001719;
    };
    class LMG_Zafir_F: Rifle_Long_Base_F {
        ACE_RailHeightAboveBore = 0.996651;
        ACE_IronSightBaseAngle = 0.004584;
    };
    class LMG_03_base_F: Rifle_Long_Base_F {
        ACE_RailHeightAboveBore = 4.24282;
        ACE_IronSightBaseAngle = 0.008021;
    };

    class pdw2000_base_F: Rifle_Short_Base_F {
        ACE_RailHeightAboveBore = 3.08883;
        ACE_RailBaseAngle = 0.019366;
        ACE_IronSightBaseAngle = 0.009740;
    };

    class arifle_AKS_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 0;
        ACE_IronSightBaseAngle = 0;
    };
    class arifle_AKM_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 0;
        ACE_IronSightBaseAngle = 0.014897;
    };
    class arifle_AK12_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.82508;
        ACE_IronSightBaseAngle = 0.025210;
    };
    class arifle_AK12_GL_base_F: arifle_AK12_base_F {
        ACE_IronSightBaseAngle = 0.017189;
    };
    class arifle_AK12U_base_F: arifle_AK12_base_F {
        ACE_IronSightBaseAngle = 0.002865;
    };
    class arifle_RPK12_base_F: arifle_AK12_base_F {
        ACE_IronSightBaseAngle = 0.003438;
    };
    class arifle_CTAR_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 6.07588;
        ACE_IronSightBaseAngle = 0.004584;
    };
    class arifle_CTARS_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 6.0787;
        ACE_IronSightBaseAngle = 0.022918;
    };
    class arifle_ARX_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.81635;
        ACE_IronSightBaseAngle = 0.016043;
    };

    class arifle_katiba_Base_F: Rifle_Base_F {};
    
    class arifle_Katiba_F: arifle_katiba_Base_F {
        ACE_RailHeightAboveBore = 5.75468;
        ACE_IronSightBaseAngle = 0.011459;
    };
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        ACE_RailHeightAboveBore = 5.75468;
        ACE_IronSightBaseAngle = 0.011459;
    };
    class arifle_Katiba_GL_F: arifle_katiba_Base_F {
        ACE_RailHeightAboveBore = 5.75468;
        ACE_IronSightBaseAngle = 0.011459;
    };

    class arifle_MX_F: arifle_MX_Base_F {
        ACE_RailHeightAboveBore = 2.80201;
        ACE_IronSightBaseAngle = -0.005157;
    };
    class arifle_MX_GL_F: arifle_MX_Base_F {
        ACE_RailHeightAboveBore = 2.80201;
        ACE_IronSightBaseAngle = -0.005730;
    };

    class arifle_MXC_F: arifle_MX_Base_F {
        ACE_RailHeightAboveBore = 2.40874;
        ACE_IronSightBaseAngle = -0.005157;
    };

    class SDAR_base_F: Rifle_Base_F {};
    
    class arifle_SDAR_F: SDAR_base_F {
        ACE_RailHeightAboveBore = 0;
        ACE_IronSightBaseAngle = -0.042972;
    };

    class SMG_01_Base: Rifle_Short_Base_F {
        ACE_RailHeightAboveBore = 4.85355;
        ACE_RailBaseAngle = 0.0250956;
        ACE_IronSightBaseAngle = 0.018908;
    };
    class SMG_02_base_F: Rifle_Short_Base_F  {
        ACE_RailHeightAboveBore = 4.41831;
        ACE_RailBaseAngle = 0.0217724;
        ACE_IronSightBaseAngle = 0.022918;
    };
    class SMG_03_TR_BASE: Rifle_Base_F {
        ACE_IronSightBaseAngle = -0.011459;
    };
    class SMG_05_base_F: Rifle_Short_Base_F {
        ACE_RailHeightAboveBore = 4.05169;
        ACE_RailBaseAngle = 0.019366;
        ACE_IronSightBaseAngle = 0.027502;
    };

    class Tavor_base_F: Rifle_Base_F {};

    class arifle_TRG20_F: Tavor_base_F {
        ACE_RailHeightAboveBore = 4.30954;
        ACE_IronSightBaseAngle = 0.002292;
    };
    class arifle_TRG21_F: Tavor_base_F {
        ACE_RailHeightAboveBore = 4.30954;
        ACE_IronSightBaseAngle = 0.002292;
    };
    class arifle_TRG21_GL_F: arifle_TRG21_F {
        ACE_RailHeightAboveBore = 4.30954;
        ACE_IronSightBaseAngle = -0.014424;
    };

    class mk20_base_F: Rifle_Base_F {};

    class arifle_Mk20_F: mk20_base_F {
        ACE_RailHeightAboveBore = 4.57255;
        ACE_IronSightBaseAngle = 0.006303;
    };
    class arifle_Mk20C_F: mk20_base_F {
        ACE_RailHeightAboveBore = 4.41539;
        ACE_IronSightBaseAngle = 0.001146;
    };
    class arifle_Mk20_GL_F: mk20_base_F {
        ACE_RailHeightAboveBore = 4.41539;
        ACE_IronSightBaseAngle = 0.005730;
    };

    class arifle_MSBS65_base_F: Rifle_Base_F {
        ACE_RailHeightAboveBore = 5.2;
        ACE_IronSightBaseAngle = 0.001719;
    };
    class arifle_MSBS65_Mark_base_F: arifle_MSBS65_base_F {
        ACE_IronSightBaseAngle = 0.002292;
    };

    class EBR_base_F: Rifle_Long_Base_F {};
    class LRR_base_F: Rifle_Long_Base_F {};
    class GM6_base_F: Rifle_Long_Base_F {};
    class DMR_01_base_F: Rifle_Long_Base_F {};
    class DMR_02_base_F: Rifle_Long_Base_F {};
    class DMR_03_base_F: Rifle_Long_Base_F {};
    class DMR_04_base_F: Rifle_Long_Base_F {};
    class DMR_05_base_F: Rifle_Long_Base_F {};

    class srifle_EBR_F: EBR_base_F {
        ACE_RailHeightAboveBore = 1.98812;
        ACE_IronSightBaseAngle = 0.007448;
    };
    class srifle_LRR_F: LRR_base_F {
        ACE_RailHeightAboveBore = 3.20864;
        ACE_IronSightBaseAngle = 0.004011;
    };
    class srifle_GM6_F: GM6_base_F {
        ACE_RailHeightAboveBore = 4.75572;
        ACE_IronSightBaseAngle = 0.001146;
    };
    class srifle_DMR_01_F: DMR_01_base_F {
        ACE_RailHeightAboveBore = 2.83284;
        ACE_IronSightBaseAngle = 0.005730;
    };
    class srifle_DMR_02_F: DMR_02_base_F {
        ACE_RailHeightAboveBore = 3.43913;
        ACE_IronSightBaseAngle = 0.015470;
    };
    class srifle_DMR_03_F: DMR_03_base_F {
        ACE_RailHeightAboveBore = 4.0795;
        ACE_IronSightBaseAngle = 0.005730;
    };
    class srifle_DMR_04_F: DMR_04_base_F {
        ACE_RailHeightAboveBore = 2.38022;
        ACE_RailBaseAngle = 0.019481;
    };
    class srifle_DMR_05_blk_F: DMR_05_base_F {
        ACE_RailHeightAboveBore = 3.91334;
        ACE_IronSightBaseAngle = 0.012605;
    };

    class MMG_01_base_F;
    class MMG_02_base_F;

    class MMG_01_hex_F: MMG_01_base_F {
        ACE_RailHeightAboveBore = 4.73961;
        ACE_IronSightBaseAngle = -0.003438;
    };    
    class MMG_02_camo_F: MMG_02_base_F {
        ACE_RailHeightAboveBore = 5.01913;
        ACE_IronSightBaseAngle = 0.010886;
    };
};

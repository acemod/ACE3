class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
    class optic_Yorris : ItemCore {
        ACE_ScopeHeightAboveRail = 0.4;
    };
    
    class optic_MRD : ItemCore {
        ACE_ScopeHeightAboveRail = 0.6;
    };
    
    class optic_Aco : ItemCore {
        ACE_ScopeHeightAboveRail = 1.8;
    };
    
    class optic_ACO_grn : ItemCore {
        ACE_ScopeHeightAboveRail = 1.8;
    };
    
    class optic_ACO_grn_smg : ItemCore {
        ACE_ScopeHeightAboveRail = 1.8;
    };
    
    class optic_ACO_smg : ItemCore {
        ACE_ScopeHeightAboveRail = 1.8;
    };
    
    class optic_Holosight : ItemCore {
        ACE_ScopeHeightAboveRail = 2.4;
    };
    
    class optic_Holosight_smg : ItemCore {
        ACE_ScopeHeightAboveRail = 2.4;
    };
    
    class optic_Arco : ItemCore {
        ACE_ScopeHeightAboveRail = 3.0;
    };
    
    class optic_ERCO_blk_F : optic_Arco {
        ACE_ScopeHeightAboveRail = 2.6;
    };
    
    class optic_Hamr : ItemCore {
        ACE_ScopeHeightAboveRail = 3.2;
    };
    
    class optic_MRCO : ItemCore {
        ACE_ScopeHeightAboveRail = 2.5;
    };
    
    class optic_Nightstalker : ItemCore {
        ACE_ScopeHeightAboveRail = 4.2;
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
        ACE_ScopeHeightAboveRail = 4.2;
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
        ACE_ScopeHeightAboveRail = 4.2;
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
        ACE_ScopeHeightAboveRail = 4.0;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
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
        ACE_ScopeHeightAboveRail = 3.8;
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
        ACE_ScopeHeightAboveRail = 3.6;
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
        ACE_ScopeHeightAboveRail = 3.6;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
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
        ACE_ScopeHeightAboveRail = 4.0;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
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
        ACE_ScopeHeightAboveRail = 4.0;
        ACE_ScopeAdjust_Vertical[] = {-4, 30};
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
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
};

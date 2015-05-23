class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
    class optic_LRPS : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_SOS : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_DMS : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 20 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class optic_AMS_base : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class AMS {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class optic_KHS_base : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    class optic_KHS_old : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};


class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
    class iansky_nfbeast : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -0.9, 34 };
        ACE_ScopeAdjust_Horizontal[] = { -11, 11 };
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NF25_MILDOT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};

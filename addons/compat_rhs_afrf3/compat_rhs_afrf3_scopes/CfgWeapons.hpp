class CfgWeapons {
    class rhs_acc_sniper_base;
    class rhs_acc_pso1m2: rhs_acc_sniper_base {
        ACE_ScopeHeightAboveRail = 4.41386;
        ACE_ScopeAdjust_Vertical[] = {0, 0};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.5;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class rhs_acc_pso1m21: rhs_acc_pso1m2 {
        ACE_ScopeHeightAboveRail = 7.75566;
        ACE_ScopeAdjust_Vertical[] = {0, 0};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.5;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class rhs_acc_dh520x56: ItemCore { // http://nightvision.ru/catalog/4/item/35
        ACE_ScopeHeightAboveRail = 4.71476;
        ACE_ScopeAdjust_Vertical[] = {0, 33};
        ACE_ScopeAdjust_Horizontal[] = {-9, 9};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class dedal_520 {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};

class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class optic_LRPS : ItemCore {
        ACE_ScopeAdjust_Horizontal[] = { -50, 50 };
        ACE_ScopeAdjust_Vertical[] = { -70, 70 };
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 1 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_SOS : ItemCore {
        ACE_ScopeAdjust_Horizontal[] = { -50, 50 };
        ACE_ScopeAdjust_Vertical[] = { -60, 60 };
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 1 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_DMS : ItemCore {
        ACE_ScopeAdjust_Horizontal[] = { -40, 40 };
        ACE_ScopeAdjust_Vertical[] = { -40, 40 };
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 1 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};

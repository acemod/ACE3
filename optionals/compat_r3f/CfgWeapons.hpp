class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class R3F_Famas_F1: Rifle_Base_F {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=488;
    };
    class R3F_Famas_surb: R3F_Famas_F1 {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=403.86;
    };
    class R3F_FRF2: Rifle_Base_F {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=650;
    };
    class R3F_PGM_Hecate_II: Rifle_Base_F {
        ACE_barrelTwist=381.0;
        ACE_barrelLength=700;
    };
    class R3F_M107: Rifle_Base_F {
        ACE_barrelTwist=381.0;
        ACE_barrelLength=736.6;
    };
    class R3F_TAC50: Rifle_Base_F
    {
        ACE_barrelTwist=381.0;
        ACE_barrelLength=736.6;
    };
    class R3F_Minimi: Rifle_Base_F {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=347.98;
    };
    class R3F_Minimi_HG: R3F_Minimi {
    };
    class R3F_Minimi_762: R3F_Minimi {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=502.92;
    };
    class R3F_Minimi_762_HG: R3F_Minimi_762 {
    };
    class R3F_HK417M: Rifle_Base_F {
        ACE_barrelTwist=279.4;
        ACE_barrelLength=406;
    };
    class R3F_HK417S_HG: R3F_HK417M
    {
        ACE_barrelTwist=279.4;
        ACE_barrelLength=305;
    };
    class R3F_HK417L: R3F_HK417M {
        ACE_barrelTwist=279.4;
        ACE_barrelLength=508;
    };
    class R3F_HK416M: Rifle_Base_F {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=368.3;
    };
    class R3F_MP5SD: Rifle_Base_F {
        ACE_barrelTwist=254.0;
        ACE_barrelLength=144.78;
    };
    class R3F_MP5A5: R3F_MP5SD {
        ACE_barrelTwist=254.0;
        ACE_barrelLength=226.06;
    };
    class R3F_M4S90: Rifle_Base_F {
        ACE_twistDirection=0;
        ACE_barrelTwist=0;
        ACE_barrelLength=144.78;
    };
    class R3F_PAMAS: Pistol_Base_F {
        ACE_barrelTwist=248.92;
        ACE_barrelLength=124.46;
    };
    
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class R3F_J4: ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -8, 8 };
        ACE_ScopeAdjust_Horizontal[] = { -8, 8 };
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.2;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J4 {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J8: ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J8 {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J8_MILDOT: R3F_J8 {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J8_MILDOT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J10: ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J10 {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J10_MILDOT: R3F_J10 {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J10_MILDOT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_ZEISS: ItemCore {
        ACE_ScopeAdjust_Vertical[] = { 0, 23 };
        ACE_ScopeAdjust_Horizontal[] = { -7, 7 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ZEISS_MILDOT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_NF: ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -0.9, 34 };
        ACE_ScopeAdjust_Horizontal[] = { -11, 11 };
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NF_MILDOT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_NF42: ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -27.3, 27.3 };
        ACE_ScopeAdjust_Horizontal[] = { -27.3, 27.3};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NF42_MILDOT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};

class Mode_SemiAuto;

class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class R3F_Famas_F1: Rifle_Base_F {
        ACE_RailHeightAboveBore = 10.6;
        ACE_barrelTwist = 304.8; // 12"
        ACE_barrelLength = 488.0;
    };
    class R3F_Famas_surb: R3F_Famas_F1 {
        ACE_RailHeightAboveBore = 5.4;
        ACE_barrelTwist = 228.6; // 9"
        ACE_barrelLength = 450.0; // Beretta barrel
    };
    class R3F_Famas_G2: R3F_Famas_F1 {
        ACE_RailHeightAboveBore = 10.6;
        ACE_barrelTwist = 228.6; // 9"
        ACE_barrelLength = 488.0;
    };
    class R3F_Famas_felin: R3F_Famas_G2 {
        ACE_RailHeightAboveBore = 5.4;
        ACE_barrelTwist = 177.8; // 7"
        ACE_barrelLength = 450.0; // Beretta barrel
    };
    class R3F_FRF2: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.2;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 650.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // 1 MOA
        };
    };
    class R3F_PGM_Hecate_II: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.0;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 700.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; 
        };
    };
    class R3F_M107: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.6;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029;
        };
    };
    class R3F_TAC50: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.2;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029;
        };
    };
    class R3F_Minimi: Rifle_Base_F {
        ACE_RailHeightAboveBore = 4.0;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 347.98;
    };
    class R3F_Minimi_762: R3F_Minimi {
        ACE_RailHeightAboveBore = 4.0;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 502.92;
    };
    class R3F_SIG551: Rifle_Base_F {
        ACE_RailHeightAboveBore = 4.2;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 363.0;
    };
    class R3F_HK417M: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.4;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 406.0;
    };
    class R3F_HK417S_HG: R3F_HK417M {
        ACE_RailHeightAboveBore = 3.4;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 305.0;
    };
    class R3F_HK417L: R3F_HK417M {
        ACE_RailHeightAboveBore = 3.4;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 508.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029;
        };
    };
    class R3F_HK416M: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.4;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.3;
    };
    class R3F_HK416M_HG: R3F_HK416M {};
    class R3F_HK416S_HG: R3F_HK416M_HG {
        ACE_RailHeightAboveBore = 3.4;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 279.4;
    };
    class R3F_MP5SD: Rifle_Base_F {
        ACE_RailHeightAboveBore = 4.5;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 144.78;
    };
    class R3F_MP5A5: R3F_MP5SD {
        ACE_RailHeightAboveBore = 4.5;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 226.06;
    };
    class R3F_M4S90: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.2;
        ACE_twistDirection = 0;
        ACE_barrelTwist = 0;
        ACE_barrelLength = 144.78;
    };
    class R3F_PAMAS: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 125.0;
    };
    class R3F_HKUSP: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 121.0;
    };   
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class R3F_AIMPOINT: ItemCore {
        ACE_ScopeHeightAboveRail = 3.0;
    };
    class R3F_EOTECH: ItemCore {
        ACE_ScopeHeightAboveRail = 3.8;
    };
    class R3F_J4: ItemCore {
        ACE_ScopeHeightAboveRail = 3.0;
        ACE_ScopeAdjust_Vertical[] = {-8, 8};
        ACE_ScopeAdjust_Horizontal[] = {-8, 8};
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.2;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J4 {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_FELIN: ItemCore {
        ACE_ScopeHeightAboveRail = 4.2;
    };
    class R3F_FELIN_FRF2: ItemCore {
        ACE_ScopeHeightAboveRail = 4.0;
    };
    class R3F_J8: ItemCore {
        ACE_ScopeHeightAboveRail = 4.4;
        ACE_ScopeAdjust_Vertical[] = {-10, 10};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J8 {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J8_MILDOT: R3F_J8 { // Scope rail 30 MOA
        ACE_ScopeHeightAboveRail = 4.4;
        ACE_ScopeAdjust_Vertical[] = {-2, 18};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J8_MILDOT {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J10: ItemCore {
        ACE_ScopeHeightAboveRail = 4.4;
        ACE_ScopeAdjust_Vertical[] = {-10, 10};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J10 {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_J10_MILDOT: R3F_J10 { // Scope rail 30 MOA
        ACE_ScopeHeightAboveRail = 4.4;
        ACE_ScopeAdjust_Vertical[] = {-2, 18};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class J10_MILDOT {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_ZEISS: ItemCore {
        ACE_ScopeHeightAboveRail = 4.6;
        ACE_ScopeAdjust_Vertical[] = {0, 23};
        ACE_ScopeAdjust_Horizontal[] = {-7, 7};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ZEISS_MILDOT {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_NF: ItemCore {
        ACE_ScopeHeightAboveRail = 4.2;
        ACE_ScopeAdjust_Vertical[] = {0, 30};
        ACE_ScopeAdjust_Horizontal[] = {-11, 11};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NF_MILDOT {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_NF42: ItemCore {
        ACE_ScopeHeightAboveRail = 4.2;
        ACE_ScopeAdjust_Vertical[] = {0, 24};
        ACE_ScopeAdjust_Horizontal[] = {-9, 9};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NF42_MILDOT {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_OB50: ItemCore {
        ACE_ScopeHeightAboveRail = 4.0;
    };
};

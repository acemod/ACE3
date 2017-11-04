class Mode_SemiAuto;

class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class R3F_Famas_F1: Rifle_Base_F {
        ACE_RailHeightAboveBore = 10.1796;
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 488.0;
        muzzles[] = {"this"};
    };
    class R3F_Famas_F1_M203: R3F_Famas_F1 {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_Famas_surb: R3F_Famas_F1 {
        ACE_RailHeightAboveBore = 5.08219;
        ACE_barrelTwist = 228.6; // 1:9"
        ACE_barrelLength = 450.0; // Beretta barrel
    };
    class R3F_Famas_surb_M203: R3F_Famas_surb {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_Famas_G2: R3F_Famas_F1 {
        ACE_RailHeightAboveBore = 10.1808;
        ACE_barrelTwist = 228.6; // 1:9"
        ACE_barrelLength = 488.0;
    };
    class R3F_Famas_G2_M203: R3F_Famas_G2 {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_Famas_felin: R3F_Famas_G2 {
        ACE_RailHeightAboveBore = 5.14504;
        ACE_barrelTwist = 177.8; // 1:7"
        ACE_barrelLength = 450.0; // Beretta barrel
    };
    class R3F_FRF2: Rifle_Base_F {
        ACE_RailHeightAboveBore = 1.79013;
        ACE_barrelTwist = 294.6;
        ACE_barrelLength = 650.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // 1 MOA, default 9.9999997e-005
        };
        muzzles[] = {"this"};
    };
    class R3F_PGM_Hecate_II: Rifle_Base_F {
        ACE_RailHeightAboveBore = 1.84858;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 700.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // 1 MOA, default 0.00018
        };
        muzzles[] = {"this"};
    };
    class R3F_M107: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.13099;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // 1 MOA, default 0.00030
        };
        muzzles[] = {"this"};
    };
    class R3F_TAC50: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.99563;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // 1 MOA, default 0.00015
        };
        muzzles[] = {"this"};
    };
    class R3F_Minimi: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.81385;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 347.98;
        muzzles[] = {"this"};
        initSpeed = 915; // R3F config
    };
    class R3F_Minimi_762: R3F_Minimi {
        ACE_RailHeightAboveBore = 3.80834;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 502.92;
        initSpeed = 820; // R3F config
    };
    class R3F_SIG551: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.95288;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 363.0;
        muzzles[] = {"this"};
    };
    class R3F_HK417M: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.23377;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 406.0;
        muzzles[] = {"this"};
    };
    class R3F_HK417S_HG: R3F_HK417M {
        ACE_barrelLength = 305.0;
    };
    class R3F_HK417L: R3F_HK417M {
        ACE_barrelLength = 508.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.00029; // 1 MOA, default 0.00020
        };
    };
    class R3F_HK416M: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.84776;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.3;
        muzzles[] = {"this"};
    };
    class R3F_HK416M_M203: R3F_HK416M {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_HK416M_HG: R3F_HK416M {};
    class R3F_HK416S_HG: R3F_HK416M_HG {
        ACE_barrelLength = 279.4;
    };
    class R3F_MP5SD: Rifle_Base_F {
        ACE_RailHeightAboveBore = 4.21816;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 144.78;
        muzzles[] = {"this"};
    };
    class R3F_MP5A5: R3F_MP5SD {
        ACE_barrelLength = 226.06;
        muzzles[] = {"this"};
    };
    class R3F_M4S90: Rifle_Base_F {
        ACE_RailHeightAboveBore = 1.86213;
        ACE_twistDirection = 0;
        ACE_barrelTwist = 0;
        ACE_barrelLength = 144.78;
    };
    class R3F_PAMAS: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 125.0;
        muzzles[] = {"this"};
        initSpeed = -1.0; // default 410
    };
    class R3F_HKUSP: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 121.0;
        muzzles[] = {"this"};
        initSpeed = -1.0; // default 410
    };
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class R3F_AIMPOINT: ItemCore {
        ACE_ScopeHeightAboveRail = 3.1916;
    };
    class R3F_EOTECH: ItemCore {
        ACE_ScopeHeightAboveRail = 4.25923;
    };
    class R3F_J4: ItemCore {
        ACE_ScopeHeightAboveRail = 3.20641;
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
        ACE_ScopeHeightAboveRail = 8.13689;
    };
    class R3F_FELIN_FRF2: ItemCore {
        ACE_ScopeHeightAboveRail = 4.28091;
    };
    class R3F_J8: ItemCore {
        ACE_ScopeHeightAboveRail = 4.474;
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
        ACE_ScopeZeroRange = 1400; // Inaccurate reticle, designed to work with the vanilla ballistic.
        ACE_ScopeHeightAboveRail = 4.474;
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
        ACE_ScopeZeroRange = 100;
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
        ACE_ScopeHeightAboveRail = 4.96547;
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
        ACE_ScopeHeightAboveRail = 4.30469;
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
        ACE_ScopeHeightAboveRail = 4.30469;
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
        ACE_ScopeHeightAboveRail = 4.13217;
    };
    class InventoryMuzzleItem_Base_F;
    class R3F_SILENCIEUX_HK416: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0; // default "0.8"
                visibleFire = 0.5;
                audibleFire = 0.1; // default "0.3"
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f"; // default "0.8f"
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f"; // default "0.1f"
                recoilCoef = "0.95f"; // default "1.0f"
                recoilProneCoef = "0.95f"; // default "1.0f"
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };
    class R3F_SILENCIEUX_HK417: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };
    class R3F_SILENCIEUX_FRF2: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.95f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "0.95f";
                recoilProneCoef = "0.95f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };
};

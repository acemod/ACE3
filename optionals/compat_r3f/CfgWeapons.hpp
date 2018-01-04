class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class R3F_Famas_F1: Rifle_Base_F {
        ACE_RailHeightAboveBore = 10.1796;
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 488.0;
        muzzles[] = {"this"};
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.74); // 3.1 MOA*0.562, R3F default value 0.00087 (2.99 MOA)
        };
        class Burst: Mode_Burst {
            dispersion = MOA_TO_RAD(1.74); // 3.1 MOA*0.562, R3F default value 0.0035 (12 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.74); // 3.1 MOA*0.562, R3F default value 0.005 (17.2 MOA)
        };
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
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.74); // 3.1 MOA*0.562, R3F default value 0.00087 (2.99 MOA)
        };
        class Burst: Mode_Burst {
            dispersion = MOA_TO_RAD(1.74); // 3.1 MOA*0.562, R3F default value 0.0035 (12 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.74); // 3.1 MOA*0.562, R3F default value 0.005 (17.2 MOA)
        };
    };
    class R3F_Famas_G2_M203: R3F_Famas_G2 {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_Famas_felin: R3F_Famas_G2 {
        ACE_RailHeightAboveBore = 5.14504;
        ACE_barrelTwist = 177.8; // 1:7"
        ACE_barrelLength = 450.0; // Beretta barrel
        // Fix a ghost mag in the VA with the FAMAS FELIN: default magazines[]={...,"",...}
        magazines[] = {
            "R3F_25Rnd_556x45_FAMAS",
            "R3F_30Rnd_556x45_FAMAS",
            "R3F_25Rnd_556x45_TRACER_FAMAS",
            "R3F_30Rnd_556x45_TRACER_FAMAS",
            "R3F_30Rnd_556x45_HK416",
            "R3F_30Rnd_556x45_tracer_hk416",
            "30Rnd_556x45_Stanag",
            "30Rnd_556x45_Stanag_Tracer_Red",
            "30Rnd_556x45_Stanag_Tracer_Green",
            "30Rnd_556x45_Stanag_Tracer_Yellow"
        };
    };
    class R3F_FRF2: Rifle_Base_F {
        ACE_RailHeightAboveBore = 1.79013;
        ACE_barrelTwist = 294.6;
        ACE_barrelLength = 650.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.88); // 1.56 MOA*0.562, R3F default value 9.9999997e-005 (0.34 MOA)
        };
        muzzles[] = {"this"};
    };
    class R3F_PGM_Hecate_II: Rifle_Base_F {
        ACE_RailHeightAboveBore = 1.84858;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 700.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.58); // 1.04 MOA*0.562, R3F default value 0.00018 (0.62 MOA)
        };
        muzzles[] = {"this"};
    };
    class R3F_M107: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.13099;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.5); // 0.9 MOA*0.562, R3F default value 0.00030 (1.03 MOA)
        };
        muzzles[] = {"this"};
    };
    class R3F_TAC50: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.99563;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.53); // 0.95 MOA*0.562, R3F default value 0.00015 (0.52 MOA)
        };
        muzzles[] = {"this"};
    };
    class R3F_Minimi: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.81385;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 347.98;
        muzzles[] = {"this"};
        initSpeed = 915; // R3F config
        class manual: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.92); // 3.41 MOA*0.562, R3F default value 0.0008 (2.75 MOA)
        };
    };
    class R3F_Minimi_HG: R3F_Minimi {
        class manual: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.92); // 3.41 MOA*0.562, R3F default value 0.0008 (2.75 MOA)
        };
    };
    class R3F_Minimi_762: R3F_Minimi {
        ACE_RailHeightAboveBore = 3.80834;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 502.92;
        initSpeed = 820; // R3F config
        class manual: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.56); // 2.77 MOA*0.562, R3F default value 0.002 (6.88 MOA)
        };
    };
    class R3F_Minimi_762_HG: R3F_Minimi_762 {
        class manual: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.56); // 2.77 MOA*0.562, R3F default value 0.002 (6.88 MOA)
        };
    };
    class R3F_HK417M: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.23377;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 406.0;
        muzzles[] = {"this"};
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.62); // 2.89 MOA*0.562, R3F default value 0.001 (3.44 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.62); // 2.89 MOA*0.562, R3F default value 0.0025 (8.6 MOA)
        };
    };
    class R3F_HK417S_HG: R3F_HK417M {
        ACE_barrelLength = 305.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.9); // 3.4 MOA*0.562, R3F default value 0.002 (6.88 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.9); // 3.4 MOA*0.562, R3F default value 0.007 (24.06 MOA)
        };
    };
    class R3F_HK417L: R3F_HK417M {
        ACE_barrelLength = 508.0;
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.93); // 1.66 MOA*0.562, R3F default value 0.0002 (0.69 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.93); // 1.66 MOA*0.562, R3F default value 0.0025 (8.6 MOA)
        };
    };
    class R3F_HK416M: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.84776;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.3;
        muzzles[] = {"this"};
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.87); // 3.32 MOA*0.562, R3F default value 0.00087 (2.99 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.87); // 3.32 MOA*0.562, R3F default value 0.005 (17.2 MOA)
        };
    };
    class R3F_HK416M_M203: R3F_HK416M {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_HK416S_HG: R3F_HK416M {
        ACE_barrelLength = 279.4;
        class Single: Single {
            dispersion = MOA_TO_RAD(2.12); // 3.78 MOA*0.562, R3F default value 0.00087 (2.99 MOA)
        };
        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(2.12); // 3.78 MOA*0.562, R3F default value 0.005 (17.2 MOA)
        };
    };
    class R3F_SIG551: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.95288;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 363.0;
        muzzles[] = {"this"};
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.88); // 3.34 MOA*0.562, R3F default value 0.00087 (2.99 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.88); // 3.34 MOA*0.562, R3F default value 0.005 (17.2 MOA)
        };
    };
    class R3F_MP5SD: Rifle_Base_F {
        ACE_RailHeightAboveBore = 4.21816;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 144.78;
        muzzles[] = {"this"};
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(7.73); // 13.75 MOA*0.562 (a square of 10/10cm at 50 meters), R3F default value 0.004 (13.75 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(7.73); // 13.75 MOA*0.562 (a square of 10/10cm at 50 meters), R3F default value 0.007 (24.06 MOA)
        };
    };
    class R3F_MP5A5: R3F_MP5SD {
        ACE_barrelLength = 226.06;
        muzzles[] = {"this"};
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(7.73); // 13.75 MOA*0.562 (a square of 10/10cm at 50 meters), R3F default value 0.004 (13.75 MOA)
        };
        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(7.73); // 13.75 MOA*0.562 (a square of 10/10cm at 50 meters), R3F default value 0.007 (24.06 MOA)
        };
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
    class R3F_J4: ItemCore { // http://www.scrome.com/assets/templates/flexibility/pdf/Scrome_Riflescope_LTE_J4_Datasheet_GB.pdf
        ACE_ScopeHeightAboveRail = 3.20641;
        ACE_ScopeAdjust_Vertical[] = {0, 16};
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
    class R3F_J8: ItemCore { // http://www.scrome.com/assets/templates/flexibility/pdf/Scrome_Marksman_Scope_LTE_Datasheet_GB.pdf
        ACE_ScopeHeightAboveRail = 4.474;
        ACE_ScopeAdjust_Vertical[] = {0, 20};
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
    class R3F_J8_MILDOT: R3F_J8 {
        ACE_ScopeAdjust_Vertical[] = {0, 20};
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
    class R3F_J10: ItemCore { // http://www.scrome.com/assets/templates/flexibility/pdf/Scrome_Marksman_Scope_LTE_Datasheet_GB.pdf
        ACE_ScopeZeroRange = 1400; // Inaccurate reticle, designed to work with the vanilla ballistic.
        ACE_ScopeHeightAboveRail = 4.474;
        ACE_ScopeAdjust_Vertical[] = {0, 20};
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
    class R3F_J10_MILDOT: R3F_J10 {
        ACE_ScopeZeroRange = 100;
        ACE_ScopeAdjust_Vertical[] = {0, 20};
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
    class R3F_ZEISS: ItemCore { // https://www.hensoldt.net/fileadmin/hensoldt/Datenbl%C3%A4tter/En/0714_SL_0817_9-6-24x72_6-24x56_EN_LoRes.pdf#page=2
        ACE_ScopeHeightAboveRail = 4.96547;
        ACE_ScopeAdjust_Vertical[] = {0, 16};
        ACE_ScopeAdjust_Horizontal[] = {-3.5, 3.5}; // {-5,5} for the Hensoldt but {-3.5,3.5} for the Zeiss according with the official documentation.
        ACE_ScopeAdjust_VerticalIncrement = 0.05;
        ACE_ScopeAdjust_HorizontalIncrement = 0.05;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ZEISS_MILDOT {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class R3F_NF: ItemCore { // http://nightforceoptics.com/nxs/3-5-15x56
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
    class R3F_NF42: ItemCore { // http://nightforceoptics.com/nxs/12-42x56
        ACE_ScopeHeightAboveRail = 4.30469;
        ACE_ScopeAdjust_Vertical[] = {0, 12};
        ACE_ScopeAdjust_Horizontal[] = {-5, 5};
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

class ACE_ATragMX_Presets {
    class R3F_PGM_Hecate_II {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"[R3F]PGM", 780, 100, 0.0879633, -0.00058679, 8.89, 0, 2, 10, 120, 0, 0, 41.92, 12.7, 38.10, 0.670, 1, "ASM", {{-15,753},{0,760},{10,767},{15,772},{25,786},{30,795},{35,806}}, {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}};
    };
    class R3F_M107 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"[R3F]M107", 850, 100, 0.0879633, -0.00058679, 8.89, 0, 2, 10, 120, 0, 0, 41.92, 12.7, 38.10, 0.670, 1, "ASM", {{-15,823},{0,830},{10,837},{15,842},{25,856},{30,865},{35,876}}, {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}};
    };
    class R3F_TAC50 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"[R3F]TAC50", 820, 100, 0.0879633, -0.00058679, 8.89, 0, 2, 10, 120, 0, 0, 41.92, 12.7, 38.10, 0.670, 1, "ASM", {{-15,793},{0,800},{10,807},{15,812},{25,826},{30,835},{35,846}}, {{0,0},{0,0},{0,0},{0,0},{0,0},{0,0},{0,0}}};
    };
    class R3F_FRF2 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"[R3F]FRF2", 850, 100, 0.0909184, -0.00103711, 7.62, 0, 2, 10, 120, 0, 0, 9.461, 7.82, 29.46, 0.398, 1, "ICAO", {{-15,823},{0,830},{10,837},{15,842},{25,856},{30,865},{35,876}}, {{0, 0.399}, {810, 0.392}, {1030, 0.383}, {1120, 0.381}, {1270, 0.380}, {1410, 0.379}, {1530, 0.379}}};
    };
    class R3F_HK417L {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"[R3F]HK417L", 820, 100, 0.0909184, -0.00103711, 7.62, 0, 2, 10, 120, 0, 0, 9.461, 7.82, 29.46, 0.398, 1, "ICAO", {{-15,793},{0,800},{10,807},{15,812},{25,826},{30,835},{35,846}}, {{0, 0.399}, {810, 0.392}, {1030, 0.383}, {1120, 0.381}, {1270, 0.380}, {1410, 0.379}, {1530, 0.379}}};
    };
};

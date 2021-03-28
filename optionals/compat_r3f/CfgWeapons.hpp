class Mode_SemiAuto;

class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class Rifle_Long_Base_F;
    class R3F_Famas_F1: Rifle_Base_F {
        ACE_RailHeightAboveBore = 10.1796;
        ACE_barrelTwist = 304.8; // 1:12"
        ACE_barrelLength = 488.0;
        muzzles[] = {"this"};
    };
    class R3F_Famas_F1_M203: R3F_Famas_F1 {
        muzzles[] = {"this","Lance_Grenades"};
    };
    class R3F_Famas_surb: R3F_Famas_F1 { // R3F FAMAS Surbaissé, should be FAMAS Valorisé : http://narval34.free.fr/fiche_tech_famas.pdf
        ACE_RailHeightAboveBore = 5.08219;
        ACE_barrelTwist = 177.8; // 1:7" FAMAS Valorisé
        ACE_barrelLength = 450.0; // 3D model with Beretta barrel : FAMAS Valorisé
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
        muzzles[] = {"this"};
    };
    class R3F_PGM_Hecate_II: Rifle_Base_F {
        ACE_RailHeightAboveBore = 1.84858;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 700.0;
        muzzles[] = {"this"};
    };
    class R3F_M107: Rifle_Base_F {
        ACE_RailHeightAboveBore = 3.13099;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        muzzles[] = {"this"};
    };
    class R3F_TAC50: Rifle_Base_F {
        ACE_RailHeightAboveBore = 2.99563;
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.6;
        muzzles[] = {"this"};
    };
    class R3F_Minimi: Rifle_Base_F { // FN HERSTAL Minimi 5.56 Mk3 https://www.fnherstal.com/sites/default/files/2020-06/technical-data-fn-minimi-556-mk3.pdf
        ACE_RailHeightAboveBore = 3.81385;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 349;
        muzzles[] = {"this"};
    };
    class R3F_Minimi_762: R3F_Minimi { // FN HERSTAL Minimi 7.62 Mk3 https://www.fnherstal.com/sites/default/files/2020-06/technical-data-fn-minimi-762-mk3.pdf
        ACE_RailHeightAboveBore = 3.80834;
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 422;
    };
    class R3F_HK417M: Rifle_Base_F { // https://www.heckler-koch.com/
        ACE_RailHeightAboveBore = 3.23377;
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 406.4;
        muzzles[] = {"this"};
    };
    class R3F_HK417S_HG: R3F_HK417M {
        ACE_barrelLength = 304.8;
    };
    class R3F_HK417L: R3F_HK417M {
        ACE_barrelLength = 508.0;
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
    class R3F_SIG551: Rifle_Base_F { // http://www.sigsauer.swiss
        ACE_RailHeightAboveBore = 3.95288;
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 363.5; // SG551 SB http://www.sigsauer.swiss/en/accessories-conversion-kits.php
        muzzles[] = {"this"};
    };
    class R3F_MP5SD: Rifle_Base_F { // https://www.heckler-koch.com/en/products/military/submachine-guns/mp5/mp5sd/overview.html
        ACE_RailHeightAboveBore = 4.21816;
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 146;
        initSpeed = -0.94; // 400*0.94= 376 m/s according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C), R3F default value 0
        muzzles[] = {"this"};
    };
    class R3F_MP5A5: R3F_MP5SD { // https://www.heckler-koch.com/en/products/military/submachine-guns/mp5/mp5/overview.html
        ACE_barrelLength = 225;
        initSpeed = -1; // 400 m/s according with the ACE_ammoTempMuzzleVelocityShifts at the normal conditions (15°C), R3F default value 0
        muzzles[] = {"this"};
    };
    class R3F_M4S90: Rifle_Base_F { // https://www.benelli.it
        ACE_RailHeightAboveBore = 1.86213;
        ACE_twistDirection = 0;
        ACE_barrelTwist = 0;
        ACE_barrelLength = 470;
    };
    class R3F_SCAR_H_PR_20cps_base: Rifle_Base_F { // FN HERSTAL https://www.fnherstal.com/sites/default/files/2020-06/technical-data-fn-scar-h-pr_0.pdf
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 508;
        muzzles[] = {"this"};
    };
    class R3F_SCAR_H_PR_20cps_recup_base: Rifle_Base_F {
        ACE_barrelTwist = 279.4;
        ACE_barrelLength = 508;
        muzzles[] = {"this"};
    };
    class R3F_SCAR_H_CAM_base: Rifle_Base_F { // FN HERSTAL https://www.fnherstal.com/sites/default/files/2020-06/technical-data-fn-scar-h_0.pdf
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 330.2;
        muzzles[] = {"this"};
    };
    class R3F_SCAR_H_CAM_LG_GHILLIE: R3F_SCAR_H_CAM_base {
        muzzles[] = {"this", "EGLM"};
    };
    class R3F_SCAR_H_CAM_LG: R3F_SCAR_H_CAM_base {
        muzzles[] = {"this", "EGLM"};
    };
    class R3F_SCAR_L_CAM_base: Rifle_Base_F { // FN HERSTAL https://www.fnherstal.com/sites/default/files/2020-06/technical-data-fn-scar-l_1.pdf
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 368.3;
        muzzles[] = {"this"};
    };
    class R3F_SCAR_L_CAM_ghillie_LG: R3F_SCAR_L_CAM_base {
        muzzles[] = {"this", "EGLM"};
    };
    class R3F_SCAR_L_CQC_CAM: R3F_SCAR_L_CAM_base {
        ACE_barrelLength = 254;
    };
    class R3F_SCAR_L_CQC_LG_CAM: R3F_SCAR_L_CAM_base {
        ACE_barrelLength = 254;
        muzzles[] = {"this", "EGLM"};
    };
    class R3F_FN_MAG58: Rifle_Long_Base_F { // FN HERSTAL https://www.fnherstal.com/sites/default/files/2020-10/technical-data-fn-mag-1.pdf
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 630;
        muzzles[] = {"this"};
    };
    class R3F_PAMAS: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 125.0;
        muzzles[] = {"this"};
        initSpeed = -1.0; // default 410
        class Single: Mode_SemiAuto {
            dispersion=0.0025; // 8.59 MOA (a square of 6.25/6.25cm at 25 meters), R3F default value 0.025 (85.94 MOA)
        };
    };
    class R3F_HKUSP: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 121.0;
        muzzles[] = {"this"};
        initSpeed = -1.0; // default 410
        class Single: Mode_SemiAuto {
            dispersion=0.002; // 6.88 MOA (a square of 5/5cm at 25 meters), R3F default value 0.02 (68.75 MOA)
        };
    };
    class R3F_G17: Pistol_Base_F {
        ACE_barrelTwist = 250.0;
        ACE_barrelLength = 114.0;
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
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Felin {};
                class Oeilleton: Felin {
                    opticsID = 2;
                    opticsDisplayName = "";
                    useModelOptics = 0;
                    opticsPPEffects[] = {};
                    opticsFlare = 0;
                    opticsDisablePeripherialVision = 0;
                    opticsZoomMin = 0.25;
                    opticsZoomMax = 1.25;
                    opticsZoomInit = 0.75;
                    memoryPointCamera = "eye_Oeilleton";
                    visionMode[] = {};
                    discretefov[] = {};
                    discreteDistance[] = {200};
                    discreteDistanceInitIndex = 0;
                    distanceZoomMin = 200;
                    distanceZoomMax = 200;
                    discreteInitIndex = 0;
                    cameraDir = "";
                };
            };
        };
    };
    class R3F_J8: ItemCore { // http://www.scrome.com/assets/templates/flexibility/pdf/Scrome_Marksman_Scope_LTE_Datasheet_GB.pdf
        ACE_ScopeHeightAboveRail = -2.237; // Off-center BDC reticle designed to work with the vanilla ballistic and R3F values only.
        ACE_ScopeAdjust_Vertical[] = {-10, 10};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    };
    class R3F_J8_MILDOT: R3F_J8 {
        ACE_ScopeHeightAboveRail = 4.474;
        ACE_ScopeAdjust_Vertical[] = {0, 20};
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
        ACE_ScopeHeightAboveRail = 4.474; // BDC reticle designed to work with the vanilla ballistic and R3F values only.
        ACE_ScopeAdjust_Vertical[] = {-10, 10};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
    };
    class R3F_J10_MILDOT: R3F_J10 {
        ACE_ScopeAdjust_Vertical[] = {0, 20};
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
    class R3F_SB_PM: ItemCore { // Off-center BDC reticle designed to work with the vanilla ballistic and R3F values only.
        ACE_ScopeAdjust_Vertical[] = {0, 12}; // https://www.schmidtundbender.de/en/products/police-military-forces/1-8x24-pm-ii-shortdot-dual-cc.html
        ACE_ScopeAdjust_Horizontal[] = {-6, 6};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class SB_PM {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                    distanceZoomMin = 100;
                    distanceZoomMax = 1200;
                };
            };
        };
    };
    class R3F_SB_PM_BLACK: R3F_SB_PM {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class SB_PM {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                    distanceZoomMin = 100;
                    distanceZoomMax = 1200;
                };
            };
        };
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
    class R3F_SILENCIEUX_SCAR_H_PR: ItemCore {
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
        preset[] = {"R3F PGM M33", 780, 100, 0.0845596, -0.00086, 6.35, 0, 2, 10, 120, 0, 0, 41.92, 12.18, 38.10, 0.670, 1, "ASM", {{-15, 761},{0, 768},{10, 775},{15, 780},{25, 794},{30, 803},{35, 814}}, {{0, 0},{0, 0},{0, 0},{0, 0},{0, 0},{0, 0},{0, 0}}};
    };
    class R3F_M107 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"R3F M107 M33", 850, 100, 0.0841653, -0.00061813, 7.62, 0, 2, 10, 120, 0, 0, 41.92, 12.19, 38.10, 0.670, 1, "ASM", {{-15, 831},{0, 838},{10, 845},{15, 850},{25, 864},{30, 873},{35, 884}}, {{0, 0},{0, 0},{0, 0},{0, 0},{0, 0},{0, 0},{0, 0}}};
    };
    class R3F_TAC50 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"R3F TAC50 AMAX", 823, 100, 0.0848384, -0.00038793, 7.37, 0, 2, 10, 120, 0, 0, 48.6, 12.44, 38.10, 1.050, 1, "ICAO", {{-15, 804},{0, 811},{10, 818},{15, 823},{25, 837},{30, 846},{35, 857}}, {{0, 0},{0, 0},{0, 0},{0, 0},{0, 0},{0, 0},{0, 0}}};
    };
    class R3F_FRF2 {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"R3F FRF2 M993", 850, 100, 0.0783702, -0.00095, 6.35, 0, 2, 10, 120, 0, 0, 8.23, 7.35, 29.46, 0.359, 1, "ICAO", {{-15, 831},{0, 838},{10, 845},{15, 850},{25, 864},{30, 873},{35, 884}}, {{0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}, {0, 0}}};
    };
    class R3F_HK417L {
        // Profile Name, Muzzle Velocity, Zero Range, Scope Base Angle, AirFriction, Bore Height, Scope Unit, Scope Click Unit, Scope Click Number, Maximum Elevation, Dialed Elevation, Dialed Windage, Mass, Bullet Diameter, Rifle Twist, BC, Drag Model, Atmosphere Model, Muzzle Velocity vs. Temperature Interpolation, C1 Ballistic Coefficient vs. Distance Interpolation
        preset[] = {"R3F HK417L M80", 820, 100, 0.0884758, -0.00095, 7.62, 0, 2, 10, 120, 0, 0, 9.46, 8.02, 27.94, 0.394, 1, "ICAO", {{-15, 801},{0, 808},{10, 815},{15, 820},{25, 834},{30, 843},{35, 854}}, {{0, 0.394}, {700, 0.394}, {800, 0.391}, {900, 0.386}, {1000, 0.383}, {1100, 0.381}, {1300, 0.379}}};
    };
};

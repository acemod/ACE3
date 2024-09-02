class CfgWeapons {
    class Launcher_Base_F;
    class SPE_Slung_Static_Weapon_Base: Launcher_Base_F {};

    // --- Vanilla Compat -------------------------------------------------------------
    class EGVAR(csw,staticHMGCarry): Launcher_Base_F {
        class ace_csw {
            class assembleTo {
                GVAR(M3_Tripod) = "B_HMG_01_F";
            };
        };
    };
    class EGVAR(csw,staticM2ShieldCarry): EGVAR(csw,staticHMGCarry) {
        class ace_csw: ace_csw {
            class assembleTo {
                GVAR(M3_Tripod) = "B_HMG_02_F";
            };
        };
    };

    class EGVAR(csw,staticGMGCarry): Launcher_Base_F {
        class ace_csw {
            class assembleTo {
                GVAR(M3_Tripod) = "B_GMG_01_F";
            };
        };
    };

    // --- Gun Turrets -------------------------------------------------------------
    class SPE_M2_M3_Tripod;
    class SPE_M2_M3_Tripod_proxy: SPE_M2_M3_Tripod {
        magazineReloadTime = 0.5;
    };

    class SPE_M3_Tripod: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(M3_Tripod);
        };
    };
    class SPE_M2_50: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(M3_Tripod) = "SPE_M2_M3";
                EGVAR(csw,m3TripodLow) = "SPE_M2_M3";
            };
        };
    };

    class SPE_M1919A4_tripod;
    class SPE_M1919A4_tripod_proxy: SPE_M1919A4_tripod {
        magazineReloadTime = 0.5;
    };

    class SPE_M2_Tripod: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(M2_Tripod);
        };
    };

    class SPE_LMG;
    class SPE_M1919A4: SPE_LMG {
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(M2_Tripod) = "SPE_M1919_M2";
            };
        };
    };

    class SPE_M1919A6_StaticBipod;
    class SPE_M1919A6_StaticBipod_proxy: SPE_M1919A6_StaticBipod {
        magazineReloadTime = 0.5;
    };

    class SPE_MG42_Tripod;
    class SPE_MG42_Tripod_proxy: SPE_MG42_Tripod {
        magazineReloadTime = 0.5;
    };

    class SPE_MG34_Tripod;
    class SPE_MG34_Tripod_proxy: SPE_MG34_Tripod {
        magazineReloadTime = 0.5;
    };

    class SPE_Lafette_Tripod: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(Lafette_Tripod_Low);
        };
    };
    class SPE_MG42: SPE_LMG {
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(Lafette_Tripod_Low) = "SPE_MG42_Lafette_low_Deployed";
                GVAR(Lafette_Tripod) = "SPE_MG42_Lafette_Deployed";
            };
        };
    };
    class SPE_MG34: SPE_LMG {
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(Lafette_Tripod_Low) = "SPE_MG34_Lafette_low_Deployed";
                GVAR(Lafette_Tripod) = "SPE_MG34_Lafette_Deployed";
            };
        };
    };

    // --- Mortars -----------------------------------------------------------------
    class SPE_M1_81;
    class SPE_M1_81_proxy: SPE_M1_81 {
        magazineReloadTime = 0.5;
    };

    class SPE_M1_81_Stand: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(M1_81_baseplate);
        };
    };
    class SPE_M1_81_Barrel: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(M1_81_baseplate) = "SPE_M1_81";
                EGVAR(csw,mortarBaseplate) = "SPE_M1_81";
            };
        };
    };

    class SPE_MLE_27_31;
    class SPE_MLE_27_31_proxy: SPE_MLE_27_31 {
        magazineReloadTime = 0.5;
    };

    class SPE_MLE_27_31_Stand: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(MLE_27_31_baseplate);
        };
    };
    class SPE_MLE_27_31_Barrel: SPE_Slung_Static_Weapon_Base {
        class ace_csw {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                GVAR(MLE_27_31_baseplate) = "SPE_MLE_27_31";
                EGVAR(csw,mortarBaseplate) = "SPE_MLE_27_31";
            };
        };
    };

    class SPE_GrW278_1;
    class SPE_GrW278_1_proxy: SPE_GrW278_1 {
        magazineReloadTime = 0.5;
    };

    class SPE_GrW278_1_Stand: SPE_MLE_27_31_Stand {
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(GrW278_baseplate);
        };
    };
    class SPE_GrW278_1_Barrel: SPE_MLE_27_31_Barrel {
        class ace_csw {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                GVAR(GrW278_baseplate) = "SPE_GrW278_1";
                EGVAR(csw,mortarBaseplate) = "SPE_GrW278_1";
            };
        };
    };
};

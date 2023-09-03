class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class SPE_Slung_Static_Weapon_Base: Launcher_Base_F {};

    class SPE_M1_81;
    class SPE_M1_81_proxy: SPE_M1_81 {
        magazineReloadTime = 0.5;
    };

    class SPE_M1_81_Stand: SPE_Slung_Static_Weapon_Base {
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(M1_81_baseplate);
        };
    };
    class SPE_M1_81_Barrel: SPE_Slung_Static_Weapon_Base {
        class ACE_CSW {
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
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(MLE_27_31_baseplate);
        };
    };
    class SPE_MLE_27_31_Barrel: SPE_Slung_Static_Weapon_Base {
        class ACE_CSW {
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
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(GrW278_baseplate);
        };
    };

    class SPE_GrW278_1_Barrel: SPE_MLE_27_31_Barrel {
        class ACE_CSW {
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

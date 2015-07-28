
class CfgWeapons {
    class Pistol_Base_F;
    class BWA3_P8: Pistol_Base_F {
        ACE_barrelTwist = 248.92;
        ACE_barrelLength = 108;
    };

    class BWA3_MP7: Pistol_Base_F {
        ACE_barrelTwist = 160.02;
        ACE_barrelLength = 180;
    };

    class Rifle_Base_F;
    class UGL_F;

    class BWA3_G36: Rifle_Base_F {
        ACE_overheating_dispersion[] = {0, 0.001, 0.003, 0.005};
        ACE_overheating_slowdownFactor[] = {1, 1, 1, 0.9};
        ACE_overheating_jamChance[] = {0, 0.0003, 0.0015, 0.0075};
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 480;

        class AG40: UGL_F {
            magazines[] += {
                "ACE_HuntIR_M203"
            };
        };
    };
    class BWA3_G36K: BWA3_G36 {
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 318;
    };
    class BWA3_G36_LMG: BWA3_G36 {
        ACE_overheating_dispersion[] = {0, 0.001, 0.002, 0.004};
    };

    class Rifle_Long_Base_F;
    class BWA3_G28_Standard: Rifle_Long_Base_F {
        ACE_overheating_dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_overheating_slowdownFactor[] = {1, 1, 1, 0.9};
        ACE_overheating_jamChance[] = {0, 0.0003, 0.0015, 0.0075};
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 421;
    };
    class BWA3_G28_Assault: BWA3_G28_Standard {
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 421;
    };
    class BWA3_G27: BWA3_G28_Standard {
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 406;
    };
    class BWA3_G27_AG: BWA3_G27 {
        class AG40: UGL_F {
            magazines[] += {
                "ACE_HuntIR_M203"
            };
        };
    };

    class BWA3_MG4: Rifle_Long_Base_F {
        ACE_overheating_allowSwapBarrel = 1;
        ACE_overheating_dispersion[] = {0, 0.001, 0.002, 0.004};
        ACE_overheating_slowdownFactor[] = {1, 1, 1, 0.9};
        ACE_overheating_jamChance[] = {0, 0.0003, 0.0015, 0.0075};
        ACE_barrelTwist = 177.8;
        ACE_barrelLength = 480;
    };

    class BWA3_MG5: Rifle_Long_Base_F {
        ACE_overheating_allowSwapBarrel = 1;
        ACE_overheating_dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_overheating_slowdownFactor[] = {1, 1, 1, 0.9};
        ACE_overheating_jamChance[] = {0, 0.0003, 0.0015, 0.0075};
        ACE_barrelTwist = 304.8;
        ACE_barrelLength = 550;
    };

    class BWA3_G82: Rifle_Long_Base_F {
        ACE_overheating_dispersion[] = {0, -0.001, 0.001, 0.003};
        ACE_overheating_slowdownFactor[] = {1, 1, 1, 0.9};
        ACE_overheating_jamChance[] = {0, 0.0003, 0.0015, 0.0075};
        ACE_barrelTwist = 381.0;
        ACE_barrelLength = 736.7;
    };

    class Launcher_Base_F;
    class BWA3_Pzf3: Launcher_Base_F {
        ACE_overpressure_angle = 60;
        ACE_overpressure_range = 10;
        ACE_overpressure_damage = 1;
    };

    class BWA3_RGW90: Launcher_Base_F {
        ACE_overpressure_angle = 60;
        ACE_overpressure_range = 6;
        ACE_overpressure_damage = 0.8;
    };

    class BWA3_Fliegerfaust: Launcher_Base_F {
        ACE_overpressure_angle = 40;
        ACE_overpressure_range = 5;
        ACE_overpressure_damage = 0.5;
    };

    // OPTICS
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
    class BWA3_optic_ZO4x30: ItemCore {
        ACE_scopeadjust_vertical[] = {-10, 10};
        ACE_scopeadjust_verticalIncrement = 0.2;
        ACE_scopeadjust_horizontal[] = {-10, 10};
        ACE_scopeadjust_horizontalIncrement = 0.2;

        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = {200};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class BWA3_optic_Shortdot: ItemCore {
        ACE_scopeadjust_vertical[] = {-0.1, 10.1};
        ACE_scopeadjust_verticalIncrement = 0.1;
        ACE_scopeadjust_horizontal[] = {-5.1, 5.1};
        ACE_scopeadjust_horizontalIncrement = 0.1;

        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class BWA3_optic_20x50: ItemCore {
        ACE_scopeadjust_vertical[] = {0, 26};
        ACE_scopeadjust_verticalIncrement = 0.1;
        ACE_scopeadjust_horizontal[] = {-6, 6};
        ACE_scopeadjust_horizontalIncrement = 0.1;

        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class BWA3_optic_24x72: ItemCore {
        ACE_scopeadjust_vertical[] = {0, 16};
        ACE_scopeadjust_verticalIncrement = 0.1;
        ACE_scopeadjust_horizontal[] = {-7, 7};
        ACE_scopeadjust_horizontalIncrement = 0.1;

        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};

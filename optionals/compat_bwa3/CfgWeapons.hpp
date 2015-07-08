class CfgWeapons {
    class Pistol_Base_F;
    class Rifle_Base_F;
    class Rifle_Long_Base_F;
    class BWA3_P8: Pistol_Base_F {
        ACE_barrelTwist=248.92;
        ACE_barrelLength=108;
    };
    class BWA3_MP7: Pistol_Base_F {
        ACE_barrelTwist=160.02;
        ACE_barrelLength=180;
    };
    class BWA3_G36: Rifle_Base_F {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=480;
    };
    class BWA3_G36K: BWA3_G36 {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=318;
    };
    class BWA3_G28_Standard: Rifle_Long_Base_F {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=421;
    };
    class BWA3_G28_Assault: BWA3_G28_Standard {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=421;
    };
    class BWA3_G27: BWA3_G28_Standard {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=406;
    };
    class BWA3_MG4: Rifle_Long_Base_F {
        ACE_barrelTwist=177.8;
        ACE_barrelLength=480;
    };
    class BWA3_MG5: Rifle_Long_Base_F {
        ACE_barrelTwist=304.8;
        ACE_barrelLength=550;
    };
    class BWA3_G82: Rifle_Long_Base_F {
        ACE_barrelTwist=381.0;
        ACE_barrelLength=736.7;
    };
    
    class optic_Hamr;
    class InventoryOpticsItem_Base_F;
    
    class BWA3_optic_ZO4x30 : optic_Hamr {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.2;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 200 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_ZO4x30_NSV : optic_Hamr {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.2;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 200 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_ZO4x30_IRV : optic_Hamr {
        ACE_ScopeAdjust_Vertical[] = { -10, 10 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.2;
        ACE_ScopeAdjust_HorizontalIncrement = 0.2;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 200 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_Shortdot : optic_Hamr {
        ACE_ScopeAdjust_Vertical[] = { -0.1, 10.1 };
        ACE_ScopeAdjust_Horizontal[] = { -5.1, 5.1 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_20x50 : optic_Hamr {
        ACE_ScopeAdjust_Vertical[] = { 0, 26 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_20x50_NSV : BWA3_optic_20x50 {
        ACE_ScopeAdjust_Vertical[] = { 0, 26 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_24x72 : optic_Hamr {
        ACE_ScopeAdjust_Vertical[] = { 0, 16 };
        ACE_ScopeAdjust_Horizontal[] = { -7, 7 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class BWA3_optic_24x72_NSV : BWA3_optic_20x50 {
        ACE_ScopeAdjust_Vertical[] = { 0, 16 };
        ACE_ScopeAdjust_Horizontal[] = { -7, 7 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Scope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
};

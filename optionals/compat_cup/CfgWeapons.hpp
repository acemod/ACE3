class CfgWeapons
{
    class Launcher_Base_F;
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    
    class CUP_optic_SB_3_12x50_PMII : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class LRR {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_LeupoldMk4 : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class LRR {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_Leupold_VX3 : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class StepScope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_AN_PVS_10 : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class NVScope {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_LeupoldM3LR : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class LRR {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_LeupoldMk4_10x40_LRT_Desert : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class LRR {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_LeupoldMk4_MRT_tan : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class MRT {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class CUP_optic_SB_11_4x20_PM : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -0.1, 10.1 };
        ACE_ScopeAdjust_Horizontal[] = { -5.1, 5.1 };
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ShortDot {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    
    /*
    // This would require MOA turrets
    class CUP_optic_AN_PVS_4 : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { -12, 50 };
        ACE_ScopeAdjust_Horizontal[] = { -20, 20 };
        ACE_ScopeAdjust_VerticalIncrement = 0.25;
        ACE_ScopeAdjust_HorizontalIncrement = 0.25;
        ACE_ScopeAdjust_Unit = "MOA";
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ANPVS4 {
                    discreteDistance[] = { 100 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    */
    
    class CUP_optic_PSO_1 : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { 0, 0 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.0;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class PSO {
                    discreteDistance[]={100, 200, 300, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000};
                    discreteDistanceInitIndex=3;
                };
            };
        };
    };
    class CUP_optic_PSO_3 : ItemCore {
        ACE_ScopeAdjust_Vertical[] = { 0, 0 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_VerticalIncrement = 0.0;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class PSO {
                    discreteDistance[]={100, 200, 300, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000};
                    discreteDistanceInitIndex=3;
                };
            };
        };
    };
    // Non Disposable launchers
    class CUP_launch_Igla: Launcher_Base_F {
        EGVAR(overpressure,angle) = 30;
        EGVAR(overpressure,range) = 2;
        EGVAR(overpressure,damage) = 0.5;
    };
    class CUP_launch_M47: Launcher_Base_F {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,range) = 30;
        EGVAR(overpressure,damage) = 0.7;
    };
    class CUP_launch_MAAWS: Launcher_Base_F {
        EGVAR(overpressure,angle) = 60;
        EGVAR(overpressure,range) = 28;
        EGVAR(overpressure,damage) = 0.7;
    };
    class CUP_launch_MAAWS_Scope: CUP_launch_MAAWS {};
    class CUP_launch_Metis: Launcher_Base_F {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,range) = 30;
        EGVAR(overpressure,damage) = 0.5;
    };
    class CUP_launch_RPG7V: Launcher_Base_F {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,range) = 20;
        EGVAR(overpressure,damage) = 1;
    };
    class CUP_launch_Mk153Mod0: Launcher_Base_F {
        EGVAR(overpressure,angle) = 30;
        EGVAR(overpressure,range) = 30;
        EGVAR(overpressure,damage) = 1;
    };
    class CUP_launch_Mk153Mod0_SMAWOptics: CUP_launch_Mk153Mod0 {};
    class CUP_launch_FIM92Stinger: Launcher_Base_F {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,damage) = 0.3; // Main damage arises from debris rather than the actual backblast
    };
    class CUP_launch_9K32Strela: Launcher_Base_F {
        EGVAR(overpressure,angle) = 30;
        EGVAR(overpressure,range) = 2;
        EGVAR(overpressure,damage) = 0.5;
    };
    // Disposable launchers under this line
    class CUP_launch_M136: Launcher_Base_F {
        EGVAR(overpressure,angle) = 45;
        EGVAR(overpressure,range) = 100;
        EGVAR(overpressure,damage) = 0.7;
        ACE_UsedTube = "ACE_launch_M136_Used_F";      // The class name of the used tube.
        magazines[] = {"ACE_PreloadedMissileDummy_CUP"};  // The dummy magazine
    };
    class ACE_launch_M136_Used_F: CUP_launch_M136 {
        scope = 1;
        ACE_isUsedLauncher = 1;
        author = "$STR_ACE_Common_ACETeam";
        //displayName = "$STR_ACE_Disposable_UsedTube";
        //descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayName = "M136 (Used)";
        descriptionShort = "Used M136 Tube";
        magazines[] = {"ACE_FiredMissileDummy_CUP"};
        //picture = "";              @todo
        //model = "";                @todo
        weaponPoolAvailable = 0;
    };
    class CUP_launch_NLAW: Launcher_Base_F {
        EGVAR(overpressure,angle) = 30;
        EGVAR(overpressure,range) = 2;
        EGVAR(overpressure,damage) = 0.5;
        ACE_UsedTube = "ACE_launch_NLAW_Used_F";      // The class name of the used tube.
        magazines[] = {"ACE_PreloadedMissileDummy_CUP"};  // The dummy magazine
    };
    class ACE_launch_NLAW_Used_F: CUP_launch_NLAW {
        scope = 1;
        ACE_isUsedLauncher = 1;
        author = "$STR_ACE_Common_ACETeam";
        //displayName = "$STR_ACE_Disposable_UsedTube";
        //descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayName = "NLAW (Used)";
        descriptionShort = "Used NLAW Tube";
        magazines[] = {"ACE_FiredMissileDummy_CUP"};
        //picture = "";              @todo
        //model = "";                @todo
        weaponPoolAvailable = 0;
    };
    class CUP_launch_RPG18: Launcher_Base_F {
        EGVAR(overpressure,angle) = 40;
        EGVAR(overpressure,range) = 15;
        EGVAR(overpressure,damage) = 1;
        ACE_UsedTube = "ACE_launch_RPG18_Used_F";      // The class name of the used tube.
        magazines[] = {"ACE_PreloadedMissileDummy_CUP"};  // The dummy magazine
    };
    class ACE_launch_RPG18_Used_F: CUP_launch_RPG18 {
        scope = 1;
        ACE_isUsedLauncher = 1;
        author = "$STR_ACE_Common_ACETeam";
        //displayName = "$STR_ACE_Disposable_UsedTube";
        //descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayName = "RPG18 (Used)";
        descriptionShort = "Used RPG18 Tube";
        magazines[] = {"ACE_FiredMissileDummy_CUP"};
        //picture = "";              @todo
        //model = "";                @todo
        weaponPoolAvailable = 0;
    };
};
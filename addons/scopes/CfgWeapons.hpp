class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class optic_LRPS : ItemCore {
        ACE_ScopeAdjust_Horizontal[] = { -50, 50 };
        ACE_ScopeAdjust_Vertical[] = { -70, 70 };
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 1 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_SOS : ItemCore {
        ACE_ScopeAdjust_Horizontal[] = { -50, 50 };
        ACE_ScopeAdjust_Vertical[] = { -60, 60 };
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 1 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class optic_DMS : ItemCore {
        ACE_ScopeAdjust_Horizontal[] = { -40, 40 };
        ACE_ScopeAdjust_Vertical[] = { -40, 40 };
        class ItemInfo : InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    discreteDistance[] = { 1 };
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };

    class ACE_optic_DMS: optic_DMS {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_DMS";
        displayName = "LOCALIZE ACE DMR";
        //descriptionShort = "$STR_A3_CFGWEAPONS_ACC_DMS1";
        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(ace_shortdot_optics.p3d));

            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    opticsZoomMin = 0.05;
                    opticsZoomMax = 0.3;
                    opticsZoomInit = 0.3;
                    discretefov[] = {};
                    modelOptics[] = {};
                };
            };
        };
    };
};

class SlotInfo;
class CowsSlot: SlotInfo {
    compatibleItems[] += {"ACE_optic_DMS"};
};

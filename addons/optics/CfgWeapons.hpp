class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class optic_DMS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
            };
        };
    };

    class ACE_optic_DMS: optic_DMS {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_DMS";
        displayName = "LOCALIZE ACE DMS";
        //descriptionShort = "$STR_A3_CFGWEAPONS_ACC_DMS1";
        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_shortdot_optics.p3d));

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

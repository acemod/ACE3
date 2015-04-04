
class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    // zooming reticle scopes
    class optic_DMS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
                class Iron;
            };
        };
    };

    class ACE_optic_DMS: optic_DMS {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_DMS";
        displayName = "LOCALIZE ACE DMS";
        //descriptionShort = "$STR_A3_CFGWEAPONS_ACC_DMS1";
        weaponInfoType = "ACE_RscWeaponZeroing";

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

                class Iron: Iron {};
            };
        };
    };

    // PIP scopes
    class optic_Hamr: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Hamr2Collimator;
                class Hamr2Scope;
            };
        };
    };

    class ACE_optic_Hamr_PIP: optic_Hamr {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_Hamr_PIP";
        displayName = "$STR_A3_cfgWeapons_optic_Hamr0";    //@todo
        picture = "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa";    //@todo
        model = "\A3\weapons_f_beta\acc\acco_hamr_F";    //@todo
        descriptionShort = "$STR_A3_cfgWeapons_optic_Hamr1";    //@todo
        weaponInfoType = "ACE_RscWeaponZeroingPIP";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_pip.p3d));

            class OpticsModes: OpticsModes {
                class Hamr2Collimator: Hamr2Collimator {};

                class Hamr2Scope: Hamr2Scope {
                    opticsDisplayName = "IHAMR"; // test??
                    modelOptics = QUOTE(PATHTOF(models\ace_optics_pip.p3d));
                    useModelOptics = 1;
                    opticsZoomInit = 0.0872664626;
                    opticsZoomMax = 0.0872664626;
                    opticsZoomMin = 0.0872664626;
                    opticsPPEffects[] += {"ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                    visionMode[] = {"Normal","NVG"};
                };
            };
        };
    };

};

class SlotInfo;
class CowsSlot: SlotInfo {
    compatibleItems[] += {"ACE_optic_DMS","ACE_optic_Hamr_PIP"};
};

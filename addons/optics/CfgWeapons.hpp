
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

    class ACE_optic_Hamr_2D: optic_Hamr {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_Hamr_2D";
        displayName = "$STR_A3_cfgWeapons_optic_Hamr0";    //@todo
        descriptionShort = "$STR_A3_cfgWeapons_optic_Hamr1";    //@todo
        weaponInfoType = "ACE_RscWeapon_Hamr";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_reticle90.p3d));

            class OpticsModes: OpticsModes {
                class Hamr2Collimator: Hamr2Collimator {};

                class Hamr2Scope: Hamr2Scope {
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

    class ACE_optic_Hamr_PIP: ACE_optic_Hamr_2D {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_Hamr_PIP";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_pip.p3d));
        };
    };

    class optic_Arco: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ARCO2collimator;
                class ARCO2scope: ARCO2collimator {};
            };
        };
    };

    class ACE_optic_Arco_2D: optic_Arco {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_Arco_2D";
        displayName = "$STR_A3_cfgWeapons_optic_Arco0";    //@todo
        descriptionShort = "$STR_A3_cfgWeapons_optic_Arco1";    //@todo
        weaponInfoType = "ACE_RscWeapon_Arco";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_reticle90.p3d));

            class OpticsModes: OpticsModes {
                class ARCO2collimator: ARCO2collimator {};
                class ARCO2scope: ARCO2scope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.0872664626;
                    opticsZoomMax = 0.0872664626;
                    opticsZoomMin = 0.0872664626;
                    opticsPPEffects[] += {"ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                    visionMode[] = {"Normal"};
                };
            };
        };
    };

    class ACE_optic_Arco_PIP: ACE_optic_Arco_2D {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_Arco_PIP";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_pip.p3d));
        };
    };

    class optic_MRCO: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class MRCOcq;
                class MRCOscope;
            };
        };
    };

    class ACE_optic_MRCO_2D: optic_MRCO {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_MRCO_2D";
        displayName = "$STR_A3_cfgWeapons_optic_Valdada0"; //@todo
        descriptionShort = "$STR_A3_cfgWeapons_optic_Valdada1";
        weaponInfoType = "ACE_RscWeapon_MRCO";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_reticle90.p3d));

            class OpticsModes: OpticsModes {
                class MRCOcq: MRCOcq {};
                class MRCOscope: MRCOscope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.0872664626;
                    opticsZoomMax = 0.0872664626;
                    opticsZoomMin = 0.0872664626;
                    opticsPPEffects[] += {"ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                    visionMode[] = {"Normal"};
                };
            };
        };
    };

    class ACE_optic_MRCO_PIP: ACE_optic_MRCO_2D {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_MRCO_PIP";

        class ItemInfo: ItemInfo {
            modelOptics = QUOTE(PATHTOF(models\ace_optics_pip.p3d));
        };
    };

    class optic_SOS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
                class Iron;
            };
        };
    };

    class ACE_optic_SOS_2D: optic_SOS {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_SOS_2D";
        displayName = "$STR_A3_cfgWeapons_optic_SOS0"; // @todo
        descriptionShort = "$STR_A3_cfgWeapons_optic_SOS1";
        weaponInfoType = "ACE_RscWeapon_SOS";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QUOTE(PATHTOF(models\ace_optics_reticle90.p3d)),QUOTE(PATHTOF(models\ace_optics_reticle90.p3d))};
                    opticsDisablePeripherialVision = 0;
                };
                class Iron: Iron {};
            };
        };
    };

    class ACE_optic_SOS_PIP: ACE_optic_SOS_2D {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_SOS_PIP";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QUOTE(PATHTOF(models\ace_optics_pip.p3d)),QUOTE(PATHTOF(models\ace_optics_pip.p3d))};
                };
            };
        };
    };

    class optic_LRPS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
            };
        };
    };

    class ACE_optic_LRPS_2D: optic_LRPS {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_LRPS_2D";
        displayName = "$STR_A3_cfgWeapons_optic_LRPS0"; //@todo
        picture = "\A3\Weapons_F_EPB\Acc\Data\UI\gear_acco_sniper02_CA.paa";
        model = "\A3\Weapons_F_EPB\Acc\acco_sniper02_F.p3d";
        descriptionShort = "$STR_A3_cfgWeapons_optic_LRPS1";
        weaponInfoType = "ACE_RscWeapon_SOS";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QUOTE(PATHTOF(models\ace_optics_reticle90.p3d)),QUOTE(PATHTOF(models\ace_optics_reticle90.p3d))};
                    useModelOptics = 1;
                    opticsZoomInit = 0.01234;
                    opticsZoomMax = 0.04673;
                    opticsZoomMin = 0.01234;
                    discreteFOV[] = {};
                    opticsPPEffects[] += {"ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                };
            };
        };
    };

    class ACE_optic_LRPS_PIP: ACE_optic_LRPS_2D {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_optic_LRPS_PIP";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QUOTE(PATHTOF(models\ace_optics_pip.p3d)),QUOTE(PATHTOF(models\ace_optics_pip.p3d))};
                };
            };
        };
    };
};

class SlotInfo;
class CowsSlot: SlotInfo {
    compatibleItems[] += {
        "ACE_optic_Hamr_2D",
        "ACE_optic_Hamr_PIP",
        "ACE_optic_Arco_2D",
        "ACE_optic_Arco_PIP",
        "ACE_optic_MRCO_2D",
        "ACE_optic_MRCO_PIP",
        "ACE_optic_SOS_2D",
        "ACE_optic_SOS_PIP",
        "ACE_optic_LRPS_2D",
        "ACE_optic_LRPS_PIP",
        "ACE_optic_DMS"
    };
};

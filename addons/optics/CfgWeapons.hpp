class CfgWeapons {
    // PIP scopes
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    class optic_Hamr: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Hamr2Collimator;
                class Hamr2Scope;
            };
        };
    };

    class ACE_optic_Hamr_2D: optic_Hamr {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(hamr);

        // optional class, scripted 2d reticle data
        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"ACE_OpticsRadBlur1"};

            reticleTexture = QPATHTOF(reticles\hamr-reticle65_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\hamr-reticle65Illum_ca.paa);
            reticleTextureSize = 1;

            bodyTexture = QPATHTOF(reticles\hamr-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\hamr-bodyNight_ca.paa);
            bodyTextureSize = 1.95;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class Hamr2Collimator: Hamr2Collimator {};
                class Hamr2Scope: Hamr2Scope {
                    useModelOptics = 1;
                };
            };
        };
    };

    class ACE_optic_Hamr_PIP: ACE_optic_Hamr_2D {
        author = ECSTRING(common,ACETeam);
        scope = 1;

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_pip.p3d";
        };
    };














/*

    class optic_Arco: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ARCO2collimator;
                class ARCO2scope: ARCO2collimator {};
            };
        };
    };

    class ACE_optic_Arco_2D: optic_Arco {
        GVAR(BodyDay) = QPATHTOF(reticles\arco-body_ca.paa);
        GVAR(BodyNight) = QPATHTOF(reticles\arco-bodyNight_ca.paa);
        GVAR(ReticleDay) = QPATHTOF(reticles\arco-reticle65_ca.paa);
        GVAR(ReticleNight) = QPATHTOF(reticles\arco-reticle65Illum_ca.paa);

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_Arco_2D";
        displayName = CSTRING(arco);
        weaponInfoType = "ACE_RscWeapon_Arco";

        class ItemInfo: ItemInfo {
            modelOptics = QPATHTOF(models\ace_optics_reticle90.p3d);

            class OpticsModes: OpticsModes {
                class ARCO2collimator: ARCO2collimator {};
                class ARCO2scope: ARCO2scope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.0872664626;
                    opticsZoomMax = 0.0872664626;
                    opticsZoomMin = 0.0872664626;
                    opticsPPEffects[] = {"OpticsCHAbera5", "OpticsBlur5", "ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                    visionMode[] = {"Normal"};
                };
            };
        };
    };

    class ACE_optic_Arco_PIP: ACE_optic_Arco_2D {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_Arco_PIP";
        //scopeArsenal = 1;
        displayName = CSTRING(arco_pip);

        class ItemInfo: ItemInfo {
            modelOptics = QPATHTOF(models\ace_optics_pip.p3d);
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
        GVAR(BodyDay) = QPATHTOF(reticles\mrco-body_ca.paa);
        GVAR(BodyNight) = QPATHTOF(reticles\mrco-bodyNight_ca.paa);
        GVAR(ReticleDay) = QPATHTOF(reticles\mrco-reticle556_ca.paa);
        GVAR(ReticleNight) = QPATHTOF(reticles\mrco-reticle556Illum_ca.paa);

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_MRCO_2D";
        displayName = CSTRING(valdada);
        weaponInfoType = "ACE_RscWeapon_MRCO";

        class ItemInfo: ItemInfo {
            modelOptics = QPATHTOF(models\ace_optics_reticle90.p3d);

            class OpticsModes: OpticsModes {
                class MRCOcq: MRCOcq {};
                class MRCOscope: MRCOscope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.0872664626;
                    opticsZoomMax = 0.0872664626;
                    opticsZoomMin = 0.0872664626;
                    opticsPPEffects[] = {"OpticsCHAbera5", "OpticsBlur5", "ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                    visionMode[] = {"Normal"};
                };
            };
        };
    };

    class ACE_optic_MRCO_PIP: ACE_optic_MRCO_2D {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_MRCO_PIP";
        scope = 1;
        //scopeArsenal = 1;
        displayName = CSTRING(valdada_pip);

        class ItemInfo: ItemInfo {
            modelOptics = QPATHTOF(models\ace_optics_pip.p3d);
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
        GVAR(BodyDay) = QPATHTOF(reticles\sos-body_ca.paa);
        GVAR(BodyNight) = QPATHTOF(reticles\sos-bodyNight_ca.paa);
        GVAR(ReticleDay) = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
        GVAR(ReticleNight) = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_SOS_2D";
        displayName = CSTRING(sos);
        weaponInfoType = "ACE_RscWeapon_SOS";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QPATHTOF(models\ace_optics_reticle90.p3d), QPATHTOF(models\ace_optics_reticle90.p3d)};
                    useModelOptics = 1;
                    opticsZoomInit = 0.0116;
                    opticsZoomMax = 0.0464;
                    opticsZoomMin = 0.0116;
                    discreteFOV[] = {0.0464, 0.0116};
                    opticsPPEffects[] = {"OpticsCHAbera1", "OpticsBlur1", "ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                };
                class Iron: Iron {};
            };
        };
    };

    class ACE_optic_SOS_PIP: ACE_optic_SOS_2D {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_SOS_PIP";
        //scopeArsenal = 1;
        displayName = CSTRING(sos_pip);

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QPATHTOF(models\ace_optics_pip.p3d), QPATHTOF(models\ace_optics_pip.p3d)};
                };
                class Iron: Iron {};
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
        GVAR(BodyDay) = QPATHTOF(reticles\sos-body_ca.paa);
        GVAR(BodyNight) = QPATHTOF(reticles\sos-bodyNight_ca.paa);
        GVAR(ReticleDay) = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
        GVAR(ReticleNight) = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);

        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_LRPS_2D";
        displayName = CSTRING(lrps);
        weaponInfoType = "ACE_RscWeapon_SOS";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QPATHTOF(models\ace_optics_reticle90.p3d), QPATHTOF(models\ace_optics_reticle90.p3d)};
                    useModelOptics = 1;
                    opticsZoomInit = 0.0116;
                    opticsZoomMax = 0.0464;
                    opticsZoomMin = 0.0116;
                    discreteFOV[] = {};
                    opticsPPEffects[] = {"OpticsCHAbera1", "OpticsBlur1", "ACE_OpticsRadBlur1"};
                    opticsDisablePeripherialVision = 0;
                };
            };
        };
    };

    class ACE_optic_LRPS_PIP: ACE_optic_LRPS_2D {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_LRPS_PIP";
        //scopeArsenal = 1;
        displayName = CSTRING(lrps_pip);

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {QPATHTOF(models\ace_optics_pip.p3d), QPATHTOF(models\ace_optics_pip.p3d)};
                };
            };
        };
    };








    // zooming reticle scopes
    /*class optic_DMS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
                class Iron;
            };
        };
    };

    class ACE_optic_DMS: optic_DMS {
        author = ECSTRING(common,ACETeam);
        _generalMacro = "ACE_optic_DMS";
        scope = 1;
        displayName = "LOCALIZE ACE DMS";
        //descriptionShort = "$STR_A3_CFGWEAPONS_ACC_DMS1";
        weaponInfoType = "ACE_RscWeaponZeroing";

        class ItemInfo: ItemInfo {
            modelOptics = QPATHTOF(models\ace_shortdot_optics.p3d);

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
    };*/



    class Default;
    class Binocular: Default {
        forceOptics = 0;             // Allow using compass with Binocular
        opticsZoomMin = 0.056889;     // 5.25x power
        opticsZoomMax = 0.056889;     // 9 px/mil
        modelOptics = "\z\ace\addons\optics\models\NWD_M22_5x"; // 7 degrees horizontal field of view
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
        "ACE_optic_LRPS_PIP"
        //"ACE_optic_DMS"
    };
};

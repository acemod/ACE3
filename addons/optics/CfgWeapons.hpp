class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    // HAMR
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
    PIP(optic_Hamr);

    // ARCO
    class optic_Arco: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class ARCO2collimator;
                class ARCO2scope: ARCO2collimator {};
            };
        };
    };

    class ACE_optic_Arco_2D: optic_Arco {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(arco);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"ACE_OpticsRadBlur1"};

            reticleTexture = QPATHTOF(reticles\arco-reticle65_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\arco-reticle65Illum_ca.paa);
            reticleTextureSize = 1;

            bodyTexture = QPATHTOF(reticles\arco-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\arco-bodyNight_ca.paa);
            bodyTextureSize = 1.95;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class ARCO2collimator: ARCO2collimator {};
                class ARCO2scope: ARCO2scope {
                    useModelOptics = 1;
                };
            };
        };
    };
    PIP(optic_Arco);

    // MRCO
    class optic_MRCO: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class MRCOcq;
                class MRCOscope;
            };
        };
    };

    class ACE_optic_MRCO_2D: optic_MRCO {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(mrco);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"ACE_OpticsRadBlur1"};

            reticleTexture = QPATHTOF(reticles\mrco-reticle556_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\mrco-reticle556Illum_ca.paa);
            reticleTextureSize = 1;

            bodyTexture = QPATHTOF(reticles\mrco-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\mrco-bodyNight_ca.paa);
            bodyTextureSize = 1.95;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class MRCOcq: MRCOcq {};
                class MRCOscope: MRCOscope {
                    useModelOptics = 1;
                };
            };
        };
    };
    PIP(optic_MRCO);

    // SOS
    class optic_SOS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
                class Iron;
            };
        };
    };

    class ACE_optic_SOS_2D: optic_SOS {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(sos);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"ACE_OpticsRadBlur1"};

            reticleTexture = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);
            reticleTextureSize = 1;

            bodyTexture = QPATHTOF(reticles\sos-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\sos-bodyNight_ca.paa);
            bodyTextureSize = 1.95;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    useModelOptics = 1;
                };
                class Iron: Iron {};
            };
        };
    };
    PIP(optic_SOS);

    // LRPS
    class optic_LRPS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip;
            };
        };
    };

    class ACE_optic_LRPS_2D: optic_LRPS {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(lrps);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"ACE_OpticsRadBlur1"};

            reticleTexture = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);
            reticleTextureSize = 1;

            bodyTexture = QPATHTOF(reticles\sos-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\sos-bodyNight_ca.paa);
            bodyTextureSize = 1.95;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

                class Snip: Snip {
                    delete modelOptics;
                    //modelOptics[] = {"\x\cba\addons\optics\cba_optic_big_90.p3d", "\x\cba\addons\optics\cba_optic_big_90.p3d"};
                    useModelOptics = 1;
                    //opticsDisablePeripherialVision = 0;
                };
            };
        };
    };
    PIP(optic_LRPS);

    /* CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT CUT
    // DMS
    class optic_DMS: ItemCore {
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

    // Binocular
    class Default;
    class Binocular: Default {
        forceOptics = 0;             // Allow using compass with Binocular
        opticsZoomMin = 0.056889;     // 5.25x power
        opticsZoomMax = 0.056889;     // 9 px/mil
        modelOptics = "\z\ace\addons\optics\models\NWD_M22_5x"; // 7 degrees horizontal field of view
    };
};

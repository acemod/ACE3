class CfgWeapons {
    class ItemCore;
    class InventoryOpticsItem_Base_F;

    // HAMR
    class optic_Hamr: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Hamr2Scope;
                class Hamr2Collimator;
            };
        };
    };

    class ACE_optic_Hamr_2D: optic_Hamr {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(hamr);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"CBA_OpticsRadBlur3"};

            reticleTexture = QPATHTOF(reticles\hamr-reticle65_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\hamr-reticle65Illum_ca.paa);
            reticleTextureSize = 6 / 25 * 4; // At 25x using https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics#debug-reticle, the best choice is 6

            bodyTexture = QPATHTOF(reticles\hamr-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\hamr-bodyNight_ca.paa);
            bodyTextureSize = 2.2;

            hideMagnification = 1;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class Hamr2Scope: Hamr2Scope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.25 / 4;
                    opticsZoomMax = 0.25 / 4;
                    opticsZoomMin = 0.25 / 4;
                };
                class Hamr2Collimator: Hamr2Collimator {};
            };
        };
    };
    class ACE_optic_Hamr_PIP: ACE_optic_Hamr_2D {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(hamr_pip);

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_pip.p3d";
        };
    };

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
            opticsPPEffects[] = {"CBA_OpticsRadBlur3"};

            reticleTexture = QPATHTOF(reticles\arco-reticle65_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\arco-reticle65Illum_ca.paa);
            reticleTextureSize = 6.4 / 25 * 4; // At 25x using https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics#debug-reticle, the best choice is 6.4

            bodyTexture = QPATHTOF(reticles\arco-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\arco-bodyNight_ca.paa);
            bodyTextureSize = 2.2;

            hideMagnification = 1;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class ARCO2scope: ARCO2scope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.25 / 4;
                    opticsZoomMax = 0.25 / 4;
                    opticsZoomMin = 0.25 / 4;
                };
                class ARCO2collimator: ARCO2collimator {};
            };
        };
    };
    class ACE_optic_Arco_PIP: ACE_optic_Arco_2D {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(arco_pip);

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_pip.p3d";
        };
    };

    // MRCO
    class optic_MRCO: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class MRCOscope;
                class MRCOcq;
            };
        };
    };

    class ACE_optic_MRCO_2D: optic_MRCO {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(mrco);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"CBA_OpticsRadBlur3"};

            reticleTexture = QPATHTOF(reticles\mrco-reticle556_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\mrco-reticle556Illum_ca.paa);
            reticleTextureSize = 6.4 / 25 * 4; // At 25x using https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics#debug-reticle, the best choice is 6.4

            bodyTexture = QPATHTOF(reticles\mrco-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\mrco-bodyNight_ca.paa);
            bodyTextureSize = 2.2;

            hideMagnification = 1;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_90.p3d";

            class OpticsModes: OpticsModes {
                class MRCOscope: MRCOscope {
                    useModelOptics = 1;
                    opticsZoomInit = 0.25 / 4;
                    opticsZoomMax = 0.25 / 4;
                    opticsZoomMin = 0.25 / 4;
                };
                class MRCOcq: MRCOcq {};
            };
        };
    };
    class ACE_optic_MRCO_PIP: ACE_optic_MRCO_2D {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(mrco_pip);

        class ItemInfo: ItemInfo {
            modelOptics = "\x\cba\addons\optics\cba_optic_big_pip.p3d";
        };
    };

    // SOS
    class optic_SOS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    modelOptics[] = {QPATHTOF(models\reticle_sos_2x), QPATHTOF(models\reticle_sos_5x)};
                };
                class Iron;
            };
        };
    };

    class ACE_optic_SOS_2D: optic_SOS {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(sos);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"CBA_OpticsRadBlur3"};

            reticleTexture = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);
            reticleTextureSize = 0.76; // At 22x using https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics#debug-reticle, the best choice is 0.76

            bodyTexture = QPATHTOF(reticles\sos-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\sos-bodyNight_ca.paa);
            bodyTextureSize = 1.55;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    opticsZoomMin = "5.5 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomMax = "2.75 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomInit = "2.75 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    discreteFov[] = {};
                    modelOptics[] = {"\x\cba\addons\optics\cba_optic_big_90.p3d"};
                    useModelOptics = 1;
                };
                class Iron: Iron {};
            };
        };
    };
    class ACE_optic_SOS_PIP: ACE_optic_SOS_2D {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(sos_pip);

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {"\x\cba\addons\optics\cba_optic_big_pip.p3d"};
                };
                class Iron: Iron {};
            };
        };
    };

    // LRPS
    class optic_LRPS: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class Snip {
                    modelOptics[] = {QPATHTOF(models\reticle_lrps_6x), QPATHTOF(models\reticle_lrps_25x)};
                };
            };
        };
    };

    // AMS
    class optic_AMS_base: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class AMS {
                    modelOptics[] = {QPATHTOF(models\reticle_ams_3x), QPATHTOF(models\reticle_ams_10x)};
                };
            };
        };
    };

    // Kahlia
    class optic_KHS_base: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS {
                    modelOptics[] = {QPATHTOF(models\reticle_khs_5x), QPATHTOF(models\reticle_khs_11x)};
                };
            };
        };
    };

    // Kahlia (Old)
    class optic_KHS_old: ItemCore {
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class KHS {
                    modelOptics[] = {QPATHTOF(models\reticle_khs_5x), QPATHTOF(models\reticle_khs_11x)};
                };
            };
        };
    };

    class ACE_optic_LRPS_2D: optic_LRPS {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(lrps);

        class CBA_ScriptedOptic {
            opticsPPEffects[] = {"CBA_OpticsRadBlur3"};

            reticleTexture = QPATHTOF(reticles\sos-reticleMLR_ca.paa);
            reticleTextureNight = QPATHTOF(reticles\sos-reticleMLRIllum_ca.paa);
            reticleTextureSize = 0.76; // At 22x using https://github.com/CBATeam/CBA_A3/wiki/Scripted-Optics#debug-reticle, the best choice is 0.76

            bodyTexture = QPATHTOF(reticles\sos-body_ca.paa);
            bodyTextureNight = QPATHTOF(reticles\sos-bodyNight_ca.paa);
            bodyTextureSize = 1.55;
        };
        weaponInfoType = "CBA_ScriptedOptic";

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    opticsZoomMin = "22 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomMax = "5.5 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    opticsZoomInit = "5.5 call (uiNamespace getVariable 'cba_optics_fnc_setOpticMagnificationHelper')";
                    discreteFov[] = {};
                    modelOptics[] = {"\x\cba\addons\optics\cba_optic_big_90.p3d"};
                    useModelOptics = 1;
                };
            };
        };
    };
    class ACE_optic_LRPS_PIP: ACE_optic_LRPS_2D {
        author = ECSTRING(common,ACETeam);
        scope = 1;
        displayName = CSTRING(lrps_pip);

        class ItemInfo: ItemInfo {
            class OpticsModes: OpticsModes {
                class Snip: Snip {
                    modelOptics[] = {"\x\cba\addons\optics\cba_optic_big_pip.p3d"};
                };
            };
        };
    };

    // Binocular
    class Default;
    class Binocular: Default {
        opticsZoomInit = 0.056889;    // 7x power IRL
        opticsZoomMin = 0.056889;     // but in order to make the stadiametric rangefinder useful, ~4.4x magnification has been set
        opticsZoomMax = 0.056889;     // 9 px/mil
        modelOptics = "\z\ace\addons\optics\models\NWD_M22_5x"; // 7 degrees horizontal field of view (Steiner M22)
        // Fix AI using Binocs on short range - #18737
        // minRange = 300; // 300 = uses Rangefinder often (runs a few meters, stops, uses RF, repeats)
        minRange = 500; // 500 = seem almost never use it..?
        minRangeProbab = 0.001;
        midRange = 1000;
        midRangeProbab = 0.01;
        maxRange = 5000;
        maxRangeProbab = 0.01;
    };
};

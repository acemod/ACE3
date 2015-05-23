class cfgWeapons {
    class ItemCore;    // External class reference
    class InventoryItem_Base_F;    // External class reference
    class InventoryOpticsItem_Base_F;    // External class reference
    
    class RKSL_optic_LDS : ItemCore {
        scope = 2;
        displayName = "LDS";
        descriptionShort = "Lightweight Day Sight (LDS)";
        weaponInfoType = "ACE_RscWeapon_RKSL_LDS";

        ACE_optics_reticleDay = QUOTE(PATHTOF(reticles\lds-reticle556_ca.paa));
        ACE_optics_reticleNight = QUOTE(PATHTOF(reticles\lds-reticle556Illum_ca.paa));
        ACE_optics_bodyDay = QUOTE(PATHTOF(reticles\lds-body_ca.paa));
        ACE_optics_bodyNight = QUOTE(PATHTOF(reticles\lds-bodyNight_ca.paa));
        
        class ItemInfo : InventoryOpticsItem_Base_F {
            opticType = 1;
            mass = 4;
            RMBhint = "Lightweight Day Sight";
            optics = true;
            modelOptics = "\z\ace\addons\optics\models\ace_optics_reticle90.p3d";
            
            class OpticsModes{

                class CQB {
                    opticsID = 1;
                    useModelOptics = 0;
                    opticsPPEffects[] = {""};
                    opticsFlare = false;
                    opticsDisablePeripherialVision = false;
                    opticsZoomMin = 0.375;
                    opticsZoomMax = 1.1;
                    opticsZoomInit = 0.75;
                    memoryPointCamera = "eye";
                    visionMode[] = {};
                    distanceZoomMin = 100;
                    distanceZoomMax = 100;
                    cameraDir = "";
                };
                
                class LDS : CQB {
                    opticsID = 2;
                    useModelOptics = 1;
                    opticsppeffects[] = {"OpticsCHAbera5", "OpticsBlur5", "ACE_OpticsRadBlur1"};
                    opticszoominit = 0.0872664626;
                    opticszoommax = 0.0872664626;
                    opticszoommin = 0.0872664626;
                    discretefov[] = {0.0872664626};
                    discreteinitindex = 0;
                    memoryPointCamera = "opticView";
                    visionMode[] = {"Normal"};
                    distanceZoomMin = 300;
                    distanceZoomMax = 300;
                    modeloptics = "\z\ace\addons\optics\models\ace_optics_reticle90.p3d";
                    opticsFlare = true;
                    opticsDisablePeripherialVision = true;
                };
            };
        };
    };

    class ACE_optic_RKSL_LDS_PIP: RKSL_optic_LDS {
        author = "da12thMonkey";
        displayName = "LDS (PiP)";

        class ItemInfo: ItemInfo {
            modelOptics = "\z\ace\addons\optics\models\ace_optics_reticle90.p3d";

            class OpticsModes: OpticsModes {

                class CQB : CQB {
                };

                class LDS : LDS {
                    modelOptics = "\z\ace\addons\optics\models\ace_optics_pip.p3d";
                };
            };
        };
    };
};
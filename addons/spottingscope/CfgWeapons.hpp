class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_SpottingScope: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DisplayName);
        descriptionShort = "";
        picture = QPATHTOF(UI\w_spottingscope_ca.paa);
        model = QPATHTOF(data\ace_spottingscope.p3d);
        ACE_isTool = 1;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 40;
        };
    };

    class ItemCore;
    class ACE_SpottingScopeOptic: ItemCore {
        scope = 1;

        class CBA_ScriptedOptic {
            minMagnificationReticleScale[] = {5,1};
            maxMagnificationReticleScale[] = {25,5};

            reticleDetailTextures[] = {
                // start at > this magnification, reticleTexture, reticleTextureSize, reticleTextureNight (optional)
                {0,  QPATHTOF(data\ace_spottingscope_reticle_b1_ca.paa), 1,   QPATHTOF(data\ace_spottingscope_reticle_b1_ca.paa)},
                {9,  QPATHTOF(data\ace_spottingscope_reticle_b2_ca.paa), 1/2, QPATHTOF(data\ace_spottingscope_reticle_b2_ca.paa)},
                {14, QPATHTOF(data\ace_spottingscope_reticle_b3_ca.paa), 1/3, QPATHTOF(data\ace_spottingscope_reticle_b3_ca.paa)},
                {19, QPATHTOF(data\ace_spottingscope_reticle_b4_ca.paa), 1/4, QPATHTOF(data\ace_spottingscope_reticle_b4_ca.paa)},
                {24, QPATHTOF(data\ace_spottingscope_reticle_b5_ca.paa), 1/5, QPATHTOF(data\ace_spottingscope_reticle_b5_ca.paa)}
            };
            fadeReticleInterval[] = {10.5,9.5};

            bodyTexture = QPATHTOF(data\ace_spottingscope_body_co.paa);
            //bodyTextureNight = QPATHTOF(data\ace_spottingscope_body_co.paa);
            bodyTextureSize = 1.5;
            reticleSafezoneSize = 1;
            hidePeripheralVision = 1;
            opticsPPEffects[] = {QGVAR(OpticsRadBlur1)};
        };
    };
};

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
                {0,  PATHTOF(data\ace_spottingscope_reticle_b1_ca.paa), 1,   PATHTOF(data\ace_spottingscope_reticle_b1_ca.paa)},
                {9,  PATHTOF(data\ace_spottingscope_reticle_b2_ca.paa), 1/2, PATHTOF(data\ace_spottingscope_reticle_b2_ca.paa)},
                {14, PATHTOF(data\ace_spottingscope_reticle_b3_ca.paa), 1/3, PATHTOF(data\ace_spottingscope_reticle_b3_ca.paa)},
                {19, PATHTOF(data\ace_spottingscope_reticle_b4_ca.paa), 1/4, PATHTOF(data\ace_spottingscope_reticle_b4_ca.paa)},
                {24, PATHTOF(data\ace_spottingscope_reticle_b5_ca.paa), 1/5, PATHTOF(data\ace_spottingscope_reticle_b5_ca.paa)}
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

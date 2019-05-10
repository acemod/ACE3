class CfgWeapons {
    class Binocular;
    class ACE_Vector: Binocular {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(VectorName);
        descriptionShort = CSTRING(VectorDescription);
        model = QPATHTOF(ace_vector.p3d);
        picture = QPATHTOF(UI\ace_vector_x_ca.paa);
        visionMode[] = {"Normal","NVG"};
        opticsZoomMax = 0.25/7;
        opticsZoomMin = 0.25/7;
        opticsDisablePeripherialVision = 1.5;
        modelOptics = "\A3\Weapons_F\empty.p3d";

        class CBA_ScriptedOptic {
            minMagnificationReticleScale[] = {7,7/5*1.026};
            maxMagnificationReticleScale[] = {7,7/5*1.026};

            reticleDetailTextures[] = {
                // start at > this magnification, reticleTexture, reticleTextureSize, reticleTextureNight (optional)
                {0,  PATHTOF(data\reticles\ace_vector_reticle_1_ca.paa), 1},
                {9,  PATHTOF(data\reticles\ace_vector_reticle_2_ca.paa), 1/2}
            };

            bodyTexture = QPATHTOF(data\reticles\ace_vector_body_co.paa);
            //bodyTextureNight = QPATHTOF(data\reticles\ace_vector_body_co.paa);
            bodyTextureSize = 1.25;
            reticleSafezoneSize = 1;
            hidePeripheralVision = 1;
        };
        weaponInfoType = "ACE_RscOptics_vector";
    };

    class ACE_VectorDay: ACE_Vector {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(VectorDayName);
        visionMode[] = {"Normal"};
    };
};

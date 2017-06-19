class CfgWeapons {
    class Binocular;
    class NVGoggles: Binocular {
        displayName = CSTRING(NVG_Gen3_brown);
        ACE_NightVision_grain = 0.75;
        ACE_NightVision_blur = 0.055;
        ACE_NightVision_radBlur = 0.001;
    };
    class NVGoggles_OPFOR: NVGoggles {
        displayName = CSTRING(NVG_Gen3_black);
    };
    class NVGoggles_INDEP: NVGoggles {
        displayName = CSTRING(NVG_Gen3_green);
    };

    class ACE_NVG_Gen1: NVGoggles_OPFOR {
        author = ECSTRING(common,ACETeam);
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        displayName = CSTRING(NVG_Gen1);
        ACE_NightVision_grain = 2.25;
        ACE_NightVision_blur = 0.22;
        ACE_NightVision_radBlur = 0.004;
    };
    class ACE_NVG_Gen2: NVGoggles_INDEP {
        author = ECSTRING(common,ACETeam);
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        displayName = CSTRING(NVG_Gen2);
        ACE_NightVision_grain = 1.5;
        ACE_NightVision_blur = 0.11;
        ACE_NightVision_radBlur = 0.002;
    };
    /*class ACE_NVG_Gen3: NVGoggles {
    author = ECSTRING(common,ACETeam);
    modelOptics = "\A3\weapons_f\reticle\optics_night";
    displayName = CSTRING(NVG_Gen3);
    ACE_NightVision_grain = 0.75;
    ACE_NightVision_blur = 0.055;
    ACE_NightVision_radBlur = 0.001;
};*/
    class ACE_NVG_Gen4: NVGoggles {
        author = ECSTRING(common,ACETeam);
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        displayName = CSTRING(NVG_Gen4);
        ACE_NightVision_grain = 0.0;
        ACE_NightVision_blur = 0.0;
        ACE_NightVision_radBlur = 0.0;
    };
    class ACE_NVG_Wide: NVGoggles {
        author = ECSTRING(common,ACETeam);
        modelOptics = QPATHTOF(models\ACE_nvg_wide_optics);
        displayName = CSTRING(NVG_FullScreen);
        ACE_NightVision_grain = 0.75;
        ACE_NightVision_blur = 0.055;
        ACE_NightVision_radBlur = 0.001;
    };
};

class CfgWeapons {
    class Binocular;
    class NVGoggles: Binocular {
        displayName = "$STR_ACE_NightVision_NVG_Gen3_brown";
        ACE_NightVision_grain = 0.75;
        ACE_NightVision_blur = 0.055;
        ACE_NightVision_radBlur = 0.001;
    };
    class NVGoggles_OPFOR: NVGoggles {
        displayName = "$STR_ACE_NightVision_NVG_Gen3_black";
    };
    class NVGoggles_INDEP: NVGoggles {
        displayName = "$STR_ACE_NightVision_NVG_Gen3_green";
    };

    class ACE_NVG_Gen1: NVGoggles_OPFOR {
        author = "$STR_ACE_Common_ACETeam";
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        displayName = "$STR_ACE_NightVision_NVG_Gen1";
        ACE_NightVision_grain = 2.25;
        ACE_NightVision_blur = 0.22;
        ACE_NightVision_radBlur = 0.004;
    };
    class ACE_NVG_Gen2: NVGoggles_INDEP {
        author = "$STR_ACE_Common_ACETeam";
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        displayName = "$STR_ACE_NightVision_NVG_Gen2";
        ACE_NightVision_grain = 1.5;
        ACE_NightVision_blur = 0.11;
        ACE_NightVision_radBlur = 0.002;
    };
    /*class ACE_NVG_Gen3: NVGoggles {
    author = "$STR_ACE_Common_ACETeam";
    modelOptics = "\A3\weapons_f\reticle\optics_night";
    displayName = "$STR_ACE_NightVision_NVG_Gen3";
    ACE_NightVision_grain = 0.75;
    ACE_NightVision_blur = 0.055;
    ACE_NightVision_radBlur = 0.001;
};*/
    class ACE_NVG_Gen4: NVGoggles {
        author = "$STR_ACE_Common_ACETeam";
        modelOptics = "\A3\weapons_f\reticle\optics_night";
        displayName = "$STR_ACE_NightVision_NVG_Gen4";
        ACE_NightVision_grain = 0.0;
        ACE_NightVision_blur = 0.0;
        ACE_NightVision_radBlur = 0.0;
    };
    class ACE_NVG_Wide: NVGoggles {
        author = "$STR_ACE_Common_ACETeam";
        modelOptics = QUOTE(PATHTOF(models\ACE_nvg_wide_optics));
        displayName = "$STR_ACE_NightVision_NVG_FullScreen";
        ACE_NightVision_grain = 0.75;
        ACE_NightVision_blur = 0.055;
        ACE_NightVision_radBlur = 0.001;
    };
};

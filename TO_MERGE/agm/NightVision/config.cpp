class CfgPatches {
  class AGM_NightVision {
    units[] = {};
    weapons[] = {"AGM_NVG_Gen1", "AGM_NVG_Gen2", /*"AGM_NVG_Gen3",*/ "AGM_NVG_Gen4", "AGM_NVG_Wide"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "KoffeinFlummi"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_NightVision {
    class AGM_NightVision {
      file = "\AGM_nightvision\functions";
      class blending;
      class decreaseNVGBrightness;
      class increaseNVGBrightness;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_NightVision {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_NightVision\clientInit.sqf'";
  };
};

class Extended_FiredBIS_EventHandlers {
  class AllVehicles {
    class AGM_NightVision_Blending {
      clientFiredBIS = "if (_this select 0 == vehicle AGM_player && {currentVisionMode (_this select 0) == 1}) then {_this call AGM_NightVision_fnc_blending};";
    };
  };
};

class AGM_Core_Default_Keys {
  class increaseNVGBrightness {
    displayName = "$STR_AGM_NightVision_IncreaseNVGBrightness";
    condition = "currentVisionMode _player == 1";
    statement = "[_player, _vehicle] call AGM_NightVision_fnc_increaseNVGBrightness";
    key = 201;
    shift = 0;
    control = 0;
    alt = 1;
    allowHolding = 1;
  };
  class decreaseNVGBrightness {
    displayName = "$STR_AGM_NightVision_DecreaseNVGBrightness";
    condition = "currentVisionMode _player == 1";
    statement = "[_player, _vehicle] call AGM_NightVision_fnc_decreaseNVGBrightness";
    key = 209;
    shift = 0;
    control = 0;
    alt = 1;
    allowHolding = 1;
  };
};

class CfgVehicles {
  class All {
    AGM_NightVision_grain = 0.75;
    AGM_NightVision_blur = 0.055;
  };

  #define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
    name = #ITEM; \
    count = COUNT; \
  };

  class Box_NATO_Support_F;
  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_NVG_Gen1,6)
      MACRO_ADDITEM(AGM_NVG_Gen2,6)
    //MACRO_ADDITEM(AGM_NVG_Gen3,6)
      MACRO_ADDITEM(AGM_NVG_Gen4,6)
      MACRO_ADDITEM(AGM_NVG_Wide,6)
    };
  };
};

class CfgWeapons {
  class Binocular;
  class NVGoggles: Binocular {
    displayName = "$STR_AGM_NightVision_NVG_Gen3_brown";
    AGM_NightVision_grain = 0.75;
    AGM_NightVision_blur = 0.055;
    AGM_NightVision_radBlur = 0.001;
  };
  class NVGoggles_OPFOR: NVGoggles {
    displayName = "$STR_AGM_NightVision_NVG_Gen3_black";
  };
  class NVGoggles_INDEP: NVGoggles {
    displayName = "$STR_AGM_NightVision_NVG_Gen3_green";
  };

  class AGM_NVG_Gen1: NVGoggles_OPFOR {
    author = "$STR_AGM_Core_AGMTeam";
    modelOptics = "\A3\weapons_f\reticle\optics_night";
    displayName = "$STR_AGM_NightVision_NVG_Gen1";
    AGM_NightVision_grain = 2.25;
    AGM_NightVision_blur = 0.22;
    AGM_NightVision_radBlur = 0.004;
  };
  class AGM_NVG_Gen2: NVGoggles_INDEP {
    author = "$STR_AGM_Core_AGMTeam";
    modelOptics = "\A3\weapons_f\reticle\optics_night";
    displayName = "$STR_AGM_NightVision_NVG_Gen2";
    AGM_NightVision_grain = 1.5;
    AGM_NightVision_blur = 0.11;
    AGM_NightVision_radBlur = 0.002;
  };
  /*class AGM_NVG_Gen3: NVGoggles {
    author = "$STR_AGM_Core_AGMTeam";
    modelOptics = "\A3\weapons_f\reticle\optics_night";
    displayName = "$STR_AGM_NightVision_NVG_Gen3";
    AGM_NightVision_grain = 0.75;
    AGM_NightVision_blur = 0.055;
    AGM_NightVision_radBlur = 0.001;
  };*/
  class AGM_NVG_Gen4: NVGoggles {
    author = "$STR_AGM_Core_AGMTeam";
    modelOptics = "\A3\weapons_f\reticle\optics_night";
    displayName = "$STR_AGM_NightVision_NVG_Gen4";
    AGM_NightVision_grain = 0.0;
    AGM_NightVision_blur = 0.0;
    AGM_NightVision_radBlur = 0.0;
  };
  class AGM_NVG_Wide: NVGoggles {
    author = "$STR_AGM_Core_AGMTeam";
    // modelOptics = "\AGM_NightVision\weapons\agm_nvg_wide";
    modelOptics = "\agm_nightvision\agm_nvg_wide_optics.p3d";
    displayName = "$STR_AGM_NightVision_NVG_FullScreen";
    AGM_NightVision_grain = 0.75;
    AGM_NightVision_blur = 0.055;
    AGM_NightVision_radBlur = 0.001;
  };
};

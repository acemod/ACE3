// PATCH CONFIG
class CfgPatches {
  class AGM_Movement {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.10;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "KoffeinFlummi", "Tachii"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Movement {
    class AGM_Movement {
      file = "AGM_Movement\functions";
      class blinking;
      class canClimb;
      class climb;
      class fatigueModule;
      class heartbeat;
      class getWeight;
      class handleClimb;
      class recoil;
      class stumble;
      class vision;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Movement {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Movement\clientInit.sqf'";
  };
};

class AGM_Core_Default_Keys {
  class climb {
    displayName = "$STR_AGM_Movement_Climb";
    condition = "_player == _vehicle";
    statement = "[_player] call AGM_Movement_fnc_climb";
    key = 47;
    shift = 0;
    control = 1;
    alt = 0;
  };
};

/*class CfgInventoryGlobalVariable {
  maxSoldierLoad = 1200;
};*/

class CfgFatigue {
  MinValue1 = 0.2;
  MinValue2 = 0.8;
  NormalRunSpeed = 7.2;
  TiredRunSpeedLimit = 0.8;
  FrequencyMin = 0.2;
  FrequencyMax = 1.0;
  TotalLoadCoef = 1.1;
  MaxDuty = 10;
};

class CfgSounds {
  class AGM_Heartbeat {
    name = "AGM_Heartbeat";
    sound[] = {"AGM_Movement\sounds\heartbeat.ogg",1,1};
    titles[] = {};
  };
};

class AGM_Core_Options {
  class useImperial {
    displayName = "$STR_AGM_Movement_UseImperial";
    default = 0;
  };
};

// leaving this for compatibility
class CfgVehicles {
  class Module_F;
  class AGM_ModuleFatigue: Module_F {
    author = "AGM Team";
    category = "AGM";
    displayName = "Fatigue System";
    function = "AGM_Movement_fnc_fatigueModule";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Movement\UI\IconFatigue_ca.paa";
    class Arguments {
      class CoefFatigue {
        displayName = "Getting Tired Coef.";
        description = "Multiplier for the rate of getting tired. Default: 1";
        defaultValue = 1;
      };
      class CoefRecover {
        displayName = "Recover Coef.";
        description = "Multiplier for the time to rest after getting tired. Default: 1";
        defaultValue = 1;
      };
    };
  };
};

class CfgMovesBasic {
  class ManActions {
    AGM_Climb = "AGM_Climb";
  };

  class Actions {
    class RifleStandActionsNoAdjust;
    class RifleLowStandActionsNoAdjust;

    // WEAPON RAISED - RUNNING
    class RifleStandActionsRunF: RifleStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    class RifleStandActionsRunFL: RifleStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    class RifleStandActionsRunFR: RifleStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    // WEAPON RAISED - SPRINTING
    class RifleStandEvasiveActionsF: RifleStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    class RifleStandEvasiveActionsFL: RifleStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    class RifleStandEvasiveActionsFR: RifleStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    // WEAPON LOWERED - RUNNING
    class RifleLowStandActionsRunF: RifleLowStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    class RifleLowStandActionsRunFL: RifleLowStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
    class RifleLowStandActionsRunFR: RifleLowStandActionsNoAdjust {
      getOver = "AovrPercMrunSrasWrflDf";
    };
  };
};

class CfgMovesMaleSdr: CfgMovesBasic {
  class StandBase;
  class States {
    // better slow walk with lowered rifle animation
    class AmovPercMstpSrasWrflDnon;
    class AmovPercMrunSrasWrflDf: AmovPercMstpSrasWrflDnon {
      InterpolateTo[] = {"AovrPercMrunSrasWrflDf",0.22,"AmovPercMrunSlowWrflDf",0.025,"AmovPercMwlkSrasWrflDf",0.025,"AmovPknlMrunSrasWrflDf",0.03,"AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon",0.02,"AmovPercMevaSrasWrflDf",0.025,"Unconscious",0.01,"AmovPercMtacSrasWrflDf",0.02,"AmovPercMrunSrasWrflDfl",0.02,"AmovPercMrunSrasWrflDfl_ldst",0.02,"AmovPercMrunSrasWrflDfr",0.02,"AmovPercMrunSrasWrflDfr_ldst",0.02,"AmovPercMstpSrasWrflDnon",0.02,"AmovPercMrunSrasWrflDl",0.02,"AmovPercMrunSrasWrflDbl",0.02,"AmovPercMrunSrasWrflDb",0.02,"AmovPercMrunSrasWrflDbr",0.02,"AmovPercMrunSrasWrflDr",0.02,"AmovPknlMstpSlowWrflDnon_relax",0.1,"AmovPercMrunSrasWrflDf_ldst",0.02,"AmovPercMrunSrasWrflDf",0.02};
    };

    class AmovPercMstpSlowWrflDnon;
    class AmovPercMwlkSlowWrflDf: AmovPercMstpSlowWrflDnon {
      speed = 0.3; //0.206897;
      file = "\A3\anims_f\Data\Anim\Sdr\Mov\Erc\Wlk\Low\Rfl\AmovPercMwlkSlowWrflDf_ver2";
      leftHandIKCurve[] = {1};
    };
    class AmovPercMwlkSlowWrflDfl: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };
    class AmovPercMwlkSlowWrflDfr: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };
    class AmovPercMwlkSlowWrflDb: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };
    class AmovPercMwlkSlowWrflDbl: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };
    class AmovPercMwlkSlowWrflDbr: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };
    class AmovPercMwlkSlowWrflDl: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };
    class AmovPercMwlkSlowWrflDr: AmovPercMwlkSlowWrflDf {
      leftHandIKCurve[] = {};
    };

    // enable optics in prone left and right stance
    class AidlPpneMstpSrasWrflDnon_G0S;
    class AadjPpneMstpSrasWrflDleft: AidlPpneMstpSrasWrflDnon_G0S {
      enableOptics = 1;
    };
    class AadjPpneMstpSrasWrflDright: AidlPpneMstpSrasWrflDnon_G0S {
      enableOptics = 1;
    };
    class AadjPpneMstpSrasWrflDup;
    class AadjPpneMstpSrasWrflDdown: AadjPpneMstpSrasWrflDup {
      enableOptics = 1;
    };

    class AidlPpneMstpSrasWpstDnon_G0S;
    class AadjPpneMstpSrasWpstDleft: AidlPpneMstpSrasWpstDnon_G0S {
      enableOptics = 2;
    };
    class AadjPpneMstpSrasWpstDright: AidlPpneMstpSrasWpstDnon_G0S {
      enableOptics = 2;
    };
    class AadjPpneMstpSrasWpstDup;
    class AadjPpneMstpSrasWpstDdown: AadjPpneMstpSrasWpstDup {
      enableOptics = 2;
    };

    // climb animation
    class AmovPercMstpSnonWnonDnon: StandBase {
      ConnectTo[] += {"AGM_Climb",0.02};
    };

    class AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium;
    class AGM_Climb: AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium {
      canReload = 0;
      forceAim = 1;
    };
  };
};

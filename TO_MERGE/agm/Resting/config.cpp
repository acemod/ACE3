// PATCH CONFIG
class CfgPatches {
  class AGM_Resting {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "TaoSensai"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

class CfgFunctions {
  class AGM_Resting {
    class AGM_Resting {
      file = "AGM_Resting\functions";
      class hasBipod;
      class restWeapon;
    };
  };
};

class AGM_Core_Default_Keys {
  class restWeapon {
    displayName = "$STR_AGM_Resting_RestWeapon";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon && {inputAction 'reloadMagazine' == 0} && {!weaponLowered _player} && {speed _player < 1}";
    statement = "[_player, _vehicle, currentWeapon _player] call AGM_Resting_fnc_restWeapon";
    key = 15;
    shift = 0;
    control = 0;
    alt = 0;
  };
};

class CfgWeapons {
  class Rifle_Long_Base_F;
  class arifle_MX_Base_F;

  class arifle_MX_SW_F : arifle_MX_Base_F {
    AGM_Bipod = 1;
  };

  class LMG_Mk200_F : Rifle_Long_Base_F {
    AGM_Bipod = 1;
  };
  class LMG_Zafir_F: Rifle_Long_Base_F {
    AGM_Bipod = 1;
  };

  class LRR_base_F : Rifle_Long_Base_F {
    AGM_Bipod = 1;
  };
  class GM6_base_F : Rifle_Long_Base_F {
    AGM_Bipod = 1;
  };
};

// CODE BELOW TAKEN FROM TMR, PREFIXES EDITED FOR COMPATABILITY

#define AGM_SWAY_DEPLOY       0.02
#define AGM_SWAY_DEPLOYPRONE  0.01
#define AGM_SWAY_RESTED       0.04  //0.08
#define AGM_SWAY_RESTEDPRONE  0.02  //0.04
#define AGM_DEPLOY_TURNSPEED  0.1

// Arma 3 doesn't respect turnSpeed.

class CfgMovesBasic {
  class Default;

  class Actions {
    class RifleStandActions;
    class RifleStandActions_agm_deploy : RifleStandActions {
      stop =    "AmovPercMstpSrasWrflDnon_agm_deploy";
      default = "AmovPercMstpSrasWrflDnon_agm_deploy";
      turnL =   "AmovPercMstpSrasWrflDnon_agm_deploy";
      turnR =   "AmovPercMstpSrasWrflDnon_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustLStandActions;
    class RifleAdjustLStandActions_agm_deploy : RifleAdjustLStandActions {
      stop =    "AadjPercMstpSrasWrflDleft_agm_deploy";
      default = "AadjPercMstpSrasWrflDleft_agm_deploy";
      AdjustL = "AadjPercMstpSrasWrflDleft_agm_deploy";
      turnL =   "AadjPercMstpSrasWrflDleft_agm_deploy";
      turnR =   "AadjPercMstpSrasWrflDleft_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustRStandActions;
    class RifleAdjustRStandActions_agm_deploy : RifleAdjustRStandActions {
      stop =    "AadjPercMstpSrasWrflDright_agm_deploy";
      default = "AadjPercMstpSrasWrflDright_agm_deploy";
      AdjustRight = "AadjPercMstpSrasWrflDright_agm_deploy";
      turnL =   "AadjPercMstpSrasWrflDright_agm_deploy";
      turnR =   "AadjPercMstpSrasWrflDright_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustFStandActions;
    class RifleAdjustFStandActions_agm_deploy : RifleAdjustFStandActions {
      stop =    "AadjPercMstpSrasWrflDup_agm_deploy";
      default = "AadjPercMstpSrasWrflDup_agm_deploy";
      AdjustF = "AadjPercMstpSrasWrflDup_agm_deploy";
      turnL =   "AadjPercMstpSrasWrflDup_agm_deploy";
      turnR =   "AadjPercMstpSrasWrflDup_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustBStandActions;
    class RifleAdjustBStandActions_agm_deploy : RifleAdjustBStandActions {
      stop =    "AadjPercMstpSrasWrflDdown_agm_deploy";
      default = "AadjPercMstpSrasWrflDdown_agm_deploy";
      AdjustB = "AadjPercMstpSrasWrflDdown_agm_deploy";
      turnR =   "AadjPercMstpSrasWrflDdown_agm_deploy";
      turnL =   "AadjPercMstpSrasWrflDdown_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleKneelActions;
    class RifleKneelActions_agm_deploy : RifleKneelActions {
      stop =    "AmovPknlMstpSrasWrflDnon_agm_deploy";
      default = "AmovPknlMstpSrasWrflDnon_agm_deploy";
      crouch =  "AmovPknlMstpSrasWrflDnon_agm_deploy"; // TODO: this might cause issues
      turnL =   "AmovPknlMstpSrasWrflDnon_agm_deploy";
      turnR =   "AmovPknlMstpSrasWrflDnon_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustLKneelActions;
    class RifleAdjustLKneelActions_agm_deploy : RifleAdjustLKneelActions {
      stop =    "AadjPknlMstpSrasWrflDleft_agm_deploy";
      default = "AadjPknlMstpSrasWrflDleft_agm_deploy";
      turnL =   "AadjPknlMstpSrasWrflDleft_agm_deploy";
      turnR =   "AadjPknlMstpSrasWrflDleft_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustRKneelActions;
    class RifleAdjustRKneelActions_agm_deploy : RifleAdjustRKneelActions {
      stop =    "AadjPknlMstpSrasWrflDright_agm_deploy";
      default = "AadjPknlMstpSrasWrflDright_agm_deploy";
      turnL =   "AadjPknlMstpSrasWrflDright_agm_deploy";
      turnR =   "AadjPknlMstpSrasWrflDright_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustFKneelActions;
    class RifleAdjustFKneelActions_agm_deploy : RifleAdjustFKneelActions {
      stop =    "AadjPknlMstpSrasWrflDup_agm_deploy";
      default = "AadjPknlMstpSrasWrflDup_agm_deploy";
      turnL =   "AadjPknlMstpSrasWrflDup_agm_deploy";
      turnR =   "AadjPknlMstpSrasWrflDup_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustBKneelActions;
    class RifleAdjustBKneelActions_agm_deploy : RifleAdjustBKneelActions {
      stop =    "AadjPknlMstpSrasWrflDdown_agm_deploy";
      default = "AadjPknlMstpSrasWrflDdown_agm_deploy";
      turnL =   "AadjPknlMstpSrasWrflDdown_agm_deploy";
      turnR =   "AadjPknlMstpSrasWrflDdown_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleProneActions;
    class RifleProneActions_agm_deploy : RifleProneActions {
      stop =    "AmovPpneMstpSrasWrflDnon_agm_deploy";
      default = "AmovPpneMstpSrasWrflDnon_agm_deploy";
      turnL =   "AmovPpneMstpSrasWrflDnon_agm_deploy";
      turnR =   "AmovPpneMstpSrasWrflDnon_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustLProneActions;
    class RifleAdjustLProneActions_agm_deploy : RifleAdjustLProneActions {
      stop =    "AadjPpneMstpSrasWrflDleft_agm_deploy";
      default = "AadjPpneMstpSrasWrflDleft_agm_deploy";
      turnL =   "AadjPpneMstpSrasWrflDleft_agm_deploy";
      turnR =   "AadjPpneMstpSrasWrflDleft_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustRProneActions;
    class RifleAdjustRProneActions_agm_deploy : RifleAdjustRProneActions {
      stop =    "AadjPpneMstpSrasWrflDright_agm_deploy";
      default = "AadjPpneMstpSrasWrflDright_agm_deploy";
      turnL =   "AadjPpneMstpSrasWrflDright_agm_deploy";
      turnR =   "AadjPpneMstpSrasWrflDright_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustFProneActions;
    class RifleAdjustFProneActions_agm_deploy : RifleAdjustFProneActions {
      stop =    "aadjppnemstpsraswrfldup_agm_deploy";
      default = "aadjppnemstpsraswrfldup_agm_deploy";
      turnL =   "aadjppnemstpsraswrfldup_agm_deploy";
      turnR =   "aadjppnemstpsraswrfldup_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustBProneActions;
    class RifleAdjustBProneActions_agm_deploy : RifleAdjustBProneActions {
      stop =    "AadjPpneMstpSrasWrflDdown_agm_deploy";
      default = "AadjPpneMstpSrasWrflDdown_agm_deploy";
      turnL =   "AadjPpneMstpSrasWrflDdown_agm_deploy";
      turnR =   "AadjPpneMstpSrasWrflDdown_agm_deploy";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    //////////////////////////////////////////////////////////////////////

    class RifleStandActions_agm_rested : RifleStandActions {
      stop =    "AmovPercMstpSrasWrflDnon_agm_rested";
      default = "AmovPercMstpSrasWrflDnon_agm_rested";
      turnL =   "AmovPercMstpSrasWrflDnon_agm_rested";
      turnR =   "AmovPercMstpSrasWrflDnon_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustLStandActions_agm_rested : RifleAdjustLStandActions {
      stop =    "AadjPercMstpSrasWrflDleft_agm_rested";
      default = "AadjPercMstpSrasWrflDleft_agm_rested";
      AdjustL = "AadjPercMstpSrasWrflDleft_agm_rested";
      turnL =   "AadjPercMstpSrasWrflDleft_agm_rested";
      turnR =   "AadjPercMstpSrasWrflDleft_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustRStandActions_agm_rested : RifleAdjustRStandActions {
      stop =    "AadjPercMstpSrasWrflDright_agm_rested";
      default = "AadjPercMstpSrasWrflDright_agm_rested";
      AdjustRight = "AadjPercMstpSrasWrflDright_agm_rested";
      turnL =   "AadjPercMstpSrasWrflDright_agm_rested";
      turnR =   "AadjPercMstpSrasWrflDright_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustFStandActions_agm_rested : RifleAdjustFStandActions {
      stop =    "AadjPercMstpSrasWrflDup_agm_rested";
      default = "AadjPercMstpSrasWrflDup_agm_rested";
      AdjustF = "AadjPercMstpSrasWrflDup_agm_rested";
      turnL =   "AadjPercMstpSrasWrflDup_agm_rested";
      turnR =   "AadjPercMstpSrasWrflDup_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustBStandActions_agm_rested : RifleAdjustBStandActions {
      stop =    "AadjPercMstpSrasWrflDdown_agm_rested";
      default = "AadjPercMstpSrasWrflDdown_agm_rested";
      AdjustB = "AadjPercMstpSrasWrflDdown_agm_rested";
      turnR =   "AadjPercMstpSrasWrflDdown_agm_rested";
      turnL =   "AadjPercMstpSrasWrflDdown_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleKneelActions_agm_rested : RifleKneelActions {
      stop =    "AmovPknlMstpSrasWrflDnon_agm_rested";
      default = "AmovPknlMstpSrasWrflDnon_agm_rested";
      crouch =  "AmovPknlMstpSrasWrflDnon_agm_rested";
      turnL =   "AmovPknlMstpSrasWrflDnon_agm_rested";
      turnR =   "AmovPknlMstpSrasWrflDnon_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustLKneelActions_agm_rested : RifleAdjustLKneelActions {
      stop =    "AadjPknlMstpSrasWrflDleft_agm_rested";
      default = "AadjPknlMstpSrasWrflDleft_agm_rested";
      turnL =   "AadjPknlMstpSrasWrflDleft_agm_rested";
      turnR =   "AadjPknlMstpSrasWrflDleft_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustRKneelActions_agm_rested : RifleAdjustRKneelActions {
      stop =    "AadjPknlMstpSrasWrflDright_agm_rested";
      default = "AadjPknlMstpSrasWrflDright_agm_rested";
      turnL =   "AadjPknlMstpSrasWrflDright_agm_rested";
      turnR =   "AadjPknlMstpSrasWrflDright_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustFKneelActions_agm_rested : RifleAdjustFKneelActions {
      stop =    "AadjPknlMstpSrasWrflDup_agm_rested";
      default = "AadjPknlMstpSrasWrflDup_agm_rested";
      turnL =   "AadjPknlMstpSrasWrflDup_agm_rested";
      turnR =   "AadjPknlMstpSrasWrflDup_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustBKneelActions_agm_rested : RifleAdjustBKneelActions {
      stop =    "AadjPknlMstpSrasWrflDdown_agm_rested";
      default = "AadjPknlMstpSrasWrflDdown_agm_rested";
      turnL =   "AadjPknlMstpSrasWrflDdown_agm_rested";
      turnR =   "AadjPknlMstpSrasWrflDdown_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleProneActions_agm_rested : RifleProneActions {
      stop =    "AmovPpneMstpSrasWrflDnon_agm_rested";
      default = "AmovPpneMstpSrasWrflDnon_agm_rested";
      turnL =   "AmovPpneMstpSrasWrflDnon_agm_rested";
      turnR =   "AmovPpneMstpSrasWrflDnon_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustLProneActions_agm_rested : RifleAdjustLProneActions {
      stop =    "AadjPpneMstpSrasWrflDleft_agm_rested";
      default = "AadjPpneMstpSrasWrflDleft_agm_rested";
      turnL =   "AadjPpneMstpSrasWrflDleft_agm_rested";
      turnR =   "AadjPpneMstpSrasWrflDleft_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustRProneActions_agm_rested : RifleAdjustRProneActions {
      stop =    "AadjPpneMstpSrasWrflDright_agm_rested";
      default = "AadjPpneMstpSrasWrflDright_agm_rested";
      turnL =   "AadjPpneMstpSrasWrflDright_agm_rested";
      turnR =   "AadjPpneMstpSrasWrflDright_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustFProneActions_agm_rested : RifleAdjustFProneActions {
      stop =    "aadjppnemstpsraswrfldup_agm_rested";
      default = "aadjppnemstpsraswrfldup_agm_rested";
      turnL =   "aadjppnemstpsraswrfldup_agm_rested";
      turnR =   "aadjppnemstpsraswrfldup_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class RifleAdjustBProneActions_agm_rested : RifleAdjustBProneActions {
      stop =    "AadjPpneMstpSrasWrflDdown_agm_rested";
      default = "AadjPpneMstpSrasWrflDdown_agm_rested";
      turnL =   "AadjPpneMstpSrasWrflDdown_agm_rested";
      turnR =   "AadjPpneMstpSrasWrflDdown_agm_rested";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    //////////////////////////////////////////////////////////////////////
    // FFV
    //////////////////////////////////////////////////////////////////////

    class passenger_inside_1Actions;
    class passenger_inside_1Actions_agm_deploy : passenger_inside_1Actions {
      stop =    "passenger_inside_1_Aim_agm_deploy";
      default = "passenger_inside_1_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_inside_2Actions;
    class passenger_inside_2Actions_agm_deploy : passenger_inside_2Actions {
      stop =    "passenger_inside_2_Aim_agm_deploy";
      default = "passenger_inside_2_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_inside_3Actions;
    class passenger_inside_3Actions_agm_deploy : passenger_inside_3Actions {
      stop =    "passenger_inside_3_Aim_agm_deploy";
      default = "passenger_inside_3_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_inside_4Actions;
    class passenger_inside_4Actions_agm_deploy : passenger_inside_4Actions {
      stop =    "passenger_inside_4_Aim_agm_deploy";
      default = "passenger_inside_4_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_bench_1Actions;
    class passenger_bench_1Actions_agm_deploy : passenger_bench_1Actions {
      stop =    "passenger_bench_1_Aim_agm_deploy";
      default = "passenger_bench_1_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_1Actions;
    class passenger_boat_1Actions_agm_deploy : passenger_boat_1Actions {
      stop =    "passenger_boat_1_Aim_agm_deploy";
      default = "passenger_boat_1_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_2Actions;
    class passenger_boat_2Actions_agm_deploy : passenger_boat_2Actions {
      stop =    "passenger_boat_2_Aim_agm_deploy";
      default = "passenger_boat_2_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_3Actions;
    class passenger_boat_3Actions_agm_deploy : passenger_boat_3Actions {
      stop =    "passenger_boat_3_Aim_agm_deploy";
      default = "passenger_boat_3_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_4Actions;
    class passenger_boat_4Actions_agm_deploy : passenger_boat_4Actions {
      stop =    "passenger_boat_4_Aim_agm_deploy";
      default = "passenger_boat_4_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_1Actions;
    class passenger_flatground_1Actions_agm_deploy : passenger_flatground_1Actions {
      stop =    "passenger_flatground_1_Aim_agm_deploy";
      default = "passenger_flatground_1_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_2Actions;
    class passenger_flatground_2Actions_agm_deploy : passenger_flatground_2Actions {
      stop =    "passenger_flatground_2_Aim_agm_deploy";
      default = "passenger_flatground_2_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_3Actions;
    class passenger_flatground_3Actions_agm_deploy : passenger_flatground_3Actions {
      stop =    "passenger_flatground_3_Aim_agm_deploy";
      default = "passenger_flatground_3_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_4Actions;
    class passenger_flatground_4Actions_agm_deploy : passenger_flatground_4Actions {
      stop =    "passenger_flatground_4_Aim_agm_deploy";
      default = "passenger_flatground_4_Aim_agm_deploy";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    //////////////////////////////////////////////////////////////////////

    class passenger_inside_1Actions_agm_rested : passenger_inside_1Actions {
      stop =    "passenger_inside_1_Aim_agm_rested";
      default = "passenger_inside_1_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_inside_2Actions_agm_rested : passenger_inside_2Actions {
      stop =    "passenger_inside_2_Aim_agm_rested";
      default = "passenger_inside_2_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_inside_3Actions_agm_rested : passenger_inside_3Actions {
      stop =    "passenger_inside_3_Aim_agm_rested";
      default = "passenger_inside_3_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_inside_4Actions_agm_rested : passenger_inside_4Actions {
      stop =    "passenger_inside_4_Aim_agm_rested";
      default = "passenger_inside_4_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_bench_1Actions_agm_rested : passenger_bench_1Actions {
      stop =    "passenger_bench_1_Aim_agm_rested";
      default = "passenger_bench_1_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_1Actions_agm_rested : passenger_boat_1Actions {
      stop =    "passenger_boat_1_Aim_agm_rested";
      default = "passenger_boat_1_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_2Actions_agm_rested : passenger_boat_2Actions {
      stop =    "passenger_boat_2_Aim_agm_rested";
      default = "passenger_boat_2_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_3Actions_agm_rested : passenger_boat_3Actions {
      stop =    "passenger_boat_3_Aim_agm_rested";
      default = "passenger_boat_3_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_boat_4Actions_agm_rested : passenger_boat_4Actions {
      stop =    "passenger_boat_4_Aim_agm_rested";
      default = "passenger_boat_4_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_1Actions_agm_rested : passenger_flatground_1Actions {
      stop =    "passenger_flatground_1_Aim_agm_rested";
      default = "passenger_flatground_1_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_2Actions_agm_rested : passenger_flatground_2Actions {
      stop =    "passenger_flatground_2_Aim_agm_rested";
      default = "passenger_flatground_2_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_3Actions_agm_rested : passenger_flatground_3Actions {
      stop =    "passenger_flatground_3_Aim_agm_rested";
      default = "passenger_flatground_3_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };

    class passenger_flatground_4Actions_agm_rested : passenger_flatground_4Actions {
      stop =    "passenger_flatground_4_Aim_agm_rested";
      default = "passenger_flatground_4_Aim_agm_rested";
      turnL =   "";
      turnR =   "";
      turnSpeed = AGM_DEPLOY_TURNSPEED;
      limitFast = 1;
    };
  };
};

class CfgMovesMaleSdr : CfgMovesBasic {
  class States {
    class AmovPercMstpSrasWrflDnon;
    class AmovPercMstpSrasWrflDnon_agm_deploy : AmovPercMstpSrasWrflDnon {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleStandActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"AmovPercMstpSrasWrflDnon_agm_deploy", 0.02};
      ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_agm_deploy", 0.02};
      InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
      InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
    };

    class aadjpercmstpsraswrfldup;
    class aadjpercmstpsraswrfldup_agm_deploy : aadjpercmstpsraswrfldup {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustFStandActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrfldup_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrfldup_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
    };

    class aadjpercmstpsraswrflddown;
    class aadjpercmstpsraswrflddown_agm_deploy : aadjpercmstpsraswrflddown {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustBStandActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrflddown_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrflddown_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
    };

    class aadjpercmstpsraswrfldright;
    class aadjpercmstpsraswrfldright_agm_deploy : aadjpercmstpsraswrfldright {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustRStandActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrfldright_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrfldright_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
    };

    class aadjpercmstpsraswrfldleft;
    class aadjpercmstpsraswrfldleft_agm_deploy : aadjpercmstpsraswrfldleft {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustLStandActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrfldleft_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrfldleft_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
    };

    class aadjpknlmstpsraswrfldup;
    class aadjpknlmstpsraswrfldup_agm_deploy : aadjpknlmstpsraswrfldup {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustFKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrfldup_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrfldup_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
    };

    class amovpknlmstpsraswrfldnon;
    class amovpknlmstpsraswrfldnon_agm_deploy : amovpknlmstpsraswrfldnon {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"amovpknlmstpsraswrfldnon_agm_deploy", 0.02};
      ConnectFrom[] = {"amovpknlmstpsraswrfldnon_agm_deploy", 0.02};
      InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
      InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
    };

    class aadjpknlmstpsraswrflddown;
    class aadjpknlmstpsraswrflddown_agm_deploy : aadjpknlmstpsraswrflddown {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustBKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrflddown_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrflddown_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
    };

    class aadjpknlmstpsraswrfldleft;
    class aadjpknlmstpsraswrfldleft_agm_deploy : aadjpknlmstpsraswrfldleft {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustLKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrfldleft_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
    };

    class aadjpknlmstpsraswrfldright;
    class aadjpknlmstpsraswrfldright_agm_deploy : aadjpknlmstpsraswrfldright {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "RifleAdjustRKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrfldright_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrfldright_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
    };

    class aadjppnemstpsraswrfldup;
    class aadjppnemstpsraswrfldup_agm_deploy : aadjppnemstpsraswrfldup {
      aimPrecision = AGM_SWAY_DEPLOYPRONE;
      actions = "RifleAdjustFProneActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrfldup_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrfldup_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
    };

    class amovppnemstpsraswrfldnon;
    class amovppnemstpsraswrfldnon_agm_deploy : amovppnemstpsraswrfldnon {
      aimPrecision = AGM_SWAY_DEPLOYPRONE;
      actions = "RifleProneActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"amovppnemstpsraswrfldnon_agm_deploy", 0.02};
      ConnectFrom[] = {"amovppnemstpsraswrfldnon_agm_deploy", 0.02};
      InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
      InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
    };

    class aadjppnemstpsraswrflddown;
    class aadjppnemstpsraswrflddown_agm_deploy : aadjppnemstpsraswrflddown {
      aimPrecision = AGM_SWAY_DEPLOYPRONE;
      actions = "RifleAdjustBKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrflddown_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrflddown_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrflddown", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrflddown", 0.02};
    };

    class aadjppnemstpsraswrfldleft;
    class aadjppnemstpsraswrfldleft_agm_deploy : aadjppnemstpsraswrfldleft {
      aimPrecision = AGM_SWAY_DEPLOYPRONE;
      actions = "RifleAdjustLKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrfldleft_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrfldleft_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrfldleft", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrfldleft", 0.02};
    };

    class aadjppnemstpsraswrfldright;
    class aadjppnemstpsraswrfldright_agm_deploy : aadjppnemstpsraswrfldright {
      aimPrecision = AGM_SWAY_DEPLOYPRONE;
      actions = "RifleAdjustRKneelActions_agm_deploy";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrfldright_agm_deploy", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrfldright_agm_deploy", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrfldright", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrfldright", 0.02};
    };

    /////////////////////////////////////////////////////////////////////////////

    class AmovPercMstpSrasWrflDnon_agm_rested : AmovPercMstpSrasWrflDnon {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleStandActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"AmovPercMstpSrasWrflDnon_agm_rested", 0.02};
      ConnectFrom[] = {"AmovPercMstpSrasWrflDnon_agm_rested", 0.02};
      InterpolateFrom[] = {"AmovPercMstpSrasWrflDnon", 0.02};
      InterpolateTo[] = {"AmovPercMstpSrasWrflDnon", 0.02};
    };

    class aadjpercmstpsraswrfldup_agm_rested : aadjpercmstpsraswrfldup {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustFStandActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrfldup_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrfldup_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrfldup", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrfldup", 0.02};
    };

    class aadjpercmstpsraswrflddown_agm_rested : aadjpercmstpsraswrflddown {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustBStandActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrflddown_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrflddown_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrflddown", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrflddown", 0.02};
    };

    class aadjpercmstpsraswrfldright_agm_rested : aadjpercmstpsraswrfldright {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustRStandActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrfldright_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrfldright_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrfldright", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrfldright", 0.02};
    };

    class aadjpercmstpsraswrfldleft_agm_rested : aadjpercmstpsraswrfldleft {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustLStandActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpercmstpsraswrfldleft_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpercmstpsraswrfldleft_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpercmstpsraswrfldleft", 0.02};
      InterpolateTo[] = {"aadjpercmstpsraswrfldleft", 0.02};
    };

    class aadjpknlmstpsraswrfldup_agm_rested : aadjpknlmstpsraswrfldup {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustFKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrfldup_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrfldup_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrfldup", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrfldup", 0.02};
    };

    class amovpknlmstpsraswrfldnon_agm_rested : amovpknlmstpsraswrfldnon {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"amovpknlmstpsraswrfldnon_agm_rested", 0.02};
      ConnectFrom[] = {"amovpknlmstpsraswrfldnon_agm_rested", 0.02};
      InterpolateFrom[] = {"amovpknlmstpsraswrfldnon", 0.02};
      InterpolateTo[] = {"amovpknlmstpsraswrfldnon", 0.02};
    };

    class aadjpknlmstpsraswrflddown_agm_rested : aadjpknlmstpsraswrflddown {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustBKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrflddown_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrflddown_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrflddown", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrflddown", 0.02};
    };

    class aadjpknlmstpsraswrfldleft_agm_rested : aadjpknlmstpsraswrfldleft {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustLKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrfldleft_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrfldleft_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrfldleft", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrfldleft", 0.02};
    };

    class aadjpknlmstpsraswrfldright_agm_rested : aadjpknlmstpsraswrfldright {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "RifleAdjustRKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjpknlmstpsraswrfldright_agm_rested", 0.02};
      ConnectFrom[] = {"aadjpknlmstpsraswrfldright_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjpknlmstpsraswrfldright", 0.02};
      InterpolateTo[] = {"aadjpknlmstpsraswrfldright", 0.02};
    };

    class aadjppnemstpsraswrfldup_agm_rested : aadjppnemstpsraswrfldup {
      aimPrecision = AGM_SWAY_RESTEDPRONE;
      actions = "RifleAdjustFProneActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrfldup_agm_rested", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrfldup_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrfldup", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrfldup", 0.02};
    };

    class amovppnemstpsraswrfldnon_agm_rested : amovppnemstpsraswrfldnon {
      aimPrecision = AGM_SWAY_RESTEDPRONE;
      actions = "RifleProneActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"amovppnemstpsraswrfldnon_agm_rested", 0.02};
      ConnectFrom[] = {"amovppnemstpsraswrfldnon_agm_rested", 0.02};
      InterpolateFrom[] = {"amovppnemstpsraswrfldnon", 0.02};
      InterpolateTo[] = {"amovppnemstpsraswrfldnon", 0.02};
    };

    class aadjppnemstpsraswrflddown_agm_rested : aadjppnemstpsraswrflddown {
      aimPrecision = AGM_SWAY_RESTEDPRONE;
      actions = "RifleAdjustBKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrflddown_agm_rested", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrflddown_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrflddown", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrflddown", 0.02};
    };

    class aadjppnemstpsraswrfldleft_agm_rested : aadjppnemstpsraswrfldleft {
      aimPrecision = AGM_SWAY_RESTEDPRONE;
      actions = "RifleAdjustLKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrfldleft_agm_rested", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrfldleft_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrfldleft", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrfldleft", 0.02};
    };

    class aadjppnemstpsraswrfldright_agm_rested : aadjppnemstpsraswrfldright {
      aimPrecision = AGM_SWAY_RESTEDPRONE;
      actions = "RifleAdjustRKneelActions_agm_rested";
      aiming = "aimingLying";
      speed = 0.01;
      onLandEnd = true;
      onLandBeg = true;

      ConnectTo[] = {"aadjppnemstpsraswrfldright_agm_rested", 0.02};
      ConnectFrom[] = {"aadjppnemstpsraswrfldright_agm_rested", 0.02};
      InterpolateFrom[] = {"aadjppnemstpsraswrfldright", 0.02};
      InterpolateTo[] = {"aadjppnemstpsraswrfldright", 0.02};
    };

    //////////////////////////////////////////////////////////////////////
    // FFV
    //////////////////////////////////////////////////////////////////////

    class passenger_bench_1_Aim;
    class passenger_bench_1_Aim_agm_deploy : passenger_bench_1_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_bench_1Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_bench_1_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_bench_1_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_bench_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_bench_1_Aim", 0.02};
    };

    class passenger_inside_1_Aim;
    class passenger_inside_1_Aim_agm_deploy : passenger_inside_1_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_inside_1Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_1_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_inside_1_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_inside_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_1_Aim", 0.02};
    };

    class passenger_inside_2_Aim;
    class passenger_inside_2_Aim_agm_deploy : passenger_inside_2_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_inside_2Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_2_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_inside_2_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_inside_2_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_2_Aim", 0.02};
    };

    class passenger_inside_3_Aim;
    class passenger_inside_3_Aim_agm_deploy : passenger_inside_3_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_inside_3Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_3_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_inside_3_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_inside_3_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_3_Aim", 0.02};
    };

    class passenger_inside_4_Aim;
    class passenger_inside_4_Aim_agm_deploy : passenger_inside_4_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_inside_4Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_4_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_inside_4_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_inside_4_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_4_Aim", 0.02};
    };

    class passenger_boat_1_Aim;
    class passenger_boat_1_Aim_agm_deploy : passenger_boat_1_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_boat_1Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_1_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_boat_1_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_boat_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_1_Aim", 0.02};
    };

    class passenger_boat_2_Aim;
    class passenger_boat_2_Aim_agm_deploy : passenger_boat_2_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_boat_2Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_2_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_boat_2_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_boat_2_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_2_Aim", 0.02};
    };

    class passenger_boat_3_Aim;
    class passenger_boat_3_Aim_agm_deploy : passenger_boat_3_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_boat_3Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_3_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_boat_3_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_boat_3_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_3_Aim", 0.02};
    };

    class passenger_boat_4_Aim;
    class passenger_boat_4_Aim_agm_deploy : passenger_boat_4_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_boat_4Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_4_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_boat_4_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_boat_4_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_4_Aim", 0.02};
    };

    class passenger_flatground_1_Aim;
    class passenger_flatground_1_Aim_agm_deploy : passenger_flatground_1_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_flatground_1Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_1_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_flatground_1_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_flatground_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_1_Aim", 0.02};
    };

    class passenger_flatground_2_Aim;
    class passenger_flatground_2_Aim_agm_deploy : passenger_flatground_2_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_flatground_2Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_2_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_flatground_2_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_flatground_2_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_2_Aim", 0.02};
    };

    class passenger_flatground_3_Aim;
    class passenger_flatground_3_Aim_agm_deploy : passenger_flatground_3_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_flatground_3Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_3_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_flatground_3_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_flatground_3_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_3_Aim", 0.02};
    };

    class passenger_flatground_4_Aim;
    class passenger_flatground_4_Aim_agm_deploy : passenger_flatground_4_Aim {
      aimPrecision = AGM_SWAY_DEPLOY;
      actions = "passenger_flatground_4Actions_agm_deploy";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_4_Aim_agm_deploy", 0.02};
      ConnectFrom[] = {"passenger_flatground_4_Aim_agm_deploy", 0.02};
      InterpolateFrom[] = {"passenger_flatground_4_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_4_Aim", 0.02};
    };

    //////////////////////////////////////////////////////////////////////

    class passenger_bench_1_Aim_agm_rested : passenger_bench_1_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_bench_1Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_bench_1_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_bench_1_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_bench_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_bench_1_Aim", 0.02};
    };

    class passenger_inside_1_Aim_agm_rested : passenger_inside_1_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_inside_1Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_1_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_inside_1_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_inside_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_1_Aim", 0.02};
    };

    class passenger_inside_2_Aim_agm_rested : passenger_inside_2_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_inside_2Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_2_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_inside_2_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_inside_2_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_2_Aim", 0.02};
    };

    class passenger_inside_3_Aim_agm_rested : passenger_inside_3_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_inside_3Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_3_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_inside_3_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_inside_3_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_3_Aim", 0.02};
    };

    class passenger_inside_4_Aim_agm_rested : passenger_inside_4_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_inside_4Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_inside_4_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_inside_4_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_inside_4_Aim", 0.02};
      InterpolateTo[] = {"passenger_inside_4_Aim", 0.02};
    };

    class passenger_boat_1_Aim_agm_rested : passenger_boat_1_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_boat_1Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_1_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_boat_1_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_boat_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_1_Aim", 0.02};
    };

    class passenger_boat_2_Aim_agm_rested : passenger_boat_2_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_boat_2Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_2_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_boat_2_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_boat_2_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_2_Aim", 0.02};
    };

    class passenger_boat_3_Aim_agm_rested : passenger_boat_3_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_boat_3Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_3_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_boat_3_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_boat_3_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_3_Aim", 0.02};
    };

    class passenger_boat_4_Aim_agm_rested : passenger_boat_4_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_boat_4Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_boat_4_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_boat_4_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_boat_4_Aim", 0.02};
      InterpolateTo[] = {"passenger_boat_4_Aim", 0.02};
    };

    class passenger_flatground_1_Aim_agm_rested : passenger_flatground_1_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_flatground_1Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_1_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_flatground_1_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_flatground_1_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_1_Aim", 0.02};
    };

    class passenger_flatground_2_Aim_agm_rested : passenger_flatground_2_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_flatground_2Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_2_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_flatground_2_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_flatground_2_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_2_Aim", 0.02};
    };

    class passenger_flatground_3_Aim_agm_rested : passenger_flatground_3_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_flatground_3Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_3_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_flatground_3_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_flatground_3_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_3_Aim", 0.02};
    };

    class passenger_flatground_4_Aim_agm_rested : passenger_flatground_4_Aim {
      aimPrecision = AGM_SWAY_RESTED;
      actions = "passenger_flatground_4Actions_agm_rested";
      aiming = "aimingDefault";
      speed = 0.01;
      onLandEnd = false;
      onLandBeg = false;

      ConnectTo[] = {"passenger_flatground_4_Aim_agm_rested", 0.02};
      ConnectFrom[] = {"passenger_flatground_4_Aim_agm_rested", 0.02};
      InterpolateFrom[] = {"passenger_flatground_4_Aim", 0.02};
      InterpolateTo[] = {"passenger_flatground_4_Aim", 0.02};
    };
  };
};

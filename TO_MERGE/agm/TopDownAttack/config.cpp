
class CfgPatches {
  class AGM_TopDownAttack {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_TopDownAttack {
    class AGM_TopDownAttack {
      file = "\AGM_TopDownAttack\functions";
      class canToggleTopDownAttack;
      class getLockedTarget;
      class toggleTopDownAttack;
      class topDownAttack;
    };
  };
};

class Extended_FiredBIS_EventHandlers {
  class CAManBase {
    class AGM_TopDownAttack_FireMissile {
      FiredBIS = "if (local (_this select 0)) then {_this call AGM_TopDownAttack_fnc_topDownAttack};";
    };
  };
};

class AGM_Core_Default_Keys {
  class toggleTopDownAttack {
    displayName = "$STR_AGM_ToggleTopDownAttack";
    condition = "[_player] call AGM_TopDownAttack_fnc_canToggleTopDownAttack";
    statement = "[_player] call AGM_TopDownAttack_fnc_toggleTopDownAttack";
    key = 25;
    shift = 0;
    control = 0;
    alt = 0;
  };
};

class CfgSounds {
  class AGM_Sound_Locked1 {
    sound[] = {"\A3\Sounds_F\weapons\Rockets\locked_3", 0.316228, 2.5, 200};
    titles[] = {};
  };
  class AGM_Sound_Locked2 {
    sound[] = {"\A3\Sounds_F\weapons\Rockets\locked_1", 0.316228, 1, 200};
    titles[] = {};
  };
};

#include <Optics.hpp>

class CfgWeapons {
  class Launcher_Base_F;

  class launch_Titan_base: Launcher_Base_F {
    AGM_enableTopDownAttack = 0;
    AGM_lockTargetMode = 0;
  };
  class launch_Titan_short_base: launch_Titan_base {
    AGM_enableTopDownAttack = 1;
    AGM_lockTargetMode = 1;
  };
};

// PATCH CONFIG
class CfgPatches {
  class AGM_SafeMode {
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
  class AGM_SafeMode {
    class AGM_SafeMode {
      file = "AGM_SafeMode\functions";
      class firstMode;
      class lockSafety;
      class playChangeFiremodeSound;
      class setSafeModeVisual;
      class unlockSafety;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_SafeMode {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_SafeMode\clientInit.sqf';";
  };
};

class AGM_Core_Default_Keys {
  class safeWeapon {
    displayName = "$STR_AGM_SafeMode_SafeMode";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "[_player, currentWeapon _player, currentMuzzle _player] call AGM_SafeMode_fnc_lockSafety";
    exceptions[] = {"AGM_Interaction_isNotEscorting"};
    key = 41;
    shift = 0;
    control = 1;
    alt = 0;
  };
};

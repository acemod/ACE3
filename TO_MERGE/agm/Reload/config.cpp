class CfgPatches {
  class AGM_Reload {
    units[] = {};
    weapons[] = {};
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
  class AGM_Reload {
    class AGM_Reload {
      file = "\AGM_Reload\functions";
      class checkAmmo;
    };
  };
};

class Extended_Take_EventHandlers {
  class CAManBase {
    class AGM_AmmoIndicatorReload {
      clientTake = "if (_this select 0 == AGM_player && {(_this select 1) in [uniformContainer (_this select 0), vestContainer (_this select 0), backpackContainer (_this select 0)]} && {_this select 2 == currentMagazine (_this select 0)}) then {[_this select 0, vehicle (_this select 0), true] call AGM_Reload_fnc_checkAmmo};";
    };
  };
};

class AGM_Core_Default_Keys {
  class checkAmmo {
    displayName = "$STR_AGM_Reload_checkAmmo";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon || {_vehicle isKindOf 'StaticWeapon'}";
    statement = "[_player, _vehicle, false] call AGM_Reload_fnc_checkAmmo";
    key = 19;
    shift = 0;
    control = 1;
    alt = 0;
  };
};

class CfgActions {
  class LoadMagazine;
  class LoadEmptyMagazine : LoadMagazine {
    showWindow = 0;
    textDefault = "";
  };
};

class RscControlsGroup;
class RscText;
class RscInGameUI {
  class RscUnitInfo {
    // Soldier only
    class WeaponInfoControlsGroupLeft: RscControlsGroup {
      class controls {
        class CA_AmmoCount: RscText {
          sizeEx = 0;
        };
      };
    };
    // Vehicles only
    /*class WeaponInfoControlsGroupRight: RscControlsGroup {
      class controls {
        class CA_AmmoCount: RscText {
          sizeEx = 0;
        };
      };
    };*/
  };
};

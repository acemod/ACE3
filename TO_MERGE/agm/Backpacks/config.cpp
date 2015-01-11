class CfgPatches {
  class AGM_Backpacks {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"bux", "commy2"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Backpacks {
    class AGM_Backpacks {
      file = "\AGM_Backpacks\functions";
      class getBackpackAssignedUnit;
      class isBackpack;
      class openInventory;
    };
  };
};

class Extended_InventoryOpened_EventHandlers {
  class CAManBase {
    class AGM_Backpacks_openInventory {
      clientInventoryOpened = "if (_this select 0 == AGM_player) then {_this call AGM_Backpacks_fnc_openInventory};";
    };
  };
};

class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class AGM_SelfActions {
      class AGM_Equipment {
        class AGM_LockBackpack {
          displayName = "$STR_AGM_Backpacks_LockBackpack";
          condition = "[backpackContainer _player] call AGM_Backpacks_fnc_isBackpack && {!((backpackContainer _player) getVariable ['AGM_LockedInventory', false])}";
          statement = "(backpackContainer _player) setVariable ['AGM_LockedInventory', true, true]";
          showDisabled = 0;
          priority = 2.5;
          icon = "";  // @todo
          hotkey = "L";
          enableInside = 1;
        };
        class AGM_UnlockBackpack {
          displayName = "$STR_AGM_Backpacks_UnlockBackpack";
          condition = "[backpackContainer _player] call AGM_Backpacks_fnc_isBackpack && {(backpackContainer _player) getVariable ['AGM_LockedInventory', false]}";
          statement = "(backpackContainer _player) setVariable ['AGM_LockedInventory', false, true]";
          showDisabled = 0;
          priority = 2.5;
          icon = "";  // @todo
          hotkey = "L";
          enableInside = 1;
        };
      };
    };
  };
};

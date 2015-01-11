class CfgPatches {
  class AGM_VehicleLock {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.6;
    requiredAddons[] = {"AGM_Core", "AGM_Interaction"};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"PabstMirror"};
    authorUrl = "https://github.com/PabstMirror/";
  };
};

class AGM_Parameters_Numeric {
  AGM_VehicleLock_DefaultLockpickStrength = 10;
};

class CfgFunctions {
  class AGM_VehicleLock {
    class AGM_VehicleLock {
      file = "AGM_vehicleLock\functions";
      class addKeyForVehicle;
      class getVehicleSideKey;
      class hasKeyForVehicle;
      class lockpick;
      class moduleInit;
      class moduleSync;
      class serverSetupCustomKey;
      class setVehicleLock;
    };
  };
};

class CfgMagazines {
  class CA_Magazine;
  class AGM_magazine_customKey: CA_Magazine {
    picture = "\AGM_vehicleLock\ui\keyBlack.paa";
    displayName = "AGM Vehicle Key";   //!!!CANNONT be localized!!!, because it is used as part of the magazineDetail string
    descriptionShort = "$STR_AGM_Vehicle_Item_Custom_Description";
  };
};

class CfgWeapons {
  class InventoryItem_Base_F;
  class AGM_ItemCore;

  class AGM_item_key_master: AGM_ItemCore {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "Vehicle Key: Master";
    descriptionShort = "$STR_AGM_Vehicle_Item_Master_Description";
    model = "\A3\weapons_F\ammo\mag_univ.p3d";
    picture = "\AGM_vehicleLock\ui\keyBlack.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 0.1;
    };
  };
  class AGM_item_key_lockpick: AGM_item_key_master {
    displayName = "Lockpick";
    descriptionShort = "$STR_AGM_Vehicle_Item_Lockpick_Description";
    picture = "\AGM_vehicleLock\ui\lockpick.paa";
  };
  class AGM_item_key_west: AGM_item_key_master {
    displayName = "Vehicle Key: West";
    descriptionShort = "$STR_AGM_Vehicle_Item_West_Description";
    picture = "\AGM_vehicleLock\ui\keyBlue.paa";
  };
  class AGM_item_key_east: AGM_item_key_master {
    displayName = "Vehicle Key: East";
    descriptionShort = "$STR_AGM_Vehicle_Item_East_Description";
    picture = "\AGM_vehicleLock\ui\keyRed.paa";
  };
  class AGM_item_key_indp: AGM_item_key_master {
    displayName = "Vehicle Key: Independent";
    descriptionShort = "$STR_AGM_Vehicle_Item_Indp_Description";
    picture = "\AGM_vehicleLock\ui\keyPurple.paa";
  };
  class AGM_item_key_civ: AGM_item_key_master {
    displayName = "Vehicle Key: Civilian";
    descriptionShort = "$STR_AGM_Vehicle_Item_Civ_Description";
    picture = "\AGM_vehicleLock\ui\keyGreen.paa";
  };
};

#define MACRO_LOCK_ACTIONS \
  class AGM_unlockVehicle { \
    displayName = "$STR_AGM_Vehicle_Action_UnLock"; \
    distance = 4; \
    condition = "([_player, AGM_Interaction_Target] call AGM_VehicleLock_fnc_hasKeyForVehicle) && {(locked AGM_Interaction_Target) in [2, 3]}"; \
    statement = "[AGM_Interaction_Target, false] call AGM_VehicleLock_fnc_setVehicleLock"; \
    showDisabled = 1; \
    priority = 0.3; \
    icon = "\AGM_vehicleLock\ui\key_menuIcon_ca.paa"; \
  }; \
  class AGM_lockVehicle { \
    displayName = "$STR_AGM_Vehicle_Action_Lock"; \
    distance = 4; \
    condition = "([_player, AGM_Interaction_Target] call AGM_VehicleLock_fnc_hasKeyForVehicle) && {(locked AGM_Interaction_Target) in [0, 1]}"; \
    statement = "[AGM_Interaction_Target, true] call AGM_VehicleLock_fnc_setVehicleLock"; \
    showDisabled = 1; \
    priority = 0.2; \
    icon = "\AGM_vehicleLock\ui\key_menuIcon_ca.paa"; \
  }; \
  class AGM_lockpickVehicle { \
    displayName = "$STR_AGM_Vehicle_Action_Lockpick"; \
    distance = 4; \
    condition = "[_player, AGM_Interaction_Target, 'canLockpick'] call AGM_VehicleLock_fnc_lockpick"; \
    statement = "[_player, AGM_Interaction_Target, 'startLockpick'] call AGM_VehicleLock_fnc_lockpick"; \
    showDisabled = 0; \
    priority = 0.1; \
  };

class CfgVehicles {
  class Logic;
  class Module_F: Logic {
    class ArgumentsBaseUnits {};
    class ModuleDescription {};
  };
  class AGM_VehicleLock_ModuleSetup: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Vehicle Lock Setup";
    function = "AGM_VehicleLock_fnc_moduleInit";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_VehicleLock\ui\IconLock_ca.paa";
    functionPriority = 0;
    class Arguments {
      class SideKeysAssignment {
        displayName = "Players Start Side Keys"; // Argument label
        description = "Which players start wtih side keys (e.g.: agm_item_key_west)"; // Tooltip description
        typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
        class values {
          class Nobody {
            name = "Nobody";
            value = 0;
            default = 1;
          };
          class GroupLeads {
            name = "Group Leads";
            value = 1;
          };
          class Everyone {
            name = "Everyone";
            value = 2;
          };
        };
      };
      class SetLockState {
        displayName = "Set Lock State"; // Argument label
        description = "Set lock state for all vehicles on map"; // Tooltip description
        typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
        class values {
          class None {
            name = "As Is";
            value = 0;
            default = 1;
          };
          class Side {
            name = "Locked";
            value = 1;
          };
          class Unique {
            name = "Unlocked";
            value = 2;
          };
        };
      };
      class LockpickStrength {
        displayName = "Global Lockpick Strength";
        description = "Global Time to lockpick (in seconds). Default: 10";
        typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
        defaultValue = "10"; // Default text filled in the input box
      };
    };
    class ModuleDescription: ModuleDescription {
      description = "Settings for lockpick strength, auto assigment of keys at start and initial vehicle lock state.";
    };
  };

  class AGM_VehicleLock_ModuleSyncedAssign: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Vehicle Key Assign";
    function = "AGM_VehicleLock_fnc_moduleSync";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_VehicleLock\ui\IconLock_ca.paa";
    functionPriority = 0;
    class Arguments {};
    class ModuleDescription: ModuleDescription {
      description = "Sync with vehicles and players.  Will handout custom keys to players for every synced vehicle. Only valid for objects present at mission start.";
      sync[] = {"AnyPlayer", "AnyVehicle"};
    };
  };

  class LandVehicle;
  class Car: LandVehicle {
    class AGM_Actions {
      MACRO_LOCK_ACTIONS
    };
  };
  class Tank: LandVehicle {
    class AGM_Actions {
      MACRO_LOCK_ACTIONS
    };
  };
  class Air;
  class Helicopter: Air {
    class AGM_Actions {
      MACRO_LOCK_ACTIONS
    };
  };
};

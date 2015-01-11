class CfgPatches {
  class AGM_SwitchUnits {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"bux578"};
    authorUrl = "https://github.com/bux578/";
  };
};

class CfgFunctions {
  class AGM_SwitchUnits {
    class AGM_SwitchUnits {
      file = "AGM_SwitchUnits\functions";
      class addMapFunction;
      class handleMapClick;
      class initPlayer;
      class isValidAi;
      class markAiOnMap;
      class module;
      class nearestPlayers;
      class switchBack;
      class switchUnit;
    };
  };
};


class Extended_PostInit_EventHandlers {
  class AGM_SwitchUnits {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_SwitchUnits\clientInit.sqf'";
  };
};


class CfgVehicles {
  class Module_F;
  class AGM_ModuleSwitchUnits: Module_F {
    author = "AGM Team";
    category = "AGM";
    displayName = "SwitchUnits System";
    function = "AGM_SwitchUnits_fnc_module";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_SwitchUnits\UI\IconSwitchUnits_ca.paa";
    class Arguments {
      class SwitchToWest {
        displayName = "Switch to West?";
        description = "Allow switching to west units?";
        typeName = "BOOL";
        class values {
          class Yes {name = "Yes"; value = 1;};
          class No {default = 1; name = "No"; value = 0;};
        };
      };
      class SwitchToEast {
        displayName = "Switch to East?";
        description = "Allow switching to east units?";
        typeName = "BOOL";
        class values {
          class Yes {name = "Yes"; value = 1;};
          class No {default = 1; name = "No"; value = 0;};
        };
      };
      class SwitchToIndependent {
        displayName = "Switch to Independent?";
        description = "Allow switching to independent units?";
        typeName = "BOOL";
        class values {
          class Yes {name = "Yes"; value = 1;};
          class No {default = 1; name = "No"; value = 0;};
        };
      };
      class SwitchToCivilian {
        displayName = "Switch to Civilian?";
        description = "Allow switching to civilian units?";
        typeName = "BOOL";
        class values {
          class Yes {name = "Yes"; value = 1;};
          class No {default = 1; name = "No"; value = 0;};
        };
      };
      class EnableSafeZone {
        displayName = "Enable Safe Zone?";
        description = "Enable a safe zone around enemy units? Players can't switch to units inside of the safe zone.";
        typeName = "BOOL";
        class values {
          class Yes {default = 1; name = "Yes"; value = 1;};
          class No {name = "No"; value = 0;};
        };
      };
      class SafeZoneRadius {
        displayName = "Safe Zone Radius";
        description = "The safe zone around players from a different team. Default: 200";
        typeName = "NUMBER";
        defaultValue = 100;
      };
    
      /*
      
      class EnableSwitchUnits {
        displayName = "Enable SwitchUnits?";
        description = "Enable to switch to AI units? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {name = "Yes"; value = 1;};
          class No {default = 1; name = "No"; value = 0;};
        };
      };
      
      class SwitchUnitsAllowedForSide {
        displayName = "Allow for which side?";
        description = "Which side should be allowed to switch to AI units?";
        typeName = "NUMBER";
        class values {
          class West {name = "West"; value = 0;};
          class East {default = 1; name = "East"; value = 1;};
          class Independent {name = "Independent"; value = 2;};
          class Civilian {name = "Civilian"; value = 3;};
        };
      };*/
    };
  };
};

class AGM_Parameters_Numeric {
  AGM_SwitchUnits_SafeZoneRadius = 100;
};
class AGM_Parameters_Boolean {
  AGM_SwitchUnits_EnableSwitchUnits = 0;
  AGM_SwitchUnits_SwitchToWest = 0;
  AGM_SwitchUnits_SwitchToEast = 0;
  AGM_SwitchUnits_SwitchToIndependent = 0;
  AGM_SwitchUnits_SwitchToCivilian = 0;
  AGM_SwitchUnits_EnableSafeZone = 1;
};

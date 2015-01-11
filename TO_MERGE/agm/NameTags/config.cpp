class CfgPatches {
  class AGM_NameTags {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "CAA-Picard"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_NameTags {
    class AGM_NameTags {
      file = "\AGM_NameTags\functions";
      class drawNameTagIcon;
      class moduleNameTags;
    };
  };
  class AGM_CrewInfo {
    class AGM_CrewInfo {
      file = "AGM_NameTags\functions\CrewInfo";
      class canShow;
      class doShow;
      class getVehicleData;
      class onMouseZChanged;
      class setText;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_NameTags {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_NameTags\clientInit.sqf'";
  };
};

class AGM_Core_Default_Keys {
  class showNames {
    displayName = "$STR_AGM_NameTags_ShowNames";
    condition = "true";
    statement = "AGM_NameTags_ShowNamesTime = time; if (call AGM_CrewInfo_fnc_canShow) then {call AGM_CrewInfo_fnc_doShow;};";
    key = 29;
    shift = 0;
    control = 0;
    alt = 0;
    allowHolding = 1;
  };
};

class AGM_Core_Options {
  class showPlayerNames {
    displayName = "$STR_AGM_NameTags_ShowPlayerNames";
    default = 1;
  };
  class showPlayerNamesOnlyOnCursor {
    displayName = "$STR_AGM_NameTags_ShowPlayerNamesOnlyOnCursor";
    default = 1;
  };
  class showPlayerNamesOnlyOnKeyPress {
    displayName = "$STR_AGM_NameTags_ShowPlayerNamesOnlyOnKeyPress";
    default = 0;
  };
  class showPlayerRanks {
    displayName = "$STR_AGM_NameTags_ShowPlayerRanks";
    default = 1;
  };
  class showVehicleCrewInfo {
    displayName = "$STR_AGM_CrewInfo_ShowVehicleCrewInfo";
    default = 1;
  };
};

class AGM_Parameters_Numeric {
  AGM_NameTags_PlayerNamesViewDistance = 5;
  AGM_NameTags_PlayerNamesMaxAlpha = 0.8;
  AGM_NameTags_CrewInfoVisibility = 0;
};
class AGM_Parameters_Boolean {
  AGM_NameTags_ShowNamesForAI = 0;
};

class CfgVehicles {
  class Module_F;
  class AGM_ModuleNameTags: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Name Tags";
    function = "AGM_NameTags_fnc_moduleNameTags";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_NameTags\UI\IconNameTags_ca.paa";
    class Arguments {
      class PlayerNamesViewDistance {
        displayName = "Player Names View Dist.";
        description = "Distance in meters at which player names are shown. Default: 5";
        typeName = "NUMBER";
        defaultValue = 5;
      };
      class ShowNamesForAI {
        displayName = "Show name tags for AI?";
        description = "Show the name and rank tags for friendly AI units? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class Visibility {
        displayName = "Visibility of crew info";
        description = "Forces visibility of vehicle crew info, or by default allows players to choose it on their own. Default: Do Not Force";
        typeName = "INT";
        class values {
          class DoNotForce {
            default = 1;
            name = "Do Not Force";
            value = 0;
          };
          class ForceShow {           
            name = "Force Show";
            value = 1;
          };
          class ForceHide {
            name = "Force Hide";
            value = -1;
          };
        };
      };
    };
  };
};

#include <RscTitles.hpp>

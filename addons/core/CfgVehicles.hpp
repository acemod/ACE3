class CfgVehicles {
  /*class Man;
  class CAManBase: Man {
    // @todo
    class UserActions {
      class AGM_Fire {
        displayName = "";
        priority = -99;
        available = 1;
        radius = 2.5;
        radiusView = 0;
        position = "";
        showWindow = 0;
        showIn3D = 0;
        onlyForPlayer = 1;
        shortcut = "DefaultAction";
        condition = "call AGM_Core_UserActionFireCondition";
        statement = "call AGM_Core_UserActionFire";
        userActionID = 100;
      };
    };
  };*/

  // += needs a non inherited entry in that class, otherwise it simply overwrites
  //#include <DefaultItems.hpp>

  class Module_F;
  class AGM_ModuleCheckPBOs: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Check PBOs";
    function = "AGM_Core_fnc_moduleCheckPBOs";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Core\UI\IconCheckPBO_ca.paa";
    class Arguments {
      class Action {
        displayName = "Action";
        description = "What to do with people who do not have the right PBOs?";
        class values {
          class WarnOnce {
            default = 1;
            name = "Warn once";
            value = 0;
          };
          class Warn {
            name = "Warn (permanent)";
            value = 1;
          };
          class Kick {
            name = "Kick";
            value = 2;
          };
        };
      };
      class CheckAll {
        displayName = "Check all addons";
        description = "Check all addons instead of only those of AGM?";
        typeName = "BOOL";
        class values {
          class WarnOnce {
            default = 1;
            name = "No";
            value = 0;
          };
          class Warn {
            name = "Yes";
            value = 1;
          };
        };
      };
      class Whitelist {
        displayName = "Whitelist";
        description = "What addons are allowed regardless?";
        typeName = "STRING";
        class values {
            default = "[]";
        };
      };
    };
  };

  class AGM_ModuleLSDVehicles: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "LSD Vehicles";
    function = "AGM_Core_fnc_moduleLSDVehicles";
    scope = 2;
    isGlobal = 1;
    class Arguments {
    };
  };

  class Box_NATO_Support_F;
  class AGM_Box_Misc: Box_NATO_Support_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "$STR_AGM_Core_MiscItems";
    transportMaxWeapons = 9001;
    transportMaxMagazines = 9001;
    transportMaxItems = 9001;
    maximumload = 2000;

    class TransportWeapons {};
    class TransportMagazines {};
    class TransportItems {};
    class TransportBackpacks {};
  };
};
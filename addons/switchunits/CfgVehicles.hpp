class CfgVehicles {
  class Module_F;
  class ACE_ModuleSwitchUnits: Module_F {
    author = "$STR_ACE_Core_ACETeam";
    category = "ACE";
    displayName = "SwitchUnits System";
    function = FUNC(module);
    scope = 2;
    isGlobal = 1;
    icon = PATHTOF(UI\IconSwitchUnits_ca.paa);
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
    };
  };
};

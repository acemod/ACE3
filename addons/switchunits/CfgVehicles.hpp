class CfgVehicles {
  class Module_F;
  class ACE_ModuleSwitchUnits: Module_F {
    author = "$STR_ACE_Common_ACETeam";
    category = "ACE";
    displayName = "$STR_ACE_SwitchUnits_Module_DisplayName";
    function = FUNC(module);
    scope = 2;
    isGlobal = 1;
    icon = QUOTE(PATHTOF(UI\Icon_Module_SwitchUnits_ca.paa));
    class Arguments {
      class SwitchToWest {
        displayName = "$STR_ACE_SwitchUnits_SwitchToWest_DisplayName";
        description = "$STR_ACE_SwitchUnits_SwitchToWest_Description";
        typeName = "BOOL";
        defaultValue = 0;
      };
      class SwitchToEast {
        displayName = "$STR_ACE_SwitchUnits_SwitchToEast_DisplayName";
        description = "$STR_ACE_SwitchUnits_SwitchToEast_Description";
        typeName = "BOOL";
        defaultValue = 0;
      };
      class SwitchToIndependent {
        displayName = "$STR_ACE_SwitchUnits_SwitchToIndependent_DisplayName";
        description = "$STR_ACE_SwitchUnits_SwitchToIndependent_Description";
        typeName = "BOOL";
        defaultValue = 0;
      };
      class SwitchToCivilian {
        displayName = "$STR_ACE_SwitchUnits_SwitchToCivilian_DisplayName";
        description = "$STR_ACE_SwitchUnits_SwitchToCivilian_Description";
        typeName = "BOOL";
        defaultValue = 0;
      };
      class EnableSafeZone {
        displayName = "$STR_ACE_SwitchUnits_EnableSafeZone_DisplayName";
        description = "$STR_ACE_SwitchUnits_EnableSafeZone_Description";
        typeName = "BOOL";
        defaultValue = 1;
      };
      class SafeZoneRadius {
        displayName = "$STR_ACE_SwitchUnits_SafeZoneRadius_DisplayName";
        description = "$STR_ACE_SwitchUnits_SafeZoneRadius_Description";
        typeName = "NUMBER";
        defaultValue = 100;
      };
    };
	class ModuleDescription {
            description = "$STR_ACE_SwitchUnits_Module_Description";
    };
  };
};
class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleSwitchUnits: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(DisplayName);
        function = FUNC(module);
        scope = 1;
        isGlobal = 1;
        icon = QPATHTOF(UI\Icon_Module_SwitchUnits_ca.paa);
        class Arguments {
            class SwitchToWest {
                displayName = CSTRING(SwitchToWest_DisplayName);
                description = CSTRING(SwitchToWest_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SwitchToEast {
                displayName = CSTRING(SwitchToEast_DisplayName);
                description = CSTRING(SwitchToEast_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SwitchToIndependent {
                displayName = CSTRING(SwitchToIndependent_DisplayName);
                description = CSTRING(SwitchToIndependent_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class SwitchToCivilian {
                displayName = CSTRING(SwitchToCivilian_DisplayName);
                description = CSTRING(SwitchToCivilian_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class EnableSafeZone {
                displayName = CSTRING(EnableSafeZone_DisplayName);
                description = CSTRING(EnableSafeZone_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class SafeZoneRadius {
                displayName = CSTRING(SafeZoneRadius_DisplayName);
                description = CSTRING(SafeZoneRadius_Description);
                typeName = "NUMBER";
                defaultValue = 100;
            };
        };
        class ModuleDescription {
          description = CSTRING(Module_Description);
        };
    };
};

class CfgVehicles {
    class ACE_Module;
    class GVAR(moduleSettings): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(DisplayName);
        function = QFUNC(moduleSettings);
        scope = 2;
        isGlobal = 1;
        isTriggerActivated = 0;
        icon = QPATHTOF(UI\Icon_Module.paa);
        class Arguments {
            class Enabled {
                displayName = CSTRING(Enabled);
                description = CSTRING(Enabled_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class PerformanceFactor {
                displayName = CSTRING(PerformanceFactor);
                description = CSTRING(PerformanceFactor_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class RecoveryFactor {
                displayName = CSTRING(RecoveryFactor);
                description = CSTRING(RecoveryFactor_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class LoadFactor {
                displayName = CSTRING(LoadFactor);
                description = CSTRING(LoadFactor_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class TerrainGradientFactor {
                displayName = CSTRING(TerrainGradientFactor);
                description = CSTRING(TerrainGradientFactor_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
    };
};

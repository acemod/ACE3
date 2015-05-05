class CfgVehicles {
    class ACE_Module;
    class GVAR(ModuleSettings): ACE_Module {
        scope = 2;
        displayName = "$STR_ACE_AdvancedBallistics_DisplayName";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Wind_ca.paa));
        category = "ACE";
        function = QUOTE(DFUNC(initModuleSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "Ruthberg";
        class Arguments {
            class enabled {
                displayName = "$STR_ACE_AdvancedBallistics_enabled_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_enabled_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class alwaysSimulateForSnipers {
                displayName = "$STR_ACE_AdvancedBallistics_alwaysSimulateForSnipers_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_alwaysSimulateForSnipers_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class disabledInFullAutoMode {
                displayName = "$STR_ACE_AdvancedBallistics_disabledInFullAutoMod_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_disabledInFullAutoMod_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class onlyActiveForLocalPlayers {
                displayName = "$STR_ACE_AdvancedBallistics_onlyActiveForLocalPlayers_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_onlyActiveForLocalPlayers_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            /* // TODO: We currently do not have firedEHs on vehicles
            class vehicleGunnerEnabled {
                displayName = "Enabled For Vehicle Gunners";
                description = "Enables advanced ballistics for vehicle gunners";
                typeName = "BOOL";
                defaultValue = 0;
            };
            */
            class ammoTemperatureEnabled {
                displayName = "$STR_ACE_AdvancedBallistics_ammoTemperatureEnabled_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_ammoTemperatureEnabled_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class barrelLengthInfluenceEnabled {
                displayName = "$STR_ACE_AdvancedBallistics_barrelLengthInfluenceEnabled_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_barrelLengthInfluenceEnabled_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class bulletTraceEnabled {
                displayName = "$STR_ACE_AdvancedBallistics_bulletTraceEnabled_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_bulletTraceEnabled_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class simulationInterval {
                displayName = "$STR_ACE_AdvancedBallistics_simulationInterval_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_simulationInterval_Description";
                typeName = "NUMBER";
                defaultValue = 0.0;
            };
            class simulationRadius {
                displayName = "$STR_ACE_AdvancedBallistics_simulationRadius_DisplayName";
                description = "$STR_ACE_AdvancedBallistics_simulationRadius_Description";
                typeName = "NUMBER";
                defaultValue = 3000;
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_AdvancedBallistics_Description";
        };
    };
};
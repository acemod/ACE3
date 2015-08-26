class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };

    // TODO make a curator variant for this
    class ACE_moduleAmbianceSound: Module_F {
        scope = 2;
        displayName = CSTRING(AmbianceSounds_DisplayName);
        icon = QUOTE(PATHTOF(UI\Icon_Module_Breathing_ca.paa));
        category = "ACE_missionModules";
        function = QUOTE(FUNC(moduleAmbianceSound));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class soundFiles {
                displayName = CSTRING(AmbianceSounds_soundFiles_DisplayName);
                description = CSTRING(AmbianceSounds_soundFiles_Description);
                typeName = "STRING";
                defaultValue = "";
            };
            class minimalDistance {
                displayName = CSTRING(AmbianceSounds_minimalDistance_DisplayName);
                description = CSTRING(AmbianceSounds_minimalDistance_Description);
                typeName = "NUMBER";
                defaultValue = 400;
            };
            class maximalDistance {
                displayName = CSTRING(AmbianceSounds_maximalDistance_DisplayName);
                description = CSTRING(AmbianceSounds_maximalDistance_Description);
                typeName = "NUMBER";
                defaultValue = 900;
            };
            class minimalDelay {
                displayName = CSTRING(AmbianceSounds_minimalDelay_DisplayName);
                description = CSTRING(AmbianceSounds_minimalDelay_Description);
                typeName = "NUMBER";
                defaultValue = 10;
            };
            class maximalDelay {
                displayName = CSTRING(AmbianceSounds_maximalDelay_DisplayName);
                description = CSTRING(AmbianceSounds_maximalDelay_Description);
                typeName = "NUMBER";
                defaultValue = 170;
            };
            class followPlayers {
                displayName = CSTRING(AmbianceSounds_followPlayers_DisplayName);
                description = CSTRING(AmbianceSounds_followPlayers_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class soundVolume {
                displayName = CSTRING(AmbianceSounds_soundVolume_DisplayName);
                description = CSTRING(AmbianceSounds_soundVolume_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(AmbianceSounds_Description);
            sync[] = {};
        };
    };

    class ACE_playerBreathing: Module_F {
        scope = 2;
        displayName = "";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Ambient_Sounds_ca.paa));
        category = "ACE_missionModules";
        function = QUOTE(FUNC(moduleBreath));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class breathEnabled {
                displayName = "Player Breathing is Enabled";
                description = "Enabled Player Breathing Simulation.";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class MaxBreathingDistance {
                displayName = "Maximal Distance";
                description = "Maximal Distance where the Breathing Smoke is Simulated.";
                typeName = "NUMBER";
                defaultValue = 100;
            };
            class breathIsForced {
                displayName = "Is Forced";
                description = "This settings Force the Breathing at for Every Tempature and Time.";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class breathTemperature {
                displayName = "Tempature";
                description = "The Tempature on that the Breathing Start.";
                typeName = "NUMBER";
                defaultValue = 0;
            };
            class breathTimeStart {
                displayName = "Start Time";
                description = "The Time when the Breathing Start.";
                typeName = "NUMBER";
                defaultValue = 0200;
            };
            class breathTimeEnd {
                displayName = "End Time";
                description = "The Time when the Breathing End.";
                typeName = "NUMBER";
                defaultValue = 0600;
            };
        };
    };
};

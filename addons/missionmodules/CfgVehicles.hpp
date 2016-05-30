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
        icon = QPATHTOF(UI\Icon_Module_Ambient_Sounds_ca.paa);
        category = "ACE_missionModules";
        function = QFUNC(moduleAmbianceSound);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments    {
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
};
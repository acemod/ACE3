class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };

    // TODO make a curator variant for this
    class ACE_moduleAmbianceSound: Module_F {
        scope = 2;
        displayName = "$STR_ACE_MissionModules_AmbianceSounds_DisplayName";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Ambient_Sounds_ca.paa));
        category = "ACE_missionModules";
        function = QUOTE(FUNC(moduleAmbianceSound));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments    {
            class soundFiles {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_soundFiles_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_soundFiles_Description";
                typeName = "STRING";
                defaultValue = "";
            };
            class minimalDistance {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_minimalDistance_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_minimalDistance_Description";
                typeName = "NUMBER";
                defaultValue = 400;
            };
            class maximalDistance {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_maximalDistance_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_maximalDistance_Description";
                typeName = "NUMBER";
                defaultValue = 900;
            };
            class minimalDelay {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_minimalDelay_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_minimalDelay_Description";
                typeName = "NUMBER";
                defaultValue = 10;
            };
            class maximalDelay {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_maximalDelay_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_maximalDelay_Description";
                typeName = "NUMBER";
                defaultValue = 170;
            };
            class followPlayers {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_followPlayers_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_followPlayers_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class soundVolume {
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_soundVolume_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_soundVolume_Description";
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_MissionModules_AmbianceSounds_Description";
            sync[] = {};
        };
    };
};
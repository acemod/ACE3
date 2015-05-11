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
<<<<<<< HEAD
                displayName = "Sounds";
                description = "Class names of the ambiance sounds to be played. Seperated by ','";
=======
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_soundFiles_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_soundFiles_Description";
>>>>>>> I made mess so new pull request.
                typeName = "STRING";
                defaultValue = "";
            };
            class minimalDistance {
<<<<<<< HEAD
                displayName = "Minimal Distance";
                description = "Used for calculating a random position and sets the minimal distance between the players and the played sound file(s)";
=======
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_minimalDistance_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_minimalDistance_Description";
>>>>>>> I made mess so new pull request.
                typeName = "NUMBER";
                defaultValue = 400;
            };
            class maximalDistance {
<<<<<<< HEAD
                displayName = "Maximum Distance";
                description = "Used for calculating a random position and sets the maximum distance between the players and the played sound file(s)";
=======
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_maximalDistance_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_maximalDistance_Description";
>>>>>>> I made mess so new pull request.
                typeName = "NUMBER";
                defaultValue = 900;
            };
            class minimalDelay {
<<<<<<< HEAD
                displayName = "Minimal Delay";
                description = "Minimal delay between sounds played";
=======
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_minimalDelay_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_minimalDelay_Description";
>>>>>>> I made mess so new pull request.
                typeName = "NUMBER";
                defaultValue = 10;
            };
            class maximalDelay {
<<<<<<< HEAD
                displayName = "Maximum Delay";
                description = "Maximum delay between sounds played";
=======
                displayName = "$STR_ACE_MissionModules_AmbianceSounds_maximalDelay_DisplayName";
                description = "$STR_ACE_MissionModules_AmbianceSounds_maximalDelay_Description";
>>>>>>> I made mess so new pull request.
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

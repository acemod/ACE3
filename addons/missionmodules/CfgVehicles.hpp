class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };

    // TODO make a curator variant for this
    class ACE_moduleAmbianceSound: Module_F {
        scope = 2;
        displayName = "Ambiance Sounds [ACE]";
        icon = QUOTE(PATHTOF(UI\Icon_Module_Ambient_Sounds_ca.paa));
        category = "ACE_missionModules";
        function = QUOTE(FUNC(moduleAmbianceSound));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "$STR_ACE_Common_ACETeam";
        class Arguments    {
            class soundFiles {
                displayName = "Sounds";
                description = "Class names of the ambiance sounds to be played. Seperated by ','";
                typeName = "STRING";
                defaultValue = "";
            };
            class minimalDistance {
                displayName = "Minimal Distance";
                description = "Used for calculating a random position and sets the minimal distance between the players and the played sound file(s)";
                typeName = "NUMBER";
                defaultValue = 400;
            };
            class maximalDistance {
                displayName = "Maximum Distance";
                description = "Used for calculating a random position and sets the maximum distance between the players and the played sound file(s)";
                typeName = "NUMBER";
                defaultValue = 900;
            };
            class minimalDelay {
                displayName = "Minimal Delay";
                description = "Minimal delay between sounds played";
                typeName = "NUMBER";
                defaultValue = 10;
            };
            class maximalDelay {
                displayName = "Maximum Delay";
                description = "Maximum delay between sounds played";
                typeName = "NUMBER";
                defaultValue = 170;
            };
            class followPlayers {
                displayName = "Follow Players";
                description = "Follow players. If set to false, loop will play sounds only nearby logic position.";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class soundVolume {
                displayName = "Volume";
                description = "The volume of the sounds played";
                typeName = "NUMBER";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "Ambiance sounds loop (synced across MP)";
            sync[] = {};
        };
    };
};

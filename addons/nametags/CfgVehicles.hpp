class CfgVehicles {
    class Module_F;
    class ACE_ModuleNameTags : Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Name Tags";
        function = QFUNC(moduleNameTags);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\IconNameTags_ca.paa));
        class Arguments {
            class PlayerNamesViewDistance {
                displayName = "Player Names View Dist.";
                description = "Distance in meters at which player names are shown. Default: 5";
                typeName = "NUMBER";
                defaultValue = 5;
            };
            class ShowNamesForAI {
                displayName = "Show name tags for AI?";
                description = "Show the name and rank tags for friendly AI units? Default: No";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "Yes";
                        value = 1;
                    };
                    class No {
                        default = 1;
                        name = "No";
                        value = 0;
                    };
                };
            };
            class Visibility {
                displayName = "Visibility of crew info";
                description = "Forces visibility of vehicle crew info, or by default allows players to choose it on their own. Default: Do Not Force";
                typeName = "INT";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = "Do Not Force";
                        value = 0;
                    };
                    class ForceShow {
                        name = "Force Show";
                        value = 1;
                    };
                    class ForceHide {
                        name = "Force Hide";
                        value = -1;
                    };
                };
            };
        };
    };
};

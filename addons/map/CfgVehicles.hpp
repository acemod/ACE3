class CfgVehicles {
    class Module_F;
    class ACE_ModuleBlueForceTracking: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Blue Force Tracking";
        function = QFUNC(blueForceTrackingModule);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\IconBFTracking_ca.paa);
        class Arguments {
            class Interval {
                displayName = "Interval";
                description = "How often the markers should be refreshed (in seconds)";
                defaultValue = 1;
            };
            class HideAiGroups {
                displayName = "Hide AI groups?";
                description = "Hide markers for 'AI only' groups?";
                typeName = "BOOL";
                class values {
                    class Yes { name = "Yes"; value = 1; };
                    class No { name = "No"; value = 0; default = 1; };
                };
            };
        };
    };
};

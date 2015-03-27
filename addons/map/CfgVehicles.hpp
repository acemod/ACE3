class CfgVehicles {
    class Module_F;
    class ACE_ModuleMap: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Map";
        function = QFUNC(moduleMap);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Map_ca.paa);
        class Arguments {
            class MapIllumination {
                displayName = "Map illumination?";
                description = "Calculate dynamic map illumination based on light conditions?";
                typeName = "BOOL";
                class values {
                    class Yes { name = "Yes"; value = 1; default = 1; };
                    class No { name = "No"; value = 0; };
                };
            };
            class MapShake {
                displayName = "Map shake?";
                description = "Make map shake when walking?";
                typeName = "BOOL";
                class values {
                    class Yes { name = "Yes"; value = 1; default = 1;};
                    class No { name = "No"; value = 0; };
                };
            };
            class MapLimitZoom {
                displayName = "Limit map zoom?";
                description = "Limit the amount of zoom available for the map?";
                typeName = "BOOL";
                class values {
                    class Yes { name = "Yes"; value = 1; };
                    class No { name = "No"; value = 0; default = 1;};
                };
            };
        };
    };

    class ACE_ModuleBlueForceTracking: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "Blue Force Tracking";
        function = QFUNC(blueForceTrackingModule);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_BFTracking_ca.paa);
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

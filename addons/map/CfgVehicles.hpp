class CfgVehicles {
    class Module_F;
    class ACE_ModuleMap: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_Map_Module_DisplayName";
        function = QFUNC(moduleMap);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Map_ca.paa);
        class Arguments {
            class MapIllumination {
                displayName = "$STR_ACE_Map_MapIllumination_DisplayName";
                description = "$STR_ACE_Map_MapIllumination_Description";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_ACE_Map_Yes"; value = 1; default = 1; };
                    class No { name = "$STR_ACE_Map_No"; value = 0; };
                };
            };
            class MapShake {
                displayName = "$STR_ACE_Map_MapShake_DisplayName";
                description = "$STR_ACE_Map_MapShake_Description";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_ACE_Map_Yes"; value = 1; default = 1;};
                    class No { name = "$STR_ACE_Map_No"; value = 0; };
                };
            };
            class MapLimitZoom {
                displayName = "$STR_ACE_Map_MapLimitZoom_DisplayName";
                description = "$STR_ACE_Map_MapLimitZoom_Description";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_ACE_Map_Yes"; value = 1; };
                    class No { name = "$STR_ACE_Map_No"; value = 0; default = 1;};
                };
            };
            class MapShowCursorCoordinates {
                displayName = "$STR_ACE_Map_MapShowCursorCoordinates_DisplayName";
                description = "$STR_ACE_Map_MapShowCursorCoordinates_Description";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_ACE_Map_Yes"; value = 1; };
                    class No { name = "$STR_ACE_Map_No"; value = 0; default = 1;};
                };
            };
        };
		class ModuleDescription {
            description = "$STR_ACE_Map_Module_Description";
        };
    };

    class ACE_ModuleBlueForceTracking: Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_Map_BFT_Module_DisplayName";
        function = QFUNC(blueForceTrackingModule);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_BFTracking_ca.paa);
        class Arguments {
            class Interval {
                displayName = "$STR_ACE_Map_BFT_Interval_DisplayName";
                description = "$STR_ACE_Map_BFT_Interval_Description";
                defaultValue = 1;
            };
            class HideAiGroups {
                displayName = "$STR_ACE_Map_BFT_HideAiGroups_DisplayName";
                description = "$STR_ACE_Map_BFT_HideAiGroups_Description";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_ACE_Map_Yes"; value = 1; };
                    class No { name = "$STR_ACE_Map_No"; value = 0; default = 1; };
                };
            };
        };
		class ModuleDescription {
            description = "$STR_ACE_Map_BFT_Module_Description";
        };
    };
};
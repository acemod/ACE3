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
                defaultValue = 1;
            };
            class MapShake {
                displayName = "$STR_ACE_Map_MapShake_DisplayName";
                description = "$STR_ACE_Map_MapShake_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class MapLimitZoom {
                displayName = "$STR_ACE_Map_MapLimitZoom_DisplayName";
                description = "$STR_ACE_Map_MapLimitZoom_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class MapShowCursorCoordinates {
                displayName = "$STR_ACE_Map_MapShowCursorCoordinates_DisplayName";
                description = "$STR_ACE_Map_MapShowCursorCoordinates_Description";
                typeName = "BOOL";
                defaultValue = 0;
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
				typeName = "NUMBER";
                defaultValue = 1;
            };
            class HideAiGroups {
                displayName = "$STR_ACE_Map_BFT_HideAiGroups_DisplayName";
                description = "$STR_ACE_Map_BFT_HideAiGroups_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
		class ModuleDescription {
            description = "$STR_ACE_Map_BFT_Module_Description";
        };
    };
};
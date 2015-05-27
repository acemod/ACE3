class CfgVehicles {
    class Module_F;
    class ACE_ModuleMap: Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleMap);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Map_ca.paa);
        class Arguments {
            class MapIllumination {
                displayName = CSTRING(MapIllumination_DisplayName);
                description = CSTRING(MapIllumination_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class MapShake {
                displayName = CSTRING(MapShake_DisplayName);
                description = CSTRING(MapShake_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class MapLimitZoom {
                displayName = CSTRING(MapLimitZoom_DisplayName);
                description = CSTRING(MapLimitZoom_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class MapShowCursorCoordinates {
                displayName = CSTRING(MapShowCursorCoordinates_DisplayName);
                description = CSTRING(MapShowCursorCoordinates_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class ACE_ModuleBlueForceTracking: Module_F {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(BFT_Module_DisplayName);
        function = QFUNC(blueForceTrackingModule);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_BFTracking_ca.paa);
        class Arguments {
            class Interval {
                displayName = CSTRING(BFT_Interval_DisplayName);
                description = CSTRING(BFT_Interval_Description);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class HideAiGroups {
                displayName = CSTRING(BFT_HideAiGroups_DisplayName);
                description = CSTRING(BFT_HideAiGroups_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(BFT_Module_Description);
        };
    };
};
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_MapFlashlight {
                displayName = CSTRING(Action_Flashlights);
                icon = QUOTE(\a3\ui_f\data\IGUI\Cfg\VehicleToggles\lightsiconon_ca.paa);
                condition = QUOTE(GVAR(mapIllumination) && visibleMap && {count ([ACE_player] call FUNC(getUnitFlashlights)) > 0});
                statement = "true";
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                insertChildren = QUOTE(_this call DFUNC(compileFlashlightMenu));
                showDisabled = 0;
                priority = 99;
            };
        };
    };

    class ACE_Module;
    class ACE_ModuleMap: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleMap);
        scope = 2;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_Map_ca.paa);
        class Arguments {
            class MapIllumination {
                displayName = CSTRING(MapIllumination_DisplayName);
                description = CSTRING(MapIllumination_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class MapGlow {
                displayName = CSTRING(MapGlow_DisplayName);
                description = CSTRING(MapGlow_Description);
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
            class DefaultChannel {
                displayName = CSTRING(DefaultChannel_DisplayName);
                description = CSTRING(DefaultChannel_Description);
                typeName = "NUMBER";
                class values {
                    class disable {name = ECSTRING(common,Disabled); value = -1; default = 1;};
                    class global {name = "$STR_channel_global"; value = 0;};
                    class side {name = "$STR_channel_side"; value = 1;};
                    class command {name = "$STR_channel_command"; value = 2;};
                    class group {name = "$STR_channel_group"; value = 3;};
                    class vehicle {name = "$STR_channel_vehicle"; value = 4;};
                    class direct {name = "$STR_channel_direct"; value = 5;};
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class ACE_ModuleBlueForceTracking: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(BFT_Module_DisplayName);
        function = QFUNC(blueForceTrackingModule);
        scope = 2;
        isGlobal = 0;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_BFTracking_ca.paa);
        class Arguments {
            class Enabled {
                displayName = CSTRING(BFT_Enabled_DisplayName);
                description = CSTRING(BFT_Enabled_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
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
            class ShowPlayerNames {
                displayName = CSTRING(BFT_ShowPlayerNames_DisplayName);
                description = CSTRING(BFT_ShowPlayerNames_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(BFT_Module_Description);
        };
    };
};

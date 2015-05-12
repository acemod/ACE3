class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(configure) {
                    //Opens the interactive dialog
                    displayName = "$STR_ACE_microdagr_configure";
                    condition = QUOTE([DISPLAY_MODE_DIALOG] call FUNC(canShow));
                    statement = QUOTE([DISPLAY_MODE_DIALOG] call FUNC(openDisplay));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};

                    //Sub Actions:
                    class GVAR(show) {
                        //Opens the background display (minimap)
                        displayName = "$STR_ACE_microdagr_show";
                        condition = QUOTE(([DISPLAY_MODE_DISPLAY] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DISPLAY});
                        statement = QUOTE([DISPLAY_MODE_DISPLAY] call FUNC(openDisplay));
                        showDisabled = 0;
                        priority = 0.2;
                        icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
                        exceptions[] = {"notOnMap", "isNotInside"};
                    };
                    class GVAR(close) {
                        displayName = "$STR_ACE_microdagr_closeUnit";
                        condition = QUOTE(GVAR(currentShowMode) != DISPLAY_MODE_CLOSED);
                        statement = QUOTE([DISPLAY_MODE_CLOSED] call FUNC(openDisplay));
                        showDisabled = 0;
                        priority = 0.3;
                        icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
                        exceptions[] = {"notOnMap", "isNotInside"};
                    };
                };
            };
        };
    };

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {};
        class ModuleDescription {};
    };
    class GVAR(dagrModule): Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "MicroDAGR Map Fill";
        function = QFUNC(moduleMapFill);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_microDAGR_ca.paa));
        functionPriority = 0;
        class Arguments {
            class MapDataAvailable {
                displayName = "MicroDAGR Map Fill"; // Argument label
                description = "How much map data is filled on MicroDAGR's "; // Tooltip description
                typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
                class values {
                    class None {name = "Full Satellite + Buildings"; value = MAP_DETAIL_SAT; default = 1;};
                    class Side {name = "Topographical + Roads"; value = MAP_DETAIL_TOPOROADS;};
                    class Unique {name = "None (Cannot use map view)"; value = MAP_DETAIL_NONE;};
                };
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "Controls how much data is filled on the microDAGR items.  Less data restricts the map view to show less on the minimap.<br/>Source: microDAGR.pbo";
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_microDAGR,10);
        };
    };
};

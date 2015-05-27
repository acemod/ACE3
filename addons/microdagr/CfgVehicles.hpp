class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(show) {
                    //Opens the mini map
                    displayName = CSTRING(show);
                    condition = QUOTE(([DISPLAY_MODE_DISPLAY] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DISPLAY});
                    statement = QUOTE([DISPLAY_MODE_DISPLAY] call FUNC(openDisplay));
                    showDisabled = 0;
                    priority = 0.2;
                    icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class GVAR(configure) {
                    //Opens the dialog
                    displayName = CSTRING(configure);
                    condition = QUOTE(([DISPLAY_MODE_DIALOG] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DIALOG});
                    statement = QUOTE([DISPLAY_MODE_DIALOG] call FUNC(openDisplay));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class GVAR(close) {
                    displayName = CSTRING(closeUnit);
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

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {};
        class ModuleDescription {};
    };
    class GVAR(dagrModule): Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleMapFill);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_microDAGR_ca.paa));
        functionPriority = 0;
        class Arguments {
            class MapDataAvailable {
                displayName = CSTRING(MapDataAvailable_DisplayName);
                description = CSTRING(MapDataAvailable_Description);
                typeName = "NUMBER";
                class values {
                    class None {name = CSTRING(None); value = MAP_DETAIL_SAT; default = 1;};
                    class Side {name = CSTRING(Side); value = MAP_DETAIL_TOPOROADS;};
                    class Unique {name = CSTRING(Unique); value = MAP_DETAIL_NONE;};
                };
            };
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_microDAGR,10);
        };
    };

    class Item_Base_F;
    class ACE_microDAGR_Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(itemName);
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
        class TransportItems {
            MACRO_ADDITEM(ACE_microDAGR,1);
        };
    };
};

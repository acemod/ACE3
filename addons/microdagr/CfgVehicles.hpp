class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(configure) {
                    //Opens the dialog
                    displayName = CSTRING(configure);
                    condition = QUOTE(([DISPLAY_MODE_DIALOG] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DIALOG});
                    statement = QUOTE([DISPLAY_MODE_DIALOG] call FUNC(openDisplay));
                    icon = QPATHTOF(UI\icon_microDAGR.paa);
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    class GVAR(show) {
                        //Opens the mini map
                        displayName = CSTRING(show);
                        condition = QUOTE(([DISPLAY_MODE_DISPLAY] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DISPLAY});
                        statement = QUOTE([DISPLAY_MODE_DISPLAY] call FUNC(openDisplay));
                        icon = QPATHTOF(UI\icon_microDAGR.paa);
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                    class GVAR(close) {
                        displayName = CSTRING(closeUnit);
                        condition = QUOTE(GVAR(currentShowMode) != DISPLAY_MODE_CLOSED);
                        statement = QUOTE([DISPLAY_MODE_CLOSED] call FUNC(openDisplay));
                        icon = QPATHTOF(UI\icon_microDAGR.paa);
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                };
            };
        };
    };

    class ACE_Module;
    class GVAR(dagrModule): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleMapFill);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_microDAGR_ca.paa);
        functionPriority = 0;
        class Arguments {
            class MapDataAvailable {
                displayName = CSTRING(MapDataAvailable_DisplayName);
                description = CSTRING(MapDataAvailable_Description);
                typeName = "NUMBER";
                class values {
                    class Full {name = CSTRING(MapFill_Full); value = MAP_DETAIL_SAT; default = 1;};
                    class Roads {name = CSTRING(MapFill_OnlyRoads); value = MAP_DETAIL_TOPOROADS;};
                    class Disabled {name = CSTRING(MapFill_None); value = MAP_DETAIL_NONE;};
                };
            };
        };
        class ModuleDescription {
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
        author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
        icon = QPATHTOF(UI\icon_microDAGR.paa);
        class TransportItems {
            MACRO_ADDITEM(ACE_microDAGR,1);
        };
    };
};

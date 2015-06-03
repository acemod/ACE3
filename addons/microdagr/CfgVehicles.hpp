class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(show) {
                    //Opens the mini map
                    displayName = "$STR_ACE_microdagr_show";
                    condition = QUOTE(([DISPLAY_MODE_DISPLAY] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DISPLAY});
                    statement = QUOTE([DISPLAY_MODE_DISPLAY] call FUNC(openDisplay));
                    showDisabled = 0;
                    priority = 0.2;
                    icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class GVAR(configure) {
                    //Opens the dialog
                    displayName = "$STR_ACE_microdagr_configure";
                    condition = QUOTE(([DISPLAY_MODE_DIALOG] call FUNC(canShow)) && {GVAR(currentShowMode) != DISPLAY_MODE_DIALOG});
                    statement = QUOTE([DISPLAY_MODE_DIALOG] call FUNC(openDisplay));
                    showDisabled = 0;
                    priority = 0.1;
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

    class ACE_Module;
    class GVAR(dagrModule): ACE_Module {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_Dagr_Module_DisplayName";
        function = QFUNC(moduleMapFill);
        scope = 2;
        isGlobal = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_microDAGR_ca.paa));
        functionPriority = 0;
        class Arguments {
            class MapDataAvailable {
                displayName = "$STR_ACE_Dagr_MapDataAvailable_DisplayName";
                description = "$STR_ACE_Dagr_MapDataAvailable_Description";
                typeName = "NUMBER";
                class values {
                    class None {name = "$STR_ACE_Dagr_None"; value = MAP_DETAIL_SAT; default = 1;};
                    class Side {name = "$STR_ACE_Dagr_Side"; value = MAP_DETAIL_TOPOROADS;};
                    class Unique {name = "$STR_ACE_Dagr_Unique"; value = MAP_DETAIL_NONE;};
                };
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_Dagr_Module_Description";
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
        displayName = "$STR_ACE_microdagr_itemName";
        author = "$STR_ACE_Common_ACETeam";
        vehicleClass = "Items";
        icon = QUOTE(PATHTOF(UI\icon_microDAGR.paa));
        class TransportItems {
            MACRO_ADDITEM(ACE_microDAGR,1);
        };
    };
};

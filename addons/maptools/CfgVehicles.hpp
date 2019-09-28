class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_MapGpsShow {
                displayName = CSTRING(MapGpsShow);
                condition = QUOTE((!GVAR(mapGpsShow)) && {call FUNC(canUseMapGPS)});
                statement = QUOTE(GVAR(mapGpsShow) = true;);
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                showDisabled = 0;
            };
            class ACE_MapGpsHide {
                displayName = CSTRING(MapGpsHide);
                condition = QUOTE((GVAR(mapGpsShow)) && {call FUNC(canUseMapGPS)});
                statement = QUOTE(GVAR(mapGpsShow) = false;);
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                showDisabled = 0;
            };
            class ACE_MapTools {
                displayName = CSTRING(MapTools_Menu);
                condition = QUOTE(call FUNC(canUseMapTools));
                statement = "";
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                showDisabled = 0;
                class ACE_MapToolsHide {
                    displayName = CSTRING(MapToolsHide);
                    condition = QUOTE(GVAR(mapTool_Shown) != 0);
                    statement = QUOTE(GVAR(mapTool_Shown) = 0;);
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                };
                class ACE_MapToolsShowNormal {
                    displayName = CSTRING(MapToolsShowNormal);
                    condition = QUOTE(GVAR(mapTool_Shown) != 1);
                    statement = QUOTE(GVAR(mapTool_Shown) = 1;);
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                };
                class ACE_MapToolsShowSmall {
                    displayName = CSTRING(MapToolsShowSmall);
                    condition = QUOTE(GVAR(mapTool_Shown) != 2);
                    statement = QUOTE(GVAR(mapTool_Shown) = 2;);
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                };
                class ACE_MapToolsAlignNorth {
                    displayName = CSTRING(MapToolsAlignNorth);
                    condition = QUOTE(GVAR(mapTool_Shown) != 0);
                    statement = QUOTE(GVAR(mapTool_angle) = 0;);
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                };
                class ACE_MapToolsAlignCompass {
                    displayName = CSTRING(MapToolsAlignCompass);
                    condition = QUOTE((GVAR(mapTool_Shown) != 0) && {'ItemCompass' in assigneditems ACE_player});
                    statement = QUOTE(GVAR(mapTool_angle) = getDir ACE_player;);
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"};
                    showDisabled = 1;
                };
            };
        };
    };

    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;

    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
        };
    };
};

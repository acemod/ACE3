class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {

            class ACE_MapTools {
                displayName = CSTRING(MapTools_Menu);
                condition = QUOTE((call FUNC(canUseMapTools) || {call FUNC(canUseMapGPS)}));
                statement = "";
                exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                showDisabled = 0;
                priority = 100;

                class ACE_MapToolsHide {
                    displayName = CSTRING(MapToolsHide);
                    condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 0}));
                    statement = QUOTE(GVAR(mapTool_Shown) = 0; [] call FUNC(updateMapToolMarkers));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 1;
                    priority = 5;
                };
                class ACE_MapToolsShowNormal {
                    displayName = CSTRING(MapToolsShowNormal);
                    condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 1}));
                    statement = QUOTE(GVAR(mapTool_Shown) = 1; [] call FUNC(updateMapToolMarkers));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 1;
                    priority = 4;
                };
                class ACE_MapToolsShowSmall {
                    displayName = CSTRING(MapToolsShowSmall);
                    condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 2}));
                    statement = QUOTE(GVAR(mapTool_Shown) = 2; [] call FUNC(updateMapToolMarkers));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 1;
                    priority = 3;
                };
                class ACE_MapToolsAlignNorth {
                    displayName = CSTRING(MapToolsAlignNorth);
                    condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 0}));
                    statement = QUOTE(GVAR(mapTool_angle) = 0; [] call FUNC(updateMapToolMarkers));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 1;
                    priority = 2;
                };
                class ACE_MapToolsAlignCompass {
                    displayName = CSTRING(MapToolsAlignCompass);
                    condition = QUOTE((call FUNC(canUseMapTools) && {GVAR(mapTool_Shown) != 0} && {('ItemCompass' in assigneditems ACE_player) || {'ItemCompass' in assigneditems ACE_player}}));
                    statement = QUOTE(GVAR(mapTool_angle) = getDir ACE_player; [] call FUNC(updateMapToolMarkers));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 1;
                    priority = 1;
                };
                class ACE_MapGpsShow {
                    displayName = CSTRING(MapGpsShow);
                    condition = QUOTE((call FUNC(canUseMapGPS) && {!GVAR(mapGpsShow)}));
                    statement = QUOTE(GVAR(mapGpsShow) = true; [GVAR(mapGpsShow)] call FUNC(openMapGps));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 0;
                    priority = 0;
                };
                class ACE_MapGpsHide {
                    displayName = CSTRING(MapGpsHide);
                    condition = QUOTE((call FUNC(canUseMapGPS) && {GVAR(mapGpsShow)}));
                    statement = QUOTE(GVAR(mapGpsShow) = false; [GVAR(mapGpsShow)] call FUNC(openMapGps));
                    exceptions[] = {"isNotDragging", "notOnMap", "isNotInside"};
                    showDisabled = 0;
                    priority = 0;
                };
            };
        };

        class ACE_Actions {
            class ACE_MainActions {
                class ACE_CopyMap {
                    displayName = CSTRING(CopyMap);
                    condition = QUOTE(([_target] call EFUNC(common,isPlayer) && {'ItemMap' in assigneditems _player} && {'ACE_MapTools' in items _player} && {'ItemMap' in assignedItems _target}));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(copyMapStart));
                    showDisabled = 0;
                    priority = -1;
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

#define EXCEPTIONS exceptions[] = {"isNotDragging", "notOnMap", "isNotInside", "isNotSitting"}

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_MapGpsShow {
                displayName = CSTRING(MapGpsShow);
                condition = QUOTE(!GVAR(mapGpsShow) && {call FUNC(canUseMapGPS)});
                statement = QUOTE(GVAR(mapGpsShow) = true);
                EXCEPTIONS;
                showDisabled = 0;
            };
            class ACE_MapGpsHide {
                displayName = CSTRING(MapGpsHide);
                condition = QUOTE(GVAR(mapGpsShow) && {call FUNC(canUseMapGPS)});
                statement = QUOTE(GVAR(mapGpsShow) = false);
                EXCEPTIONS;
                showDisabled = 0;
            };
            class ACE_MapTools {
                displayName = CSTRING(MapTools_Menu);
                condition = QUOTE(call FUNC(canUseMapTools));
                statement = "";
                EXCEPTIONS;
                showDisabled = 0;

                class ACE_MapToolsHide {
                    displayName = CSTRING(MapToolsHide);
                    condition = QUOTE(GVAR(mapTool_Shown) != 0);
                    statement = QUOTE(GVAR(mapTool_Shown) = 0);
                    EXCEPTIONS;
                    showDisabled = 1;
                };
                class ACE_MapToolsShowNormal {
                    displayName = CSTRING(MapToolsShowNormal);
                    condition = QUOTE(GVAR(mapTool_Shown) != 1);
                    statement = QUOTE(if (GVAR(mapTool_Shown) == 0) then {GVAR(mapTool_moveToMouse) = true}; GVAR(mapTool_Shown) = 1);
                    EXCEPTIONS;
                    showDisabled = 1;
                };
                class ACE_MapToolsShowSmall {
                    displayName = CSTRING(MapToolsShowSmall);
                    condition = QUOTE(GVAR(mapTool_Shown) != 2);
                    statement = QUOTE(if (GVAR(mapTool_Shown) == 0) then {GVAR(mapTool_moveToMouse) = true}; GVAR(mapTool_Shown) = 2);
                    EXCEPTIONS;
                    showDisabled = 1;
                };
                class ACE_MapToolsAlign {
                    displayName = CSTRING(AlignTo);
                    condition = QUOTE(GVAR(mapTool_Shown) != 0);
                    statement = "";
                    EXCEPTIONS;
                    showDisabled = 0;

                    class ACE_MapToolsAlignToPlottingBoardRuler {
                        displayName = CSTRING(ToPlottingBoardRulerLabel);
                        condition = QUOTE(GVAR(mapTool_Shown) != 0 && GVAR(plottingBoard_Shown) == 2);
                        statement = QUOTE(GVAR(mapTool_angle) = GVAR(plottingBoard_rulerAngle));
                        EXCEPTIONS;
                        showDisabled = 1;
                    };
                    class ACE_MapToolsAlignToPlottingBoardAcrylic {
                        displayName = CSTRING(ToPlottingBoardAcrylicLabel);
                        condition = QUOTE(GVAR(mapTool_Shown) != 0 && GVAR(plottingBoard_Shown) != 0);
                        statement = QUOTE(GVAR(mapTool_angle) = GVAR(plottingBoard_acrylicAngle));
                        EXCEPTIONS;
                        showDisabled = 1;
                    };
                    class ACE_MapToolsAlignToPlottingBoard {
                        displayName = CSTRING(ToPlottingBoardLabel);
                        condition = QUOTE(GVAR(mapTool_Shown) != 0 && GVAR(plottingBoard_Shown) != 0);
                        statement = QUOTE(GVAR(mapTool_angle) = GVAR(plottingBoard_angle));
                        EXCEPTIONS;
                        showDisabled = 1;
                    };
                    class ACE_MapToolsAlignCompass {
                        displayName = CSTRING(ToCompassLabel);
                        condition = QUOTE(GVAR(mapTool_Shown) != 0 && {ACE_player getSlotItemName TYPE_COMPASS != ''});
                        statement = QUOTE(GVAR(mapTool_angle) = getDir ACE_player);
                        EXCEPTIONS;
                        showDisabled = 1;
                    };
                    class ACE_MapToolsAlignNorth {
                        displayName = CSTRING(ToNorthLabel);
                        condition = QUOTE(GVAR(mapTool_Shown) != 0);
                        statement = QUOTE(GVAR(mapTool_angle) = 0);
                        EXCEPTIONS;
                        showDisabled = 1;
                    };
                };
            };
            class ACE_PlottingBoard {
                displayName = CSTRING(ShowPlottingBoard);
                condition = QUOTE(GVAR(plottingBoard_Shown) < 1 && {call FUNC(canUsePlottingBoard)});
                statement = QUOTE(GVAR(plottingBoard_Shown) = 1);
                EXCEPTIONS;
                showDisabled = 0;
            };
            class ACE_PlottingBoardHide {
                displayName = CSTRING(HidePlottingBoard);
                condition = QUOTE(GVAR(plottingBoard_Shown) != 0 && {call FUNC(canUsePlottingBoard)});
                statement = QUOTE(GVAR(plottingBoard_Shown) = 0);
                EXCEPTIONS;
                showDisabled = 0;

                class ACE_PlottingBoardRulerShow {
                    displayName = CSTRING(TogglePlottingBoardRuler);
                    condition = QUOTE(GVAR(plottingBoard_Shown) == 1);
                    statement = QUOTE(GVAR(plottingBoard_Shown) = 2);
                    EXCEPTIONS;
                    showDisabled = 1;
                };
                class ACE_PlottingBoardRulerHide {
                    displayName = CSTRING(TogglePlottingBoardRuler);
                    condition = QUOTE(GVAR(plottingBoard_Shown) == 2);
                    statement = QUOTE(GVAR(plottingBoard_Shown) = 1);
                    EXCEPTIONS;
                    showDisabled = 1;
                };
                class ACE_PlottingBoardWipe {
                    displayName = CSTRING(WipeBoard);
                    condition = QUOTE(GVAR(plottingBoard_markers) isNotEqualTo createHashMap);
                    statement = QUOTE(call FUNC(wipeMarkers));
                    EXCEPTIONS;
                    showDisabled = 1;
                };
                class ACE_PlottingBoardAlign {
                    displayName = CSTRING(AlignTo);
                    condition = QUOTE(GVAR(plottingBoard_Shown) > 0);
                    statement = "";
                    EXCEPTIONS;
                    showDisabled = 0;

                    class ACE_PlottingBoardAlignBoard {
                        displayName = CSTRING(PlottingBoardLabel);
                        condition = QUOTE(true);
                        statement = "";
                        EXCEPTIONS;
                        showDisabled = 0;

                        class ACE_PlottingBoardAlignBoardMaptool {
                            displayName = CSTRING(ToMapToolLabel);
                            condition = QUOTE(GVAR(mapTool_Shown) > 0 && GVAR(plottingBoard_angle) != GVAR(mapTool_angle));
                            statement = QUOTE(GVAR(plottingBoard_angle) = GVAR(mapTool_angle));
                            EXCEPTIONS;
                            showDisabled = 0;
                        };
                        class ACE_PlottingBoardAlignBoardUp {
                            displayName = CSTRING(ToUpLabel);
                            condition = QUOTE(GVAR(plottingBoard_angle) != 0);
                            statement = QUOTE(GVAR(plottingBoard_angle) = 0);
                            EXCEPTIONS;
                            showDisabled = 0;
                        };
                    };
                    class ACE_PlottingBoardAlignAcrylic {
                        displayName = CSTRING(PlottingBoardAcrylicLabel);
                        condition = QUOTE(true);
                        statement = "";
                        EXCEPTIONS;
                        showDisabled = 0;

                        class ACE_PlottingBoardAlignAcrylicMaptool {
                            displayName = CSTRING(ToMapToolLabel);
                            condition = QUOTE(GVAR(mapTool_Shown) > 0 && GVAR(plottingBoard_acrylicAngle) != GVAR(mapTool_angle));
                            statement = QUOTE(GVAR(plottingBoard_acrylicAngle) = GVAR(mapTool_angle));
                            EXCEPTIONS;
                            showDisabled = 0;
                        };
                        class ACE_PlottingBoardAlignAcrylicUp {
                            displayName = CSTRING(ToUpLabel);
                            condition = QUOTE(GVAR(plottingBoard_acrylicAngle) != 0);
                            statement = QUOTE(GVAR(plottingBoard_acrylicAngle) = 0);
                            EXCEPTIONS;
                            showDisabled = 0;
                        };
                    };
                    class ACE_PlottingBoardAlignRuler {
                        displayName = CSTRING(PlottingBoardRulerLabel);
                        condition = QUOTE(GVAR(plottingBoard_Shown) == 2);
                        statement = "";
                        EXCEPTIONS;
                        showDisabled = 0;

                        class ACE_PlottingBoardAlignRulerMaptool {
                            displayName = CSTRING(ToMapToolLabel);
                            condition = QUOTE(GVAR(mapTool_Shown) > 0 && GVAR(plottingBoard_rulerAngle) != GVAR(mapTool_angle));
                            statement = QUOTE(GVAR(plottingBoard_rulerAngle) = GVAR(mapTool_angle));
                            EXCEPTIONS;
                            showDisabled = 0;
                        };
                        class ACE_PlottingBoardAlignRulerUp {
                            displayName = CSTRING(ToUpLabel);
                            condition = QUOTE(GVAR(plottingBoard_rulerAngle) != 0);
                            statement = QUOTE(GVAR(plottingBoard_rulerAngle) = 0);
                            EXCEPTIONS;
                            showDisabled = 0;
                        };
                    };
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
            MACRO_ADDITEM(ACE_PlottingBoard,12);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
            MACRO_ADDITEM(ACE_PlottingBoard,12);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
            MACRO_ADDITEM(ACE_PlottingBoard,12);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
            MACRO_ADDITEM(ACE_PlottingBoard,12);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_MapTools,12);
            MACRO_ADDITEM(ACE_PlottingBoard,12);
        };
    };
};

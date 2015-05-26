// Background definition
#define GUI_GRID_PX_W 2048 // width in pixels
#define GUI_GRID_PX_H 2048 // hight in pixels

// Define screen area less header and footer. This defines the outer limits for any control groups.
#define SCREEN_CONTENT_X TAD_MAP_X
#define SCREEN_CONTENT_Y TAD_MAP_Y
#define SCREEN_CONTENT_W TAD_MAP_W
#define SCREEN_CONTENT_H TAD_MAP_H

#include "shared_macros.hpp"

class GVAR(TAD_OSB): GVAR(RscButtonInv) {
    w = pxToScreen_W(134);
    h = pxToScreen_H(134);
};
class GVAR(TAD_OSB01): GVAR(TAD_OSB) {
    x = pxToScreen_X(577);
    y = pxToScreen_Y(146);
};
class GVAR(TAD_OSB02): GVAR(TAD_OSB01) {
    x = pxToScreen_X(767);
};
class GVAR(TAD_OSB03): GVAR(TAD_OSB01) {
    x = pxToScreen_X(957);
};
class GVAR(TAD_OSB04): GVAR(TAD_OSB01) {
    x = pxToScreen_X(1147);
};
class GVAR(TAD_OSB05): GVAR(TAD_OSB01) {
    x = pxToScreen_X(1337);
};
class GVAR(TAD_OSB06): GVAR(TAD_OSB) {
    x = pxToScreen_X(1782);
    y = pxToScreen_Y(563);
};
class GVAR(TAD_OSB07): GVAR(TAD_OSB06) {
    y = pxToScreen_Y(760);
};
class GVAR(TAD_OSB08): GVAR(TAD_OSB06) {
    y = pxToScreen_Y(957);
};
class GVAR(TAD_OSB09): GVAR(TAD_OSB06) {
    y = pxToScreen_Y(1155);
};
class GVAR(TAD_OSB10): GVAR(TAD_OSB06) {
    y = pxToScreen_Y(1352);
};
class GVAR(TAD_OSB11): GVAR(TAD_OSB) {
    x = pxToScreen_X(1337);
    y = pxToScreen_Y(1811);
};
class GVAR(TAD_OSB12): GVAR(TAD_OSB11) {
    x = pxToScreen_X(1147);
};
class GVAR(TAD_OSB13): GVAR(TAD_OSB11) {
    x = pxToScreen_X(957);
};
class GVAR(TAD_OSB14): GVAR(TAD_OSB11) {
    x = pxToScreen_X(767);
};
class GVAR(TAD_OSB15): GVAR(TAD_OSB11) {
    x = pxToScreen_X(577);
};
class GVAR(TAD_OSB16): GVAR(TAD_OSB) {
    x = pxToScreen_X(132);
    y = pxToScreen_Y(1352);
};
class GVAR(TAD_OSB17): GVAR(TAD_OSB16) {
    y = pxToScreen_Y(1155);
};
class GVAR(TAD_OSB18): GVAR(TAD_OSB16) {
    y = pxToScreen_Y(957);
};
class GVAR(TAD_OSB19): GVAR(TAD_OSB16) {
    y = pxToScreen_Y(760);
};
class GVAR(TAD_OSB20): GVAR(TAD_OSB16) {
    y = pxToScreen_Y(563);
};
class GVAR(TAD_ADJ_INC): GVAR(RscButtonInv) {
    x = pxToScreen_X(124);
    y = pxToScreen_Y(257);
    w = pxToScreen_W(142);
    h = pxToScreen_H(119);
};
class GVAR(TAD_ADJ_DEC): GVAR(TAD_ADJ_INC) {
    y = pxToScreen_Y(376);
};
class GVAR(TAD_DSP_INC): GVAR(TAD_ADJ_INC) {
    x = pxToScreen_X(1782);
};
class GVAR(TAD_DSP_DEC): GVAR(TAD_DSP_INC) {
    y = pxToScreen_Y(376);
};
class GVAR(TAD_CON_INC): GVAR(TAD_ADJ_INC) {
    y = pxToScreen_Y(1539);
};
class GVAR(TAD_CON_DEC): GVAR(TAD_CON_INC) {
    y = pxToScreen_Y(1658);
};
class GVAR(TAD_BRT_INC): GVAR(TAD_CON_INC) {
    x = pxToScreen_X(1782);
};
class GVAR(TAD_BRT_DEC): GVAR(TAD_BRT_INC) {
    y = pxToScreen_Y(1658);
};
class GVAR(TAD_SYM_INC): GVAR(RscButtonInv) {
    x = pxToScreen_X(1663);
    y = pxToScreen_Y(1811);
    w = pxToScreen_W(119);
    h = pxToScreen_H(142);
};
class GVAR(TAD_SYM_DEC): GVAR(TAD_SYM_INC) {
    x = pxToScreen_X(1544);
};
class GVAR(TAD_DNO): GVAR(RscButtonInv) {
    x = pxToScreen_X(234);
    y = pxToScreen_Y(1894);
    w = pxToScreen_W(142);
    h = pxToScreen_H(142);
};
class GVAR(TAD_RscText): GVAR(RscText) {
    style = ST_CENTER;
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W);
    h = pxToScreen_H(TAD_OSD_ELEMENT_STD_H);
    font = GUI_FONT_MONO;
    colorText[] = COLOR_NEON_GREEN;
    sizeEx = pxToScreen_H(TAD_OSD_TEXT_STD_SIZE);
    colorBackground[] = COLOR_BLACK;
    shadow = 0;
};
class GVAR(TAD_upDownArrow): GVAR(RscPicture) {
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W);
    h = pxToScreen_H(TAD_OSD_ICON_H);
    colorText[] = COLOR_NEON_GREEN;
    colorBackground[] = COLOR_BLACK;
    text = "\a3\ui_f\data\IGUI\Cfg\Actions\autohover_ca.paa";
};
class GVAR(TAD_RscMapControl): GVAR(RscMapControl) {
    onDraw = onDrawBFT(1);
    text = "#(argb,8,8,3)color(1,1,1,1)";
    x = pxToScreen_X(TAD_MAP_X);
    y = pxToScreen_Y(TAD_MAP_Y);
    w = pxToScreen_W(TAD_MAP_W);
    h = pxToScreen_H(TAD_MAP_H);
    //type = CT_MAP;
    // allow to zoom out further (defines the maximum map scale, usually 1)
    scaleMax = 1000;
    // set initial map scale
    scaleDefault = QUOTE((missionNamespace getVariable 'GVAR(mapScale)') * 0.86 / (safezoneH * 0.8));
    // turn on satellite map information (defines the map scale of when to switch to topographical)
    maxSatelliteAlpha = 10000;
    alphaFadeStartScale = 10;
    alphaFadeEndScale = 10;

    // Rendering density coefficients
    ptsPerSquareSea = 8 / TAD_DLGtoDSP_fctr;       // seas
    ptsPerSquareTxt = 8 / TAD_DLGtoDSP_fctr;       // textures
    ptsPerSquareCLn = 8 / TAD_DLGtoDSP_fctr;       // count-lines
    ptsPerSquareExp = 8 / TAD_DLGtoDSP_fctr;       // exposure
    ptsPerSquareCost = 8 / TAD_DLGtoDSP_fctr;      // cost

    // Rendering thresholds
    ptsPerSquareFor = 3 / TAD_DLGtoDSP_fctr;       // forests
    ptsPerSquareForEdge = 100 / TAD_DLGtoDSP_fctr; // forest edges
    ptsPerSquareRoad = 1.5 / TAD_DLGtoDSP_fctr;        // roads
    ptsPerSquareObj = 4 / TAD_DLGtoDSP_fctr;       // other objects

    /*
    // replace CustomMark with wedding cake icon
    class CustomMark {
        icon = "\cTab\img\icon_wedding_cake_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        color[] = {1,1,1,1};
        shadow = 1;
    };
    */
};
class GVAR(TAD_RscMapControl_BLACK): GVAR(TAD_RscMapControl) {
    font = "TahomaB";
    sizeEx = 0.0;
    maxSatelliteAlpha = 0.0;
    colorBackground[] = {0,0,0,0};
    colorLevels[] = {0,0,0,0};
    colorSea[] = {0,0,0,0};
    colorForest[] = {0,0,0,0};
    colorRocks[] = {0,0,0,0};
    colorCountlines[] = {0,0,0,0};
    colorMainCountlines[] = {0,0,0,0};
    colorCountlinesWater[] = {0,0,0,0};
    colorMainCountlinesWater[] = {0,0,0,0};
    colorPowerLines[] = {0,0,0,0};
    colorRailWay[] = {0,0,0,0};
    colorForestBorder[] = {0,0,0,0};
    colorRocksBorder[] = {0,0,0,0};
    colorNames[] = {0,0,0,0};
    colorInactive[] = {0,0,0,0};
    colorOutside[] = {0,0,0,0};
    colorText[] = {0,0,0,0};
    colorGrid[] = {0,0,0,0};
    colorGridMap[] = {0,0,0,0};
    colorTracks[] = {0,0,0,0};
    colorTracksFill[] = {0,0,0,0};
    colorRoads[] = {0,0,0,0};
    colorRoadsFill[] = {0,0,0,0};
    colorMainRoads[] = {0,0,0,0};
    colorMainRoadsFill[] = {0,0,0,0};
    ShowCountourInterval = 0;
    shadow = 0;
    text = "";
    alphaFadeStartScale = 0.0;
    alphaFadeEndScale = 0.0;
    fontLabel = "TahomaB";
    sizeExLabel = 0.0;
    fontGrid = "TahomaB";
    sizeExGrid = 0.0;
    fontUnits = "TahomaB";
    sizeExUnits = 0.0;
    fontNames = "TahomaB";
    sizeExNames = 0.0;
    fontInfo = "TahomaB";
    sizeExInfo = 0.0;
    fontLevel = "TahomaB";
    sizeExLevel = 0.0;
    stickX[] = {0.0,{ "Gamma",0,0.0 }};
    stickY[] = {0.0,{ "Gamma",0,0.0 }};
    ptsPerSquareSea = 10000;
    ptsPerSquareTxt = 10000;
    ptsPerSquareCLn = 10000;
    ptsPerSquareExp = 10000;
    ptsPerSquareCost = 10000;
    ptsPerSquareFor = 10000;
    ptsPerSquareForEdge = 10000;
    ptsPerSquareRoad = 10000;
    ptsPerSquareObj = 10000;
    class Task {
        icon = "";
        color[] = {0,0,0,0};
        iconCreated = "";
        colorCreated[] = {0,0,0,0};
        iconCanceled = "";
        colorCanceled[] = {0,0,0,0};
        iconDone = "";
        colorDone[] = {0,0,0,0};
        iconFailed = "";
        colorFailed[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class CustomMark {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Bunker {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Bush {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class BusStop {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Command {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Cross {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Fortress {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Fuelstation {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Fountain {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Hospital {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Chapel {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Church {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Lighthouse {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Quay {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Rock {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Ruin {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class SmallTree {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Stack {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Tree {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Tourism {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Transmitter {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class ViewTower {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Watertower {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Waypoint {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class WaypointCompleted {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class ActiveMarker {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class PowerSolar {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class PowerWave {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class PowerWind {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
    class Shipwreck {
        icon = "";
        color[] = {0,0,0,0};
        size = 0;
        importance = 0;
        coefMin = 0;
        coefMax = 0;
    };
};
class GVAR(TAD_Map_Background): GVAR(RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_MAP_X);
    y = pxToScreen_Y(TAD_MAP_Y);
    w = pxToScreen_W(TAD_MAP_W);
    h = pxToScreen_H(TAD_MAP_H);
    colorBackground[] = COLOR_BLACK;
};
class GVAR(TAD_background): GVAR(RscPicture) {
    idc = IDC_BACKGROUND;
    text = ""; // will be set during onLoad event
    x = GUI_GRID_X;
    y = GUI_GRID_Y;
    w = GUI_GRID_W;
    h = GUI_GRID_H;
};
class GVAR(TAD_OSD_hookGrid): GVAR(TAD_RscText) {
    idc = IDC_OSD_HOOK_GRID;
    style = ST_CENTER;
    x = pxToScreen_X(TAD_OSD_OSB11_X - TAD_OSD_ELEMENT_STD_W * 4);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y - TAD_OSD_ELEMENT_STD_H * 0.5 + TAD_OSD_ELEMENT_STD_H * 1);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 6);
};
class GVAR(TAD_OSD_hookElevation): GVAR(TAD_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_ELEVATION;
    x = pxToScreen_X(TAD_OSD_OSB11_X - TAD_OSD_ELEMENT_STD_W * 2);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y - TAD_OSD_ELEMENT_STD_H * 0.5 + TAD_OSD_ELEMENT_STD_H * 2);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 4);
};
class GVAR(TAD_OSD_hookDir): GVAR(TAD_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_DIR;
    x = pxToScreen_X(TAD_OSD_OSB11_X - TAD_OSD_ELEMENT_STD_W * 6);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y - TAD_OSD_ELEMENT_STD_H * 0.5 + TAD_OSD_ELEMENT_STD_H * 0);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 8);
};
class GVAR(TAD_OSD_hookToggleIconBackground): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET - TAD_OSD_ELEMENT_STD_W);
    y = pxToScreen_Y(TAD_OSD_OSB18_Y - TAD_OSD_ELEMENT_STD_H   / 2);
};
class GVAR(TAD_OSD_hookToggleIcon): GVAR(TAD_upDownArrow) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET - TAD_OSD_ELEMENT_STD_W);
    y = pxToScreen_Y(TAD_OSD_OSB18_Y - TAD_OSD_ICON_H / 2);
};
class GVAR(TAD_OSD_hookToggleText1): GVAR(TAD_RscText) {
    idc = IDC_OSD_HOOK_TGGL1;
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET);
    y = pxToScreen_Y(TAD_OSD_OSB18_Y - TAD_OSD_ELEMENT_STD_H);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 4);
};
class GVAR(TAD_OSD_hookToggleText2): GVAR(TAD_OSD_hookToggleText1) {
    idc = IDC_OSD_HOOK_TGGL2;
    y = pxToScreen_Y(TAD_OSD_OSB18_Y);
};
class GVAR(TAD_OSD_currentDirection): GVAR(TAD_RscText) {
    idc = IDC_OSD_DIR_DEGREE;
    x = pxToScreen_X(TAD_OSD_OSB14_X - TAD_OSD_ELEMENT_STD_W * 4 / 2);
    y = pxToScreen_Y(TAD_OSD_EDGE_B - TAD_OSD_ELEMENT_STD_H * 2);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 4);
};
class GVAR(TAD_OSD_currentElevation): GVAR(TAD_OSD_currentDirection) {
    idc = IDC_OSD_ELEVATION;
    x = pxToScreen_X(TAD_OSD_OSB12_X - TAD_OSD_ELEMENT_STD_W * 5 / 2);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 5);
};
class GVAR(TAD_OSD_centerMapText): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET);
    y = pxToScreen_Y(TAD_OSD_OSB19_Y - TAD_OSD_ELEMENT_STD_H / 2);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 3);
    text = "CTR";
};
class GVAR(TAD_loadingtxt): GVAR(TAD_RscText) {
    idc = IDC_LOADINGTXT;
    style = ST_CENTER;
    text = "Loading"; //--- ToDo: Localize;
    x = pxToScreen_X(TAD_MAP_X);
    y = pxToScreen_Y(TAD_MAP_Y);
    w = pxToScreen_W(TAD_MAP_W);
    h = pxToScreen_H(TAD_MAP_H);
};
class GVAR(TAD_OSD_cursor): GVAR(RscPicture) {
    IDC_COUNTER
    text = "\a3\ui_f\data\IGUI\Cfg\WeaponCursors\cursoraimon_gs.paa";
        // "\a3\ui_f\data\map\Markers\Military\destroy_ca.paa";
        // "\a3\ui_f\data\IGUI\Cfg\WeaponCursors\cursoraimon_gs.paa"
        // "\a3\ui_f\data\map\MarkerBrushes\cross_ca.paa"
    x = pxToScreen_X(TAD_MAP_X + TAD_MAP_W / 2 - 128 / 33 * TAD_CURSOR / 2);
    y = pxToScreen_Y(TAD_MAP_Y + TAD_MAP_H / 2 - 128 / 33 * TAD_CURSOR / 2);
    w = pxToScreen_W(128 / 33 * TAD_CURSOR);
    h = pxToScreen_H(128 / 33 * TAD_CURSOR);
    colorText[] = COLOR_NEON_GREEN;
};
class GVAR(TAD_OSD_navModeOrScale): GVAR(TAD_RscText) {
    idc = IDC_OSD_MAP_SCALE;
    x = pxToScreen_X(TAD_OSD_EDGE_R - TAD_OSD_ELEMENT_MODE_W * 4);
    y = pxToScreen_Y(TAD_OSD_EDGE_T);
    w = pxToScreen_W(TAD_OSD_ELEMENT_MODE_W * 4);
    h = pxToScreen_H(TAD_OSD_ELEMENT_MODE_H);
    sizeEx = pxToScreen_H(TAD_OSD_TEXT_MODE_SIZE);
};
class GVAR(TAD_OSD_modeTAD): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_OSB15_X - TAD_OSD_ELEMENT_STD_W * 3 / 2);
    y = pxToScreen_Y(TAD_OSD_EDGE_B - TAD_OSD_ELEMENT_STD_H);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 3);
    colorText[] = COLOR_BLACK;
    colorBackground[] = COLOR_NEON_GREEN;
    text = "TAD";
};
class GVAR(TAD_OSD_txtToggleIconBg): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_R - TAD_OSD_OSB_TEXT_OFFSET);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y - TAD_OSD_ELEMENT_STD_H / 2);
};
class GVAR(TAD_OSD_txtToggleIcon): GVAR(TAD_upDownArrow) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_R - TAD_OSD_OSB_TEXT_OFFSET);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y - TAD_OSD_ICON_H / 2);
};
class GVAR(TAD_OSD_txtToggleText1): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_R - TAD_OSD_OSB_TEXT_OFFSET - TAD_OSD_ELEMENT_STD_W * 3);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y - TAD_OSD_ELEMENT_STD_H);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 3);
    text = "TXT";
};
class GVAR(TAD_OSD_txtToggleText2): GVAR(TAD_RscText) {
    idc = IDC_OSD_TXT_TGGL;
    x = pxToScreen_X(TAD_OSD_EDGE_R - TAD_OSD_OSB_TEXT_OFFSET - TAD_OSD_ELEMENT_STD_W * 3);
    y = pxToScreen_Y(TAD_OSD_OSB10_Y);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 3);
};
class GVAR(TAD_OSD_time): GVAR(TAD_RscText) {
    idc = IDC_OSD_TIME;
    x = pxToScreen_X(TAD_OSD_EDGE_L);
    y = pxToScreen_Y(TAD_OSD_EDGE_B - TAD_OSD_ELEMENT_STD_H);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 5);
};
class GVAR(TAD_OSD_currentGrid): GVAR(TAD_RscText) {
    idc = IDC_OSD_GRID;
    x = pxToScreen_X(TAD_OSD_OSB13_X - TAD_OSD_ELEMENT_STD_W * 6 / 2);
    y = pxToScreen_Y(TAD_OSD_EDGE_B - TAD_OSD_ELEMENT_STD_H * 2);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 6);
};
class GVAR(TAD_OSD_mapToggleIconBg): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET - TAD_OSD_ELEMENT_STD_W);
    y = pxToScreen_Y(TAD_OSD_OSB20_Y - TAD_OSD_ELEMENT_STD_H / 2);
};
class GVAR(TAD_OSD_mapToggleIcon): GVAR(TAD_upDownArrow) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET - TAD_OSD_ELEMENT_STD_W);
    y = pxToScreen_Y(TAD_OSD_OSB20_Y - TAD_OSD_ICON_H / 2);
};
class GVAR(TAD_OSD_mapToggleText1): GVAR(TAD_RscText) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET);
    y = pxToScreen_Y(TAD_OSD_OSB20_Y - TAD_OSD_ELEMENT_STD_H);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 3);
    text = "MAP";
};
class GVAR(TAD_OSD_mapToggleText2): GVAR(TAD_RscText) {
    idc = IDC_OSD_MAP_TGGL;
    x = pxToScreen_X(TAD_OSD_EDGE_L + TAD_OSD_OSB_TEXT_OFFSET);
    y = pxToScreen_Y(TAD_OSD_OSB20_Y);
    w = pxToScreen_W(TAD_OSD_ELEMENT_STD_W * 4);
};

// Define areas around the screen as interaction areas to allow screen movement
class GVAR(TAD_movingHandle_T): GVAR(TAD_RscText) {
    IDC_COUNTER
    moving = 1;
    colorBackground[] = COLOR_TRANSPARENT;
    x = pxToScreen_X(0);
    y = pxToScreen_Y(0);
    w = pxToScreen_W(GUI_GRID_PX_W);
    h = pxToScreen_H(TAD_MAP_Y);
};
class GVAR(TAD_movingHandle_B): GVAR(TAD_movingHandle_T) {
    IDC_COUNTER
    y = pxToScreen_Y(TAD_MAP_Y + TAD_MAP_H);
    h = pxToScreen_H(GUI_GRID_PX_H - (TAD_MAP_Y + TAD_MAP_H));
};
class GVAR(TAD_movingHandle_L): GVAR(TAD_movingHandle_T) {
    IDC_COUNTER
    y = pxToScreen_Y(TAD_MAP_Y);
    w = pxToScreen_W(TAD_MAP_X);
    h = pxToScreen_H(TAD_MAP_H);
};
class GVAR(TAD_movingHandle_R): GVAR(TAD_movingHandle_L) {
    IDC_COUNTER
    x = pxToScreen_X(TAD_MAP_X + TAD_MAP_W);
    w = pxToScreen_W(GUI_GRID_PX_W - (TAD_MAP_X + TAD_MAP_W));
};

// transparent control that gets placed on top of the GUI to adjust brightness
class GVAR(TAD_brightness): GVAR(TAD_RscText) {
    idc = IDC_BIGHTNESS;
    x = pxToScreen_X(TAD_MAP_X);
    y = pxToScreen_Y(TAD_MAP_Y);
    w = pxToScreen_W(TAD_MAP_W);
    h = pxToScreen_H(TAD_MAP_H);
    colorBackground[] = COLOR_TRANSPARENT;
};
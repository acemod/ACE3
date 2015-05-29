// Background definition
#define GUI_GRID_PX_W 2048 // width in pixels
#define GUI_GRID_PX_H 2048 // hight in pixels

// Define screen area less header and footer. This defines the outer limits for any control groups.
#define SCREEN_CONTENT_X GD300_SCREEN_CONTENT_X
#define SCREEN_CONTENT_Y GD300_SCREEN_CONTENT_Y
#define SCREEN_CONTENT_W GD300_SCREEN_CONTENT_W
#define SCREEN_CONTENT_H GD300_SCREEN_CONTENT_H

#include "shared_macros.hpp"

class GVAR(GD300_RscText): GVAR(RscText) {
    style = ST_CENTER;
    w = pxToScreen_W(GD300_OSD_ELEMENT_STD_W);
    h = pxToScreen_H(GD300_OSD_ELEMENT_STD_H);
    font = GUI_FONT_MONO;
    colorText[] = COLOR_WHITE;
    sizeEx = pxToScreen_H(GD300_OSD_TEXT_STD_SIZE);
    colorBackground[] = COLOR_TRANSPARENT;
    shadow = 0;
};
class GVAR(GD300_RscMapControl): GVAR(RscMapControl) {
    idc = IDC_SCREEN;
    onDraw = onDrawBFT(0);
    text = "#(argb,8,8,3)color(1,1,1,1)";
    x = pxToScreen_X(GD300_SCREEN_CONTENT_X);
    y = pxToScreen_Y(GD300_SCREEN_CONTENT_Y);
    w = pxToScreen_W(GD300_SCREEN_CONTENT_W);
    h = pxToScreen_H(GD300_SCREEN_CONTENT_H);
    //type = CT_MAP;
    // allow to zoom out further (defines the maximum map scale, usually 1)
    scaleMax = 1000;
    // set initial map scale
    scaleDefault = QUOTE((missionNamespace getVariable 'GVAR(mapScale)') * 0.86 / safezoneH);
    // turn on satellite map information (defines the map scale of when to switch to topographical)
    maxSatelliteAlpha = 10000;
    alphaFadeStartScale = 10;
    alphaFadeEndScale = 10;

    // Rendering density coefficients
    ptsPerSquareSea = 8 / GD300_DLGtoDSP_fctr;       // seas
    ptsPerSquareTxt = 8 / GD300_DLGtoDSP_fctr;       // textures
    ptsPerSquareCLn = 8 / GD300_DLGtoDSP_fctr;       // count-lines
    ptsPerSquareExp = 8 / GD300_DLGtoDSP_fctr;       // exposure
    ptsPerSquareCost = 8 / GD300_DLGtoDSP_fctr;      // cost

    // Rendering thresholds
    ptsPerSquareFor = 3 / GD300_DLGtoDSP_fctr;       // forests
    ptsPerSquareForEdge = 100 / GD300_DLGtoDSP_fctr; // forest edges
    ptsPerSquareRoad = 1.5 / GD300_DLGtoDSP_fctr;        // roads
    ptsPerSquareObj = 4 / GD300_DLGtoDSP_fctr;       // other objects
};
class GVAR(GD300_background): GVAR(RscPicture) {
    idc = IDC_BACKGROUND;
    text = ""; // will be set during onLoad event
    x = GUI_GRID_X;
    y = GUI_GRID_Y;
    w = GUI_GRID_W;
    h = GUI_GRID_H;
};
class GVAR(GD300_btnBack): GVAR(RscButtonInv) {
    x = pxToScreen_X(1609);
    y = pxToScreen_Y(806);
    w = pxToScreen_W(102);
    h = pxToScreen_H(102);
};
class GVAR(GD300_btnMenu): GVAR(GD300_btnBack) {
    y = pxToScreen_Y(1140);
};
class GVAR(GD300_btnHome): GVAR(GD300_btnBack) {
    x = pxToScreen_X(1613);
    y = pxToScreen_Y(972);
};
class GVAR(GD300_btnPower): GVAR(RscButtonInv) {
    x = pxToScreen_X(1583);
    y = pxToScreen_Y(1407);
    w = pxToScreen_W(107);
    h = pxToScreen_H(48);
};
class GVAR(GD300_notificationLight) {
    x = pxToScreen_X(1793);
    y = pxToScreen_Y(768);
    w = pxToScreen_W(61);
    h = pxToScreen_H(61);
};
class GVAR(GD300_header): GVAR(RscPicture) {
    IDC_COUNTER
    text = "#(argb,8,8,3)color(0,0,0,1)";
    x = pxToScreen_X(GD300_MAP_X);
    y = pxToScreen_Y(GD300_MAP_Y);
    w = pxToScreen_W(GD300_MAP_W);
    h = pxToScreen_H(GD300_OSD_HEADER_H);
};
class GVAR(GD300_on_screen_battery): GVAR(RscPicture) {
    IDC_COUNTER
    text = QUOTE(PATHTOF(UI\icons\battery_ca.paa));
    x = pxToScreen_X(GD300_OSD_X(1));
    y = pxToScreen_Y(GD300_MAP_Y + (GD300_OSD_HEADER_H - GD300_OSD_ICON_STD_SIZE) / 2);
    w = pxToScreen_W(GD300_OSD_ICON_STD_SIZE);
    h = pxToScreen_H(GD300_OSD_ICON_STD_SIZE);
    colorText[] = COLOR_WHITE;
};
class GVAR(GD300_on_screen_time): GVAR(GD300_RscText) {
    idc = IDC_OSD_TIME;
    style = ST_CENTER;
    x = pxToScreen_X(GD300_OSD_X(3));
    y = pxToScreen_Y(GD300_MAP_Y + (GD300_OSD_HEADER_H - GD300_OSD_TEXT_STD_SIZE) / 2);
};
class GVAR(GD300_on_screen_signalStrength): GVAR(GD300_on_screen_battery) {
    IDC_COUNTER
    text = QUOTE(PATHTOF(UI\icons\signalStrength_ca.paa));
    x = pxToScreen_X(GD300_OSD_X(5) + GD300_OSD_ELEMENT_STD_W - GD300_OSD_ICON_STD_SIZE * 2);
    colorText[] = COLOR_WHITE;
};
class GVAR(GD300_on_screen_satellite): GVAR(GD300_on_screen_battery) {
    IDC_COUNTER
    text = "\a3\ui_f\data\map\Diary\signal_ca.paa";
    x = pxToScreen_X(GD300_OSD_X(5) + GD300_OSD_ELEMENT_STD_W - GD300_OSD_ICON_STD_SIZE);
    colorText[] = COLOR_WHITE;
};
class GVAR(GD300_on_screen_dirDegree): GVAR(GD300_on_screen_time) {
    idc = IDC_OSD_DIR_DEGREE;
    style = ST_LEFT;
    x = pxToScreen_X(GD300_OSD_X(2));
};
class GVAR(GD300_on_screen_grid): GVAR(GD300_on_screen_dirDegree) {
    idc = IDC_OSD_GRID;
    style = ST_RIGHT;
    x = pxToScreen_X(GD300_OSD_X(4));
};
class GVAR(GD300_on_screen_dirOctant): GVAR(GD300_on_screen_dirDegree) {
    idc = IDC_OSD_DIR_OCTANT;
    style = ST_RIGHT;
    x = pxToScreen_X(GD300_OSD_X(1));
};
class GVAR(GD300_on_screen_hookGrid): GVAR(GD300_RscText) {
    idc = IDC_OSD_HOOK_GRID;
    style = ST_CENTER;
    x = pxToScreen_X(GD300_OSD_X(1));
    y = pxToScreen_Y(GD300_OSD_EDGE_B - GD300_OSD_MARGIN - GD300_OSD_ELEMENT_STD_H * 4);
    colorText[] = {1,1,1,0.5};
    colorBackground[] = {0,0,0,0.25};
};
class GVAR(GD300_on_screen_hookElevation): GVAR(GD300_on_screen_hookGrid) {
    idc = IDC_OSD_HOOK_ELEVATION;
    y = pxToScreen_Y(GD300_OSD_EDGE_B - GD300_OSD_MARGIN - GD300_OSD_ELEMENT_STD_H * 3);
};
class GVAR(GD300_on_screen_hookDst): GVAR(GD300_on_screen_hookGrid) {
    idc = IDC_OSD_HOOK_DST;
    y = pxToScreen_Y(GD300_OSD_EDGE_B - GD300_OSD_MARGIN - GD300_OSD_ELEMENT_STD_H * 2);
};
class GVAR(GD300_on_screen_hookDir): GVAR(GD300_on_screen_hookGrid) {
    idc = IDC_OSD_HOOK_DIR;
    y = pxToScreen_Y(GD300_OSD_EDGE_B - GD300_OSD_MARGIN - GD300_OSD_ELEMENT_STD_H);
};
class GVAR(GD300_loadingtxt): GVAR(GD300_RscText) {
    idc = IDC_LOADINGTXT;
    style = ST_CENTER;
    text = "Loading"; //--- ToDo: Localize;
    x = pxToScreen_X(GD300_SCREEN_CONTENT_X);
    y = pxToScreen_Y(GD300_SCREEN_CONTENT_Y);
    w = pxToScreen_W(GD300_SCREEN_CONTENT_W);
    h = pxToScreen_H(GD300_SCREEN_CONTENT_H);
    colorBackground[] = COLOR_LIGHT_BLUE;
};
class GVAR(GD300_windowsBG): GVAR(RscPicture) {
    idc = IDC_WIN_BACK;
    text = "#(argb,8,8,3)color(0.2,0.431,0.647,1)";
    x = pxToScreen_X(GD300_MAP_X);
    y = pxToScreen_Y(GD300_MAP_Y);
    w = pxToScreen_W(GD300_MAP_W);
    h = pxToScreen_H(GD300_MAP_H);
};

// Define areas around the screen as interaction areas to allow screen movement
class GVAR(GD300_movingHandle_T): GVAR(GD300_RscText) {
    IDC_COUNTER
    moving = 1;
    colorBackground[] = COLOR_TRANSPARENT;
    x = pxToScreen_X(0);
    y = pxToScreen_Y(0);
    w = pxToScreen_W(GUI_GRID_PX_W);
    h = pxToScreen_H(GD300_MAP_Y);
};
class GVAR(GD300_movingHandle_B): GVAR(GD300_movingHandle_T) {
    IDC_COUNTER
    y = pxToScreen_Y(GD300_MAP_Y + GD300_MAP_H);
    h = pxToScreen_H(GUI_GRID_PX_H - (GD300_MAP_Y + GD300_MAP_H));
};
class GVAR(GD300_movingHandle_L): GVAR(GD300_movingHandle_T) {
    IDC_COUNTER
    y = pxToScreen_Y(GD300_MAP_Y);
    w = pxToScreen_W(GD300_MAP_X);
    h = pxToScreen_H(GD300_MAP_H);
};
class GVAR(GD300_movingHandle_R): GVAR(GD300_movingHandle_L) {
    IDC_COUNTER
    x = pxToScreen_X(GD300_MAP_X + GD300_MAP_W);
    w = pxToScreen_W(GUI_GRID_PX_W - (GD300_MAP_X + GD300_MAP_W));
};

// transparent control that gets placed on top of the GUI to adjust brightness
class GVAR(GD300_brightness): GVAR(GD300_RscText) {
    idc = IDC_BRIGHTNESS;
    x = pxToScreen_X(GD300_MAP_X);
    y = pxToScreen_Y(GD300_MAP_Y);
    w = pxToScreen_W(GD300_MAP_W);
    h = pxToScreen_H(GD300_MAP_H);
    colorBackground[] = COLOR_TRANSPARENT;
};
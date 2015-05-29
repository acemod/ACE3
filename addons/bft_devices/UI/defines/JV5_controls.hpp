// Background definition
#define GUI_GRID_PX_W 2048 // width in pixels
#define GUI_GRID_PX_H 2048 // hight in pixels

// Define screen area less header and footer. This defines the outer limits for any control groups.
#define SCREEN_CONTENT_X JV5_SCREEN_CONTENT_X
#define SCREEN_CONTENT_Y JV5_SCREEN_CONTENT_Y
#define SCREEN_CONTENT_W JV5_SCREEN_CONTENT_W
#define SCREEN_CONTENT_H JV5_SCREEN_CONTENT_H

#include "shared_macros.hpp"

class GVAR(JV5_RscText): GVAR(RscText) {
    style = ST_CENTER;
    w = pxToScreen_W(JV5_OSD_ELEMENT_STD_W);
    h = pxToScreen_H(JV5_OSD_ELEMENT_STD_H);
    font = GUI_FONT_MONO;
    colorText[] = COLOR_WHITE;
    sizeEx = pxToScreen_H(JV5_OSD_TEXT_STD_SIZE);
    colorBackground[] = COLOR_TRANSPARENT;
    shadow = 0;
};
class GVAR(JV5_background): GVAR(RscPicture) {
    idc = IDC_BACKGROUND;
    text = QUOTE(PATHTOF(UI\images\JV5_background.paa));
    x = GUI_GRID_X;
    y = GUI_GRID_Y;
    w = GUI_GRID_W;
    h = GUI_GRID_H;
};
class GVAR(JV5_header): GVAR(RscPicture) {
    IDC_COUNTER
    text = "#(argb,8,8,3)color(0,0,0,1)";
    x = pxToScreen_X(JV5_MAP_X);
    y = pxToScreen_Y(JV5_MAP_Y);
    w = pxToScreen_W(JV5_MAP_W);
    h = pxToScreen_H(JV5_OSD_HEADER_H);
};
class GVAR(JV5_OSD_battery): GVAR(RscPicture) {
    IDC_COUNTER
    text = QUOTE(PATHTOF(UI\icons\battery_ca.paa));
    x = pxToScreen_X(JV5_OSD_X(1));
    y = pxToScreen_Y(JV5_MAP_Y + (JV5_OSD_HEADER_H - JV5_OSD_ICON_STD_SIZE) / 2);
    w = pxToScreen_W(JV5_OSD_ICON_STD_SIZE);
    h = pxToScreen_H(JV5_OSD_ICON_STD_SIZE);
    colorText[] = COLOR_WHITE;
};
class GVAR(JV5_OSD_time): GVAR(JV5_RscText) {
    idc = IDC_OSD_TIME;
    style = ST_CENTER;
    x = pxToScreen_X(JV5_OSD_X(3));
    y = pxToScreen_Y(JV5_MAP_Y + (JV5_OSD_HEADER_H - JV5_OSD_TEXT_STD_SIZE) / 2);
};
class GVAR(JV5_OSD_signalStrength): GVAR(JV5_OSD_battery) {
    IDC_COUNTER
    text = QUOTE(PATHTOF(UI\icons\signalStrength_ca.paa));
    x = pxToScreen_X(JV5_OSD_X(5) + JV5_OSD_ELEMENT_STD_W - JV5_OSD_ICON_STD_SIZE * 2);
    colorText[] = COLOR_WHITE;
};
class GVAR(JV5_OSD_satellite): GVAR(JV5_OSD_battery) {
    IDC_COUNTER
    text = "\a3\ui_f\data\map\Diary\signal_ca.paa";
    x = pxToScreen_X(JV5_OSD_X(5) + JV5_OSD_ELEMENT_STD_W - JV5_OSD_ICON_STD_SIZE);
    colorText[] = COLOR_WHITE;
};
class GVAR(JV5_OSD_dirDegree): GVAR(JV5_OSD_time) {
    idc = IDC_OSD_DIR_DEGREE;
    style = ST_LEFT;
    x = pxToScreen_X(JV5_OSD_X(2));
};
class GVAR(JV5_OSD_grid): GVAR(JV5_OSD_dirDegree) {
    idc = IDC_OSD_GRID;
    style = ST_RIGHT;
    x = pxToScreen_X(JV5_OSD_X(4));
};
class GVAR(JV5_OSD_dirOctant): GVAR(JV5_OSD_dirDegree) {
    idc = IDC_OSD_DIR_OCTANT;
    style = ST_RIGHT;
    x = pxToScreen_X(JV5_OSD_X(1));
};
class GVAR(JV5_btnF1): GVAR(RscButtonInv) {
    x = pxToScreen_X(762);
    y = pxToScreen_Y(1452);
    w = pxToScreen_W(70);
    h = pxToScreen_H(40);
};
class GVAR(JV5_btnF2): GVAR(JV5_btnF1) {
    x = pxToScreen_X(846);
};
class GVAR(JV5_btnF3): GVAR(JV5_btnF1) {
    x = pxToScreen_X(929);
};
class GVAR(JV5_btnF4): GVAR(JV5_btnF1) {
    x = pxToScreen_X(1013);
};
class GVAR(JV5_btnF5): GVAR(JV5_btnF1) {
    x = pxToScreen_X(1097);
};
class GVAR(JV5_btnF6): GVAR(JV5_btnF1) {
    x = pxToScreen_X(1180);
};
class GVAR(JV5_btnF7): GVAR(JV5_btnF1) {
    x = pxToScreen_X(1264);
};
class GVAR(JV5_btnF8): GVAR(JV5_btnF1) {
    x = pxToScreen_X(1349);
};
class GVAR(JV5_btnPWR): GVAR(RscButtonInv) {
    x = pxToScreen_X(592);
    y = pxToScreen_Y(603);
    w = pxToScreen_W(40);
    h = pxToScreen_H(70);
};
class GVAR(JV5_btnBRTplus): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(680);
};
class GVAR(JV5_btnBRTminus): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(759);
};
class GVAR(JV5_btnBLKOUT): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(839);
};
class GVAR(JV5_btnESC): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(918);
};
class GVAR(JV5_btnRight): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(998);
};
class GVAR(JV5_btnUp): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(1079);
};
class GVAR(JV5_btnDown): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(1161);
};
class GVAR(JV5_btnENT): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(1241);
};
class GVAR(JV5_btnFCN): GVAR(JV5_btnPWR) {
    y = pxToScreen_Y(1322);
};
class GVAR(JV5_OSD_hookGrid): GVAR(JV5_RscText) {
    idc = IDC_OSD_HOOK_GRID;
    style = ST_CENTER;
    x = pxToScreen_X(JV5_OSD_RIGHT_X);
    y = pxToScreen_Y(JV5_OSD_EDGE_B - JV5_OSD_MARGIN - JV5_OSD_ELEMENT_STD_H * 4);
    colorText[] = {1,1,1,0.5};
    colorBackground[] = {0,0,0,0.25};
};
class GVAR(JV5_OSD_hookElevation): GVAR(JV5_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_ELEVATION;
    y = pxToScreen_Y(JV5_OSD_EDGE_B - JV5_OSD_MARGIN - JV5_OSD_ELEMENT_STD_H * 3);
};
class GVAR(JV5_OSD_hookDst): GVAR(JV5_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_DST;
    y = pxToScreen_Y(JV5_OSD_EDGE_B - JV5_OSD_MARGIN - JV5_OSD_ELEMENT_STD_H * 2);
};
class GVAR(JV5_OSD_hookDir): GVAR(JV5_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_DIR;
    y = pxToScreen_Y(JV5_OSD_EDGE_B - JV5_OSD_MARGIN - JV5_OSD_ELEMENT_STD_H);
};
class GVAR(JV5_RscMapControl): GVAR(RscMapControl) {
    onDraw = onDrawBFT(0);
    text = "#(argb,8,8,3)color(1,1,1,1)";
    x = pxToScreen_X(SCREEN_CONTENT_X);
    y = pxToScreen_Y(SCREEN_CONTENT_Y);
    w = pxToScreen_W(SCREEN_CONTENT_W);
    h = pxToScreen_H(SCREEN_CONTENT_H);

    maxSatelliteAlpha = 10000;
    alphaFadeStartScale = 10;
    alphaFadeEndScale = 10;

    // Rendering density coefficients
    ptsPerSquareSea = 8 / (0.86 / GUI_GRID_H);      // seas
    ptsPerSquareTxt = 8 / (0.86 / GUI_GRID_H);      // textures
    ptsPerSquareCLn = 8 / (0.86 / GUI_GRID_H);      // count-lines
    ptsPerSquareExp = 8 / (0.86 / GUI_GRID_H);      // exposure
    ptsPerSquareCost = 8 / (0.86 / GUI_GRID_H);     // cost

    // Rendering thresholds
    ptsPerSquareFor = 3 / (0.86 / GUI_GRID_H);      // forests
    ptsPerSquareForEdge = 100 / (0.86 / GUI_GRID_H);    // forest edges
    ptsPerSquareRoad = 1.5 / (0.86 / GUI_GRID_H);       // roads
    ptsPerSquareObj = 4 / (0.86 / GUI_GRID_H);      // other objects
};
class GVAR(JV5_loadingtxt): GVAR(JV5_RscText) {
    idc = IDC_LOADINGTXT;
    style = ST_CENTER;
    text = "Loading"; //--- ToDo: Localize;
    x = pxToScreen_X(SCREEN_CONTENT_X);
    y = pxToScreen_Y(SCREEN_CONTENT_Y);
    w = pxToScreen_W(SCREEN_CONTENT_W);
    h = pxToScreen_H(SCREEN_CONTENT_H);
    colorBackground[] = COLOR_BLACK;
};
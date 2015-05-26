// Background definition
#define GUI_GRID_PX_W 2048 // width in pixels
#define GUI_GRID_PX_H 2048 // hight in pixels

// Define screen area less header and footer. This defines the outer limits for any control groups.
#define SCREEN_CONTENT_X DK10_SCREEN_CONTENT_X
#define SCREEN_CONTENT_Y DK10_SCREEN_CONTENT_Y
#define SCREEN_CONTENT_W DK10_SCREEN_CONTENT_W
#define SCREEN_CONTENT_H DK10_SCREEN_CONTENT_H

#include "shared_macros.hpp"

class GVAR(DK10_RscText): GVAR(RscText) {
    style = ST_CENTER;
    w = pxToScreen_W(DK10_OSD_ELEMENT_STD_W);
    h = pxToScreen_H(DK10_OSD_ELEMENT_STD_H);
    font = GUI_FONT_MONO;
    colorText[] = COLOR_WHITE;
    sizeEx = pxToScreen_H(DK10_OSD_TEXT_STD_SIZE);
    colorBackground[] = COLOR_TRANSPARENT;
    shadow = 0;
};
class GVAR(DK10_RscListbox): GVAR(RscListbox) {
    sizeEx = pxToScreen_H(DK10_OSD_TEXT_STD_SIZE * 1.2);
};
class GVAR(DK10_RscEdit): GVAR(RscEdit) {
    sizeEx = pxToScreen_H(DK10_OSD_TEXT_STD_SIZE * 1.2);
};
class GVAR(DK10_RscButton): GVAR(RscButton) {
    font = GUI_FONT_MONO;
    sizeEx = pxToScreen_H(DK10_OSD_TEXT_STD_SIZE);
};
class GVAR(DK10_background): GVAR(RscPicture) {
    idc = IDC_BACKGROUND;
    text = QUOTE(PATHTOF(UI\images\DK10_background_ca.paa));
    x = GUI_GRID_X;
    y = GUI_GRID_Y;
    w = GUI_GRID_W;
    h = GUI_GRID_H;
};
class GVAR(DK10_header): GVAR(RscPicture) {
    IDC_COUNTER
    text = "#(argb,8,8,3)color(0,0,0,1)";
    x = pxToScreen_X(DK10_MAP_X);
    y = pxToScreen_Y(DK10_MAP_Y);
    w = pxToScreen_W(DK10_MAP_W);
    h = pxToScreen_H(DK10_OSD_HEADER_H);
};
class GVAR(DK10_OSD_battery): GVAR(RscPicture) {
    IDC_COUNTER
    text = QUOTE(PATHTOF(UI\icons\battery_ca.paa));
    x = pxToScreen_X(DK10_OSD_X(1));
    y = pxToScreen_Y(DK10_MAP_Y + (DK10_OSD_HEADER_H - DK10_OSD_ICON_STD_SIZE) / 2);
    w = pxToScreen_W(DK10_OSD_ICON_STD_SIZE);
    h = pxToScreen_H(DK10_OSD_ICON_STD_SIZE);
    colorText[] = COLOR_WHITE;
};
class GVAR(DK10_OSD_time): GVAR(DK10_RscText) {
    idc = IDC_OSD_TIME;
    style = ST_CENTER;
    x = pxToScreen_X(DK10_OSD_X(4));
    y = pxToScreen_Y(DK10_MAP_Y + (DK10_OSD_HEADER_H - DK10_OSD_TEXT_STD_SIZE) / 2);
};
class GVAR(DK10_OSD_signalStrength): GVAR(DK10_OSD_battery) {
    IDC_COUNTER
    text = QUOTE(PATHTOF(UI\icons\signalStrength_ca.paa));
    x = pxToScreen_X(DK10_OSD_X(7) + DK10_OSD_ELEMENT_STD_W - DK10_OSD_ICON_STD_SIZE * 2);
    colorText[] = COLOR_WHITE;
};
class GVAR(DK10_OSD_satellite): GVAR(DK10_OSD_battery) {
    IDC_COUNTER
    text = "\a3\ui_f\data\map\Diary\signal_ca.paa";
    x = pxToScreen_X(DK10_OSD_X(7) + DK10_OSD_ELEMENT_STD_W - DK10_OSD_ICON_STD_SIZE);
    colorText[] = COLOR_WHITE;
};
class GVAR(DK10_OSD_dirDegree): GVAR(DK10_OSD_time) {
    idc = IDC_OSD_DIR_DEGREE;
    style = ST_LEFT;
    x = pxToScreen_X(DK10_OSD_X(2));
};
class GVAR(DK10_OSD_grid): GVAR(DK10_OSD_dirDegree) {
    idc = IDC_OSD_GRID;
    style = ST_RIGHT;
    x = pxToScreen_X(DK10_OSD_X(6));
};
class GVAR(DK10_OSD_dirOctant): GVAR(DK10_OSD_dirDegree) {
    idc = IDC_OSD_DIR_OCTANT;
    style = ST_RIGHT;
    x = pxToScreen_X(DK10_OSD_X(1));
};
class GVAR(DK10_window_back_TL): GVAR(RscPicture) {
    //text = "\cTab\img\window_2.jpg";
    x = pxToScreen_X(DK10_WINDOW_BACK_L_X);
    y = pxToScreen_Y(DK10_WINDOW_BACK_T_Y);
    w = pxToScreen_W(DK10_WINDOW_BACK_W);
    h = pxToScreen_H(DK10_WINDOW_BACK_H);
};
class GVAR(DK10_window_back_BL): GVAR(DK10_window_back_TL) {
    y = pxToScreen_Y(DK10_WINDOW_BACK_B_Y);
};
class GVAR(DK10_window_back_TR): GVAR(DK10_window_back_TL) {
    x = pxToScreen_X(DK10_WINDOW_BACK_R_X);
};
class GVAR(DK10_window_back_BR): GVAR(DK10_window_back_TR) {
    y = pxToScreen_Y(DK10_WINDOW_BACK_B_Y);
};
class GVAR(DK10_btnF1): GVAR(RscButtonInv) {
    x = pxToScreen_X(506);
    y = pxToScreen_Y(1545);
    w = pxToScreen_W(52);
    h = pxToScreen_H(52);
};
class GVAR(DK10_btnF2): GVAR(DK10_btnF1) {
    x = pxToScreen_X(569);
};
class GVAR(DK10_btnF3): GVAR(DK10_btnF1) {
    x = pxToScreen_X(639);
};
class GVAR(DK10_btnF4): GVAR(DK10_btnF1) {
    x = pxToScreen_X(703);
};
class GVAR(DK10_btnF5): GVAR(DK10_btnF1) {
    x = pxToScreen_X(768);
};
class GVAR(DK10_btnF6): GVAR(DK10_btnF1) {
    x = pxToScreen_X(833);
};
class GVAR(DK10_btnFn): GVAR(DK10_btnF1) {
    x = pxToScreen_X(970);
};
class GVAR(DK10_btnPower): GVAR(DK10_btnFn) {
    x = pxToScreen_X(1034);
};
class GVAR(DK10_btnBrtDn): GVAR(DK10_btnFn) {
    x = pxToScreen_X(1100);
};
class GVAR(DK10_btnBrtUp): GVAR(DK10_btnFn) {
    x = pxToScreen_X(1163);
};
class GVAR(DK10_btnTrackpad): GVAR(DK10_btnFn) {
    x = pxToScreen_X(1262);
    y = pxToScreen_Y(1550);
    w = pxToScreen_W(48);
    h = pxToScreen_H(43);
};
class GVAR(DK10_btnMouse): GVAR(DK10_btnFn) {
    x = pxToScreen_X(1401);
    w = pxToScreen_W(91);
};
class GVAR(DK10_btnHome): GVAR(DK10_btnMouse) {
    x = pxToScreen_X(897);
    y = pxToScreen_Y(1534);
    w = pxToScreen_W(61);
    h = pxToScreen_H(49);
};
class GVAR(DK10_notificationLight) {
    x = pxToScreen_X(1353);
    y = pxToScreen_Y(1557);
    w = pxToScreen_W(28);
    h = pxToScreen_H(28);
};
class GVAR(DK10_OSD_hookGrid): GVAR(DK10_RscText) {
    idc = IDC_OSD_HOOK_GRID;
    style = ST_CENTER;
    x = pxToScreen_X(DK10_OSD_RIGHT_X);
    y = pxToScreen_Y(DK10_OSD_EDGE_B - DK10_OSD_MARGIN - DK10_OSD_ELEMENT_STD_H * 4);
    colorText[] = {1,1,1,0.5};
    colorBackground[] = {0,0,0,0.25};
};
class GVAR(DK10_OSD_hookElevation): GVAR(DK10_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_ELEVATION;
    y = pxToScreen_Y(DK10_OSD_EDGE_B - DK10_OSD_MARGIN - DK10_OSD_ELEMENT_STD_H * 3);
};
class GVAR(DK10_OSD_hookDst): GVAR(DK10_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_DST;
    y = pxToScreen_Y(DK10_OSD_EDGE_B - DK10_OSD_MARGIN - DK10_OSD_ELEMENT_STD_H * 2);
};
class GVAR(DK10_OSD_hookDir): GVAR(DK10_OSD_hookGrid) {
    idc = IDC_OSD_HOOK_DIR;
    y = pxToScreen_Y(DK10_OSD_EDGE_B - DK10_OSD_MARGIN - DK10_OSD_ELEMENT_STD_H);
};
class GVAR(DK10_loadingtxt): GVAR(DK10_RscText) {
    idc = IDC_LOADINGTXT;
    style = ST_CENTER;
    text = "Loading"; //--- ToDo: Localize;
    x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
    y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
    w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
    h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
    colorBackground[] = COLOR_LIGHT_BLUE;
};
// Define areas around the screen as interaction areas to allow screen movement
class GVAR(DK10_movingHandle_T): GVAR(DK10_RscText) {
    IDC_COUNTER
    moving = 1;
    colorBackground[] = COLOR_TRANSPARENT;
    x = pxToScreen_X(0);
    y = pxToScreen_Y(0);
    w = pxToScreen_W(GUI_GRID_PX_W);
    h = pxToScreen_H(DK10_MAP_Y);
};
class GVAR(DK10_movingHandle_B): GVAR(DK10_movingHandle_T) {
    IDC_COUNTER
    y = pxToScreen_Y(DK10_MAP_Y + DK10_MAP_H);
    h = pxToScreen_H(GUI_GRID_PX_H - (DK10_MAP_Y + DK10_MAP_H));
};
class GVAR(DK10_movingHandle_L): GVAR(DK10_movingHandle_T) {
    IDC_COUNTER
    y = pxToScreen_Y(DK10_MAP_Y);
    w = pxToScreen_W(DK10_MAP_X);
    h = pxToScreen_H(DK10_MAP_H);
};
class GVAR(DK10_movingHandle_R): GVAR(DK10_movingHandle_L) {
    IDC_COUNTER
    x = pxToScreen_X(DK10_MAP_X + DK10_MAP_W);
    w = pxToScreen_W(GUI_GRID_PX_W - (DK10_MAP_X + DK10_MAP_W));
};

// transparent control that gets placed on top of the GUI to adjust brightness
class GVAR(DK10_brightness): GVAR(DK10_RscText) {
    idc = IDC_BIGHTNESS;
    x = pxToScreen_X(DK10_MAP_X);
    y = pxToScreen_Y(DK10_MAP_Y);
    w = pxToScreen_W(DK10_MAP_W);
    h = pxToScreen_H(DK10_MAP_H);
    colorBackground[] = COLOR_TRANSPARENT;
};
class GVAR(DK10_RscMapControl): GVAR(RscMapControl) {
    onDraw = onDrawBFT(0);
    text = "#(argb,8,8,3)color(1,1,1,1)";
    x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
    y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
    w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
    h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
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
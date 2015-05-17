#define DISPLAY_NAME TAD_dsp

#define GUI_MARGIN_X    (0.05)
#define GUI_MARGIN_Y    (0.2)
#define GUI_TAD_W   (0.86)
#define GUI_TAD_H   (0.86)

#define TAD_DLGtoDSP_fctr (1)

#define GUI_GRID_X  (safeZoneX + GUI_MARGIN_X * 3/4)
#define GUI_GRID_Y  (safeZoneY + safeZoneH - GUI_TAD_H - GUI_MARGIN_Y)
#define GUI_GRID_W  (GUI_TAD_W * 3/4)
#define GUI_GRID_H  (GUI_TAD_H)

#include "TAD_controls.hpp"

class GVAR(DISPLAY_NAME) {
    idd = IDD_TAD_DSP;
    movingEnable = true;
    duration = 10e10;
    fadeIn = 0;
    fadeOut = 0;
    onLoad = QUOTE(_this call FUNC(ifOnLoad));
    class controlsBackground {
        class mapBackground: GVAR(TAD_Map_Background) {};
        class screen: GVAR(TAD_RscMapControl) {
            idc = IDC_SCREEN;
            // hide grid lines
            colorGrid[] = {0.1,0.1,0.1,0};
            colorGridMap[] = {0.1,0.1,0.1,0};
        };
        class screenTopo: screen {
            idc = IDC_SCREEN_TOPO;
            maxSatelliteAlpha = 0;
        };
        class screenBlack: GVAR(TAD_RscMapControl_BLACK) {
            idc = IDC_SCREEN_BLACK;
            // hide grid lines
            colorGrid[] = {0.1,0.1,0.1,0};
            colorGridMap[] = {0.1,0.1,0.1,0};
        };
    };

    class controls {
        /*
            ### OSD GUI controls ###
        */
        class navModeOrScale: GVAR(TAD_OSD_navModeOrScale) {
            idc = IDC_OSD_MAP_SCALE;
            x = pxToScreen_X(TAD_OSD_EDGE_R - TAD_OSD_ELEMENT_MODE_W * 2);
            w = pxToScreen_W(TAD_OSD_ELEMENT_MODE_W * 2);
        };
        class modeTAD: GVAR(TAD_OSD_modeTAD) {};
        class txtToggleIconBg: GVAR(TAD_OSD_txtToggleIconBg) {};
        class txtToggleIcon: GVAR(TAD_OSD_txtToggleIcon) {};
        class txtToggleText1: GVAR(TAD_OSD_txtToggleText1) {};
        class txtToggleText2: GVAR(TAD_OSD_txtToggleText2) {};
        class time: GVAR(TAD_OSD_time) {};
        class currentGrid: GVAR(TAD_OSD_currentGrid) {};
        class mapToggleIconBg: GVAR(TAD_OSD_mapToggleIconBg) {};
        class mapToggleIcon: GVAR(TAD_OSD_mapToggleIcon) {};
        class mapToggleText1: GVAR(TAD_OSD_mapToggleText1) {};
        class mapToggleText2: GVAR(TAD_OSD_mapToggleText2) {};
        class hookToggleIconBackground: GVAR(TAD_OSD_hookToggleIconBackground) {};
        class hookToggleIcon: GVAR(TAD_OSD_hookToggleIcon) {};
        class hookToggleText1: GVAR(TAD_OSD_hookToggleText1) {};
        class hookToggleText2: GVAR(TAD_OSD_hookToggleText2) {};
        class on_screen_currentDirection: GVAR(TAD_OSD_currentDirection) {};
        class on_screen_currentElevation: GVAR(TAD_OSD_currentElevation) {};
        class on_screen_centerMapText: GVAR(TAD_OSD_centerMapText) {};

        /*
            ### Overlays ###
        */
        // ---------- LOADING ------------
        class loadingtxt: GVAR(TAD_loadingtxt) {};
        // ---------- BRIGHTNESS ------------
        class brightness: GVAR(TAD_brightness) {};
        // ---------- BACKGROUND ------------
        class background: GVAR(TAD_background) {};
    };
};

#include "shared_undefines.hpp"
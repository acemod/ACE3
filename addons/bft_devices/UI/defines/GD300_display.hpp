#define DISPLAY_NAME GD300_dsp

#define GUI_GRID_W  (0.86)
#define GUI_GRID_H  (GUI_GRID_W * 4/3)
#define GUI_GRID_X  (safezoneX - GUI_GRID_W * 0.17)
#define GUI_GRID_Y  (safezoneY + safezoneH * 0.88 - GUI_GRID_H * 0.72)

#define GD300_DLGtoDSP_fctr (1)

#include "GD300_controls.hpp"

//#define MENU_sizeEx pxToScreen_H(GD300_OSD_TEXT_STD_SIZE)
//#include "\cTab\shared\cTab_markerMenu_macros.hpp"

class GVAR(DISPLAY_NAME) {
    idd = IDD_GD300_DSP;
    duration = 10e10;
    fadeIn = 0;
    fadeOut = 0;
    onLoad = QUOTE(_this call FUNC(ifOnLoad));
    objects[] = {};
    class controlsBackground {
        class windowsBG: GVAR(GD300_windowsBG) {};
        class screen: GVAR(GD300_RscMapControl) {};
        class screenTopo: screen {
            idc = IDC_SCREEN_TOPO;
            maxSatelliteAlpha = 0;
        };
    };

    class controls {
        /*
            ### OSD GUI controls ###
        */
        class header: GVAR(GD300_header) {};
        class battery: GVAR(GD300_on_screen_battery) {};
        class time: GVAR(GD300_on_screen_time) {};
        class signalStrength: GVAR(GD300_on_screen_signalStrength) {};
        class satellite: GVAR(GD300_on_screen_satellite) {};
        class dirDegree: GVAR(GD300_on_screen_dirDegree) {};
        class grid: GVAR(GD300_on_screen_grid) {};
        class dirOctant: GVAR(GD300_on_screen_dirOctant) {};

        /*
            ### Overlays ###
        */
        // ---------- LOADING ------------
        class loadingtxt: GVAR(GD300_loadingtxt) {};
        // ---------- BRIGHTNESS ------------
        class brightness: GVAR(GD300_brightness) {};
        // ---------- BACKGROUND ------------
        class background: GVAR(GD300_background) {};
    };
};

#include "shared_undefines.hpp"
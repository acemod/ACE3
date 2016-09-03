#define DISPLAY_NAME JV5_dlg

#define GUI_GRID_W  (safezoneW)
#define GUI_GRID_H  (GUI_GRID_W * 4/3)
#define GUI_GRID_X  (safezoneX + (safezoneW - GUI_GRID_W) / 2)
#define GUI_GRID_Y  (safezoneY + (safezoneH - GUI_GRID_H) / 2)

#include "JV5_controls.hpp"

/*#define MENU_sizeEx pxToScreen_H(JV5_OSD_TEXT_STD_SIZE)
#include "\cTab\shared\cTab_markerMenu_macros.hpp"*/

class GVAR(DISPLAY_NAME) {
    idd = IDD_JV5;
    movingEnable = true;
    onLoad = QUOTE(_this call FUNC(ifOnLoad));
    onUnload = QUOTE([] call FUNC(ifOnUnload));
    onKeyDown = QUOTE(_this call FUNC(ifOnKeyDown));
    objects[] = {};
    class controlsBackground {
        class background: GVAR(JV5_background) {
            moving = 1;
        };
        class screen: GVAR(JV5_RscMapControl) {
            idc = IDC_SCREEN;
            //onMouseButtonDblClick = "_ok = [3300,_this] execVM '\cTab\shared\cTab_markerMenu_load.sqf';";
            onMouseMoving = onMM;
        };
        class screenTopo: screen {
            idc = IDC_SCREEN_TOPO;
            maxSatelliteAlpha = 0;
        };
    };
    class controls {
        class header: GVAR(JV5_header) {};
        class battery: GVAR(JV5_OSD_battery) {};
        class time: GVAR(JV5_OSD_time) {};
        class signalStrength: GVAR(JV5_OSD_signalStrength) {};
        class satellite: GVAR(JV5_OSD_satellite) {};
        class dirDegree: GVAR(JV5_OSD_dirDegree) {};
        class grid: GVAR(JV5_OSD_grid) {};
        class dirOctant: GVAR(JV5_OSD_dirOctant) {};
        class hookGrid: GVAR(JV5_OSD_hookGrid) {};
        class hookElevation: GVAR(JV5_OSD_hookElevation) {};
        class hookDst: GVAR(JV5_OSD_hookDst) {};
        class hookDir: GVAR(JV5_OSD_hookDir) {};

        // ---------- USER MARKER MENU ------------
        //#include "\cTab\shared\cTab_markerMenu_controls.hpp"

        /*
            ### Overlays ###
        */
        // ---------- NOTIFICATION ------------
        class notification: GVAR(JV5_notification) {};
        // ---------- LOADING ------------
        class loadingtxt: GVAR(JV5_loadingtxt) {};

        /*
            ### PHYSICAL BUTTONS ###
        */
        class pwrbtn: GVAR(JV5_btnPWR) {
            idc = IDC_BTNOFF;
            onMouseButtonUp = onMBU(close);
            tooltip = "Close Interface";
        };
        class btnbrtpls: GVAR(JV5_btnBRTplus) {
            idc = IDC_BTNUP;
            onMouseButtonUp = onMBU(incTextSize);
            tooltip = "Increase Font";
        };
        class btnbrtmns: GVAR(JV5_btnBRTminus) {
            idc = IDC_BTNDWN;
            onMouseButtonUp = onMBU(decTextSize);
            tooltip = "Decrease Font";
        };
        class btnfunction: GVAR(JV5_btnFCN) {
            idc = IDC_BTNFN;
            onMouseButtonUp = onMBU(toggleIconText);
            tooltip = "Toggle Text on/off";
        };
        class btnF5: GVAR(JV5_btnF5) {
            idc = IDC_BTNF5;
            tooltip = "Toggle Map Tools (F5)";
            onMouseButtonUp = onMBU(toggleMapTools);
        };
        class btnF6: GVAR(JV5_btnF6) {
            idc = IDC_BTNF6;
            onMouseButtonUp = onMBU(toggleMapType);
            tooltip = "Toggle Map Textures (F6)";
        };
        class btnF7: GVAR(JV5_btnF7) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(centerMapOnPlayerPosition);
            tooltip = "Center Map On Current Position (F7)";
        };
    };
};

#include "shared_undefines.hpp"
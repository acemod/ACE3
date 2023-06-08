#define DISPLAY_NAME TAD_dlg

#define GUI_GRID_X  (safezoneX + (safezoneW - safezoneH * 0.8 * 3/4) / 2)
#define GUI_GRID_Y  (safezoneY + 0.1 * safezoneH)
#define GUI_GRID_W  (safezoneH * 0.8 * 3/4)
#define GUI_GRID_H  (safezoneH * 0.8)

#define TAD_DLGtoDSP_fctr (0.86 / GUI_GRID_H)

#include "TAD_controls.hpp"

//#define MENU_sizeEx pxToScreen_H(TAD_OSD_TEXT_STD_SIZE)
//#include "\cTab\shared\ACE_BFT_Devices_markerMenu_macros.hpp"

class GVAR(DISPLAY_NAME) {
    idd = IDD_TAD_DLG;
    movingEnable = true;
    onLoad = QUOTE(_this call FUNC(ifOnLoad));
    onUnload = QUOTE([] call FUNC(ifOnUnload));
    onKeyDown = QUOTE(_this call FUNC(ifOnKeyDown));
    objects[] = {};
    class controlsBackground {
        class mapBackground: GVAR(TAD_Map_Background) {};
        class screen: GVAR(TAD_RscMapControl) {
            idc = IDC_SCREEN;
            //onMouseButtonDblClick = "_ok = [3300,_this] execVM '\cTab\shared\ACE_BFT_Devices_markerMenu_load.sqf';";
            onMouseMoving = onMM;
        };
        class screenTopo: screen {
            idc = IDC_SCREEN_TOPO;
            maxSatelliteAlpha = 0;
        };
        class screenBlack: GVAR(TAD_RscMapControl_BLACK) {
            idc = IDC_SCREEN_BLACK;
            //onMouseButtonDblClick = "_ok = [3300,_this] execVM '\cTab\shared\ACE_BFT_Devices_markerMenu_load.sqf';";
            onMouseMoving = onMM;
        };
    };

    class controls {
        /*
            ### OSD GUI controls ###
        */
        class navMode: GVAR(TAD_OSD_navModeOrScale) {
            text = "EXT1";
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
        class hookGrid: GVAR(TAD_OSD_hookGrid) {};
        class hookElevation: GVAR(TAD_OSD_hookElevation) {};
        class hookDir: GVAR(TAD_OSD_hookDir) {};
        class hookToggleIconBackground: GVAR(TAD_OSD_hookToggleIconBackground) {};
        class hookToggleIcon: GVAR(TAD_OSD_hookToggleIcon) {};
        class hookToggleText1: GVAR(TAD_OSD_hookToggleText1) {};
        class hookToggleText2: GVAR(TAD_OSD_hookToggleText2) {};
        class on_screen_currentDirection: GVAR(TAD_OSD_currentDirection) {};
        class on_screen_currentElevation: GVAR(TAD_OSD_currentElevation) {};
        class on_screen_centerMapText: GVAR(TAD_OSD_centerMapText) {};

        // ---------- USER MARKER MENU ------------
        //#include "\cTab\shared\ACE_BFT_Devices_markerMenu_controls.hpp"

        /*
            ### Overlays ###
        */
        // ---------- NOTIFICATION ------------
        class notification: GVAR(TAD_notification) {};
        // ---------- LOADING ------------
        class loadingtxt: GVAR(TAD_loadingtxt) {};
        // ---------- BRIGHTNESS ------------
        class brightness: GVAR(TAD_brightness) {};
        // ---------- BACKGROUND ------------
        class background: GVAR(TAD_background) {};
        // ---------- MOVING HANDLEs ------------
        class movingHandle_T: GVAR(TAD_movingHandle_T) {};
        class movingHandle_B: GVAR(TAD_movingHandle_B) {};
        class movingHandle_L: GVAR(TAD_movingHandle_L) {};
        class movingHandle_R: GVAR(TAD_movingHandle_R) {};

        /*
            ### PHYSICAL BUTTONS ###
        */
        class pwrbtn: GVAR(TAD_DNO) {
            idc = IDC_BTNMAIN;
            onMouseButtonUp = onMBU(toggleNightModeOrClose);
            tooltip = "left-click: Toggle DAY / NIGHT mode; right-click: Close interface";
        };
        class btnSymInc: GVAR(TAD_SYM_INC) {
            idc = IDC_BTNUP;
            onMouseButtonUp = onMBU(incTextSize);
            tooltip = "Increase Font";
        };
        class btnSymDec: GVAR(TAD_SYM_DEC) {
            idc = IDC_BTNDWN;
            onMouseButtonUp = onMBU(decTextSize);
            tooltip = "Decrease Font";
        };
        class btnBrtInc: GVAR(TAD_BRT_INC) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(incBrightness);
            tooltip = "Increase Brightness";
        };
        class btnBrtDec: GVAR(TAD_BRT_DEC) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(decBrightness);
            tooltip = "Decrease Brightness";
        };
        class btnfunction: GVAR(TAD_OSB10) {
            idc = IDC_BTNFN;
            onMouseButtonUp = onMBU(toggleIconText);
            tooltip = "Toggle Text on/off";
        };
        class btnMapType: GVAR(TAD_OSB20) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(toggleMapType);
            tooltip = "Toggle Map Type (F6)";
        };
        class btnMapTools: GVAR(TAD_OSB18) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(toggleMapTools);
            tooltip = "Toggle Map Tools (F5)";
        };
        class btnF7: GVAR(TAD_OSB19) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(centerMapOnPlayerPosition);
            tooltip = "Center Map On Current Position (F7)";
        };
    };
};

#include "shared_undefines.hpp"
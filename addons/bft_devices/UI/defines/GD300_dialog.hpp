#define DISPLAY_NAME GD300_dlg

#define GUI_GRID_W  (safezoneW * 0.8)
#define GUI_GRID_H  (GUI_GRID_W * 4/3)
#define GUI_GRID_X  (safezoneX + (safezoneW - GUI_GRID_W) / 2)
#define GUI_GRID_Y  (safezoneY + (safezoneH - GUI_GRID_H) / 2)

#define GD300_DLGtoDSP_fctr (0.86 / GUI_GRID_H)

#include "GD300_controls.hpp"

//#define MENU_sizeEx pxToScreen_H(GD300_OSD_TEXT_STD_SIZE)
//#include "\cTab\shared\cTab_markerMenu_macros.hpp"

class GVAR(DISPLAY_NAME) {
    idd = IDD_GD300_DLG;
    movingEnable = true;
    onLoad = QUOTE(_this call FUNC(ifOnLoad));
    onUnload = QUOTE([] call FUNC(ifOnUnload));
    onKeyDown = QUOTE(_this call FUNC(ifOnKeyDown));
    objects[] = {};
    class controlsBackground {
        class windowsBG: GVAR(GD300_windowsBG) {};
        class screen: GVAR(GD300_RscMapControl) {
            //onMouseButtonDblClick = "_ok = [3300,_this] execVM '\cTab\shared\cTab_markerMenu_load.sqf';";
            onMouseMoving = onMM;
        };
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
        class hookGrid: GVAR(GD300_on_screen_hookGrid) {};
        class hookElevation: GVAR(GD300_on_screen_hookElevation) {};
        class hookDst: GVAR(GD300_on_screen_hookDst) {};
        class hookDir: GVAR(GD300_on_screen_hookDir) {};

        // ---------- MAIN MENU -----------
        class menuContainer: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_MENU;
            x = pxToScreen_X(GD300_OSD_MENU_X);
            y = pxToScreen_Y(GD300_OSD_MENU_Y);
            w = pxToScreen_W(GD300_OSD_MENU_W);
            h = pxToScreen_H(GD300_OSD_MENU_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class menuBackground: GVAR(IGUIBack) {
                    IDC_COUNTER
                    x = 0;
                    y = 0;
                    w = pxToScreen_W(GD300_OSD_MENU_W);
                    h = pxToScreen_H(GD300_OSD_MENU_H);
                };
                class btnTextonoff: GVAR(RscButton) {
                    IDC_COUNTER
                    text = "Text On/Off"; //--- ToDo: Localize;
                    sizeEx = pxToScreen_H(GD300_OSD_TEXT_STD_SIZE);
                    x = pxToMenu_X(GD300_OSD_MENU_ELEMENT_X);
                    y = pxToMenu_Y(GD300_OSD_MENU_ELEMENT_Y(1));
                    w = pxToScreen_W(GD300_OSD_MENU_ELEMENT_W);
                    h = pxToScreen_H(GD300_OSD_MENU_ELEMENT_H);
                    onMouseButtonUp = onMBU(toggleIconText);
                    tooltip = "Toggle Text on/off";
                };
                class btnIcnSizeup: btnTextonoff {
                    IDC_COUNTER
                    text = "Icon Size +"; //--- ToDo: Localize;
                    y = pxToMenu_Y(GD300_OSD_MENU_ELEMENT_Y(2));
                    onMouseButtonDown = QFUNC(incTextSize);
                    tooltip = "Increase Font";
                };
                class btnIconSizedwn: btnTextonoff {
                    IDC_COUNTER
                    text = "Icon Size -"; //--- ToDo: Localize;
                    y = pxToMenu_Y(GD300_OSD_MENU_ELEMENT_Y(3));
                    onMouseButtonDown = QFUNC(decTextSize);
                    tooltip = "Decrease Font";
                };
                class btnF5: btnTextonoff {
                    IDC_COUNTER
                    y = pxToMenu_Y(GD300_OSD_MENU_ELEMENT_Y(7));
                    text = "Map Tools";
                    tooltip = "Toggle Map Tools (F5)";
                    onMouseButtonUp = onMBU(toggleMapTools);
                };
                class btnF6: btnTextonoff {
                    IDC_COUNTER
                    y = pxToMenu_Y(GD300_OSD_MENU_ELEMENT_Y(5));
                    text = "Map Textures";
                    onMouseButtonUp = onMBU(toggleMapType);
                    tooltip = "Toggle Map Textures (F6)";
                };
                class btnF7: btnTextonoff {
                    IDC_COUNTER
                    y = pxToMenu_Y(GD300_OSD_MENU_ELEMENT_Y(6));
                    text = "Center Map";
                    onMouseButtonUp = onMBU(centerMapOnPlayerPosition);
                    tooltip = "Center Map On Current Position (F7)";
                };
            };
        };
        // ---------- MESSAGING READ -----------
        class MESSAGE: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_MESSAGE;
            x = pxToScreen_X(GD300_SCREEN_CONTENT_X);
            y = pxToScreen_Y(GD300_SCREEN_CONTENT_Y);
            w = pxToScreen_W(GD300_SCREEN_CONTENT_W);
            h = pxToScreen_H(GD300_SCREEN_CONTENT_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class msgListbox: GVAR(RscListbox) {
                    idc = IDC_MSG_LIST;
                    style = LB_MULTI;
                    x = pxToGroup_X(GD300_MESSAGE_MESSAGELIST_X);
                    y = pxToGroup_Y(GD300_MESSAGE_MESSAGELIST_Y);
                    w = pxToScreen_W(GD300_MESSAGE_MESSAGELIST_W);
                    h = pxToScreen_H(GD300_MESSAGE_MESSAGELIST_H);
                    onLBSelChanged = onLBSC(MSGlist);
                };
                class msgframe: GVAR(RscFrame) {
                    IDC_COUNTER
                    text = "Read Message"; //--- ToDo: Localize;
                    x = pxToGroup_X(GD300_MESSAGE_MESSAGETEXT_FRAME_X);
                    y = pxToGroup_Y(GD300_MESSAGE_MESSAGETEXT_FRAME_Y);
                    w = pxToScreen_W(GD300_MESSAGE_MESSAGETEXT_FRAME_W);
                    h = pxToScreen_H(GD300_MESSAGE_MESSAGETEXT_FRAME_H);
                };
                class msgTxt: GVAR(RscEdit) {
                    idc = IDC_MSG_CONTENT;
                    htmlControl = true;
                    style = ST_MULTI;
                    lineSpacing = 0.2;
                    text = "No Message Selected"; //--- ToDo: Localize;
                    x = pxToGroup_X(GD300_MESSAGE_MESSAGETEXT_X);
                    y = pxToGroup_Y(GD300_MESSAGE_MESSAGETEXT_Y);
                    w = pxToScreen_W(GD300_MESSAGE_MESSAGETEXT_W);
                    h = pxToScreen_H(GD300_MESSAGE_MESSAGETEXT_H);
                    canModify = 0;
                };
                class deletebtn: GVAR(RscButton) {
                    idc = IDC_MSG_BTNDELETE;
                    text = "Delete"; //--- ToDo: Localize;
                    tooltip = "Delete Selected Message(s)";
                    x = pxToGroup_X(GD300_MESSAGE_BUTTON_DELETE_X);
                    y = pxToGroup_Y(GD300_MESSAGE_BUTTON_DELETE_Y);
                    w = pxToScreen_W(GD300_MESSAGE_BUTTON_W);
                    h = pxToScreen_H(GD300_MESSAGE_BUTTON_H);
                    onMouseButtonUp = onMBU(msgDelete);
                };
                class toCompose: GVAR(RscButton) {
                    IDC_COUNTER
                    text = "Compose >>"; //--- ToDo: Localize;
                    tooltip = "Compose Messages";
                    x = pxToGroup_X(GD300_MESSAGE_BUTTON_MODE_X);
                    y = pxToGroup_Y(GD300_MESSAGE_BUTTON_MODE_Y);
                    w = pxToScreen_W(GD300_MESSAGE_BUTTON_W);
                    h = pxToScreen_H(GD300_MESSAGE_BUTTON_H);
                    onMouseButtonUp = onMBU(modeCOMPOSE);
                };
            };
        };
        // ---------- MESSAGING COMPOSE -----------
        class COMPOSE: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_COMPOSE;
            x = pxToScreen_X(GD300_SCREEN_CONTENT_X);
            y = pxToScreen_Y(GD300_SCREEN_CONTENT_Y);
            w = pxToScreen_W(GD300_SCREEN_CONTENT_W);
            h = pxToScreen_H(GD300_SCREEN_CONTENT_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class composeFrame: GVAR(RscFrame) {
                    IDC_COUNTER
                    text = "Compose Message"; //--- ToDo: Localize;
                    x = pxToGroup_X(GD300_MESSAGE_COMPOSE_FRAME_X);
                    y = pxToGroup_Y(GD300_MESSAGE_COMPOSE_FRAME_Y);
                    w = pxToScreen_W(GD300_MESSAGE_COMPOSE_FRAME_W);
                    h = pxToScreen_H(GD300_MESSAGE_COMPOSE_FRAME_H);
                };
                class playerlistbox: GVAR(RscListbox) {
                    idc = IDC_MSG_RECIPIENTS;
                    style = LB_MULTI;
                    x = pxToGroup_X(GD300_MESSAGE_PLAYERLIST_X);
                    y = pxToGroup_Y(GD300_MESSAGE_PLAYERLIST_Y);
                    w = pxToScreen_W(GD300_MESSAGE_PLAYERLIST_W);
                    h = pxToScreen_H(GD300_MESSAGE_PLAYERLIST_H);
                };
                class sendbtn: GVAR(RscButton) {
                    idc = IDC_MSG_BTNSEND;
                    text = "Send"; //--- ToDo: Localize;
                    x = pxToGroup_X(GD300_MESSAGE_BUTTON_SEND_X);
                    y = pxToGroup_Y(GD300_MESSAGE_BUTTON_SEND_Y);
                    w = pxToScreen_W(GD300_MESSAGE_BUTTON_W);
                    h = pxToScreen_H(GD300_MESSAGE_BUTTON_H);
                    onMouseButtonUp = onMBU(msgSend);
                };
                class edittxtbox: GVAR(RscEdit) {
                    idc = IDC_MSG_COMPOSE;
                    htmlControl = true;
                    style = ST_MULTI;
                    lineSpacing = 0.2;
                    text = ""; //--- ToDo: Localize;
                    x = pxToGroup_X(GD300_MESSAGE_COMPOSE_TEXT_X);
                    y = pxToGroup_Y(GD300_MESSAGE_COMPOSE_TEXT_Y);
                    w = pxToScreen_W(GD300_MESSAGE_COMPOSE_TEXT_W);
                    h = pxToScreen_H(GD300_MESSAGE_COMPOSE_TEXT_H);
                };
                class toRead: GVAR(RscButton) {
                    IDC_COUNTER
                    text = "Read >>"; //--- ToDo: Localize;
                    tooltip = "Read Messages";
                    x = pxToGroup_X(GD300_MESSAGE_BUTTON_MODE_X);
                    y = pxToGroup_Y(GD300_MESSAGE_BUTTON_MODE_Y);
                    w = pxToScreen_W(GD300_MESSAGE_BUTTON_W);
                    h = pxToScreen_H(GD300_MESSAGE_BUTTON_H);
                    onMouseButtonUp = onMBU(modeMESSAGE);
                };
            };
        };

        // User Placed markers
        //#include "\cTab\shared\cTab_markerMenu_controls.hpp"

        /*
            ### Overlays ###
        */
        // ---------- LOADING ------------
        class loadingtxt: GVAR(GD300_loadingtxt) {};
        // ---------- BRIGHTNESS ------------
        class brightness: GVAR(GD300_brightness) {};
        // ---------- BACKGROUND ------------
        class background: GVAR(GD300_background) {};
        // ---------- MOVING HANDLEs ------------
        class movingHandle_T: GVAR(GD300_movingHandle_T){};
        class movingHandle_B: GVAR(GD300_movingHandle_B){};
        class movingHandle_L: GVAR(GD300_movingHandle_L){};
        class movingHandle_R: GVAR(GD300_movingHandle_R){};

        /*
            ### PHYSICAL BUTTONS ###
        */
        class btnMenu: GVAR(GD300_btnMenu) {
            idc = IDC_BTNFN;
            onMouseButtonUp = onMBU(toggleMapMenu);
            tooltip = "Map Options";
        };
        class btnPower: GVAR(GD300_btnPower) {
            idc = IDC_BTNOFF;
            onMouseButtonUp = onMBU(close);
            tooltip = "Close Interface";
        };
        class btnHome: GVAR(GD300_btnHome) {
            idc = IDC_BTNF1;
            onMouseButtonUp = onMBU(toggleInterfaceMode);
            tooltip = "Toggle Map (F1) / Messages (F4)";
        };
    };
};

#include "shared_undefines.hpp"
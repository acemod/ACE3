#define DISPLAY_NAME DK10_dlg

#define GUI_GRID_H  (safezoneH * 1.15)
#define GUI_GRID_W  (GUI_GRID_H * 3/4)
#define GUI_GRID_X  (safezoneX + (safezoneW - GUI_GRID_W) / 2)
#define GUI_GRID_Y  (safezoneY + (safezoneH - GUI_GRID_H) / 2)

#include "DK10_controls.hpp"

//#define MENU_sizeEx pxToScreen_H(DK10_OSD_TEXT_STD_SIZE)
//#include "\cTab\shared\cTab_markerMenu_macros.hpp"

class GVAR(DISPLAY_NAME) {
    idd = IDD_DK10_DLG;
    movingEnable = true;
    onLoad = QUOTE(_this call FUNC(ifOnLoad));
    onUnload = QUOTE([] call FUNC(ifOnUnload));
    onKeyDown = QUOTE(_this call FUNC(ifOnKeyDown));
    objects[] = {};
    class controlsBackground {
        class windowsBG: GVAR(RscPicture) {
            idc = IDC_WIN_BACK;
            text = "#(argb,8,8,3)color(0.2,0.431,0.647,1)";
            x = pxToScreen_X(DK10_MAP_X);
            y = pxToScreen_Y(DK10_MAP_Y);
            w = pxToScreen_W(DK10_MAP_W);
            h = pxToScreen_H(DK10_MAP_H);
        };
        class windowsBar: GVAR(RscPicture) {
            idc = IDC_WIN_TASKBAR;
            //text = "\cTab\img\Desktop_bar.jpg";
            x = pxToScreen_X(DK10_TASKBAR_X);
            y = pxToScreen_Y(DK10_TASKBAR_Y);
            w = pxToScreen_W(DK10_TASKBAR_W);
            h = pxToScreen_H(DK10_TASKBAR_H);
        };
        class MiniMapBG: GVAR(DK10_window_back_BL) {
            idc = IDC_MINIMAPBG;
        };
        class UavMap: GVAR(DK10_RscMapControl) {
            idc = IDC_UAVMAP;
            x = pxToScreen_X(DK10_WINDOW_CONTENT_L_X);
            y = pxToScreen_Y(DK10_WINDOW_CONTENT_B_Y);
            w = pxToScreen_W(DK10_WINDOW_CONTENT_W);
            h = pxToScreen_H(DK10_WINDOW_CONTENT_H);
        };
        class HcamMap: UavMap {
            idc = IDC_HCAMMAP;
        };
        class screen: GVAR(DK10_RscMapControl) {
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
        class header: GVAR(DK10_header) {};
        class battery: GVAR(DK10_OSD_battery) {};
        class time: GVAR(DK10_OSD_time) {};
        class signalStrength: GVAR(DK10_OSD_signalStrength) {};
        class satellite: GVAR(DK10_OSD_satellite) {};
        class dirDegree: GVAR(DK10_OSD_dirDegree) {};
        class grid: GVAR(DK10_OSD_grid) {};
        class dirOctant: GVAR(DK10_OSD_dirOctant) {};
        class hookGrid: GVAR(DK10_OSD_hookGrid) {};
        class hookElevation: GVAR(DK10_OSD_hookElevation) {};
        class hookDst: GVAR(DK10_OSD_hookDst) {};
        class hookDir: GVAR(DK10_OSD_hookDir) {};
        // ---------- DESKTOP -----------
        class Desktop: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_DESKTOP;
            x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
            y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
            w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
            h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class appBFT: GVAR(ActiveText) {
                    style = ST_PICTURE;
                    idc = IDC_ACTBFTTXT;
                    text = QUOTE(PATHTOF(UI\icons\appBFT.paa));
                    x = pxToGroup_X(DK10_SCREEN_CONTENT_X + DK10_DESKTOP_ICON_OFFSET_X);
                    y = pxToGroup_Y(DK10_SCREEN_CONTENT_Y + DK10_DESKTOP_ICON_OFFSET_Y);
                    w = pxToScreen_W(DK10_DESKTOP_ICON_W);
                    h = pxToScreen_H(DK10_DESKTOP_ICON_H);
                    onMouseButtonUp = onMBU(modeBFT);
                    toolTip = "FBCB2 - Blue Force Tracker";
                };
                class appUAV: appBFT {
                    idc = IDC_ACTUAVTXT;
                    text = QUOTE(PATHTOF(UI\icons\appUAV.paa));
                    y = pxToGroup_Y(DK10_SCREEN_CONTENT_Y + DK10_DESKTOP_ICON_OFFSET_Y * 2 + DK10_DESKTOP_ICON_H);
                    onMouseButtonUp = onMBU(modeUAV);
                    toolTip = "UAV Video Feeds";
                };
                class appHCAM: appBFT {
                    idc = IDC_ACTVIDTXT;
                    text = QUOTE(PATHTOF(UI\icons\appHelmetCam.paa));
                    y = pxToGroup_Y(DK10_SCREEN_CONTENT_Y + DK10_DESKTOP_ICON_OFFSET_Y * 3 + DK10_DESKTOP_ICON_H * 2);
                    onMouseButtonUp = onMBU(modeHCAM);
                    toolTip = "Live Helmet Cam Video Feeds";
                };
                class appMAIL: appBFT {
                    idc = IDC_ACTMSGTXT;
                    text = QUOTE(PATHTOF(UI\icons\appMail.paa));
                    y = pxToGroup_Y(DK10_SCREEN_CONTENT_Y + DK10_DESKTOP_ICON_OFFSET_Y * 4 + DK10_DESKTOP_ICON_H * 3);
                    onMouseButtonUp = onMBU(modeMESSAGE);
                    toolTip = "Text Messaging System";
                };
            };
        };
        // ---------- UAV -----------
        class UAV: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_UAV;
            x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
            y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
            w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
            h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class UAVListBG: GVAR(DK10_window_back_TL) {
                    IDC_COUNTER
                    x = pxToGroup_X(DK10_WINDOW_BACK_L_X);
                    y = pxToGroup_Y(DK10_WINDOW_BACK_T_Y);
                };
                class UAVVidBG1: GVAR(DK10_window_back_TR) {
                    IDC_COUNTER
                    x = pxToGroup_X(DK10_WINDOW_BACK_R_X);
                    y = pxToGroup_Y(DK10_WINDOW_BACK_T_Y);
                };
                class UAVVidBG2: GVAR(DK10_window_back_BR) {
                    IDC_COUNTER
                    x = pxToGroup_X(DK10_WINDOW_BACK_R_X);
                    y = pxToGroup_Y(DK10_WINDOW_BACK_B_Y);
                };
                class UAVlist: GVAR(DK10_RscListbox) {
                    idc = IDC_UAVLIST;
                    x = pxToGroup_X(DK10_WINDOW_CONTENT_L_X);
                    y = pxToGroup_Y(DK10_WINDOW_CONTENT_T_Y);
                    w = pxToScreen_W(DK10_WINDOW_CONTENT_W);
                    h = pxToScreen_H(DK10_WINDOW_CONTENT_H);
                    onLBSelChanged = onLBSC(UAVlist);
                };
                class UAVdisplay: GVAR(RscPicture) {
                    idc = IDC_UAVDISPLAY;
                    text = "#(argb,512,512,1)r2t(rendertarget8,1.1896551724)";
                    x = pxToGroup_X(DK10_WINDOW_CONTENT_R_X);
                    y = pxToGroup_Y(DK10_WINDOW_CONTENT_T_Y);
                    w = pxToScreen_W(DK10_WINDOW_CONTENT_W);
                    h = pxToScreen_H(DK10_WINDOW_CONTENT_H);
                };
                class UAV2nddisplay: GVAR(RscPicture) {
                    idc = IDC_UAV2NDDISPLAY;
                    text = "#(argb,512,512,1)r2t(rendertarget9,1.1896551724)";
                    x = pxToGroup_X(DK10_WINDOW_CONTENT_R_X);
                    y = pxToGroup_Y(DK10_WINDOW_CONTENT_B_Y);
                    w = pxToScreen_W(DK10_WINDOW_CONTENT_W);
                    h = pxToScreen_H(DK10_WINDOW_CONTENT_H);
                };
            };
        };
        // ---------- HELMET CAM -----------
        class HCAM: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_HCAM;
            x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
            y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
            w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
            h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class HcamListBG: GVAR(DK10_window_back_TL) {
                    IDC_COUNTER
                    x = pxToGroup_X(DK10_WINDOW_BACK_L_X);
                    y = pxToGroup_Y(DK10_WINDOW_BACK_T_Y);
                };
                class HcamVidBG: GVAR(DK10_window_back_TR) {
                    IDC_COUNTER
                    x = pxToGroup_X(DK10_WINDOW_BACK_R_X);
                    y = pxToGroup_Y(DK10_WINDOW_BACK_T_Y);
                };
                class HcamList: GVAR(DK10_RscListbox) {
                    idc = IDC_HCAMLIST;
                    x = pxToGroup_X(DK10_WINDOW_CONTENT_L_X);
                    y = pxToGroup_Y(DK10_WINDOW_CONTENT_T_Y);
                    w = pxToScreen_W(DK10_WINDOW_CONTENT_W);
                    h = pxToScreen_H(DK10_WINDOW_CONTENT_H);
                    onLBSelChanged = onLBSC(HCAMlist);
                };
                class HcamDisplay: GVAR(RscPicture) {
                    idc = IDC_HCAMDISPLAY;
                    text = "#(argb,512,512,1)r2t(rendertarget12,1.1896551724)";
                    x = pxToGroup_X(DK10_WINDOW_CONTENT_R_X);
                    y = pxToGroup_Y(DK10_WINDOW_CONTENT_T_Y);
                    w = pxToScreen_W(DK10_WINDOW_CONTENT_W);
                    h = pxToScreen_H(DK10_WINDOW_CONTENT_H);
                };
            };
        };
        // ---------- MESSAGING -----------
        class MESSAGE: GVAR(RscControlsGroup) {
            idc = IDC_GROUP_MESSAGE;
            x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
            y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
            w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
            h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
            class VScrollbar {};
            class HScrollbar {};
            class Scrollbar {};
            class controls {
                class msgframe: GVAR(RscFrame) {
                    IDC_COUNTER
                    text = "Read Message"; //--- ToDo: Localize;
                    x = pxToGroup_X(DK10_MESSAGE_MESSAGETEXT_FRAME_X);
                    y = pxToGroup_Y(DK10_MESSAGE_MESSAGETEXT_FRAME_Y);
                    w = pxToScreen_W(DK10_MESSAGE_MESSAGETEXT_FRAME_W);
                    h = pxToScreen_H(DK10_MESSAGE_MESSAGETEXT_FRAME_H);
                };
                class msgListbox: GVAR(DK10_RscListbox) {
                    idc = IDC_MSG_LIST;
                    style = LB_MULTI;
                    x = pxToGroup_X(DK10_MESSAGE_MESSAGELIST_X);
                    y = pxToGroup_Y(DK10_MESSAGE_MESSAGELIST_Y);
                    w = pxToScreen_W(DK10_MESSAGE_MESSAGELIST_W);
                    h = pxToScreen_H(DK10_MESSAGE_MESSAGELIST_H);
                    onLBSelChanged = onLBSC(MSGlist);
                };
                class msgTxt: GVAR(DK10_RscEdit) {
                    idc = IDC_MSG_CONTENT;
                    htmlControl = true;
                    style = ST_MULTI;
                    lineSpacing = 0.2;
                    text = "No Message Selected"; //--- ToDo: Localize;
                    x = pxToGroup_X(DK10_MESSAGE_MESSAGETEXT_X);
                    y = pxToGroup_Y(DK10_MESSAGE_MESSAGETEXT_Y);
                    w = pxToScreen_W(DK10_MESSAGE_MESSAGETEXT_W);
                    h = pxToScreen_H(DK10_MESSAGE_MESSAGETEXT_H);
                    canModify = 0;
                };
                class composeFrame: GVAR(RscFrame) {
                    IDC_COUNTER
                    text = "Compose Message"; //--- ToDo: Localize;
                    x = pxToGroup_X(DK10_MESSAGE_COMPOSE_FRAME_X);
                    y = pxToGroup_Y(DK10_MESSAGE_COMPOSE_FRAME_Y);
                    w = pxToScreen_W(DK10_MESSAGE_COMPOSE_FRAME_W);
                    h = pxToScreen_H(DK10_MESSAGE_COMPOSE_FRAME_H);
                };
                class playerlistbox: GVAR(DK10_RscListbox) {
                    idc = IDC_MSG_RECIPIENTS;
                    style = LB_MULTI;
                    x = pxToGroup_X(DK10_MESSAGE_PLAYERLIST_X);
                    y = pxToGroup_Y(DK10_MESSAGE_PLAYERLIST_Y);
                    w = pxToScreen_W(DK10_MESSAGE_PLAYERLIST_W);
                    h = pxToScreen_H(DK10_MESSAGE_PLAYERLIST_H);
                };
                class deletebtn: GVAR(DK10_RscButton) {
                    idc = IDC_MSG_BTNDELETE;
                    text = "Delete"; //--- ToDo: Localize;
                    tooltip = "Delete Selected Message(s)";
                    x = pxToGroup_X(DK10_MESSAGE_BUTTON_DELETE_X);
                    y = pxToGroup_Y(DK10_MESSAGE_BUTTON_DELETE_Y);
                    w = pxToScreen_W(DK10_MESSAGE_BUTTON_W);
                    h = pxToScreen_H(DK10_MESSAGE_BUTTON_H);
                    onMouseButtonUp = onMBU(msgDelete);
                };
                class sendbtn: GVAR(DK10_RscButton) {
                    idc = IDC_MSG_BTNSEND;
                    text = "Send"; //--- ToDo: Localize;
                    x = pxToGroup_X(DK10_MESSAGE_BUTTON_SEND_X);
                    y = pxToGroup_Y(DK10_MESSAGE_BUTTON_SEND_Y);
                    w = pxToScreen_W(DK10_MESSAGE_BUTTON_W);
                    h = pxToScreen_H(DK10_MESSAGE_BUTTON_H);
                    onMouseButtonUp = onMBU(msgSend);
                };
                class edittxtbox: GVAR(DK10_RscEdit) {
                    idc = IDC_MSG_COMPOSE;
                    htmlControl = true;
                    style = ST_MULTI;
                    lineSpacing = 0.2;
                    text = ""; //--- ToDo: Localize;
                    x = pxToGroup_X(DK10_MESSAGE_COMPOSE_TEXT_X);
                    y = pxToGroup_Y(DK10_MESSAGE_COMPOSE_TEXT_Y);
                    w = pxToScreen_W(DK10_MESSAGE_COMPOSE_TEXT_W);
                    h = pxToScreen_H(DK10_MESSAGE_COMPOSE_TEXT_H);
                };
            };
        };
        // ---------- FULLSCREEN HCAM -----------
        class HcamFull: GVAR(RscPicture) {
            idc = IDC_HCAM_FULL;
            text = "#(argb,512,512,1)r2t(rendertarget13,1.3096153846)";
            x = pxToScreen_X(DK10_SCREEN_CONTENT_X);
            y = pxToScreen_Y(DK10_SCREEN_CONTENT_Y);
            w = pxToScreen_W(DK10_SCREEN_CONTENT_W);
            h = pxToScreen_H(DK10_SCREEN_CONTENT_H);
        };
        // ---------- USER MARKER MENU ------------
        //#define cTab_IS_TABLET
        //#include "\cTab\shared\cTab_markerMenu_controls.hpp"
        //#undef cTab_IS_TABLET

        /*
            ### Overlays ###
        */
        // ---------- LOADING ------------
        class loadingtxt: GVAR(DK10_loadingtxt) {};
        // ---------- BRIGHTNESS ------------
        class brightness: GVAR(DK10_brightness) {};
        // ---------- BACKGROUND ------------
        class background: GVAR(DK10_background) {};
        // ---------- MOVING HANDLEs ------------
        class movingHandle_T: GVAR(DK10_movingHandle_T) {};
        class movingHandle_B: GVAR(DK10_movingHandle_B) {};
        class movingHandle_L: GVAR(DK10_movingHandle_L) {};
        class movingHandle_R: GVAR(DK10_movingHandle_R) {};

        /*
            ### PHYSICAL BUTTONS ###
        */
        class btnF1: GVAR(DK10_btnF1) {
            idc = IDC_BTNF1;
            onMouseButtonUp = onMBU(modeBFT);
            tooltip = "Blue Force Tracker - (F1)";
        };
        class btnF2: GVAR(DK10_btnF2) {
            idc = IDC_BTNF2;
            onMouseButtonUp = onMBU(modeUAV);
            tooltip = "UAV Intel Live Feed - (F2)";
        };
        class btnF3: GVAR(DK10_btnF3) {
            idc = IDC_BTNF3;
            onMouseButtonUp = onMBU(modeHCAM);
            tooltip = "Helmet Cam Live Feed - (F3)";
        };
        class btnF4: GVAR(DK10_btnF4) {
            idc = IDC_BTNF4;
            onMouseButtonUp = onMBU(modeMESSAGE);
            tooltip = "Text Message Application - (F4)";
        };
        class btnF5: GVAR(DK10_btnF5) {
            idc = IDC_BTNF5;
            tooltip = "Toggle Map Tools (F5)";
            onMouseButtonUp = onMBU(toggleMapTools);
        };
        class btnF6: GVAR(DK10_btnF6) {
            idc = IDC_BTNF6;
            onMouseButtonUp = onMBU(toggleMapType);
            tooltip = "Toggle Map Textures (F6)";
        };
        class btnF7: GVAR(DK10_btnTrackpad) {
            IDC_COUNTER
            onMouseButtonUp = onMBU(centerMapOnPlayerPosition);
            tooltip = "Center Map On Current Position (F7)";
        };
        class btnMain: GVAR(DK10_btnHome) {
            idc = IDC_BTNMAIN;
            onMouseButtonUp = onMBU(modeDESKTOP);
            tooltip = "Main Menu";
        };
        class btnFN: GVAR(DK10_btnFn) {
            idc = IDC_BTNFN;
            onMouseButtonUp = onMBU(toggleIconText);
            tooltip = "Toggle Text on/off";
        };
        class btnOFF: GVAR(DK10_btnPower) {
            idc = IDC_BTNOFF;
            onMouseButtonUp = onMBU(close);
            tooltip = "Close Interface";
        };
        class btnUP: GVAR(DK10_btnBrtUp) {
            idc = IDC_BTNUP;
            onMouseButtonDown = QFUNC(incTextSize);
            tooltip = "Increase Font";
        };
        class btnDWN: GVAR(DK10_btnBrtDn) {
            idc = IDC_BTNDWN;
            onMouseButtonDown = QFUNC(decTextSize);
            tooltip = "Decrease Font";
        };
        class btnACT: GVAR(DK10_btnMouse) {
            idc = IDC_BTNACT;
            onMouseButtonUp = onMBU(btnACT);
            tooltip = "";
        };
    };
};

#include "shared_undefines.hpp"
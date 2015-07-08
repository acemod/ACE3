#include "\z\ace\addons\common\define.hpp"

#define SIZEX ((safezoneW / safezoneH) min 1.2)
#define SIZEY (SIZEX / 1.2)
#define W_PART(num) (num * (SIZEX / 40))
#define H_PART(num) (num * (SIZEY / 25))
#define X_PART(num) (W_PART(num) + (safezoneX + (safezoneW - SIZEX)/2))
#define Y_PART(num) (H_PART(num) + (safezoneY + (safezoneH - SIZEY)/2))

class GVAR(overlay) {

    idd = 12200;
    enableSimulation = 1;
    movingEnable = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['ace_spectator_overlay', _this select 0]; ['Init', _this] call ace_spectator_fnc_overlay";

    class controls {

        class Unitlist {

            access = 0;
            idc = 0;
            type = CT_TREE;
            style = ST_LEFT;
            default = 0;
            blinkingPeriod = 0;

            x = safeZoneX;
            y = safezoneY + H_PART(1);
            w = W_PART(5);
            h = safeZoneH - H_PART(1);

            colorBorder[] = {1,1,1,1};

            colorBackground[] = {0.1,0.1,0.1,1};
            colorSelect[] = {1,0.5,0,1};
            colorMarked[] = {1,0.5,0,0.5};
            colorMarkedSelected[] = {1,0.5,0,1};

            sizeEx = H_PART(1);
            font = "PuristaMedium";
            shadow = 1;
            colorText[] = {1,1,1,1};
            colorSelectText[] = {1,1,1,1};
            colorMarkedText[] = {1,1,1,1};

            tooltip = "";
            tooltipColorShade[] = {0,0,0,1};
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};

            multiselectEnabled = 0;
            expandOnDoubleclick = 0;
            hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
            expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
            maxHistoryDelay = 1;

            class ScrollBar {
                width = 0;
                height = 0;
                scrollSpeed = 0.01;

                arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
                arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
                border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
                thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

                color[] = {1,1,1,1};
            };

            colorDisabled[] = {0,0,0,0};
            colorArrow[] = {0,0,0,0};

            onDestroy = QUOTE(GVAR(mouseBusy) = false; false);
            onMouseEnter = QUOTE(GVAR(mouseBusy) = true; false);
            onMouseExit = QUOTE(GVAR(mouseBusy) = false; false);

            onTreeDblClick = "['Select', _this] call ace_spectator_fnc_overlay; false";
        };
    };
};

class GVAR(map) {

    idd = 12202;
    enableSimulation = 1;
    enableDisplay = 0;
    onLoad = "uiNameSpace setVariable ['ace_spectator_map', _this select 0]; ['Init', _this select 0] call ace_spectator_fnc_map";
    onUnload = "['Close', _this select 0] call ace_spectator_fnc_map";
    onKeyDown = "['KeyDown', _this] call ace_spectator_fnc_map";

    class controls {
        class Map: ACE_gui_mapBase {
            access = 0;
            idc = 1;
        };
    };
};

class RscTitles {
    class GVAR(crosshair) {

        onLoad = "uiNamespace setVariable ['ace_spectator_crosshair', _this select 0]";

        idd=-1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {

            class X: ACE_gui_backgroundBase {
                idc = 0;
                x = 0.5 - W_PART(2);
                y = 0.5 - H_PART(2);
                w = W_PART(4);
                h = H_PART(4);
                text = "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa";
                colorText[] = {1,1,1,0.8};
                fixedWidth = 0;
                shadow = 0;
            };
        };
    };

    class GVAR(status) {

        onLoad = "uiNamespace setVariable ['ace_spectator_status', _this select 0]; [_this select 0] call ace_spectator_fnc_status";
        idd = -1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {

            class TopBar: ACE_gui_staticBase {
                style = ST_CENTER;
                x = safeZoneX;
                y = safeZoneY;
                w = safeZoneW;
                h = H_PART(1);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class Name: TopBar {
                idc = 1;
                x = safeZoneX;
                w = safeZoneW * 0.2;
                style = ST_CENTER;
                shadow = 2;
                colorText[]={1,1,1,1};
                colorBackground[] = {0,0,0,1};
                sizeEx = H_PART(1);
            };

            class NameFrame: Name {
                style = ST_FRAME;
            };

            class Mode: Name {
                idc = 2;
                x = safeZoneX + safeZoneW * 0.2;
                w = safeZoneW * 0.05;
                h = H_PART(1);
                style = ST_CENTER;
            };

            class ModeFrame: Mode {
                style = ST_FRAME;
            };

            class Focus: Mode {
                idc = 6;
                x = safeZoneX + safeZoneW * 0.8;
                style = ST_CENTER;
            };

            class FocusFrame: Focus {
                style = ST_FRAME;
            };

            class Time: Mode {
                idc = 3;
                x = safeZoneX + safeZoneW * 0.75;
                style = ST_CENTER;
            };

            class TimeFrame: Time {
                style = ST_FRAME;
            };

            class TimeAcc: Mode {
                idc = 5;
                x = safeZoneX + safeZoneW * 0.85;
                style = ST_CENTER;
            };

            class TimeAccFrame: TimeAcc {
                style = ST_FRAME;
            };

            class Fov: Mode {
                idc = 4;
                x = safezoneX + safezoneW * 0.9;
                style = ST_CENTER;
            };

            class FovFrame: Fov {
                style = ST_FRAME;
            };

            class Velocity: Mode {
                idc = 0;
                x = safeZoneX + safeZoneW * 0.95;
                y = safeZoneY;
            };

            class VelocityFrame: Velocity {
                style = ST_FRAME;
            };
        };
    };

    class GVAR(compass) {

        onLoad = "uiNamespace setVariable ['ace_spectator_compass', _this select 0]";
        onUnload = "";
        idd=-1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {

            class BG: ACE_gui_staticBase {
                style = ST_CENTER;
                x = 0.5 - safeZoneW * 0.25;
                y = safeZoneY;
                w = safeZoneW * 0.5;
                h = H_PART(1);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class 0_90: ACE_gui_backgroundBase {
                idc = 1;
                x = 0.5;
                y = safeZoneY;
                w = safeZoneW * 0.25;
                h = H_PART(1);
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture180_ca.paa";
            };

            class 90_180: 0_90 {
                idc = 2;
                x = 0.5 + safezoneW * 0.25;
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture270_ca.paa";
            };

            class 180_270: 0_90 {
                idc = 3;
                x = 0.5 + safezoneW * 0.5;
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture0_ca.paa";
            };

            class 270_0: 0_90 {
                idc = 4;
                x = 0.5 + safeZoneW * 0.75;
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture90_ca.paa";
            };

            class Post: ACE_gui_staticBase {
                style = ST_CENTER;
                x = 0.5;
                y = safeZoneY;
                w = W_PART(0.1);
                h = H_PART(1);
                colorBackground[]={1,0,0,1};
            };

            class LeftBlocker: ACE_gui_staticBase {
                style = ST_CENTER;
                x = 0.5 - safezoneW * 0.5;
                y = safeZoneY;
                w = safeZoneW * 0.25;
                h = H_PART(1);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class RightBlocker: LeftBlocker {
                x = 0.5 + safeZoneW * 0.25;
            };

            class Frame: ACE_gui_staticBase {
                style = ST_FRAME;
                x = 0.5 - safeZoneW * 0.25;
                y = safeZoneY;
                w = safeZoneW * 0.5;
                h = H_PART(1);
                shadow=2;
                colorText[]={1,1,1,1};
            };
        };
    };

    class GVAR(help) {

        onLoad = "uiNamespace setVariable ['ace_spectator_help', _this select 0]; ['Help', _this select 0] call ace_spectator_fnc_camera";
        idd = -1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {

            class BG: ACE_gui_staticBase {
                style = ST_CENTER;
                idc = -1;
                x = 0.5 - W_PART(8);
                y = 0.5 - H_PART(8);
                w = W_PART(16);
                h = H_PART(16);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class Title: BG {
                idc = 0;
                h = H_PART(1);
                colorText[]={1,1,1,1};
                colorBackground[] = {
                    "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])",
                    "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])",
                    "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",
                    1
                };
                sizeEx = H_PART(1);
                text = "ACE Spectator Controls";
            };

            class LeftColumn1 {
                idc = 1;
                type = CT_STRUCTURED_TEXT;
                style = ST_LEFT;
                x = 0.5 - W_PART(8);
                y = 0.5 - H_PART(7);
                w = W_PART(4);
                h = H_PART(7);
                text = "";
                size = QUOTE(RESUNITS_Y * 2.5);
                colorBackground[] = {0,0,0,0};
            };

            class LeftColumn2: LeftColumn1 {
                idc = 2;
                x = 0.5 - H_PART(4);
            };

            class RightColumn1: LeftColumn1 {
                idc = 3;
                x = 0.5;
            };

            class RightColumn2: LeftColumn1 {
                idc = 4;
                x = 0.5 + H_PART(4);
            };
        };
    };
};

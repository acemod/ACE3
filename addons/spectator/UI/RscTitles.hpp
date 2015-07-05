#include "\z\ace\addons\common\define.hpp"
#define PIXEL_X (safeZoneWAbs / (getResolution select 0))
#define PIXEL_Y (safeZoneH / (getResolution select 1))
#define XHAIR RESUNITS_X * 4
#define COMPASS_W RESUNITS_X * 20
#define COMPASS_H COMPASS_W / 15
#define COMPASS_X RESCENTRE_X - COMPASS_W / 2
#define HELP_W RESUNITS_X * 75
#define HELP_H RESUNITS_Y * 75
// Fonts
#define GUI_FONT_NORMAL PuristaMedium
#define GUI_FONT_BOLD PuristaSemibold
#define GUI_FONT_THIN PuristaLight
#define GUI_FONT_MONO EtelkaMonospacePro
#define GUI_FONT_NARROW EtelkaNarrowMediumPro
#define GUI_FONT_CODE LucidaConsoleB
#define GUI_FONT_SYSTEM TahomaB

//colours

#define COLOUR_GUI_TEXT {"profilenamespace getvariable ['GUI_TITLETEXT_RGB_R',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_G',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_B',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_A',1]"}

#define COLOUR_GUI_BG {"profilenamespace getvariable ['GUI_BCG_RGB_R',0.8]", "profilenamespace getvariable ['GUI_BCG_RGB_G',0.8]","profilenamespace getvariable ['GUI_BCG_RGB_B',0.8]","profilenamespace getvariable ['GUI_BCG_RGB_A',0.8]"}

#define COLOUR_IGUI_TEXT {"profilenamespace getvariable ['IGUI_TEXT_RGB_R',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_G',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_B',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_A',1]"}

#define COLOUR_IGUI_BG {"profilenamespace getvariable ['IGUI_BCG_RGB_R',0.8]", "profilenamespace getvariable ['IGUI_BCG_RGB_G',0.5]","profilenamespace getvariable ['IGUI_BCG_RGB_B',0]","profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8]"}

#define COLOUR_IGUI_WARN {"profilenamespace getvariable ['IGUI_TEXT_WARNING_R',0.8]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_G',0.5]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_B',0]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_A',0.8]"}

// Grids
#define GUI_GRID_CENTER_WAbs ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

#define RESUNITS_X (safeZoneW / 100)
#define RESUNITS_Y (safeZoneH / 100)
#define RESCENTRE_X safeZoneX + safeZoneW / 2
#define RESCENTRE_Y safeZoneY + safeZoneH / 2

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

            x = QUOTE(safeZoneX);
            y = QUOTE(safeZoneY + RESUNITS_X * 4/3);
            w = QUOTE(RESUNITS_X * 30);
            h = QUOTE(RESUNITS_Y * 50);

            colorBorder[] = {1,1,1,1};

            colorBackground[] = {0.1,0.1,0.1,1};
            colorSelect[] = {1,0.5,0,1};
            colorMarked[] = {1,0.5,0,0.5};
            colorMarkedSelected[] = {1,0.5,0,1};

            sizeEx = QUOTE(RESUNITS_Y * 2);
            font = GUI_FONT_NORMAL;
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
                x = QUOTE(RESCENTRE_X - XHAIR / 2);
                y = QUOTE(RESCENTRE_Y - XHAIR * 4/3 / 2);
                w = QUOTE(XHAIR);
                h = QUOTE(XHAIR * 4/3);
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

            class BGRight: ACE_gui_staticBase {
                style = ST_CENTER;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
                y = QUOTE(safeZoneY);
                w = QUOTE(RESUNITS_X * 30);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class BGLeft: BGRight {
                x = QUOTE(safeZoneX);
            };

            class SpeedFrame: ACE_gui_staticBase {
                style = ST_FRAME;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 5);
                y = QUOTE(safeZoneY);
                w = QUOTE(RESUNITS_X * 5);
                h = QUOTE(COMPASS_H);
                shadow = 2;
                colorText[]={1,1,1,1};
            };

            class Speed: ACE_gui_staticBase {
                idc = 0;
                style = ST_CENTER;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 5);
                y = QUOTE(safeZoneY);
                w = QUOTE(RESUNITS_X * 5);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0,0,0,1};
                sizeEx = QUOTE(RESUNITS_Y * 2);
            };

            class FovFrame: SpeedFrame {
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 10.5);
            };

            class Fov: Speed {
                idc = 4;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 10.5);
            };

            class TimeAccFrame: SpeedFrame {
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 21.5);
            };

            class TimeAcc: Speed {
                idc = 5;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 21.5);
            };

            class FocusFrame: SpeedFrame {
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 16);
            };

            class Focus: Speed {
                idc = 6;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 16);
            };

            class NameFrame: SpeedFrame {
                x = QUOTE(safeZoneX);
                w = QUOTE(RESUNITS_X * 24.5);
            };

            class Name: Speed {
                idc = 1;
                x = QUOTE(safeZoneX);
                w = QUOTE(RESUNITS_X * 24.5);
            };

            class ModeFrame: SpeedFrame {
                x = QUOTE(safeZoneX + RESUNITS_X * 25);
            };

            class Mode: Speed {
                idc = 2;
                x = QUOTE(safeZoneX + RESUNITS_X * 25);
            };

            class TimeFrame: SpeedFrame {
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
                w = QUOTE(RESUNITS_X * 8);
            };

            class Time: Speed {
                idc = 3;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
                w = QUOTE(RESUNITS_X * 8);
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
                x = QUOTE(COMPASS_X);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class 0_90: ACE_gui_backgroundBase {
                idc = 1;
                x = QUOTE(RESCENTRE_X);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W / 2);
                h = QUOTE(COMPASS_H);
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture180_ca.paa";
            };

            class 90_180: 0_90 {
                idc = 2;
                x = QUOTE(RESCENTRE_X + COMPASS_W / 2);
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture270_ca.paa";
            };

            class 180_270: 0_90 {
                idc = 3;
                x = QUOTE(RESCENTRE_X + COMPASS_W);
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture0_ca.paa";
            };

            class 270_0: 0_90 {
                idc = 4;
                x = QUOTE(RESCENTRE_X + COMPASS_W * 1.5);
                text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture90_ca.paa";
            };

            class Post: ACE_gui_staticBase {
                style = ST_CENTER;
                x = QUOTE(COMPASS_X + COMPASS_W / 2);
                y = QUOTE(safeZoneY);
                w = QUOTE(PIXEL_X * 2);
                h = QUOTE(COMPASS_H);
                colorBackground[]={1,0,0,1};
            };

            class LeftBlocker: ACE_gui_staticBase {
                style = ST_CENTER;
                x = QUOTE(COMPASS_X - COMPASS_W / 2);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W / 2);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class RightBlocker: LeftBlocker {
                x = QUOTE(COMPASS_X + COMPASS_W);
            };

            class Frame: ACE_gui_staticBase {
                style = ST_FRAME;
                x = QUOTE(COMPASS_X);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W);
                h = QUOTE(COMPASS_H);
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
                x = QUOTE(RESCENTRE_X - HELP_W / 2);
                y = QUOTE(RESCENTRE_Y - HELP_H / 2);
                w = QUOTE(HELP_W);
                h = QUOTE(HELP_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };

            class Title: ACE_gui_staticBase {
                idc = 0;
                style = ST_CENTER;
                x = QUOTE(RESCENTRE_X - RESUNITS_X * 25);
                y = QUOTE(RESCENTRE_Y - (HELP_H / 2) + RESUNITS_Y * 3);
                w = QUOTE(RESUNITS_X * 50);
                h = QUOTE(RESUNITS_Y * 4);
                colorText[]={1,1,1,1};
                sizeEx = QUOTE(RESUNITS_Y * 4);
                text = "ACE Spectator Controls";
            };

            class LeftColumn1 {
                idc = 1;
                type = CT_STRUCTURED_TEXT;
                style = ST_LEFT;
                x = QUOTE(RESCENTRE_X - HELP_W / 2 + RESUNITS_X * 3);
                y = QUOTE(RESCENTRE_Y - (HELP_H / 2) + RESUNITS_Y * 10);
                w = QUOTE(RESUNITS_X * 16.75);
                h = QUOTE(RESUNITS_Y * 63);
                text = "";
                size = QUOTE(RESUNITS_Y * 2.5);
                colorBackground[] = {0,0,0,0};
            };

            class LeftColumn2: LeftColumn1 {
                idc = 2;
                x = QUOTE(RESCENTRE_X - HELP_W / 2 + RESUNITS_X * 19.75);
            };

            class RightColumn1: LeftColumn1 {
                idc = 3;
                x = QUOTE(RESCENTRE_X + HELP_W / 2 - RESUNITS_X * 3 - RESUNITS_X * 29.5);
            };

            class RightColumn2: LeftColumn1 {
                idc = 4;
                x = QUOTE(RESCENTRE_X + HELP_W / 2 - RESUNITS_X * 3 - RESUNITS_X * 11.75);
            };
        };
    };
};

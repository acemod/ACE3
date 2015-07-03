#define PIXEL_X (safeZoneWAbs / (getResolution select 0))
#define PIXEL_Y (safeZoneH / (getResolution select 1))
#define XHAIR RESUNITS_X * 4
#define COMPASS_W RESUNITS_X * 20
#define COMPASS_H COMPASS_W / 15
#define COMPASS_X RESCENTRE_X - COMPASS_W / 2
#define HELP_W RESUNITS_X * 75
#define HELP_H RESUNITS_Y * 75

class ace_spectator_overlay {

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

class ace_spectator_map {

    idd = 12202;
    enableSimulation = 1; 
    enableDisplay = 0;
    onLoad = "uiNameSpace setVariable ['ace_spectator_map', _this select 0]; ['Init', _this select 0] call ace_spectator_fnc_map";
    onUnload = "['Close', _this select 0] call ace_spectator_fnc_map";
    onKeyDown = "['KeyDown', _this] call ace_spectator_fnc_map";
    
    class controls {
        //changes stolen from ACE_map
        class Map {
            access = 0;
            idc = 1; 
            type = CT_MAP_MAIN;
            style = ST_PICTURE;
            default = 0;
            blinkingPeriod = 0; 

            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;

            sizeEx = GUI_GRID_CENTER_H;
            font = GUI_FONT_NORMAL;
            colorText[] = {0,0,0,1};
            text = "#(argb,8,8,3)color(1,1,1,1)"; 

            moveOnEdges = 1;

            ptsPerSquareSea =    5;
            ptsPerSquareTxt =    20;
            ptsPerSquareCLn =    10;
            ptsPerSquareExp =    10;
            ptsPerSquareCost =    10;

            ptsPerSquareFor =    9;
            ptsPerSquareForEdge =    9;
            ptsPerSquareRoad =    6;
            ptsPerSquareObj =    9;

            scaleMin = 0.001;
            scaleMax = 1.0;
            scaleDefault = 0.16;

            alphaFadeStartScale = 2;
            alphaFadeEndScale = 2;
            maxSatelliteAlpha = 0.5;
        
            colorBackground[] = {0.929412, 0.929412, 0.929412, 1.0};
            colorOutside[] = {0.929412, 0.929412, 0.929412, 1.0};
            colorSea[] = {0.4,0.6,0.8,0.5}; 
            colorForest[] = {0.6, 0.8, 0.2, 0.25};
            colorForestBorder[] = {0.6,0.8,0.4,1}; 
            colorRocks[] = {0.50, 0.50, 0.50, 0.50};  
            colorRocksBorder[] = {0,0,0,1};
            colorLevels[] = {0.0, 0.0, 0.0, 1.0};
            colorMainCountlines[] = {0.858824, 0, 0,1};
            colorCountlines[] = {0.647059, 0.533333, 0.286275, 1};
            colorMainCountlinesWater[] = {0.5,0.6,0.7,0.6};
            colorCountlinesWater[] = {0.5,0.6,0.7,0.3};
            colorPowerLines[] = {0.1,0.1,0.1,1};
            colorRailWay[] = {0.8,0.2,0,1};
            colorNames[] = {1.1,0.1,1.1,0.9};
            colorInactive[] = {1,1,0,0.5};
            colorTracks[] = {0.2,0.13,0,1};
            colorTracksFill[] = {1,0.88,0.65,0.3};
            colorRoads[] = {0.2,0.13,0,1};
            colorRoadsFill[] = {1,0.88,0.65,1};
            colorMainRoads[] = {0.0,0.0,0.0,1};
            colorMainRoadsFill[] = {0.94,0.69,0.2,1};
            colorGrid[] = {0.05,0.1,0,0.6};
            colorGridMap[] = {0.05,0.1,0,0.4};

            fontLabel="PuristaMedium";
            sizeExLabel="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            fontGrid="TahomaB";
            sizeExGrid = 0.032;
            fontUnits="TahomaB";
            sizeExUnits="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            fontNames="EtelkaNarrowMediumPro";
            sizeExNames="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
            fontInfo="PuristaMedium";
            sizeExInfo="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            fontLevel="TahomaB";
            sizeExLevel=0.03;
            showCountourInterval = 1;

            class Task {
                icon = "#(argb,8,8,3)color(1,1,1,1)";
                color[] = {1,1,0,1};

                iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
                colorCreated[] = {0,0,0,1};

                iconCanceled = "#(argb,8,8,3)color(1,1,1,1)";
                colorCanceled[] = {0,0,0,0.5};

                iconDone = "#(argb,8,8,3)color(1,1,1,1)";
                colorDone[] = {0,1,0,1};

                iconFailed = "#(argb,8,8,3)color(1,1,1,1)";
                colorFailed[] = {1,0,0,1};

                size = 8;
                importance = 1;
                coefMin = 1;
                coefMax = 1;
            };
            class ActiveMarker { //includes icons spawned by drawIcon
                color[] = {0,0,0,1};
                size = 2;
                coefMin = 1; //make sure icon doesnt scale
            };
            class Waypoint {
                coefMax = 1;
                coefMin = 4;
                color[] = {0,0,0,1};
                icon = "#(argb,8,8,3)color(0,0,0,1)";
                importance = 1;
                size = 2;
            };
            class WaypointCompleted: Waypoint{};
            class CustomMark: Waypoint{};
            class Command: Waypoint{};
            class Bush {
                icon = "";
                color[] = {0.450000, 0.640000, 0.330000, 0.0};
                size = 14;
                importance = "0.2 * 14 * 0.05";
                coefMin = 0.250000;
                coefMax = 4;
            };
            class Rock: Waypoint{color[]={0.45,0.64,0.33,0.4}; importance="0.5 * 12 * 0.05";};
            class SmallTree {
                icon = "";
                color[] = {0.450000, 0.640000, 0.330000, 0.0};
                size = 12;
                importance = "0.6 * 12 * 0.05";
                coefMin = 0.250000;
                coefMax = 4;
            };
            class Tree {
                icon = "";
                color[] = {0.450000, 0.640000, 0.330000, 0.0};
                size = 12;
                importance = "0.9 * 16 * 0.05";
                coefMin = 0.250000;
                coefMax = 4;
            };
            class Legend {
                x = SafeZoneX+SafeZoneW-.340;
                y = SafeZoneY+SafeZoneH-.152;
                font = "PuristaMedium";
                w = .340;
                h = .152;
                sizeEx = 0.039210;
                colorBackground[] = {0.906000, 0.901000, 0.880000, 0.5};
                color[] = {0, 0, 0, 0.75};
            };
            class BusStop: Waypoint{};
            class FuelStation: Waypoint{};
            class Hospital: Waypoint{};
            class Church: Waypoint{};
            class Lighthouse: Waypoint{};
            class Power: Waypoint{};
            class PowerSolar: Waypoint{};
            class PowerWave: Waypoint{};
            class PowerWind: Waypoint{};
            class Quay: Waypoint{};
            class Transmitter: Waypoint{};
            class Watertower: Waypoint{};
            class Cross: Waypoint{};
            class Chapel: Waypoint{};
            class Shipwreck: Waypoint{};
            class Bunker: Waypoint{};
            class Fortress: Waypoint{};
            class Fountain: Waypoint{};
            class Ruin: Waypoint{};
            class Stack: Waypoint{};
            class Tourism: Waypoint{};
            class ViewTower: Waypoint{};
        };
    };
};

class RscTitles {
    class ace_spectator_crosshair {

        onLoad = "uiNamespace setVariable ['ace_spectator_crosshair', _this select 0]";
        
        idd=-1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {
        
            class X: vip_rsc_picture {
                idc = 0;
                x = QUOTE(RESCENTRE_X - XHAIR / 2);
                y = QUOTE(RESCENTRE_Y - XHAIR * 4/3 / 2);
                w = QUOTE(XHAIR);
                h = QUOTE(XHAIR * 4/3);
                text = "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa";
                colorText[] = {1,1,1,0.8};
            };
        };
    };

    class ace_spectator_status {

        onLoad = "uiNamespace setVariable ['ace_spectator_status', _this select 0]; [_this select 0] call ace_spectator_fnc_status";
        idd = -1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {
        
            class BGRight: vip_rsc_box {
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
                y = QUOTE(safeZoneY);
                w = QUOTE(RESUNITS_X * 30);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };
            
            class BGLeft: BGRight {
                x = QUOTE(safeZoneX);
            };
            
            class SpeedFrame: vip_rsc_frame {
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 5);
                y = QUOTE(safeZoneY);
                w = QUOTE(RESUNITS_X * 5);
                h = QUOTE(COMPASS_H);
                shadow = 2;
                colorText[]={1,1,1,1};
            };
            
            class Speed: vip_rsc_text {
                idc = 0;
                style = ST_CENTER;
                x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 5);
                y = QUOTE(safeZoneY);
                w = QUOTE(RESUNITS_X * 5);
                h = QUOTE(COMPASS_H);
                colorText[]={1,1,1,1};
                sizeEx = QUOTE(RESUNITS_Y * 2);
                font = GUI_FONT_NORMAL;
                text = "";
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

    class ace_spectator_compass {

        onLoad = "uiNamespace setVariable ['ace_spectator_compass', _this select 0]";
        onUnload = "";
        idd=-1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {
            
            class BG: vip_rsc_box {
                x = QUOTE(COMPASS_X);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };
            
            class 0_90: vip_rsc_picture {
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
            
            class Post: vip_rsc_box {
                x = QUOTE(COMPASS_X + COMPASS_W / 2);
                y = QUOTE(safeZoneY);
                w = QUOTE(PIXEL_X * 2);
                h = QUOTE(COMPASS_H);
                colorBackground[]={1,0,0,1};
            };
            
            class LeftBlocker: vip_rsc_box {
                x = QUOTE(COMPASS_X - COMPASS_W / 2);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W / 2);
                h = QUOTE(COMPASS_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };
            
            class RightBlocker: LeftBlocker {
                x = QUOTE(COMPASS_X + COMPASS_W);
            };
            
            class Frame: vip_rsc_frame {
                x = QUOTE(COMPASS_X);
                y = QUOTE(safeZoneY);
                w = QUOTE(COMPASS_W);
                h = QUOTE(COMPASS_H);
                shadow=2;
                colorText[]={1,1,1,1};
            };
        };
    };

    class ace_spectator_help {

        onLoad = "uiNamespace setVariable ['ace_spectator_help', _this select 0]; ['Help', _this select 0] call ace_spectator_fnc_camera";
        idd = -1;
        movingEnable=0;
        fadein=0;
        fadeout=0;
        duration=1e+011;

        class controls {
        
            class BG: vip_rsc_box {
                idc = -1;
                x = QUOTE(RESCENTRE_X - HELP_W / 2);
                y = QUOTE(RESCENTRE_Y - HELP_H / 2);
                w = QUOTE(HELP_W);
                h = QUOTE(HELP_H);
                colorBackground[] = {0.1,0.1,0.1,1};
            };
            
            class Title: vip_rsc_text {
                idc = 0;
                style = ST_CENTER;
                x = QUOTE(RESCENTRE_X - RESUNITS_X * 25);
                y = QUOTE(RESCENTRE_Y - (HELP_H / 2) + RESUNITS_Y * 3);
                w = QUOTE(RESUNITS_X * 50);
                h = QUOTE(RESUNITS_Y * 4);
                colorText[]={1,1,1,1};
                sizeEx = QUOTE(RESUNITS_Y * 4);
                font = GUI_FONT_NORMAL;
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
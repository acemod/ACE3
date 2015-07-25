// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_HITZONES         17
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102
#define CT_ITEMSLOT         103
#define CT_CHECKBOX         77

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0
#define ST_UPPERCASE      0xC0
#define ST_LOWERCASE      0xD0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4
#define MB_ERROR_DIALOG   8

// Fonts
#define GUI_FONT_NORMAL            PuristaMedium
#define GUI_FONT_BOLD            PuristaSemibold
#define GUI_FONT_THIN            PuristaLight
#define GUI_FONT_MONO            EtelkaMonospacePro
#define GUI_FONT_NARROW            EtelkaNarrowMediumPro
#define GUI_FONT_CODE            LucidaConsoleB
#define GUI_FONT_SYSTEM            TahomaB

//colours

#define COLOUR_GUI_TEXT {"profilenamespace getvariable ['GUI_TITLETEXT_RGB_R',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_G',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_B',1]", "profilenamespace getvariable ['GUI_TITLETEXT_RGB_A',1]"}

#define COLOUR_GUI_BG {"profilenamespace getvariable ['GUI_BCG_RGB_R',0.8]", "profilenamespace getvariable ['GUI_BCG_RGB_G',0.8]","profilenamespace getvariable ['GUI_BCG_RGB_B',0.8]","profilenamespace getvariable ['GUI_BCG_RGB_A',0.8]"}

#define COLOUR_IGUI_TEXT {"profilenamespace getvariable ['IGUI_TEXT_RGB_R',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_G',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_B',1]", "profilenamespace getvariable ['IGUI_TEXT_RGB_A',1]"}

#define COLOUR_IGUI_BG {"profilenamespace getvariable ['IGUI_BCG_RGB_R',0.8]", "profilenamespace getvariable ['IGUI_BCG_RGB_G',0.5]","profilenamespace getvariable ['IGUI_BCG_RGB_B',0]","profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8]"}

#define COLOUR_IGUI_WARN {"profilenamespace getvariable ['IGUI_TEXT_WARNING_R',0.8]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_G',0.5]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_B',0]", "profilenamespace getvariable ['IGUI_TEXT_WARNING_A',0.8]"}

// Grids
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W        (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H        (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X        (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y        (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

#define RESUNITS_X (safeZoneW / 100)
#define RESUNITS_Y (safeZoneH / 100)
#define RESCENTRE_X safeZoneX + safeZoneW / 2
#define RESCENTRE_Y safeZoneY + safeZoneH / 2

#define Q(s) #s

class vip_rsc_picture {
    
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
};

class vip_rsc_text {
    
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = 0.08;
    lineSpacing = 1;
    text = "";
    fixedWidth = 0;
    moving = 0;
};

class vip_rsc_box {

    idc=-1;
    type = CT_STATIC;
    style = ST_CENTER;
    text = "";
    font = "TahomaB";
    sizeEx = 0.04;

    colorBackground[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
};

class vip_rsc_button {

    access = 0;
    type = CT_BUTTON;
    style = ST_LEFT; 
    default = 0;
    blinkingPeriod = 0;

    x = 0 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X;
    y = 0 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
    w = 6 * GUI_GRID_CENTER_W;
    h = 1 * GUI_GRID_CENTER_H;

    colorBackground[] = {0.8,0.8,0.8,1};
    colorBackgroundDisabled[] = {0.8,0.8,0.8, 0.25};
    colorBackgroundActive[] = {1,1,1,1};
    colorFocused[] = {0.8,0.8,0.8,1};

    text = ""; 
    sizeEx = 1 * GUI_GRID_CENTER_H;
    font = GUI_FONT_NORMAL;
    shadow = 1;
    colorText[] = {0,0,0,1};
    colorDisabled[] = {0,0,0,0.25};

    borderSize = 0.0;
    colorBorder[] = {1,1,1,1}; 

    colorShadow[] = {0,0,0,0.0};
    offsetX = 0.0075;
    offsetY = 0.01;
    offsetPressedX = 0.000; 
    offsetPressedY = 0.00;

    period = 0; 
    periodFocus = 0;
    periodOver = 0.5;

    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1}; 
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};

    //onButtonClick = "false";
};

class vip_rsc_listbox {

    access = 0;
    idc = 25;
    type = CT_COMBO;
    style = ST_LEFT + LB_TEXTURES; 
    default = 0; 
    blinkingPeriod = 0;

    x = 12 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; 
    y = 4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y;
    w = 9 * GUI_GRID_CENTER_W; 
    h = 1 * GUI_GRID_CENTER_H;

    colorBackground[] = {0.2,0.2,0.2,1}; 
    colorSelectBackground[] = {1,0.5,0,1};

    sizeEx = GUI_GRID_CENTER_H; 
    font = GUI_FONT_NORMAL; 
    shadow = 0; 
    colorText[] = {1,1,1,1}; 
    colorDisabled[] = {1,1,1,0.5};
    colorSelect[] = {1,1,1,1}; 

    pictureColor[] = {1,0.5,0,1};
    pictureColorSelect[] = {1,1,1,1}; 
    pictureColorDisabled[] = {1,1,1,0.5};

    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";

    wholeHeight = 8 * GUI_GRID_CENTER_H;
    maxHistoryDelay = 1;

    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1}; 

    class ComboScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.01; 

        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; 
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; 
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

        color[] = {1,1,1,1};
    };

    onLBSelChanged = "";
};

class vip_rsc_frame {
    type = 0;
    idc = -1;
    style=ST_FRAME;
    shadow=2;
    colorBackground[]={0,0,0,0};
    colorText[]={1,1,1,1};
    font="PuristaMedium";
    sizeEx=0.02;
    text="";
};

class vip_rsc_map {
    moveOnEdges=1;
    x="SafeZoneXAbs";
    y="SafeZoneY + 1.5 *                     (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w="SafeZoneWAbs";
    h="SafeZoneH - 1.5 *                     (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    shadow=0;
    ptsPerSquareSea=5;
    ptsPerSquareTxt=20;
    ptsPerSquareCLn=10;
    ptsPerSquareExp=10;
    ptsPerSquareCost=10;
    ptsPerSquareFor=9;
    ptsPerSquareForEdge=9;
    ptsPerSquareRoad=6;
    ptsPerSquareObj=9;
    showCountourInterval=0;
    scaleMin=0.001;
    scaleMax=1;
    scaleDefault=0.16;
    maxSatelliteAlpha=0.85000002;
    alphaFadeStartScale=2;
    alphaFadeEndScale=2;
    colorBackground[]={0.96899998,0.95700002,0.949,1};
    colorSea[]={0.46700001,0.63099998,0.85100001,0.5};
    colorForest[]={0.62400001,0.77999997,0.38800001,0.5};
    colorForestBorder[]={0,0,0,0};
    colorRocks[]={0,0,0,0.30000001};
    colorRocksBorder[]={0,0,0,0};
    colorLevels[]={0.28600001,0.177,0.093999997,0.5};
    colorMainCountlines[]={0.57200003,0.354,0.18799999,0.5};
    colorCountlines[]={0.57200003,0.354,0.18799999,0.25};
    colorMainCountlinesWater[]={0.491,0.57700002,0.70200002,0.60000002};
    colorCountlinesWater[]={0.491,0.57700002,0.70200002,0.30000001};
    colorPowerLines[]={0.1,0.1,0.1,1};
    colorRailWay[]={0.80000001,0.2,0,1};
    colorNames[]={0.1,0.1,0.1,0.89999998};
    colorInactive[]={1,1,1,0.5};
    colorOutside[]={0,0,0,1};
    colorTracks[]={0.83999997,0.75999999,0.64999998,0.15000001};
    colorTracksFill[]={0.83999997,0.75999999,0.64999998,1};
    colorRoads[]={0.69999999,0.69999999,0.69999999,1};
    colorRoadsFill[]={1,1,1,1};
    colorMainRoads[]={0.89999998,0.5,0.30000001,1};
    colorMainRoadsFill[]={1,0.60000002,0.40000001,1};
    colorGrid[]={0.1,0.1,0.1,0.60000002};
    colorGridMap[]={0.1,0.1,0.1,0.60000002};
    fontLabel="PuristaMedium";
    sizeExLabel="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontGrid="TahomaB";
    sizeExGrid=0.02;
    fontUnits="TahomaB";
    sizeExUnits="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontNames="EtelkaNarrowMediumPro";
    sizeExNames="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
    fontInfo="PuristaMedium";
    sizeExInfo="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontLevel="TahomaB";
    sizeExLevel=0.02;
    text="#(argb,8,8,3)color(1,1,1,1)";
    class Legend
    {
        x="SafeZoneX +                     (            ((safezoneW / safezoneH) min 1.2) / 40)";
        y="SafeZoneY + safezoneH - 4.5 *                     (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w="10 *                     (            ((safezoneW / safezoneH) min 1.2) / 40)";
        h="3.5 *                     (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font="PuristaMedium";
        sizeEx="(            (            (            ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        colorBackground[]={1,1,1,0.5};
        color[]={0,0,0,1};
    };
    class Task
    {
        icon="\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated="\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled="\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone="\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed="\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        color[]=
        {
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
        };
        colorCreated[]={1,1,1,1};
        colorCanceled[]={0.69999999,0.69999999,0.69999999,1};
        colorDone[]={0.69999999,1,0.30000001,1};
        colorFailed[]={1,0.30000001,0.2,1};
        size=27;
        importance=1;
        coefMin=1;
        coefMax=1;
    };
    class Waypoint
    {
        icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        color[]={0,0,0,1};
    };
    class WaypointCompleted
    {
        icon="\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
        color[]={0,0,0,1};
    };
    class CustomMark
    {
        icon="\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size=24;
        importance=1;
        coefMin=1;
        coefMax=1;
        color[]={0,0,0,1};
    };
    class Command
    {
        icon="\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size=18;
        importance=1;
        coefMin=1;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class Bush
    {
        icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        color[]={0.44999999,0.63999999,0.33000001,0.40000001};
        size="14/2";
        importance="0.2 * 14 * 0.05 * 0.05";
        coefMin=0.25;
        coefMax=4;
    };
    class Rock
    {
        icon="\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        color[]={0.1,0.1,0.1,0.80000001};
        size=12;
        importance="0.5 * 12 * 0.05";
        coefMin=0.25;
        coefMax=4;
    };
    class SmallTree
    {
        icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        color[]={0.44999999,0.63999999,0.33000001,0.40000001};
        size=12;
        importance="0.6 * 12 * 0.05";
        coefMin=0.25;
        coefMax=4;
    };
    class Tree
    {
        icon="\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        color[]={0.44999999,0.63999999,0.33000001,0.40000001};
        size=12;
        importance="0.9 * 16 * 0.05";
        coefMin=0.25;
        coefMax=4;
    };
    class busstop
    {
        icon="\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class fuelstation
    {
        icon="\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class hospital
    {
        icon="\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class church
    {
        icon="\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class lighthouse
    {
        icon="\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class power
    {
        icon="\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class powersolar
    {
        icon="\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class powerwave
    {
        icon="\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class powerwind
    {
        icon="\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class quay
    {
        icon="\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class transmitter
    {
        icon="\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class watertower
    {
        icon="\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={1,1,1,1};
    };
    class Cross
    {
        icon="\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={0,0,0,1};
    };
    class Chapel
    {
        icon="\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={0,0,0,1};
    };
    class Shipwreck
    {
        icon="\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
        size=24;
        importance=1;
        coefMin=0.85000002;
        coefMax=1;
        color[]={0,0,0,1};
    };
    class Bunker
    {
        icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size=14;
        importance="1.5 * 14 * 0.05";
        coefMin=0.25;
        coefMax=4;
        color[]={0,0,0,1};
    };
    class Fortress
    {
        icon="\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size=16;
        importance="2 * 16 * 0.05";
        coefMin=0.25;
        coefMax=4;
        color[]={0,0,0,1};
    };
    class Fountain
    {
        icon="\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size=11;
        importance="1 * 12 * 0.05";
        coefMin=0.25;
        coefMax=4;
        color[]={0,0,0,1};
    };
    class Ruin
    {
        icon="\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size=16;
        importance="1.2 * 16 * 0.05";
        coefMin=1;
        coefMax=4;
        color[]={0,0,0,1};
    };
    class Stack
    {
        icon="\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size=20;
        importance="2 * 16 * 0.05";
        coefMin=0.89999998;
        coefMax=4;
        color[]={0,0,0,1};
    };
    class Tourism
    {
        icon="\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size=16;
        importance="1 * 16 * 0.05";
        coefMin=0.69999999;
        coefMax=4;
        color[]={0,0,0,1};
    };
    class ViewTower
    {
        icon="\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size=16;
        importance="2.5 * 16 * 0.05";
        coefMin=0.5;
        coefMax=4;
        color[]={0,0,0,1};
    };
};
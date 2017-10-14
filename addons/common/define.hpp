
#ifndef ACE_DEFINE_H
#define ACE_DEFINE_H
// define.hpp

#define true 1
#define false 0

#define CT_STATIC     0
#define CT_BUTTON     1
#define CT_EDIT       2
#define CT_SLIDER     3
#define CT_COMBO      4
#define CT_LISTBOX      5
#define CT_TOOLBOX      6
#define CT_CHECKBOXES   7
#define CT_PROGRESS     8
#define CT_HTML       9
#define CT_STATIC_SKEW    10
#define CT_ACTIVETEXT   11
#define CT_TREE       12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU   14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC     40
#define CT_XBUTTON      41
#define CT_XLISTBOX     42
#define CT_XSLIDER      43
#define CT_XCOMBO     44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT     80
#define CT_OBJECT_ZOOM    81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK    98
#define CT_ANIMATED_USER  99
#define CT_MAP        100
#define CT_MAP_MAIN     101
#define CT_LISTNBOX     102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20
#define FONT_ACE       "RobotoCondensed"

class ACE_gui_backgroundBase {
  type = CT_STATIC;
  idc = -1;
  style = ST_PICTURE;
  colorBackground[] = {0,0,0,0};
  colorText[] = {1, 1, 1, 1};
  font = FONT_ACE;
  text = "";
  sizeEx = 0.032;
};
class ACE_gui_editBase
{
    type = 2;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] =
    {
            0,
            0,
            0,
            1
    };
    colorText[] =
    {
            0.95,
            0.95,
            0.95,
            1
    };
    colorSelection[] =
    {
            "(profilenamespace getVariable ['GUI_BCG_RGB_R',0.3843])",
            "(profilenamespace getVariable ['GUI_BCG_RGB_G',0.7019])",
            "(profilenamespace getVariable ['GUI_BCG_RGB_B',0.8862])",
            1
    };
    autocomplete = "";
    text = "";
    size = 0.2;
    style = "0x00 + 0x40";
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    colorDisabled[] =
    {
            1,
            1,
            1,
            0.25
    };
};



class ACE_gui_buttonBase {
  idc = -1;
  type = 16;
  style = ST_LEFT;
  text = "";
  action = "";
  x = 0.0;
  y = 0.0;
  w = 0.25;
  h = 0.04;
  size = 0.03921;
  sizeEx = 0.03921;
  color[] = {1.0, 1.0, 1.0, 1};
  color2[] = {1.0, 1.0, 1.0, 1};
  colorBackground[] = {1,1,1,0.95};
  colorbackground2[] = {1,1,1,0.95};
  colorDisabled[] = {1,1,1,0.6};
  colorFocused[] = {1,1,1,1};
  colorBackgroundFocused[] = {1,1,1,1};
  periodFocus = 1.2;
  periodOver = 0.8;
  default = false;
  class HitZone {
    left = 0.00;
    top = 0.00;
    right = 0.00;
    bottom = 0.00;
  };

  class ShortcutPos {
    left = 0.00;
    top = 0.00;
    w = 0.00;
    h = 0.00;
  };

  class TextPos {
    left = 0.002;
    top = 0.0004;
    right = 0.0;
    bottom = 0.00;
  };
  textureNoShortcut = "";
  animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
  animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
  animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
  animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
  animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
  animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
  period = 0.5;
  font = FONT_ACE;
  soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
  soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.0,0};
  soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.07,1};
  soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
  class Attributes {
    font = FONT_ACE;
    color = "#E5E5E5";
    align = "center";
    shadow = "true";
  };
  class AttributesImage {
    font = FONT_ACE;
    color = "#E5E5E5";
    align = "left";
    shadow = "true";
  };
};

class ACE_gui_RscProgress {
  type = 8;
  style = 0;
  colorFrame[] = {1,1,1,0.7};
  colorBar[] = {1,1,1,0.7};
  texture = "#(argb,8,8,3)color(1,1,1,0.7)";
  x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
  y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
  w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
  h = "0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};


class ACE_gui_staticBase {
  idc = -1;
  type = CT_STATIC;
  x = 0.0;
  y = 0.0;
  w = 0.183825;
  h = 0.104575;
  style = ST_LEFT;
  font = FONT_ACE;
  sizeEx = 0.03921;
  colorText[] = {0.95, 0.95, 0.95, 1.0};
  colorBackground[] = {0, 0, 0, 0};
  text = "";
};

class RscListBox;
class ACE_gui_listBoxBase : RscListBox{
  type = CT_LISTBOX;
  style = ST_MULTI;
  font = FONT_ACE;
  sizeEx = 0.03921;
  color[] = {1, 1, 1, 1};
  colorText[] = {0.543, 0.5742, 0.4102, 1.0};
  colorScrollbar[] = {0.95, 0.95, 0.95, 1};
  colorSelect[] = {0.95, 0.95, 0.95, 1};
  colorSelect2[] = {0.95, 0.95, 0.95, 1};
  colorSelectBackground[] = {0, 0, 0, 1};
  colorSelectBackground2[] = {0.543, 0.5742, 0.4102, 1.0};
  colorDisabled[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])", 0.25};
  period = 1.2;
  rowHeight = 0.03;
  colorBackground[] = {0, 0, 0, 1};
  maxHistoryDelay = 1.0;
  autoScrollSpeed = -1;
  autoScrollDelay = 5;
  autoScrollRewind = 0;
  soundSelect[] = {"",0.1,1};
  soundExpand[] = {"",0.1,1};
  soundCollapse[] = {"",0.1,1};
  class ListScrollBar {
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    autoScrollDelay = 5;
    autoScrollEnabled = 0;
    autoScrollRewind = 0;
    autoScrollSpeed = -1;
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    height = 0;
    scrollSpeed = 0.06;
    shadow = 0;
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    width = 0;
  };
  class ScrollBar {
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.3};
    thumb = "";
    arrowFull = "";
    arrowEmpty = "";
    border = "";
  };
};


class ACE_gui_listNBox {
  type = CT_LISTNBOX;// 102;
  style =ST_MULTI;
  w = 0.4;
  h = 0.4;
  font = FONT_ACE;
  sizeEx = 0.031;

  autoScrollSpeed = -1;
  autoScrollDelay = 5;
  autoScrollRewind = 0;
  arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
  arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
  columns[] = {0.0};
  color[] = {1, 1, 1, 1};

  rowHeight = 0.03;
  colorBackground[] = {0, 0, 0, 0.2};
  colorText[] = {1,1, 1, 1.0};
  colorScrollbar[] = {0.95, 0.95, 0.95, 1};
  colorSelect[] = {0.95, 0.95, 0.95, 1};
  colorSelect2[] = {0.95, 0.95, 0.95, 1};
  colorSelectBackground[] = {0, 0, 0, 0.0};
  colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.5};
  colorActive[] = {0,0,0,1};
  colorDisabled[] = {0,0,0,0.3};
  rows = 1;

 drawSideArrows = 0;
 idcLeft = -1;
 idcRight = -1;
 maxHistoryDelay = 1;
 soundSelect[] = {"", 0.1, 1};
 period = 1;
 shadow = 2;
 class ScrollBar {
  arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
  arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
  border = "#(argb,8,8,3)color(1,1,1,1)";
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.3};
  thumb = "#(argb,8,8,3)color(1,1,1,1)";
 };
   class ListScrollBar {
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    autoScrollDelay = 5;
    autoScrollEnabled = 0;
    autoScrollRewind = 0;
    autoScrollSpeed = -1;
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    height = 0;
    scrollSpeed = 0.06;
    shadow = 0;
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    width = 0;
  };
};


class RscCombo;
class ACE_gui_comboBoxBase: RscCombo {
 idc = -1;
 type = 4;
 style = "0x10 + 0x200";
 x = 0;
 y = 0;
 w = 0.3;
 h = 0.035;
 color[] = {0,0,0,0.6};
 colorActive[] = {1,0,0,1};
 colorBackground[] = {0,0,0,1};
 colorDisabled[] = {1,1,1,0.25};
 colorScrollbar[] = {1,0,0,1};
 colorSelect[] = {0,0,0,1};
 colorSelectBackground[] = {1,1,1,0.7};
 colorText[] = {1,1,1,1};

 arrowEmpty = "";
 arrowFull = "";
 wholeHeight = 0.45;
 font = FONT_ACE;
 sizeEx = 0.031;
 soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
 soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
 soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
 maxHistoryDelay = 1.0;
 class ScrollBar
 {
  color[] = {0.3,0.3,0.3,0.6};
  colorActive[] = {0.3,0.3,0.3,1};
  colorDisabled[] = {0.3,0.3,0.3,0.3};
  thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
  arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
  arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
  border = "";
 };
  class ComboScrollBar {
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    autoScrollDelay = 5;
    autoScrollEnabled = 0;
    autoScrollRewind = 0;
    autoScrollSpeed = -1;
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    color[] = {0.3,0.3,0.3,0.6};
    colorActive[] = {0.3,0.3,0.3,1};
    colorDisabled[] = {0.3,0.3,0.3,0.3};
    height = 0;
    scrollSpeed = 0.06;
    shadow = 0;
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    width = 0;
  };
};



class ACE_gui_mapBase {
 moveOnEdges = 1;
 x = "SafeZoneXAbs";
 y = "SafeZoneY + 1.5 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
 w = "SafeZoneWAbs";
 h = "SafeZoneH - 1.5 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
 type = 100; // Use 100 to hide markers
 style = 48;
 shadow = 0;

 ptsPerSquareSea = 5;
 ptsPerSquareTxt = 3;
 ptsPerSquareCLn = 10;
 ptsPerSquareExp = 10;
 ptsPerSquareCost = 10;
 ptsPerSquareFor = 9;
 ptsPerSquareForEdge = 9;
 ptsPerSquareRoad = 6;
 ptsPerSquareObj = 9;
 showCountourInterval = 0;
 scaleMin = 0.001;
 scaleMax = 1.0;
 scaleDefault = 0.16;
 maxSatelliteAlpha = 0.85;
 alphaFadeStartScale = 0.35;
 alphaFadeEndScale = 0.4;
 colorBackground[] = {0.969,0.957,0.949,1.0};
 colorSea[] = {0.467,0.631,0.851,0.5};
 colorForest[] = {0.624,0.78,0.388,0.5};
 colorForestBorder[] = {0.0,0.0,0.0,0.0};
 colorRocks[] = {0.0,0.0,0.0,0.3};
 colorRocksBorder[] = {0.0,0.0,0.0,0.0};
 colorLevels[] = {0.286,0.177,0.094,0.5};
 colorMainCountlines[] = {0.572,0.354,0.188,0.5};
 colorCountlines[] = {0.572,0.354,0.188,0.25};
 colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
 colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
 colorPowerLines[] = {0.1,0.1,0.1,1.0};
 colorRailWay[] = {0.8,0.2,0.0,1.0};
 colorNames[] = {0.1,0.1,0.1,0.9};
 colorInactive[] = {1.0,1.0,1.0,0.5};
 colorOutside[] = {0.0,0.0,0.0,1.0};
 colorTracks[] = {0.84,0.76,0.65,0.15};
 colorTracksFill[] = {0.84,0.76,0.65,1.0};
 colorRoads[] = {0.7,0.7,0.7,1.0};
 colorRoadsFill[] = {1.0,1.0,1.0,1.0};
 colorMainRoads[] = {0.9,0.5,0.3,1.0};
 colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
 colorGrid[] = {0.1,0.1,0.1,0.6};
 colorGridMap[] = {0.1,0.1,0.1,0.6};
 colorText[] = {1, 1, 1, 0.85};
font = "RobotoCondensed";
sizeEx = 0.0270000;
stickX[] = {0.20, {"Gamma", 1.00, 1.50} };
stickY[] = {0.20, {"Gamma", 1.00, 1.50} };
onMouseButtonClick = "";
onMouseButtonDblClick = "";

 fontLabel = "RobotoCondensed";
 sizeExLabel = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
 fontGrid = "TahomaB";
 sizeExGrid = 0.02;
 fontUnits = "TahomaB";
 sizeExUnits = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
 fontNames = "RobotoCondensed";
 sizeExNames = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
 fontInfo = "RobotoCondensed";
 sizeExInfo = "(      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
 fontLevel = "TahomaB";
 sizeExLevel = 0.02;
 text = "#(argb,8,8,3)color(1,1,1,1)";
 class ActiveMarker {
  color[] = {0.30, 0.10, 0.90, 1.00};
  size = 50;
 };
 class Legend
 {
  x = "SafeZoneX +          (     ((safezoneW / safezoneH) min 1.2) / 40)";
  y = "SafeZoneY + safezoneH - 4.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  w = "10 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
  h = "3.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  font = "RobotoCondensed";
  sizeEx = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
  colorBackground[] = {1,1,1,0.5};
  color[] = {0,0,0,1};
 };
 class Task
 {
  icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
  iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
  iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
  iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
  iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
  color[] = {"(profilenamespace getVariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getVariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getVariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"};
  colorCreated[] = {1,1,1,1};
  colorCanceled[] = {0.7,0.7,0.7,1};
  colorDone[] = {0.7,1,0.3,1};
  colorFailed[] = {1,0.3,0.2,1};
  size = 27;
  importance = 1;
  coefMin = 1;
  coefMax = 1;
 };
 class Waypoint
 {
  icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
  color[] = {0,0,0,1};
 size = 20;
 importance = "1.2 * 16 * 0.05";
 coefMin = 0.900000;
 coefMax = 4;
 };
 class WaypointCompleted
 {
  icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
  color[] = {0,0,0,1};
   size = 20;
 importance = "1.2 * 16 * 0.05";
 coefMin = 0.900000;
 coefMax = 4;
 };
 class CustomMark
 {
  icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
  size = 24;
  importance = 1;
  coefMin = 1;
  coefMax = 1;
  color[] = {0,0,0,1};
 };
 class Command
 {
  icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
  size = 18;
  importance = 1;
  coefMin = 1;
  coefMax = 1;
  color[] = {1,1,1,1};
 };
 class Bush
 {
  icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
  color[] = {0.45,0.64,0.33,0.4};
  size = "14/2";
  importance = "0.2 * 14 * 0.05 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
 };
 class Rock
 {
  icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
  color[] = {0.1,0.1,0.1,0.8};
  size = 12;
  importance = "0.5 * 12 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
 };
 class SmallTree
 {
  icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
  color[] = {0.45,0.64,0.33,0.4};
  size = 12;
  importance = "0.6 * 12 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
 };
 class Tree
 {
  icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
  color[] = {0.45,0.64,0.33,0.4};
  size = 12;
  importance = "0.9 * 16 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
 };
 class busstop
 {
  icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class fuelstation
 {
  icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class hospital
 {
  icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class church
 {
  icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class lighthouse
 {
  icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class power
 {
  icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class powersolar
 {
  icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class powerwave
 {
  icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class powerwind
 {
  icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class quay
 {
  icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class shipwreck
 {
  icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class transmitter
 {
  icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class watertower
 {
  icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {1,1,1,1};
 };
 class Cross
 {
  icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {0,0,0,1};
 };
 class Chapel
 {
  icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
  size = 24;
  importance = 1;
  coefMin = 0.85;
  coefMax = 1.0;
  color[] = {0,0,0,1};
 };
 class Bunker
 {
  icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
  size = 14;
  importance = "1.5 * 14 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
 class Fortress
 {
  icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
  size = 16;
  importance = "2 * 16 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
 class Fountain
 {
  icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
  size = 11;
  importance = "1 * 12 * 0.05";
  coefMin = 0.25;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
 class Ruin
 {
  icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
  size = 16;
  importance = "1.2 * 16 * 0.05";
  coefMin = 1;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
 class Stack
 {
  icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
  size = 20;
  importance = "2 * 16 * 0.05";
  coefMin = 0.9;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
 class Tourism
 {
  icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
  size = 16;
  importance = "1 * 16 * 0.05";
  coefMin = 0.7;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
 class ViewTower
 {
  icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
  size = 16;
  importance = "2.5 * 16 * 0.05";
  coefMin = 0.5;
  coefMax = 4;
  color[] = {0,0,0,1};
 };
};

#endif

// define.hpp

#define true 1
#define false 0

#define CT_STATIC			0
#define CT_BUTTON			1
#define CT_EDIT				2
#define CT_SLIDER			3
#define CT_COMBO			4
#define CT_LISTBOX			5
#define CT_TOOLBOX			6
#define CT_CHECKBOXES		7
#define CT_PROGRESS			8
#define CT_HTML				9
#define CT_STATIC_SKEW		10
#define CT_ACTIVETEXT		11
#define CT_TREE				12
#define CT_STRUCTURED_TEXT	13
#define CT_CONTEXT_MENU		14
#define CT_CONTROLS_GROUP	15
#define CT_SHORTCUTBUTTON	16
#define CT_XKEYDESC			40
#define CT_XBUTTON			41
#define CT_XLISTBOX			42
#define CT_XSLIDER			43
#define CT_XCOMBO			44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT			80
#define CT_OBJECT_ZOOM		81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK		98
#define CT_ANIMATED_USER	99
#define CT_MAP				100
#define CT_MAP_MAIN			101
#define CT_LISTNBOX			102

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
#define FontCSE			  "PuristaMedium"

class cse_backgroundBase {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1, 1, 1, 1};
	font = FontCSE;
	text = "";
	sizeEx = 0.032;
};

class cse_editBase
{
	access = 0;
	type = CT_EDIT;
	style = ST_STATIC;
	x = 0;
	y = 0;
	h = 1;
	w = 1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	colorSelection[] = {1,1,1,0};
 	colorDisabled[] = {1, 1, 1, 0.25};
	font = FontCSE;
	sizeEx = 0.03921;
	autocomplete = "";
	text = "";
	size = 0.03921;
	shadow = 0;
};


class cse_buttonBase {
	idc = -1;
	type = 16;
	style = 0;
	text = "";
	action = "";
	x = 0.0;
	y = 0.0;
	w = 0.2;
	h = 0.04;
	size = 0.03921;
	sizeEx = 0.03921;
	color[] = {1.0, 1.0, 1.0, 1};
	color2[] = {1.0, 1.0, 1.0, 1};
	colorBackground[] = {1, 1, 1, 0.6};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
    colorFocused[] = {1,1,1,1};
    colorBackgroundFocused[] = {1,1,1,0.6};

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
	 animTextureNormal = "cse\cse_gui\data\cse_cms_button.paa";
	 animTextureDisabled = "cse\cse_gui\data\cse_cms_button.paa";
	 animTextureOver = "cse\cse_gui\data\cse_cms_button.paa";
	 animTextureFocused = "cse\cse_gui\data\cse_cms_button.paa";
	 animTexturePressed = "cse\cse_gui\data\cse_cms_button.paa";
	 animTextureDefault = "cse\cse_gui\data\cse_cms_button.paa";
	period = 0.5;
	font = FontCSE;
	soundEnter[] = {"\A3\ui_f\data\sound\onover",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape",0.09,1};
	class Attributes {
		font = FontCSE;
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
	class AttributesImage {
		font = FontCSE;
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
};



class cse_staticBase {
	idc = -1;
	type = CT_STATIC;
	x = 0.0;
	y = 0.0;
	w = 0.183825;
	h = 0.104575;
	style = ST_LEFT;
	font = FontCSE;
	sizeEx = 0.03921;
	colorText[] = {0.95, 0.95, 0.95, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	text = "";
};

class cse_listBoxBase {
	type = CT_LISTBOX;
	style = ST_MULTI;
	font = FontCSE;
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.543, 0.5742, 0.4102, 1.0};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0, 0, 0, 1};
	colorSelectBackground2[] = {0.543, 0.5742, 0.4102, 1.0};
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

class cse_comboBoxBase {
 idc = -1;
 type = 4;
 style = 1;
 x = 0;
 y = 0;
 w = 0.3;
 h = 0.035;
 colorSelect[] = {0.023529,0,0.0313725,1};
 colorText[] = {0.023529,0,0.0313725,1};
 colorBackground[] = {0.95,0.95,0.95,1};
 colorSelectBackground[] = {0.543,0.5742,0.4102,1.0};
 colorScrollbar[] = {0.023529,0,0.0313725,1};
 arrowEmpty = "";
 arrowFull = "";
 wholeHeight = 0.45;
 color[] = {0,0,0,0.6};
 colorActive[] = {0,0,0,1};
 colorDisabled[] = {0,0,0,0.3};
 font = FontCSE;
 sizeEx = 0.031;
 soundSelect[] = {"",0.09,1};
 soundExpand[] = {"",0.09,1};
 soundCollapse[] = {"",0.09,1};
 maxHistoryDelay = 1.0;
 class ScrollBar
 {
  color[] = {1,1,1,0.6};
  colorActive[] = {1,1,1,1};
  colorDisabled[] = {1,1,1,0.3};
  thumb = "";
  arrowFull = "";
  arrowEmpty = "";
  border = "";
 };
};

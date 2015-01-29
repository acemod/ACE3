#define CT_STATIC	0
#define CT_BUTTON	1
#define CT_EDIT	2
#define CT_SLIDER	3
#define CT_COMBO	4
#define CT_LISTBOX	5
#define CT_TOOLBOX	6
#define CT_CHECKBOXES	7
#define CT_PROGRESS	8
#define CT_HTML	9
#define CT_STATIC_SKEW	10
#define CT_ACTIVETEXT	11
#define CT_TREE	12
#define CT_STRUCTURED_TEXT	13
#define CT_CONTEXT_MENU	14
#define CT_CONTROLS_GROUP	15
#define CT_XKEYDESC	40
#define CT_XBUTTON	41
#define CT_XLISTBOX	42
#define CT_XSLIDER	43
#define CT_XCOMBO	44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT	80
#define CT_OBJECT_ZOOM	81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK	98
#define CT_USER	99
#define CT_MAP	100
#define CT_MAP_MAIN	101
#define ST_POS	0x0F
#define ST_HPOS	0x03
#define ST_VPOS	0x0C
#define ST_LEFT	0x00
#define ST_RIGHT	0x01
#define ST_CENTER	0x02
#define ST_DOWN	0x04
#define ST_UP	0x08
#define ST_VCENTER	0x0c
#define ST_TYPE	0xF0
#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_TITLE_BAR	32
#define ST_PICTURE	48
#define ST_FRAME	64
#define ST_BACKGROUND	80
#define ST_GROUP_BOX	96
#define ST_GROUP_BOX2	112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE	144
#define ST_WITH_RECT	160
#define ST_LINE	176
#define ST_SHADOW	0x100
#define ST_NO_RECT	0x200
#define ST_KEEP_ASPECT_RATIO	0x800
#define ST_TITLE	ST_TITLE_BAR + ST_CENTER
#define SL_DIR	0x400
#define SL_VERT	0
#define SL_HORZ	0x400
#define SL_TEXTURES	0x10
#define LB_TEXTURES	0x10
#define LB_MULTI	0x20
#define FontM	"PuristaMedium"
#define FontHTML	"PuristaMedium"


class ACE_CARGO_RscBgFrame {
	type=CT_STATIC;
	idc=-1;
	style=ST_FRAME;
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	colorText[]={0, 0, 0, 1};
	font=FontM;
	SizeEX=0.025;
	text="";
};
class ACE_CARGO_RscBackground {
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	text="";
	type=CT_STATIC;
	idc=-1;
	style=ST_LEFT;
	colorText[]={1, 1, 1, 1};
	font=FontM;
	sizeEx=0.04;
};
class ACE_CARGO_RscPicture {
	type=CT_STATIC;
	idc=-1;
	style=ST_PICTURE;
	colorBackground[]={0, 0, 0, 0};
	colorText[]={1, 1, 1, 1};
	font=FontM;
	sizeEx=0.02;
	text="";
};
class ACE_CARGO_RscButton {
	type=CT_BUTTON;
	idc=-1;
	style=ST_CENTER;
	colorText[]={0, 0, 0, 1};
	font=FontHTML;
	sizeEx=0.025;
	soundPush[]={"", 0.2, 1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	default=false;
	text="";
	action="";
	colorActive[]={0, 0, 0, 0};
	colorDisabled[]={0, 0, 0, 0.1};
	colorBackground[]={0,0,0,0.3};
	colorBackgroundActive[]={0,0,0,0.4};
	colorBackgroundDisabled[]={0,0,0,0.3};
	colorFocused[]={0.84,1,0.55,1};
	colorShadow[]={1, 1, 1, 0.1};
	colorBorder[]={0, 0, 0, 0.1};
	offsetX=0;
	offsetY=0;
	offsetPressedX=0;
	offsetPressedY=0;
	borderSize=0;
	soundEnter[]={"", 0.15, 1};
};
class ACE_CARGO_RscButton2:ACE_CARGO_RscButton {
	x=-1.0;
	y=-1.0;
	idc=-1;
	w=0.01;
	h=0.01;
	default=true;
};
class ACE_CARGO_RscShortcutButton {
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.543,0.5742,0.4102,1};
	color2[] = {0.95,0.95,0.95,1};
	colorBackground[] = {1,1,1,1};
	colorbackground2[] = {1,1,1,0.4};
	colorDisabled[] = {1,1,1,0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos {
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	period = 0.4;
	font = "PuristaMedium";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	action = "";
	class Attributes {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
	textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
};
class ACE_CARGO_RscShortcutButtonMain: ACE_CARGO_RscShortcutButton {
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	w = 0.313726;
	h = 0.104575;
	color[] = {0.543,0.5742,0.4102,1};
	colorDisabled[] = {1,1,1,0.25};
	colorFocused[] = {1, 1, 1, 0};//Check
	colorBackgroundFocused[] = {1, 1, 1, 0};//Check
	class HitZone {
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos {
		left = 0.0204;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.08;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	period = 0.5;
	font = "PuristaMedium";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	action = "";
	class Attributes {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage {
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "false";
	};
};
class ACE_CARGO_RscEdit {
	type=CT_EDIT;
	idc=-1;
	style=ST_LEFT;
	font=FontHTML;
	sizeEx=0.02;
	colorText[]={0, 0, 0, 1};
	colorSelection[]={0.5, 0.5, 0.5, 1};
	autocomplete=false;
	text="";
};
class ACE_CARGO_RscLB_C {
	style=ST_LEFT;
	idc=-1;
	colorSelect[]={0.4, 0.4, 0.4, 1};
	colorSelectBackground[]={0.2, 0.2, 0.2, 1};
	colorText[]={0.2, 0.2, 0.2, 1};
	colorBackground[]={0.4, 0.4, 0.4, 1};
	font=FontHTML;
	sizeEx=0.025;
	rowHeight=0.04;
};
class ACE_CARGO_RscListBox:ACE_CARGO_RscLB_C {
	soundSelect[]={"", 0.1, 1};
	type=CT_LISTBOX;
};
class ACE_CARGO_RscCombo: ACE_CARGO_RscLB_C {
	sizeEx=0.02;
	type=CT_COMBO;
	wholeHeight=0.3;
	soundSelect[]={"", 0.15, 1};
	soundExpand[]={"", 0.15, 1};
	soundCollapse[]={"", 0.15, 1};
	maxHistoryDelay = 1;
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	color[] ={0,0,0,0.6};
	colorActive[] ={0,0,0,1};
	colorDisabled[] ={0,0,0,0.3};
	colorSelectBackground[] ={0.543,0.5742,0.4102,1};
};
class ACE_CARGO_RscSliderH {
	access=0;
	type=CT_SLIDER;
	idc=-1;
	sizeEx=0.025;
	style=1024;
	color[]={0.2, 0.2, 0.2, 1};
	colorActive[]={1, 1, 1, 1};
};
class ACE_CARGO_RscSliderV {
	access=0;
	type=CT_SLIDER;
	idc=-1;
	sizeEx=0.025;
	style=0;
	color[]={0.2, 0.2, 0.2, 1};
	colorActive[]={1, 1, 1, 1};
};
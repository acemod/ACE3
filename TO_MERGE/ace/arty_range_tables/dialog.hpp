#define ReadAndWrite 0 //! any modifications enabled
#define ReadAndCreate 1 //! only adding new class members is allowed
#define ReadOnly 2 //! no modifications enabled
#define ReadOnlyVerified 3 //! no modifications enabled, CRC test applied

// Control types
#define CT_STATIC                   0
#define CT_BUTTON                   1
#define CT_EDIT                     2
#define CT_COMBO                    4
#define CT_LISTBOX                  5
#define CT_STRUCTURED_TEXT          13
#define CT_LISTNBOX                 102
// Static styles
#define ST_LEFT                     0
#define ST_RIGHT                    1
#define ST_CENTER                   0x02
#define ST_UP                       0x08
#define ST_DOWN                     0x04
#define ST_VCENTER                  0x0c
#define ST_SINGLE                   0
#define ST_MULTI                    16
#define ST_FRAME                    64
#define ST_BACKGROUND               80
#define ST_GROUP_BOX2               112

// Colors
#define LightARMAGrey               {0.72549, 0.72549, 0.72549, 0.75}
#define DarkARMAGreen               {0.20392, 0.40000, 0.05882, 1.0}
#define MedARMAGrey                 {0.67549, 0.67549, 0.67549, 0.65}
#define LightARMAGreen              {0.83921, 1.00000, 0.54901, 1.00000}
#define Transparent                 {0,0,0,0}
#define BlackSolid                  {0,0,0,1}
#define WhiteSolid                  {1,1,1,1}
#define BlackSolidA                 "#000000"

#define BackColor                   {0.34, 0.34, 0.34, 0.5}
#define MainColor                   {0.9, 0.9, 0.9, 1}
#define Pink                        {1,0.3686,0.98,1}

//Fonts
#define Font                        "TahomaB"

#define true                        1
#define false                       0

// Top left coordinates of dialog window
#define INITX                       SafeZoneX + SafeZoneW*0.5	- 0.17
#define INITY                       SafeZoneY + 0

//Range card
#define INITX_RNG                   INITX
#define INITY_RNG                   INITY+0.15
#define INITX_RNG1                  0.37

#define ROWPOS(y)	((0.0209*y)*SafeZoneH)
#define COLPOS(x)	((0.029075*x)*SafeZoneW)

class RscText;
class ace_sys_arty_rangeTables_RscText: RscText {
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = Transparent;
	colorText[] = BlackSolid;
	font = Font;
	sizeEx = 0.021; //((0.0209*y)*SafeZoneH)
	linespacing = 1.0;
	text = ;
	shadow = 0;
};

class RscFrame;
class RscButton;
class ace_sys_arty_rangeTables_RscButton: RscButton {
	access = ReadAndWrite;
	idc = -1;
	type = CT_BUTTON;
	style = ST_CENTER;
	default = false;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.1;
	text = "";
	font = Font;
	sizeEx = 0.024;
	colorText[] = {0, 0, 0, 1};
	colorDisabled[] = Transparent;
	colorBackground[] = Transparent;
	colorBackgroundDisabled[] = Transparent;
	colorBackgroundActive[] = Transparent;
	offsetX = 0.002;
	offsetY = 0.002;
	offsetPressedX = 0.001;
	offsetPressedY = 0.001;
	colorFocused[] = Transparent;
	colorShadow[] = {0, 0, 0, 0};
	colorBorder[] = {0, 0, 0, 0};
	borderSize = 0;
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
	shadow = 0;
};

class ace_sys_arty_rangeTables_RscPicture {
	access = ReadAndWrite;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = Font;
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	borderSize = 0;
};

class RscCombo;
class ace_sys_arty_rangeTables_RscComboBox {
	type = CT_COMBO;
	style = "0 + 0x10";
	font = Font;
	sizeEx = 0.022;
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,1};
	colorScrollbar[] = {1,1,1,1};
	colorSelect[] = {1,0,1,1 };
	colorSelect2[] = {1,1,0,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {1,1,1,1};
	period = 1.200000;
	colorBackground[] = {0,0,0,1};
	maxHistoryDelay = 1.000000;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	wholeHeight = ROWPOS(4.1);
	arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
	arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
	class ScrollBar  {
		color[] = {0,1,0,1};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.300000};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class RscListNBox;
class ace_sys_arty_rangeTables_RscListNBox: RscListNBox {
	type = 102;
	idc = -1;
	style = ST_SINGLE;
	font = "TahomaB";
	color[] = {0,0,0,1};
	colorText[] = {0,0,0,0.75};
	colorScrollbar[] = {0.95,0.,0.95,1};
	colorSelect[] = {0,0,0,1}; // text
	colorSelect2[] = {0,1,0,1};
	colorSelectBackground[] = {0.9,0.9,0.9,1};
	colorSelectBackground2[] = {0.9,0.9,0.9,1}; // background
	period = 0;
	sizeEx = 0.022;
	colorBackground[] = {1,0,0,1};
	columns[] = {0,0.08,0.16,0.24};
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	shadow = 0;
	rowHeight = ROWPOS(1);
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 0;
	drawSideArrows = 0;
	idcLeft = 10061;
	idcRight = 10062;
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
class ace_sys_arty_rangeTables_RangeTable {
	idd = 2999;
	movingEnable = true;
	objects[] = {};
	class controlsBackground {
		class Frame : ace_sys_arty_rangeTables_RscPicture {
			text = QPATHTO_T(data\rangetable_ca.paa);
			x = -0.000361398 * safezoneW + safezoneX;
			y = -0.097232 * safezoneH + safezoneY;
			w = 0.553948 * safezoneW;
			h = 1.20385 * safezoneH;
			moving = 0;
		};
	};
	class controls {
		class Combo_Round: RscCombo { // Selection: HE, Smoke, ILLUM, whatever
			idc = 4020;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0.91,0.91,0.91,1};			
			x = 0.216675 * safezoneW + safezoneX;
			y = 0.0662958 * safezoneH + safezoneY;
			w = 0.0605361 * safezoneW;
			h = 0.0215816 * safezoneH;
		};
		class Combo_Charge: RscCombo { // Charge selector
			idc = 4021;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0.91,0.91,0.91,1};				
			x = 0.030643 * safezoneW + safezoneX;
			y = 0.0480134 * safezoneH + safezoneY;
			w = 0.0621397 * safezoneW;
			h = 0.0225973 * safezoneH;
		};
		class ListNBox: ace_sys_arty_rangeTables_RscListNBox {
			idc = 4022;
			x = 0.0311783 * safezoneW + safezoneX;
			y = 0.242012 * safezoneH + safezoneY;
			w = 0.239084 * safezoneW;
			h = 0.6 * safezoneH;
			columns[] = {0,0.14,0.28,0.41,0.57};
		};
		class Btn_CloseRC : ace_sys_arty_rangeTables_RscButton {
			idc = 3999;
			text = "x";
			colorText[] = {0,0,0,1};
			x = 0.270542 * safezoneW + safezoneX;
			y = 0.0262543 * safezoneH + safezoneY;
			w = 0.0102861 * safezoneW;
			h = 0.0165031 * safezoneH;
			action = "closeDialog 1";
		};
	};
};
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
  sizeEx = 0.021;
  linespacing = 1.0;
  text = ;
	shadow = 0;
};
class RscTextRightAl;
class ace_sys_arty_rangeTables_RscTextRightAl: RscTextRightAl {
  type = CT_STATIC;
  idc = -1;
  style = ST_RIGHT;
  colorBackground[] = Transparent;
  colorText[] = BlackSolid;
  font = Font;
  sizeEx = 0.024;
  linespacing = 1.0;
  text = ;
	shadow = 0;
};
class RscStructuredText;
class ace_sys_arty_rangeTables_RscStructuredText: RscStructuredText {
	access = ReadAndWrite;
	type = CT_STRUCTURED_TEXT;
	style = ST_VCENTER;
	size = 0.0208333;
	colorText[] = BlackSolid;
	class Attributes {
		font = Font;
		color = BlackSolidA;
		align = "center";
		shadow = 0;
	};
};

//class RscListBox;
class RscListBox {
	idc = -1;
	type = CT_LISTBOX;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.04221;
  rowHeight = 0.03;
	color[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.6, 0.8392, 0.4706, 1.0};
	colorSelectBackground2[] = {0.6, 0.8392, 0.4706, 1.0};
	columns[] = {0.1, 0.7, 0.1, 0.1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
class ace_sys_arty_rangeTables_RscListBox: RscListBox {
	access = ReadAndWrite;
	style = ST_LEFT;
	idc = -1;
	color[] = BlackSolid;
	colorSelect[] = BlackSolid;
	colorSelectBackground[] = Transparent;
	colorSelect2[] = Transparent;
	colorSelectBackground2[] = Transparent;
	colorText[] = BlackSolid;
	colorBackground[] = Transparent;
	colorScrollbar[] = BlackSolid;
	colorBorder[] = BlackSolid;
	font = "BitStream";
	sizeEx = 0.022;
	rowHeight = 0.024;
	canDrag = 0;
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
  font = "TahomaB";
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
class RscEdit;
class ace_sys_arty_rangeTables_RscEdit: RscEdit {
  type = CT_EDIT;
  idc = -1;
  style = ST_CENTER + ST_VCENTER;
  font = Font;
  sizeEx = 0.024;
  colorText[] = BlackSolid;
  colorSelection[] = DarkARMAGreen;
  autocomplete = false;
  text = ;
	shadow = 0;
};
class ace_sys_arty_rangeTables_RscPicture {
	access = ReadAndWrite;
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	borderSize = 0;
};
class ace_sys_arty_rangeTables_MainBack: ace_sys_arty_rangeTables_RscText {
	text = "";
	colorText[] = BackColor;
	colorBackground[] = BackColor;
};
class ace_sys_arty_rangeTables_ControlBack: ace_sys_arty_rangeTables_MainBack {
	text = "\CA\UI\Data\ui_gradient_reverse_gs.paa";
	colorText[] = BackColor;
	colorBackground[] = BackColor;
};
class ace_sys_arty_rangeTables_TitleBack: ace_sys_arty_rangeTables_RscPicture{
	text = "\CA\UI\Data\ui_gradient_title_gs.paa";
	colorText[] = BackColor;
	colorBackground[] = BackColor;
};
class ace_sys_arty_rangeTables_ArrowDown: ace_sys_arty_rangeTables_RscPicture{
	text = "\CA\UI\textures\arrow_down.paa";
	colorText[] = BlackSolid; //DarkARMAGreen;
	colorBackground[] = Transparent;
};
class ace_sys_arty_rangeTables_ArrowUp: ace_sys_arty_rangeTables_ArrowDown{
	text = "\CA\UI\textures\arrow_up.paa";
};
class ace_sys_arty_rangeTables_ArrowLeft: ace_sys_arty_rangeTables_ArrowDown{
	text = QPATHTO_T(data\arrow_left.paa);
};
class ace_sys_arty_rangeTables_ArrowRight: ace_sys_arty_rangeTables_ArrowDown{
	text = QPATHTO_T(data\arrow_right.paa);
};

class RscCombo {
	idc = -1;
	type = 4;
	style = 1;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.035;
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorText[] = {0.023529, 0, 0.0313725, 1};
	colorBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.543, 0.5742, 0.4102, 1.0};
	colorScrollbar[] = {0.023529, 0, 0.0313725, 1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0, 0, 0, 0.6};
	colorActive[] = {0, 0, 0, 1};
	colorDisabled[] = {0, 0, 0, 0.3};
	font = "Zeppelin32";
	sizeEx = 0.031;
	soundSelect[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundExpand[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundCollapse[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	maxHistoryDelay = 1.0;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class ace_sys_arty_rangeTables_RscComboBox {
  type = CT_COMBO;
  style = "0 + 0x10";
  font = "TahomaB";
  sizeEx = 0.015*SafeZoneH;
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
class ace_sys_arty_rangeTables_RscListNBox: RscListNBox
{
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
	sizeEx = 0.015*SafeZoneH;
	colorBackground[] = {1,0,0,1};
	columns[] = {0,0.08,0.16,0.24};
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	rowHeight = ROWPOS(1);
	autoScrollSpeed = -1;
  autoScrollDelay = 5;
  autoScrollRewind = 0;
	maxHistoryDelay = 0;
	drawSideArrows = 0;
	idcLeft = 10061;
	idcRight = 10062;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
/*class ace_sys_arty_rangeTables_RscListNBox: ace_sys_arty_rangeTables_RscListBox
{
	type = 102;
	drawSideArrows = 0;
	idcLeft = 10061;
	idcRight = 10062;
	canDrag = 0;
	columns = [0, 0.08, 0.16, 0.24];
};*/

class ace_sys_arty_rangeTables_RangeTable {
	idd = 2999;
	movingEnable = true;
	
	controlsBackground[] = {Frame, InnerFrame};
	class Frame : ace_sys_arty_rangeTables_MainBack {
		x = INITX_RNG1 -0.01; y = INITY_RNG - 0.02; w = 0.44; h = 0.617;
		moving = 1;
	};
	class InnerFrame : ace_sys_arty_rangeTables_MainBack {
		x = INITX_RNG1 - 0.003; y = INITY_RNG - 0.01; w = 0.426; h = 0.597;
		moving = 1;
		colorBackground[] = MainColor;
		text = "";
		colorText[] = BlackSolid;
	};
	
	objects[] = {};
	controls[] = {
	  Combo_Round,
		Combo_Charge,
		Txt_HeaderRange,
		Txt_HeaderRange_Units,
		Txt_HeaderElevation,
		Txt_HeaderElevation_Units,
		Txt_HeaderAltitude,
    Txt_HeaderAltitudeElev,
		Txt_HeaderAltitudeElev_Units,
    Txt_HeaderAltitudeTime,
    Txt_HeaderAltitudeTime_Units,
		Txt_HeaderTimeOfFlight,
		Txt_HeaderTimeOfFlight_Units,

		/*Txt_HeaderDrop_Line1,
		Txt_HeaderDrop_Line2,
		Txt_HeaderDrop_Units,
		Txt_HeaderRight_Line1,
		Txt_HeaderRight_Line2,
		Txt_HeaderRight_Units,*/
		/*LB,*/
		ListNBox,
		/*Column,
		Column1,
		Column2,*/
		/*Column3,*/
		Btn_CloseRC
	};
	
	//class Combo_Round: ace_sys_arty_rangeTables_RscComboBox {
	class Combo_Round: RscCombo {
		idc = 4020;
		x = INITX_RNG1 + 0.01; y = INITY_RNG + 0.01; w = 0.13; h = 0.04;
	};
	class Combo_Charge: RscCombo {
		idc = 4021;
		x = INITX_RNG1 + 0.17; y = INITY_RNG + 0.01; w = 0.13; h = 0.04;
	};
	/*class Combo_Charge: ace_sys_arty_rangeTables_RscComboBox {
		idc = 4021;
		x = INITX_RNG1 + 0.16; y = INITY_RNG + 0.01; w = 0.1; h = 0.04;
	};*/
	
	class Txt_HeaderRange : ace_sys_arty_rangeTables_RscText {
		idc = 4002;
		style = ST_MULTI;
		text = "Range";
		x = INITX_RNG1 + 0; y = INITY_RNG + 0.06; w = 0.08; h = 0.08;
	};
	class Txt_HeaderRange_Units: ace_sys_arty_rangeTables_RscText {
		idc = 4009;
		text = "m";
		x = INITX_RNG1 + 0; y = INITY_RNG + 0.14; w = 0.08; h = 0.03;
	};
	
	class Txt_HeaderElevation: ace_sys_arty_rangeTables_RscText {
		idc = 4003;
		style = ST_MULTI;
		text = "Elev";
		x = INITX_RNG1 + 0.08; y = INITY_RNG + 0.06; w = 0.08; h = 0.08;
	};
	class Txt_HeaderElevation_Units: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "mil";
		x = INITX_RNG1 + 0.08; y = INITY_RNG + 0.14; w = 0.08; h = 0.03;
	};

	class Txt_HeaderAltitude: ace_sys_arty_rangeTables_RscText {
		idc = 4004;
		style = ST_MULTI;
		text = "Altitude -100m\n   Change in";
		x = INITX_RNG1 + 0.16; y = INITY_RNG + 0.06; w = 0.16; h = 0.06;
	};
  class Txt_HeaderAltitudeElev: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "Elev";
		x = INITX_RNG1 + 0.16; y = INITY_RNG + 0.10; w = 0.08; h = 0.03;
	};
  class Txt_HeaderAltitudeTime: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "Time";
		x = INITX_RNG1 + 0.24; y = INITY_RNG + 0.10; w = 0.08; h = 0.03;
	};
	class Txt_HeaderAltitudeElev_Units: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "mil";
		x = INITX_RNG1 + 0.16; y = INITY_RNG + 0.14; w = 0.08; h = 0.03;
	};
  class Txt_HeaderAltitudeTime_Units: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "sec";
		x = INITX_RNG1 + 0.24; y = INITY_RNG + 0.14; w = 0.08; h = 0.03;
	};
	
	class Txt_HeaderTimeOfFlight: ace_sys_arty_rangeTables_RscText {
		idc = 4004;
		style = ST_MULTI;
		text = "Time\nOf\nFlight";
		x = INITX_RNG1 + 0.32; y = INITY_RNG + 0.06; w = 0.08; h = 0.08;
	};
	class Txt_HeaderTimeOfFlight_Units: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "sec";
		x = INITX_RNG1 + 0.32; y = INITY_RNG + 0.14; w = 0.08; h = 0.03;
	};
/*	
	class Txt_HeaderDrop_Line1: ace_sys_arty_rangeTables_RscText {
		idc = 4004;
		text = "Drop";
		x = INITX_RNG1 + 0.2; y = INITY_RNG + 0.035; w = 0.1; h = 0.03;
	};
	class Txt_HeaderDrop_Line2: ace_sys_arty_rangeTables_RscText {
		idc = 4004;
		text = "100m";
		x = INITX_RNG1 + 0.2; y = INITY_RNG + 0.055; w = 0.1; h = 0.03;
	};
	class Txt_HeaderDrop_Units: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "mil";
		x = INITX_RNG1 + 0.2; y = INITY_RNG + 0.1; w = 0.1; h = 0.03;
	};
	
	class Txt_HeaderRight_Line1: ace_sys_arty_rangeTables_RscText {
		idc = 4004;
		text = "Right";
		x = INITX_RNG1 + 0.25; y = INITY_RNG + 0.035; w = 0.1; h = 0.03;
	};
	class Txt_HeaderRight_Line2: ace_sys_arty_rangeTables_RscText {
		idc = 4004;
		text = "100m";
		x = INITX_RNG1 + 0.25; y = INITY_RNG + 0.055; w = 0.1; h = 0.03;
	};
	class Txt_HeaderRight_Units: ace_sys_arty_rangeTables_RscText {
		idc = 40010;
		text = "mil";
		x = INITX_RNG1 + 0.25; y = INITY_RNG + 0.1; w = 0.1; h = 0.03;
	};
	*/
	
	/*class LB: ace_sys_arty_rangeTables_RscListBox {
		idc = 4005;
		x = INITX_RNG1 + 0; y = INITY_RNG + 0.14; w = 0.34; h = 0.4;
		moving = 1;
	};*/
	class ListNBox: ace_sys_arty_rangeTables_RscListNBox {
		idc = 4022;
		x = INITX_RNG1 + 0; y = INITY_RNG + 0.18; w = 0.42; h = 0.4;
		//columns[] = {-0.02,0.213,0.447,0.68,0.913};
    columns[] = {-0.02,0.17,0.36,0.55,0.74};
		//moving = 1;
	};
	
	/*class Column : ace_sys_arty_rangeTables_RscButton { //ACE_SYS_SA_RscText
		idc = 4006;
		text = "";
		x = INITX_RNG1 + 0.08; y = INITY_RNG + 0.14; w = 0.00015; h = 0.402;
		colorBackground[] = Transparent;
		colorBorder[] = {0.5,0.5,0.5,0.5};//BlackSolid;//{0.67549, 0.67549, 0.67549, 0.25};
		BorderSize = 0.00015;
		action = "";
	};
	class Column1: Column {
		idc = 4007;
		x = INITX_RNG1 + 0.16;
	};
	class Column2: Column {
		idc = 4007;
		x = INITX_RNG1 + 0.24;
	};*/
  /*class Column3: Column {
		idc = 4007;
		x = INITX_RNG1 + 0.22;
	};*/
	
	class Btn_CloseRC : ace_sys_arty_rangeTables_RscButton {
		idc = 3999;
		text = "x";
		x = INITX_RNG1 + 0.395; y = INITY_RNG + 0; w = 0.025; h = 0.025;
		action = "closeDialog 1";
	};
};

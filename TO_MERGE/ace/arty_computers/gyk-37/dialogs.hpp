#include "script_component.hpp"
#include "\x\ace\addons\main\script_dialog_defines.hpp"
#define FontM	"Zeppelin32"
#define ClrWhite 1,1,1
#define ClrBlack 0,0,0
#define ClrGray 0.5,0.5,0.5
#define ClrBlue 0.2,0.5,1





#define ROWPOS(y)	((0.016*y)*SafeZoneW)
#define COLPOS(x)	((0.029075*x)*SafeZoneW)

#define __SX(var1) x = QUOTE((var1 * safeZoneW) + safeZoneX)
#define __SY(var1) y = QUOTE((var1 * safeZoneW) + safeZoneY)
#define __SW(var1) w = QUOTE(var1 * safeZoneW)
#define __SH(var1) h = QUOTE(var1 * safeZoneW)

#define BGSIZEH 0.976
#define BGSIZEW 0.81
#define CGSIZE 0.59

#include "IDC.hpp"

class ace_arty_bcs_RscText 
{
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	font = FontM;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	sizeEx = 0.012*SafeZoneW;
	w = COLPOS(5);
	h = ROWPOS(0.8);
	lineSpacing = 1;
};

class ace_arty_bcs_RscTextBox
{
	idc = -1;
	type = CT_EDIT;
	style = ST_LEFT;
	w = COLPOS(5);
	h = ROWPOS(0.8);
	sizeEx = .02;
	font = FontM;
	
	text = "";
	colorText[] = {1,1,1,1};
	
	autocomplete = false;
	colorSelection[] = {0.5,0.5,0.5,1};
};

class ace_arty_bcs_RscButton 
{
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;

	x = 0.0;
	y = 0.0;
	w = COLPOS(5);
	h = ROWPOS(0.8);
	sizeEx = 0.012*SafeZoneW;
	offsetX = 0;
	offsetY = 0.002;
	offsetPressedX = 0;
	offsetPressedY = 0.002;
	borderSize = 0;

	

	colorText[] = {ClrWhite,1};
	colorBackground[] = {ClrGray, 0.75};
	colorFocused[] = {ClrGray,0};

	colorShadow[] = {ClrBlack,0};
	colorBorder[] = {ClrWhite,0};
	colorBackgroundActive[] = {ClrGray,0};
	colorDisabled[] = {ClrGray, 0};
	colorBackgroundDisabled[] = {ClrGray,0};
	font = FontM;

	soundEnter[] = {"", 0.2, 1};
	soundPush[] = {"", 0.2, 1};
	soundClick[] = {"", 0.2, 1};
	soundEscape[] = {"", 0.2, 1};

	default = false;
	text = "";
	action = "";
};
class RscListNBox;
class ace_arty_bcs_RscListNBox: RscListNBox
{
	type = 102;
	idc = -1;
	style = ST_SINGLE;
	color[] = {1,1,1,1};
	colorText[] = {1,1,1,0.75};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0.6,0.8392,0.4706,1.0};
	colorSelectBackground2[] = {0.6,0.8392,0.4706,1.0};
	period = 0;
	font = FontM;
	sizeEx = 0.012*SafeZoneW;
	colorBackground[] = {1,0,0,1};
	columns[] = {0.1,0.7};
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	rowHeight = ROWPOS(1);
	autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
	maxHistoryDelay = 0;
	drawSideArrows = 0;
	idcLeft = 10001;
	idcRight = 10002;
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

class ace_arty_bcs_RscComboBox {
	type = 4;
	style = "0 + 0x10";
	font = FontM;
	sizeEx = 0.012*SafeZoneW;
	color[] = {1,1,1,1 };
	colorText[] = {1,1,1,1 };
	colorScrollbar[] = {1,1,1,1 };
	colorSelect[] = {1,0,1,1 };
	colorSelect2[] = {1,1,0,1 };
	colorSelectBackground[] = {0,0,0,1 };
	colorSelectBackground2[] = {1,1,1,1 };
	period = 1.200000;
	colorBackground[] = {0,0,0,1 };
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
		color[] = {0,1,0,1 };
		colorActive[] = {1,1,1,1 };
		colorDisabled[] = {1,1,1,0.300000 };
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};

class ace_arty_bcs_RscListBox : ace_arty_bcs_RscComboBox {
	type = 5;
	rowHeight = ROWPOS(1);
};

class ace_arty_bcs_CheckBox {
	idc = -1;
	type = CT_TOOLBOX;  //defined constant (6)
	style = ST_LEFT; //defined constant (2)

	x = 0;
	y = 0;
	w = COLPOS(2);
	h = ROWPOS(0.8);

	colorText[] = {1, 1, 1, 1};
	color[] = {0, 0, 0, 1};    // seems nothing to change, but define it to avoid error!
	colorTextSelect[] = {1, 0, 0, 1};
	colorSelect[] = {0, 0, 1, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	coloSelectedBg[] = {0.4, 0.4, 0.4, 1};
	font = FontM;
	sizeEx = 0.012*SafeZoneW;

	rows = 1;
	columns = 2;
	strings[] = {"No","Yes"};
	values[] = {0,1};
};

class ace_arty_bcs_RscPicture : ace_arty_bcs_RscButton
{
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	text = "";
};
class RscControlsGroup;
class ace_arty_bcs_ControlGroup:RscControlsGroup {
    type = 15;
    idc = -1;
    style = 16;
    x = 0.5-((CGSIZE/2)*SafeZoneW);
	y = 0.5-(((CGSIZE/2)-0.05)*SafeZoneW);
	w = (CGSIZE*SafeZoneW);
	h = (CGSIZE*SafeZoneW);
	class VScrollbar
	{
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		color[] = {1,1,1,1};
		width = 0.001;
	};
	class HScrollbar
	{
		color[] = {1,1,1,0};
		height = 0.001;
	};
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
    class controls { };
};

class ace_arty_bcs_Display {
    idd = 754;
	movingEnable = 0;
	name = "ace_arty_bcs_Display";
    onload = QUOTE([] call FUNC(bcsLoad));
	onUnload = QUOTE([] call FUNC(bcsUnload));
    
	class controlsBackground {
		class ace_arty_bcs_Background {
            idc = -1;
            access = 0;
            type = CT_STATIC;  // defined constant
            colorText[] = { 1, 1, 1, 1 };
            colorBackground[] = {0, 0, 0, 0 };
            font = FontM;  // defined constant
            sizeEx = 1*SafeZoneW;
            x = 0.5-((BGSIZEW/2)*SafeZoneW);
			y = 0.5-((BGSIZEH/2)*SafeZoneW);
            w = (BGSIZEW*SafeZoneW);
            h = (BGSIZEH*SafeZoneW);
            style = ST_PICTURE;
            text = "\x\ace\addons\sys_arty_computers\gyk-37\data\BCS_FDC.paa";
        };
	};
	class objects {
		// define controls here
	};
	class controls {
        
        
        #include "main.hpp"
		#include "mission.hpp"
		#include "adjust.hpp"
        #include "ffe.hpp"
        
		
		
		
		class GVAR(log) : ace_arty_bcs_RscListBox {
			idc = 10021;
			__SX(0.208);
			__SY(0.72);
			__SW(0.5815);
			__SH(0.09);
			rowHeight = ROWPOS(0.75);
			colorBackground[] = {0,1,0,1 };
			colorText[] = {1,1,1,1 };
			colorScrollbar[] = {1,1,1,1 };
			colorSelect[] = {1,1,1,1 };
			colorSelect2[] = {1,1,1,1 };
			colorSelectBackground[] = {0,0,0,1 };
			colorSelectBackground2[] = {0,0,0,1 };
		};
		
		class GVAR(logDivideBar) : ace_arty_bcs_RscText {
			text = "";
			__SX(0.208);
			__SY(0.715);
			__SW(0.5815);
			__SH(0.0025);
			colorBackground[] = {1,1,1,1};
		};
		
		class GVAR(showMapButton): ace_arty_bcs_RscButton {
			__SX(0.815);
			__SY(0.8);
			h = ROWPOS(2);
			w = COLPOS(3);
			text = "Open Map";
			action = QUOTE([] call FUNC(openMap));
		};
		
		#include "acre_controls.hpp"
	};
};



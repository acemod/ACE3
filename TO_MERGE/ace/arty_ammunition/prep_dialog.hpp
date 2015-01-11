
#define FontM	"Zeppelin32"
#define ClrWhite 1,1,1
#define ClrBlack 0,0,0
#define ClrGray 0.5,0.5,0.5
#define ClrBlue 0.2,0.5,1

#define ROUNDS_LISTBOX_ID 	20100
#define CHARGE_LISTBOX_ID 	20101
#define FUZE_SLIDER_ID 		20201

#define ROWPOS(y)	((0.0219*y)*SafeZoneH)
#define COLPOS(x)	((0.029075*x)*SafeZoneW)

class ace_arty_ammoprep_RscText {
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	font = FontM;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	sizeEx = 0.02*SafeZoneH;
	__SW(0.5815);
	__SH(0.02);
	lineSpacing = 1;
};

class ace_arty_ammoprep_RscTextBox {
	idc = -1;
	type = CT_EDIT;
	style = ST_LEFT;
	__SW(0.5815);
	__SH(0.02);
	sizeEx = .02;
	font = FontM;
	
	text = "";
	colorText[] = {1,1,1,1};
	
	autocomplete = false;
	colorSelection[] = {0,0,0,1};
};

class ace_arty_ammoprep_RscButton {
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;

	x = 0.0;
	y = 0.0;
	__SW(0.2);
	__SH(0.03);
	sizeEx = 0.015*SafeZoneH;
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
class ace_arty_ammoprep_RscListNBox: RscListNBox {
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
	sizeEx = 0.015*SafeZoneH;
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

class ace_arty_ammoprep_RscComboBox {
	type = 4;
	style = "0 + 0x10";
	font = FontM;
	sizeEx =0.02*SafeZoneH;
	color[] = {1,1,1,1 };
	colorText[] = {1,1,1,1 };
	colorScrollbar[] = {1,1,1,1 };
	colorSelect[] = {1,1,1,1 };
	colorSelect2[] = {90/255, 74/255, 36/255, 0.75};
	colorSelectBackground[] = {0,0,0,1 };
	colorSelectBackground2[] = {90/255, 74/255, 36/255, 0.75};
	period = 1.200000;
	colorBackground[] = {90/255, 74/255, 36/255, 0.75};
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

class ace_arty_ammoprep_RscListBox {
	type = 5;
	style = "0 + 0x10";
	font = "Zeppelin32";
	sizeEx = 0.039210;
	color[] = {1,1,1,1 };
	colorText[] = {0.543000,0.574200,0.410200,1.000000 };
	colorScrollbar[] = {0,1,0,1 };
	colorSelect[] = {0.950000,0.950000,0.950000,1 };
	colorSelect2[] = {0.950000,0.950000,0.950000,1 };
	colorSelectBackground[] = {0,0,0,1 };
	colorSelectBackground2[] = {0.543000,0.574200,0.410200,1.000000 };
	period = 1.200000;
	colorBackground[] = {0,0,0,1 };
	maxHistoryDelay = 1.000000;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
	rowHeight = ROWPOS(1);
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

class ace_arty_ammoprep_CheckBox {
	idc = -1;
	type = CT_TOOLBOX;  //defined constant (6)
	style = ST_LEFT; //defined constant (2)

	x = 0;
	y = 0;
	w = COLPOS(2);
	h = ROWPOS(1);

	colorText[] = {1, 1, 1, 1};
	color[] = {0, 0, 0, 1};    // seems nothing to change, but define it to avoid error!
	colorTextSelect[] = {1, 0, 0, 1};
	colorSelect[] = {0, 0, 1, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	coloSelectedBg[] = {0.4, 0.4, 0.4, 1};
	font = FontM;
	sizeEx = 0.015*SafeZoneH;

	rows = 1;
	columns = 2;
	strings[] = {"No","Yes"};
	values[] = {0,1};
};

class ace_arty_ammoprep_RscPicture : ace_arty_ammoprep_RscButton
{
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	text = "";
};
class RscControlsGroup;
class ace_arty_ammoprep_ControlGroup:RscControlsGroup {
    type = 15;
    idc = -1;
    style = 16;
    __SX(0.125);
	__SY(0);
	__SW(0.75);
	__SH(1);
	class VScrollbar {
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
		color[] = {1,1,1,1};
		width = 0.001;
	};
	class HScrollbar {
		color[] = {1,1,1,0};
		height = 0.001;
	};
	class ScrollBar {
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

class ace_arty_ammoprep_Display {
    idd = 754;
	movingEnable = 0;
	name = "ace_arty_ammoprep_Display";
    onUnload = QUOTE(_this call FUNC(onDialogClose));
	onLoad = QUOTE(_this call FUNC(onDialogOpen));
    
	class controlsBackground {
		class ace_arty_ammoprep_Background {
            idc = -1;
            access = 0;
            type = CT_STATIC;
			style = ST_LEFT;
            colorText[] = { 0, 0, 0, 1 };
            colorBackground[] = {90/255, 74/255, 36/255, 0.75};
            font = FontM;  // defined constant
            sizeEx = 1*SafeZoneH;
            __SX(0.125);
            __SY(0);
            __SW(0.75);
            __SH(1);
            
            text = "";
        };
	};
	class objects {
		// define controls here
	};
	class controls {

		class ace_arty_ammoprep_main:ace_arty_ammoprep_ControlGroup {
			idc = -1;
			class controls {
				class GVAR(ammoAvailable):ace_arty_ammoprep_RscText {
					x = COLPOS(0);
					y = ROWPOS(0);
					w = COLPOS(5);
					h = ROWPOS(1);
					text = "Available Rounds";
				};
				class GVAR(availabeAmmoBG):ace_arty_ammoprep_RscText {
					x = COLPOS(0);
					y = ROWPOS(1);
					w = COLPOS(7);
					h = 1*SafeZoneH;
					colorBackground[] = {90/255, 74/255, 36/255, 0.75};
					text = "";
				};
				class GVAR(availabeAmmo):ace_arty_ammoprep_RscListBox {
					idc = ROUNDS_LISTBOX_ID;
					x = COLPOS(0);
					y = ROWPOS(1);
					w = COLPOS(7);
					h = 1*SafeZoneH;
					onLBSelChanged = QUOTE(_this call FUNC(onSelectRound));
				};
				
				class GVAR(ammoPrepTitle):ace_arty_ammoprep_RscText {
					idc = 12555;
					x = COLPOS(7);
					y = ROWPOS(0);
					w = COLPOS(20);
					h = ROWPOS(2);
					sizeEx = (0.02*SafeZoneH)*2;
					text = "Prepare Ammo";
				};
				
				class GVAR(ammoCharge):ace_arty_ammoprep_RscText {
					x = COLPOS(7);
					y = ROWPOS(3);
					w = COLPOS(6);
					h = ROWPOS(2);
					sizeEx = (0.02*SafeZoneH)*2;
					text = "Charge";
				};
				
				class GVAR(ammoCurrentCharge):ace_arty_ammoprep_RscText {
					idc = 12556;
					x = COLPOS(7.5);
					y = ROWPOS(5);
					w = COLPOS(4);
					h = ROWPOS(1);
					text = "Current Charge:";
				};
				
				class GVAR(ammoChargeUp):ace_arty_ammoprep_RscButton {
					text = "CHARGE UP";
					x = COLPOS(12);
					y = ROWPOS(5);
					w = COLPOS(3);
					h = ROWPOS(1);
					action = QUOTE([1] call FUNC(changeCharge));
				};
				
				class GVAR(ammoChargeDown):ace_arty_ammoprep_RscButton {
					text = "CHARGE DOWN";
					x = COLPOS(15);
					y = ROWPOS(5);
					w = COLPOS(3);
					h = ROWPOS(1);
					action = QUOTE([-1] call FUNC(changeCharge));
				};
				
				class GVAR(ammoFuze):ace_arty_ammoprep_RscText {
					x = COLPOS(7);
					y = ROWPOS(7);
					w = COLPOS(6);
					h = ROWPOS(2);
					sizeEx = (0.02*SafeZoneH)*2;
					text = "Fuze";
				};
				
				class GVAR(ammoFuzeSelect):ace_arty_ammoprep_RscComboBox {
					idc = 12557;
					x = COLPOS(7.5);
					y = ROWPOS(9);
					w = COLPOS(5);
					h = ROWPOS(1);
					onLBSelChanged = QUOTE(_this call FUNC(onSelectFuze));
				};
				
				class GVAR(ammoFuzeTimeLabel):ace_arty_ammoprep_RscText {
					idc = 12561;
					x = COLPOS(7.5);
					y = ROWPOS(11);
					w = COLPOS(3);
					h = ROWPOS(1);
					text = "Fuze Time:";
				};
				
				class GVAR(ammoFuzeTime):ace_arty_ammoprep_RscTextBox {
					idc = 12560;
					x = COLPOS(10.5);
					y = ROWPOS(11);
					w = COLPOS(2);
					h = ROWPOS(1);
					text = "";
				};
				
				class GVAR(ammoFuzeTimeFormat):ace_arty_ammoprep_RscText {
					idc = 12562;
					x = COLPOS(12.5);
					y = ROWPOS(11);
					w = COLPOS(3);
					h = ROWPOS(1);
					text = "##.#";
				};
				
				class GVAR(ammoPrepRoundButton):ace_arty_ammoprep_RscButton {
					idc = 31337;
					text = "PREP ROUND";
					x = COLPOS(20);
					y = ROWPOS(5);
					w = COLPOS(3);
					h = ROWPOS(2);
					action = QUOTE([] call FUNC(onDoPrep));
				};
				
				class GVAR(ammoShellImage):ace_arty_ammoprep_RscText {
					idc = 12558;
					x = (0.75*SafeZoneW)-(0.0675*SafeZoneW);
					y = 0*SafeZoneH;
					w = 0.0875*SafeZoneW;
					h = .5*SafeZoneH;
					style = ST_PICTURE;
					text = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m1.paa";
				};
				
				class GVAR(ammoChargeImage):ace_arty_ammoprep_RscText {
					idc = 12559;
					x = (0.75*SafeZoneW)-(0.0675*SafeZoneW);
					y = .5*SafeZoneH;
					w = 0.0875*SafeZoneW;
					h = .5*SafeZoneH;
					style = ST_PICTURE;
					text = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m14_chg1.paa";
				};
				
			};
		};
	};
};



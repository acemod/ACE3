/* ace_sys_cargo | (c) 2013 by rocko */

#include "Defines.hpp"

#define __X SafeZoneX
#define __Y SafeZoneY
#define __W SafeZoneW
#define __H SafeZoneH

#define UICOMBO 5 // LISTBOX

class ACE_CARGOUIList {
	w = 0.275;
	h = 0.04;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0.543,0.5742,0.4102,1};
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "PuristaMedium";
	sizeEx = 0.029;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class listScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class ACE_CARGOUIComboBox: ACE_CARGOUIList {
	type = UICOMBO;
	style = 0;
	idc = -1;
	sizeEx = 0.025;
	wholeHeight = 0.3;
};

class ACE_CARGO_RscText {
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	x = 0.0;
	y = 0.0;
	w = 0.3;
	h = 0.03;
	sizeEx = 0.023;
	colorBackground[] = {0.5, 0.5, 0.5, 0.75};
	colorText[] = { 0, 0, 0, 1 };
	font = "PuristaMedium";
	text = "";
};

class ACE_Cargo_List {
	name="ACE_Cargo_List";
	idd=-1;
	movingEnable=0;
	objects[]={};
	onLoad = "uiNamespace setVariable ['ACE_Cargo_List', _this select 0];['back'] call ace_sys_cargo_fnc_onload";
	onUnload = "[ace_sys_cargo_vehicle,objnull,0,0] call ace_sys_cargo_fnc_cbusy;";
	class controlsBackground {
		class BG: ACE_CARGO_RscText {
			idc = -1;
			type = 0;
			style = 48;
			x = 0.270792 * safezoneW + safezoneX;
			y = 0.224911 * safezoneH + safezoneY;
			w = 0.455752 * safezoneW;
			h = 0.547272 * safezoneH;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0,0,0,0};
			text = "z\ace\addons\sys_cargo\data\rsc\ace_ui_background_ca.paa";
			font = "PuristaMedium";
			sizeEx = 0.032;
		};
	};
	class controls {
		class Title: ACE_CARGO_RscText {
			idc = 30;
			x = 0.289755 * safezoneW + safezoneX;
			y = 0.231139 * safezoneH + safezoneY;
			w = 0.0458417 * safezoneW;
			h = 0.0550178 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {1, 1, 1, 0.0};
			colorText[] = {0.643, 0.5742, 0.4102, 1.0};
			text = "";
		};
		class Content: ACE_CARGOUIComboBox {
			idc = 99;
			text = "";
			x = 0.277061 * safezoneW + safezoneX;
			y = 0.283526 * safezoneH + safezoneY;
			w = 0.416083 * safezoneW;
			h = 0.322891 * safezoneH;
			colorSelect[] = {1, 1, 1, 1};
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.8,0.8,0.8,1};
			colorSelectBackground[] = {0, 0, 0, 1};
			colorScrollbar[] = {0.2, 0.2, 0.2, 1};
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			wholeHeight = 0.45;
			rowHeight = 0.06;
			color[] = {0.8, 0.8, 0.8, 1};
			colorActive[] = {0,0,0,1};
			colorDisabled[] = {0,0,0,0.3};
			font = "PuristaMedium";
			sizeEx = 0.035;
			soundSelect[] = {"",0.1,1};
			soundExpand[] = {"",0.1,1};
			soundCollapse[] = {"",0.1,1};
			maxHistoryDelay = 1;
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;

			class listScrollBar {
				color[] = {1, 1, 1, 0.6};
				colorActive[] = {1, 1, 1, 1};
				colorDisabled[] = {1, 1, 1, 0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			//onLBSelChanged = QUOTE([_this,'back'] call FUNC(lbselchanged));
			onLBSelChanged = "[_this,'back'] call ace_sys_cargo_fnc_lbselchanged";
		};

		class Apply_B: ACE_CARGO_RscShortcutButtonMain {
			idc=10;
			x = 0.451603 * safezoneW + safezoneX;
			y = 0.618615 * safezoneH + safezoneY;
			w = 0.103494 * safezoneW;
			h = 0.0451332 * safezoneH;
			size = 0.02;
			sizeEx = 0.02;
			text = $STR_DIAG_ACE_CARGO_UNLOAD;
			//action = QUOTE([GVAR(vehicle),'back'] call FUNC(unload));
			action = "[ace_sys_cargo_vehicle,'back'] call ace_sys_cargo_fnc_unload";
		};

		class Quit_B: Apply_B {
			idc = 20;
			x = 0.566379 * safezoneW + safezoneX;
			text = $STR_DIAG_ACE_CARGO_CANCEL;
			action = "closeDialog 0;";
		};
	};
};

class ACE_CargoFront_List: ACE_Cargo_List {
	name="ACE_CargoFront_List";
	onLoad = "uiNamespace setVariable ['ACE_CargoFront_List', _this select 0];['front'] call ace_sys_cargo_fnc_onload";
	class controls: controls {
		class Title: Title {};
		class Content: Content {
			onLBSelChanged = "[_this,'front'] call ace_sys_cargo_fnc_lbselchanged";
		};
		class Apply_B: Apply_B {
			action = "[ace_sys_cargo_vehicle,'front'] call ace_sys_cargo_fnc_unload";
		};
		class Quit_B: Quit_B {};
	};
};

class CSE_RADIAL_MENU {
	idd = 432341;
	movingenable = 0;
	fadein = 0;
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['CSE_RADIAL_MENU', _this select 0]; ['CSE_RADIAL_MENU', true] call cse_fnc_gui_blurScreen;";
	onUnload = "['CSE_RADIAL_MENU', false] call cse_fnc_gui_blurScreen; ";
	class controlsBackground {	
		class backgroundTop: cse_gui_backgroundBase{
			idc = 800;
			type = CT_STATIC;
			x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0, 0, 0, 0.66};
			colorBackground[] = {0, 0, 0, 0.66};
			text = "cse\cse_gui\radialmenu\data\radial_background_top_w.paa";
		};			
		class backgroundTopLeft: backgroundTop{
			idc = 801;
			text = "cse\cse_gui\radialmenu\data\radial_background_topleft_w.paa";
		};	
		class backgroundTopRight: backgroundTop{
			idc = 802;
			text = "cse\cse_gui\radialmenu\data\radial_background_topright_w.paa";
		};	
		class backgroundCenterLeft: backgroundTop{
			idc = 803;
			text = "cse\cse_gui\radialmenu\data\radial_background_centerleft_w.paa";
		};	
		class backgroundCenterRight: backgroundTop{
			idc = 804;
			text = "cse\cse_gui\radialmenu\data\radial_background_centerright_w.paa";
		};

		class backgroundBottomLeft: backgroundTop{
			idc = 805;
			text = "cse\cse_gui\radialmenu\data\radial_background_bottomleft_w.paa";
		};	
		class backgroundBottomRight: backgroundTop{
			idc = 806;
			text = "cse\cse_gui\radialmenu\data\radial_background_bottomright_w.paa";
		};
		class backgroundBottom: backgroundTop{
			idc = 807;
			text = "cse\cse_gui\radialmenu\data\radial_background_bottom_w.paa";
		};
		class backgroundCenter: backgroundTop{
			idc = 808;
			text = "cse\cse_gui\radialmenu\data\radial_center_info_background.paa";
		};
		class submenu_background_topleft: cse_gui_backgroundBase{
			idc = 700;
			type = CT_STATIC;
			x = "5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "-1.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "30 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0, 0, 0, 0.0};
			colorBackground[] = {0, 0, 0, 0.66};
			text = "cse\cse_gui\radialmenu\data\radial_submenu_topleft.paa";
		};
		class submenu_background_topright: submenu_background_topleft{
			idc = 701;
			text = "cse\cse_gui\radialmenu\data\radial_submenu_topright.paa";
		};
		class submenu_background_bottomleft: submenu_background_topleft{
			idc = 702;
			text = "cse\cse_gui\radialmenu\data\radial_submenu_bottomleft.paa";
		};
		class submenu_background_bottomright: submenu_background_topleft{
			idc = 703;
			text = "cse\cse_gui\radialmenu\data\radial_submenu_bottomright.paa";
		};


		class iconCenter: cse_gui_backgroundBase{
			idc = 710;
			type = CT_STATIC;
			x = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1, 0.4};
			colorBackground[] = {1,1,1, 0.0};
			text = "";
		};
		class iconCenter_return: cse_gui_backgroundBase{
			idc = 711;
			type = CT_STATIC;
			x = "19.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1, 0.4};
			colorBackground[] = {1,1,1, 0.0};
			text = "cse\cse_gui\radialmenu\data\icons\icon_return.paa";
		};

	};
	class controls {
		class LabelmenuName: cse_gui_staticBase{
			idc = 1;
			x = "17 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorText[] = {0.97,0.97,0.97,1};
			colorBackground[] = {0,0,0, 0.0};
			text = "";
			style = ST_CENTER;
		};

		class LabeltargetName: LabelmenuName{
			idc = 2;
			y = "14 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.6)";
		};
		class actionToPrevious : cse_gui_buttonBase {
			idc = 2315;
			text = "";
			/*x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";*/
			x = "19.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0.0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0.0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0.0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0.0)";
			color[] = {1, 1, 1, 1};
			color2[] = {0,0,0, 1};				
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.5,0.5,0.5,0.8};
			colorFocused[] = {0,0,0,1};
			periodFocus = 1;
			periodOver = 1;
			action = "[] call cse_fnc_returnToPreviousSubMenu_GUI;";
		};

		/** ICONS FOR INNER CYCIRLE  */
		class InnerCycle_iconTop: cse_gui_backgroundBase{
			idc = 100;
			type = CT_STATIC;
			x = "19 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1, 0.66};
			colorBackground[] = {1,1,1, 0.66};
			text = "";
		};
		class InnerCycle_iconTopLeft : InnerCycle_iconTop {
			idc = 101;
			x = "15 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			
		};
		class InnerCycle_iconTopRight : InnerCycle_iconTop {
			idc = 102;
			x = "23.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_iconCenterLeft : InnerCycle_iconTop {
			idc = 103;
			x = "13.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_iconCenterRight : InnerCycle_iconTop {
			idc = 104;
			x = "24.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_iconBottomLeft : InnerCycle_iconTop {
			idc = 105;
			x = "15 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_iconBottomRight : InnerCycle_iconTop {
			idc = 106;
			x = "23.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};

		class InnerCycle_iconBottom : InnerCycle_iconTop {
			idc = 107;
			x = "19 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
	
		/** TEXT */
		class InnerCycle_TextTop: cse_gui_staticBase{
			idc = 200;
			x = "18 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorText[] = {1,1,1, 0.66};
			colorBackground[] = {1,1,1, 0.0};
			text = "";
			style = ST_CENTER;
		};
		class InnerCycle_TextTopLeft : InnerCycle_TextTop {
			idc = 201;
			x = "14.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			
		};
		class InnerCycle_TextTopRight : InnerCycle_TextTop {
			idc = 202;
			x = "22.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_TextCenterLeft : InnerCycle_TextTop {
			idc = 203;
			x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "15.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_TextCenterRight : InnerCycle_TextTop {
			idc = 204;
			x = "23.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "15.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_TextBottomLeft : InnerCycle_TextTop {
			idc = 205;
			x = "14.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class InnerCycle_TextBottomRight : InnerCycle_TextTop {
			idc = 206;
			x = "22.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "19.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};

		class InnerCycle_TextBottom : InnerCycle_TextTop {
			idc = 207;
			x = "18 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "20.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};

class InnerCycle_actionTop : cse_gui_buttonBase {
			idc = 10;
			text = "";
			x = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.7 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			/*animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.6)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0.5)";*/
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			color[] = {1, 1, 1, 1};
			color2[] = {0,0,0, 1};				
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.5,0.5,0.5,0.8};
			colorFocused[] = {0,0,0,1};
			periodFocus = 1;
			periodOver = 1;
			action = "";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_10;";
		};

		class InnerCycle_actionTopLeft : InnerCycle_actionTop {
			idc = 11;
			text = "";
			x = "14.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_11;";
		};
		class InnerCycle_actionTopRight : InnerCycle_actionTop {
			idc = 12;
			text = "";
			x = "22.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_12;";
		};



		class InnerCycle_actionCenterLeft : InnerCycle_actionTop {
			idc = 13;
			text = "";
			x = "12.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_13;";
		};
		class InnerCycle_actionCenterRight : InnerCycle_actionTop {
			idc = 14;
			text = "";
			x = "23.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_14;";
		};


		class InnerCycle_actionBottomLeft : InnerCycle_actionTop {
			idc = 15;
			text = "";
			x = "14.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_15;";
		};
		class InnerCycle_actionBottomRight : InnerCycle_actionTop {
			idc = 16;
			text = "";
			x = "22.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_16;";
		};

		class InnerCycle_actionBottom : InnerCycle_actionTop {
			idc = 17;
			text = "";
			x = "18.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.7 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "[] call compile CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_17;";
		};
	



		class secondCycle_iconBottomLeft: cse_gui_backgroundBase{
			idc = 350;
			type = CT_STATIC;
			x = "10.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1, 0.66};
			colorBackground[] = {1,1,1, 0.66};
			text = "";
		};
		class secondCycle_iconBottomLeftTwo : secondCycle_iconBottomLeft {
			idc = 351;
			x = "9.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconBottomLeftThree : secondCycle_iconBottomLeft {
			idc = 352;
			x = "9.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconTopLeftOne : secondCycle_iconBottomLeft {
			idc = 353;
			x = "10.75 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "8.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconTopLeftTwo : secondCycle_iconBottomLeft {
			idc = 354;
			text = "";
			x = "13.75 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconTopLeftThree : secondCycle_iconBottomLeft {
			idc = 355;
			x = "17.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconTopRightOne : secondCycle_iconBottomLeft {
			idc = 356;
			x = "21.35 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconTopRightTwo : secondCycle_iconBottomLeft {
			idc = 357;
			x = "24.84 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconTopRightThree : secondCycle_iconBottomLeft {
			idc = 358;
			x = "27.48 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "8.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconBottomRightOne : secondCycle_iconBottomLeft {
			idc = 359;
			x = "29.65 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.25 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconBottomRightTwo : secondCycle_iconBottomLeft {
			idc = 360;
			x = "29.65 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_iconBottomRightThree : secondCycle_iconBottomLeft {
			idc = 361;
			x = "28.65 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};


		class secondCycle_TextBottomLeft: cse_gui_staticBase{
			idc = 400;
			x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "20 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorText[] = {1,1,1, 0.66};
			colorBackground[] = {1,1,1, 0.0};
			text = "";
			style = ST_CENTER;
		};


		class secondCycle_textBottomLeftTwo : secondCycle_TextBottomLeft {
			idc = 401;
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textBottomLeftThree : secondCycle_TextBottomLeft {
			idc = 402;
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textTopLeftOne : secondCycle_TextBottomLeft {
			idc = 403;
			x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textTopLeftTwo : secondCycle_TextBottomLeft {
			idc = 404;
			text = "";
			x = "12 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textTopLeftThree : secondCycle_TextBottomLeft {
			idc = 405;
			x = "15.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textTopRightOne : secondCycle_TextBottomLeft {
			idc = 406;
			x = "19.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textTopRightTwo : secondCycle_TextBottomLeft {
			idc = 407;
			x = "22.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textTopRightThree : secondCycle_TextBottomLeft {
			idc = 408;
			x = "25.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textBottomRightOne : secondCycle_TextBottomLeft {
			idc = 409;
			x = "27.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textBottomRightTwo : secondCycle_TextBottomLeft {
			idc = 410;
			x = "27.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "16.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class secondCycle_textBottomRightThree : secondCycle_TextBottomLeft {
			idc = 411;
			x = "26.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "20 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};

		class secondCycle_actionBottomLeft : cse_gui_buttonBase {
			idc = 300;
			text = "";
			x = "9.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			/*animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.6)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0.5)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0.5)";*/
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
			color[] = {1, 1, 1, 1};
			color2[] = {0,0,0, 1};				
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			colorbackground2[] = {1,1,1,1};
			colorDisabled[] = {0.5,0.5,0.5,0.8};
			colorFocused[] = {0,0,0,1};
			periodFocus = 1;
			periodOver = 1;
			action = "";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 350) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 350) ctrlSetTextColor [1, 1, 1, 0.66];";
		};

		class secondCycle_actionBottomLeftTwo : secondCycle_actionBottomLeft {
			idc = 301;
			x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 351) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 351) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionBottomLeftThree : secondCycle_actionBottomLeft {
			idc = 302;
			x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 352) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 352) ctrlSetTextColor [1, 1, 1, 0.66];";
		};

		class secondCycle_actionTopLeftOne : secondCycle_actionBottomLeft {
			idc = 303;
			x = "10 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 353) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 353) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionTopLeftTwo : secondCycle_actionBottomLeft {
			idc = 304;
			text = "";
			x = "13 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 354) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 354) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionTopLeftThree : secondCycle_actionBottomLeft {
			idc = 305;
			x = "16.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 355) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 355) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionTopRightOne : secondCycle_actionBottomLeft {
			idc = 306;
			x = "20.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 356) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 356) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionTopRightTwo : secondCycle_actionBottomLeft {
			idc = 307;
			x = "23.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 357) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 357) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionTopRightThree : secondCycle_actionBottomLeft {
			idc = 308;
			x = "26.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 358) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 358) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionBottomRightOne : secondCycle_actionBottomLeft {
			idc = 309;
			x = "28.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 359) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 359) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionBottomRightTwo : secondCycle_actionBottomLeft {
			idc = 310;
			x = "28.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "14.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 360) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 360) ctrlSetTextColor [1, 1, 1, 0.66];";
		};
		class secondCycle_actionBottomRightThree : secondCycle_actionBottomLeft {
			idc = 311;
			x = "27.4 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "3.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			onMouseEnter = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 361) ctrlSetTextColor [1, 1, 1, 1];";
			onMouseExit = "((uiNamespace getvariable 'CSE_RADIAL_MENU') displayCtrl 361) ctrlSetTextColor [1, 1, 1, 0.66];";
		};

	};
};

class cse_sys_vehicleMenu {
	idd = 314436;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_sys_vehicleMenu', _this select 0]; ['cse_onMenuOpen_Veh', true] call cse_fnc_gui_blurScreen; [_this select 0] call cse_fnc_onMenuOpen_VEH; ";
	onUnload = "CSE_VEHICLE_INTERACTION_MENU_OPEN = false; ['cse_onMenuOpen_Veh', false] call cse_fnc_gui_blurScreen; ['cse_onMenuOpen_Veh', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;";

	class controlsBackground {
		class HeaderBackground: cse_gui_backgroundBase{
			idc = -1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "#(argb,8,8,3)color(0,0,0,0)";
			//moving = 1;
		};
		class CenterBackground: HeaderBackground {
			/*x = 0.138;
			y = 0.17;
			w = 1.2549;
			h = 0.836601;*/
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			h = "16 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			//text = "#(argb,8,8,3)color(0,0,0,0.65)";
			//text = "cse\cse_sys_medical\data\ui_background.paa";
			text = "#(argb,8,8,3)color(0,0,0,0.9)";
			colorText[] = {0, 0, 0, "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			colorBackground[] = {0,0,0,"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
		};
		/*class BottomBackground: CenterBackground {
			y = "(18.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))";
			h = "9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};*/
	};

	class controls {
		class HeaderName {
			idc = 1;
			type = CT_STATIC;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_LEFT + ST_SHADOW;
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.95, 0.95, 0.95, 0.75};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			text = "";
		};

		class IconsBackGroundBar: cse_gui_backgroundBase{
			idc = -1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			//text = "#(argb,8,8,3)color(0,0,0,0.4)";
			text ="cse\cse_sys_medical\data\cse_background_img.paa";
			colorText[] = {1, 1, 1, 0.0};
			//moving = 1;
		};
		class CatagoryLeft: HeaderName {
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "12.33 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_CENTER;
			//colorText[] = {0.6, 0.7, 1.0, 1};
			colorText[] = {1, 1, 1.0, 0.9};
			colorBackground[] = {0,0,0,0};
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			text = "ACTIONS & OVERVIEW";
		};
		class CatagoryCenter: CatagoryLeft {
			x = "13.33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "ACTIONS";
		};
		class CatagoryRight: CatagoryCenter{
			x = "25.66 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "VEHICLE";
		};
		class Line: cse_gui_backgroundBase {
			idc = -1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "37 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.03 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "#(argb,8,8,3)color(1,1,1,0.5)";
		};



		class BtnIconLeft1: cse_gui_buttonBase {
			idc = 11;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.73 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.1)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureOver = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureFocused = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTexturePressed = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDefault = "#(argb,8,8,3)color(0,0,0,0.0)";
			action = "['crew'] call cse_fnc_displayOptions_VEH;";
		};
		class BtnIconLeft2: BtnIconLeft1 {
			idc = 12;
			x = "3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['cargo'] call cse_fnc_displayOptions_VEH;";
		};
		class BtnIconLeft3: BtnIconLeft1 {
			idc = 13;
			x = "4.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "['repair'] call cse_fnc_displayOptions_VEH;";
		};
		class BtnIconLeft4: BtnIconLeft1 {
			idc = 14;
			x = "6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "";
		};
		class BtnIconLeft5: BtnIconLeft1 {
			idc = 15;
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "";
		};
		class BtnIconLeft6: BtnIconLeft1 {
			idc = 16;
			x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "";
		};
		class BtnIconLeft7: BtnIconLeft1 {
			idc = 17;
			x = "10.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "";
		};
		class BtnIconLeft8: BtnIconLeft1 {
			idc = 18;
			x = "12 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "";
		};
		class iconImg1: cse_gui_backgroundBase {
			idc = 111;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.73 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.1)";
			colorBackground[] = {0,0,0,1};
			colorPicture[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			text = "cse\cse_sys_vehicles\data\icons\icon_crew.paa";
		};
		class iconImg2: iconImg1 {
			idc = 112;
			x = "3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_vehicles\data\icons\icon_cargo.paa";
		};
		class iconImg3: iconImg1 {
			idc = 113;
			x = "4.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "cse\cse_sys_vehicles\data\icons\icon_repair.paa";
		};
		class iconImg4: iconImg1 {
			idc = 114;
			x = "6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "";
		};
		class iconImg5: iconImg1 {
			idc = 115;
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "";
		};
		class iconImg6: iconImg1 {
			idc = 116;
			x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "";
		};
		class iconImg7: iconImg1 {
			idc = 117;
			x = "10.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "";
		};
		class iconImg8: iconImg1 {
			idc = 118;
			x = "12 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			text = "";
		};


		class informationList:  cse_gui_listBoxBase {
			idc = 212;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			rowHeight = 0.03;
			colorBackground[] = {0, 0, 0, 0.2};
			colorText[] = {1,1, 1, 1.0};
			colorScrollbar[] = {1,1, 1, 1.0};
			colorSelect[] = {1,1, 1, 1.0};
			colorSelect2[] = {1,1, 1, 1.0};
			colorSelectBackground[] = {0, 0, 0, 1.0};
			colorSelectBackground2[] = {0.0, 0.0, 0.0, 0.7};
		};



		class BtnMenu1: BtnIconLeft1 {
			idc = 20;
			x = "13.6 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11.6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
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
		};
		class BtnMenu2: BtnMenu1 {
			idc = 21;
			y = "6.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu3: BtnMenu1 {
			idc = 22;
			y = "7.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu4: BtnMenu1 {
			idc = 23;
			y = "8.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text ="";
		};
		class BtnMenu5: BtnMenu1 {
			idc = 24;
			y = "9.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu6: BtnMenu1 {
			idc = 25;
			y = "10.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu7: BtnMenu1 {
			idc = 26;
			y = "12 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class BtnMenu8: BtnMenu1 {
			idc = 27;
			y = "13.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
	};
};
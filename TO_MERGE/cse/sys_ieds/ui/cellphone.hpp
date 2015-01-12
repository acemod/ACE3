class cse_ied_cellphone {
	idd = 754321;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_ied_cellphone', _this select 0]; [_this] call cse_fnc_onCellPhoneOpened_IEDS; ['CSE_RADIAL_MENU', false] call cse_fnc_gui_blurScreen;";
	onUnload = "";

	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "cse\cse_sys_ieds\data\cellphone_background.paa";
		};
	};
	class controls {
		class labelTextMenu : cse_gui_staticBase {
			idc = 10;
			x = "5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			text = "SERVICE";
			colorBackground[] = {0,0,0,0.0};
			colorText[] = {0.0, 0.0, 0.0, 1.0};
			style = ST_CENTER;
		};
		class labelTextLineOne : labelTextMenu {
			idc = 11;
			x = "5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "19.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "5.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.6)";
			text = "";
			style = ST_LEFT;
		};
		class labelTextLineTwo : labelTextLineOne {
			idc = 12;
			y = "20.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class labelTextLineThree : labelTextLineOne {
			idc = 13;
			y = "21 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class labelTextLineFour : labelTextLineOne {
			idc = 14;
			y = "21.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};


		class actionCenter : cse_gui_buttonBase {
			idc = 30;
			text = "";
			x = "6.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "2.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
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
			action = "[] call cse_fnc_cellphone_detonateIED_IEDS;";
		};

		class actionButtonLeft : actionCenter {
			idc = 31;
			text = "";
			x = "5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "24 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "";
		};
		class actionButtonRight_downwards : actionButtonLeft {
			idc = 32;
			text = "";
			x = "8.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "24.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS - 1; [_this] call cse_fnc_onCellPhoneOpened_IEDS;";
		};
		class actionButtonRight_up : actionButtonRight_downwards {
			idc = 32;
			text = "";
			x = "9.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS = CSE_CELLPHONE_ADRESSBOOK_POINTER_IEDS + 1; [_this] call cse_fnc_onCellPhoneOpened_IEDS;";
		};

	};
};

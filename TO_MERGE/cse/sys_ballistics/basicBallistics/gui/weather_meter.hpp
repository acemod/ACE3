class cse_weather_meter {
	idd = 65423;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['cse_weather_meter', _this select 0];CSE_WEATHER_METER_IS_OPEN_DEFLECT = true; NUL = [] spawn cse_fnc_onWeatherMeterOpened_DEFLECT;";
	onUnload = "CSE_WEATHER_METER_IS_OPEN_DEFLECT = false; ";

	class controlsBackground {
		class backgroundImg: cse_gui_backgroundBase{
			idc = 1;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			x = "0 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "cse\cse_sys_ballistics\basicBallistics\data\pocket_weather_meter_day_green.paa";
			moving = 1;
		};
	};

	class controls {
		class labelTextMenu : cse_gui_staticBase {
			idc = 10;
			x = "4.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "19 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			text = "CATEGORY NAME";
			colorBackground[] = {0,0,0,0.0};
			colorText[] = {0.0, 0.0, 0.0, 1.0};
			style = ST_CENTER;
		};
		class labelTextLineOne : labelTextMenu {
			idc = 11;
			x = "4.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "20 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.6)";
			text = "";
			style = ST_LEFT;
		};
		class labelTextLineTwo : labelTextLineOne {
			idc = 12;
			y = "20.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};
		class labelTextLineThree : labelTextLineOne {
			idc = 13;
			y = "21.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "";
		};



		class actionClose : cse_gui_buttonBase {
			idc = 30;
			text = "";
			x = "4.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "28.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.0)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.0)";
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
			action = "closedialog 0;";
		};

		class actionButtonLeft : actionClose {
			idc = 31;
			text = "";
			x = "4.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "[] call cse_fnc_weatherMeterOpenWindView_DEFLECT; CSE_WEATHER_METER_CURRENT_SCREEN_DEFLECT = 'WIND_VIEW';";
		};
		class actionButtonRight : actionButtonLeft {
			idc = 32;
			text = "";
			x = "9.25 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "1.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "[] call cse_fnc_weatherMeterOpenWeatherView_DEFLECT; CSE_WEATHER_METER_CURRENT_SCREEN_DEFLECT = 'WEATHER_VIEW';";
		};

	};
};
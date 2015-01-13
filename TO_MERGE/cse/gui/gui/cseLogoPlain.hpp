
class CSE_LogoPlain {
	idd = 432350;
	movingenable = 0;
	fadein = 1;
	fadeout = 1;
	onLoad = "uiNamespace setVariable ['CSE_LogoPlain', _this select 0];";
	onUnload = "uiNamespace setVariable ['CSE_LogoPlain', nil];";
	onMouseButtonClick = "closeDialog 432350;";
	class controlsBackground {
		class backgroundTop: cse_gui_backgroundBase{
			idc = 1;
			type = CT_STATIC;
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {1,1,1,1};
			colorBackground[] = {1,1,1,1};
			text = "cse\cse_gui\data\logo_black_background.paa";
			onMouseButtonClick = "closeDialog 432350;";
		};

	};

	class controls {

	};
};

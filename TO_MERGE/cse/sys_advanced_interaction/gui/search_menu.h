class cse_searchMenu_aim {
	idd = 54327;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_searchMenu_aim', _this select 0];";
	onUnload = "uiNamespace setVariable ['cse_searchMenu_aim', nil];"; 
	class controlsBackground {
		class HeaderBackground: cse_gui_backgroundBase{
			idc = -1;
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
	};

	class controls {

	};
};
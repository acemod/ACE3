class RscTitles {
	class ACE_RscWindIntuitive {
		idd = -1;
		onLoad ="with uiNameSpace do { ACE_RscWindIntuitive = _this select 0 };";
		movingEnable = 0;
		duration = 10;
		fadeIn = false;
		fadeOut = false;
		controls[] = { "ACE_RscWindIntuitive_BG", "ACE_RscWindIntuitive_1" };
		class ACE_RscWindIntuitive_BG {
			idc = -1;
			type = 0;
			style = 128;
			font = "TahomaB";
			colorBackground[] = {0,0,0,0};
			colorText[] = { 0,0,0,0};
			text = "";
			sizeEx = 0.027;
			x = "SafeZoneX + 0.001";
			y = "SafeZoneY + 0.04";
			w = 0.3;
			h = 0.3;
			size = 0.034;
		};
		class ACE_RscWindIntuitive_1: ACE_RscWindIntuitive_BG {
			// TITS = 1591514
			idc = 1591514;
			style = 48;
			colorText[] = {0,0,0,0.1};
			font ="Bitstream";
			sizeEx = 0.03;
			text = "";		// text = "x\ace\addons\sys_wind_deflection\data\windxx.paa";
		};
	};
};
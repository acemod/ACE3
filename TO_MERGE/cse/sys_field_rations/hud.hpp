// CSE FRM HUD
// by Glowbal

class RscTitles{
	class RscCSEPlayerStatus {
		duration = 10000000000;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEFRMStatusUI', _this select 0];";

		class controlsBackground {
			class cse_FoodStatus: cse_backgroundBase {
				text = "cse\cse_sys_field_rations\data\hud_foodstatus2.paa";
				colorText[] = {0.0, 1.0, 0.0, 0.9};
				idc = 11112;
				x = "0.955313 * safezoneW + safezoneX";
				y = "0.90 * safezoneH + safezoneY";
				w = "0.04 * safezoneW";
				h = "0.05 * safezoneH";
			};
		
			class cse_drinkStatus: cse_FoodStatus {
				text = "cse\cse_sys_field_rations\data\hud_drinkstatus2.paa";
				idc = 11113;
				y = "0.85 * safezoneH + safezoneY";
	
			};
			
			class cse_CamelBak: cse_FoodStatus {
				text = "cse\cse_sys_field_rations\data\hud_camelbak.paa";
				idc = 11114;
				y = "0.80 * safezoneH + safezoneY";
			};
		};
	};
};
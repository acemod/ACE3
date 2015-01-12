class RscTitles{
	class RscCSEScreenEffectsBlack {
		duration = 10e10;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEFadingBlackUI', _this select 0];";

		class controlsBackground {
			class cse_BlackScreen: cse_gui_backgroundBase {
				text = "cse\cse_f_states\data\black_out1.paa";
				colorText[] = {0.0, 0.0, 0.0, 0.0};
				idc = 11112;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class RscCSEScreenEffectsPain {
		duration = 1;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEPainScreen', _this select 0];";

		class controlsBackground {
			class cse_PainScreen: cse_gui_backgroundBase {
				text = "cse\cse_f_states\data\pain_screen3.paa";
				colorText[] = {1, 1, 1, 0.5};
				idc = 11114;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class RscCSEScreenEffectsBleeding {
		duration = 1;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEBleedingScreen', _this select 0];";

		class controlsBackground {
			class cse_BleedingScreen: cse_gui_backgroundBase {
				text = "cse\cse_f_states\data\cse_bleedingScreen_v5.paa";
				colorText[] = {0.9, 0.2, 0.2, 0.6};
				idc = 11113;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class RscCSEScreenEffectsHit{
		duration = 1.1;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEHitScreen', _this select 0];";

		class controlsBackground {
			class cse_EffectHit: cse_gui_backgroundBase {
				text = "cse\cse_f_states\data\hit_screen1.paa";
				colorText[] = {0.7, 0.2, 0.2, 0.4};
				idc = 11113;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class RscCSEScreenEffectsHitPain{
		duration = 1.1;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEHitPainScreen', _this select 0];";

		class controlsBackground {
			class cse_EffectHitNew: cse_gui_backgroundBase {
				text = "cse\cse_f_states\data\hit_screen1.paa";
				colorText[] = {0.9, 0.9, 0.9, 0.7};
				idc = 11113;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
class RscCSEScreenEffectsBlur {
		duration = 2;
		idd = 1111;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSEBlurScreen', _this select 0];";

		class controlsBackground {
			class cse_BlurScreen: cse_gui_backgroundBase {
				text = "cse\cse_f_states\data\cse_blurryScreen.paa";
				colorText[] = {0.5, 0.5, 0.5, 0.2};
				idc = 11114;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class cse_progressBar_Sample {
		idd = -1;
		onLoad = "uiNamespace setVariable ['cse_progressBar_Sample', _this select 0]; ";
		fadein = 0;
		fadeout = 0;
		duration = 10e10;
		class Controls {

			class background: cse_gui_backgroundBase {
				idc = -1;
				colorBackground[] = {0,0,0,1};
				colorText[] = {1, 1, 1, 1};
				x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
				y = "29 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
				w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
				h = "0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				text = "#(argb,8,8,3)color(0,0,0,0.4)";
			};

			class Progress: cse_gui_RscProgress {
			 	idc = 6;
				x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
				y = "29 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
				w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
				h = "0.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				colorFrame[] = {0,0,0,0};
  				colorBar[] = {0.27,0.5,0.31,0.6};
  				// colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
  				texture = "#(argb,8,8,3)color(1,1,1,0.7)";
			};
		};
	};


	class CSE_DISPLAY_MESSAGE {
		duration = 7;
		idd = 86411;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSE_DISPLAY_MESSAGE', _this select 0];";
		fadein = 0;
		class controlsBackground {
			class header: cse_gui_staticBase {
				idc = 1;
				type = CT_STATIC;
				x = "safezoneX + (safezoneW / 10)";
				y = "safezoneY + (30 * (safeZoneH / 40))";
				w = "(safeZoneW / 10)";
				h = "(safeZoneH / 40)";
				style = ST_LEFT;
				font = FontCSE;
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {0.85, 0.85, 0.85, 1.0};
				colorBackground[] = {0, 0, 0, 0.9};
				text = "";
			};
			class text: header {
				idc = 2;
				y = "safezoneY + (31 * (safeZoneH / 40))";
				w = "(safeZoneW / 10) * 1.3";
				colorText[] = {0.0, 0.0, 0.0, 1.0};
				colorBackground[] = {1, 1, 1, 0.9};
				text = "";
			};
		};
	};

	class CSE_DISPLAY_INFORMATION {
		duration = 15;
		idd = 86412;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSE_DISPLAY_INFORMATION', _this select 0];";
		fadein = 0;
		class controlsBackground {
			class header: cse_gui_staticBase {
				idc = 1;
				type = CT_STATIC;
				x = "safezoneX + (safezoneW / 10)";
				y = "safezoneY + (6 * (safeZoneH / 40))";
				w = "(safeZoneW / 10)";
				h = "(safeZoneH / 40)";
				style = ST_LEFT;
				font = FontCSE;
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {0.85, 0.85, 0.85, 1.0};
				colorBackground[] = {0, 0, 0, 0.9};
				text = "";
			};
			class text: header {
				idc = 2;
				y = "safezoneY + (7.1 * (safeZoneH / 40))";
				w = "(safeZoneW / 10) * 1.3";
				colorText[] = {0.0, 0.0, 0.0, 1.0};
				colorBackground[] = {1, 1, 1, 0.9};
				text = "";
			};
			class text2: text {
				idc = 3;
				y = "safezoneY + (8.2 * (safeZoneH / 40))";
			};
			class text3: text {
				idc = 4;
				y = "safezoneY + (9.3 * (safeZoneH / 40))";
			};
			class text4: text {
				idc = 5;
				y = "safezoneY + (10.4 * (safeZoneH / 40))";
			};
			class text5: text {
				idc = 6;
				y = "safezoneY + (11.5 * (safeZoneH / 40))";
			};


			class icon: cse_gui_backgroundBase {
				type = CT_STATIC;
				idc = 10;
				style = ST_PICTURE;
				colorBackground[] = {0,0,0,1};
				colorText[] = {1, 1, 1, 1};
				font = FontCSE;
				text = "";
				sizeEx = 0.032;
				x = "safezoneX + (safezoneW / 10)";
				y = "safezoneY + (4 * (safeZoneH / 40))";
				w = "(safeZoneH / 40)*2";
				h = "(safeZoneH / 40)*2";

			};

		};
	};

	class CSE_DISPLAY_MESSAGE_CONCEPT {
		duration = 15;
		idd = 86413;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['CSE_DISPLAY_MESSAGE_CONCEPT', _this select 0];";
		fadein = 0;
		class controlsBackground {
			class header: cse_gui_staticBase {
				idc = 1;
				type = CT_STATIC;
				x = "safezoneX + (safezoneW / 10)";
				y = "safezoneY + (6 * (safeZoneH / 40))";
				w = "(safeZoneW / 10)";
				h = "(safeZoneH / 40)";
				style = ST_LEFT + ST_SHADOW;
				font = "EtelkaMonospacePro";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {1,1,1, 1.0};
				colorBackground[] = {0, 0, 0, 0.0};
				text = "";
				shadow = 2;
			};
			class text: header {
				idc = 2;
				y = "safezoneY + (31 * (safeZoneH / 40))";
				w = "(safeZoneW / 10) * 1.3";
				text = "";
			};
		};
	};

 class CSE_sys_field_rations_PlayerStatusUI {
    duration = 1e+011;
    idd = 1111;
    movingenable = 0;
    onLoad = "uiNamespace setVariable ['CSE_sys_field_rations_PlayerStatusUI', _this select 0];";
    class controlsBackground {
      class FoodStatus: cse_gui_backgroundBase {
        text = "cse\cse_sys_field_rations\data\hud_foodstatus.paa";
        colorText[] = {0.0,1.0,0.0,0.4};
        idc = 11112;
        x = (safezoneW + safezoneX) - (2 * (((safezoneW / safezoneH) min 1.2) / 40));
        y = "28 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
        w = "1.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h = "1.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
      };
      class drinkStatus: cse_gui_backgroundBase {
        text = "cse\cse_sys_field_rations\data\hud_drinkstatus.paa";
        colorText[] = {0.0,1.0,0.0,0.4};
        idc = 11113;
        x = (safezoneW + safezoneX) - (2 * (((safezoneW / safezoneH) min 1.2) / 40));
        y = "30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
        w = "1.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
        h = "1.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
      };
     /* class CamelBak: cse_gui_backgroundBase {
        text = "cse\cse_sys_field_rations\data\hud_camelbak.paa";
        colorText[] = {0.0,1.0,0.0,0};
        idc = 11114;
        x = "0.955313 * safezoneW + safezoneX";
        y = "0.80 * safezoneH + safezoneY";
        w = 0.05;
        h = 0.09;
      };*/
    };
  };

//  class RscHealthTextures {
//  	onload = "uinamespace setvariable ['RscHealthTextures',_this select 0]; ['RscHealthTextures has activated'] call cse_fnc_debug;";
 // };
};
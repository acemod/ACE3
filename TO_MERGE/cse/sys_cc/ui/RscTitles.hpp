class RscTitles{
	//#include "cse_m_tablet.hpp"
	//#include "cse_view_small.hpp"


	class cse_future_soldier_blueforce {
		onLoad = "uiNamespace setVariable ['cse_future_soldier_blueforce', _this select 0];";
		duration = 10e10;
		fadein = 0;
		fadeout = 0;
		idd = 590824;
		movingEnable = false;

		class controlsBackground {
			class cse_background : cse_gui_backgroundBase {
				idc = -1;
				x = 3;
				y = 2;
				w = 1;
				h = 0.5;
				text = "";
			};
		};

		class controls {



			class display_hud_backgroundImg: cse_gui_backgroundBase {
				idc = 1;
				x = safezoneX + 0.01;
				y = safezoneY + 0.01;
				w = 0.4;
				h = 0.4;
				text = "cse\cse_sys_cc\data\empty_background2.paa";
				colorText[] = {0, 0, 0, 0.2};
			};


			class informationDisplay: cse_gui_staticBase {
				idc = 2;
				x = safezoneX + 0.02;
				y = safezoneY + 0.02;
				w = 0.31;
				h = 0.05;
				style = ST_LEFT;
				sizeEx = 0.03921;
				colorText[] = {0.95, 0.95, 0.95, 0.8};
				colorBackground[] = {0, 0, 0, 0};
				text = "LOCAL TIME: 05:21";
			};
			class informationDisplay2: informationDisplay {
				idc = 3;
				//x = safezoneX + 0.05;
				y = safezoneY + 0.07;
				text = "OBJECTIVE: 0534 1235";
			};
			class informationDisplay3: informationDisplay {
				idc = 4;
				//x = safezoneX + 0.05;
				y = safezoneY + 0.12;
				text = "DISTANCE: 1530m";
			};
			class informationDisplay4: informationDisplay {
				idc = 5;
				//x = safezoneX + 0.05;
				y = safezoneY + 0.17;
				text = "SPEED: 10km";
			};



		};
	};
};
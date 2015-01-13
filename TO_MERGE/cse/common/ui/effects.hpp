class RscTitles{
	class GVAR(ScreenEffectsBlack) {
		duration = 10e10;
		idd = 1111;
		movingenable = 0;
		onLoad = QUOTE(uiNamespace setVariable [QGVAR(ScreenEffectsBlack), _this select 0];);

		class controlsBackground {
			class blackScreen: ace_gui_backgroundBase {
				text = QUOTE(PATHTOF(data\black_out.paa));
				colorText[] = {0.0, 0.0, 0.0, 0.0};
				idc = 11112;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class GVAR(ScreenEffectsBleeding) {
		duration = 1;
		idd = 1111;
		movingenable = 0;
		onLoad = QUOTE(uiNamespace setVariable [QGVAR(ScreenEffectsBleeding), _this select 0];);

		class controlsBackground {
			class bleedingScreen: ace_gui_backgroundBase {
				text = QUOTE(PATHTOF(data\bleeding.paa));
				colorText[] = {0.9, 0.2, 0.2, 0.6};
				idc = 11113;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
	class GVAR(ScreenEffectsHit) {
		duration = 1.1;
		idd = 1111;
		movingenable = 0;
		onLoad = QUOTE(uiNamespace setVariable [QGVAR(ScreenEffectsHit), _this select 0];);

		class controlsBackground {
			class effectHit: ace_gui_backgroundBase {
				text = QUOTE(PATHTOF(data\hit.paa));
				colorText[] = {0.7, 0.2, 0.2, 0.4};
				idc = 11113;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
};
class RscTitles{
	class GVAR(ScreenEffectsBlack) {
		duration = 10e10;
		idd = 1111;
		movingenable = 0;
		onLoad = QUOTE(uiNamespace setVariable [QGVAR(ScreenEffectsBlack), _this select 0];);

		class controlsBackground {
			class blackScreen: ACE_gui_backgroundBase {
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
			class bleedingScreen: ACE_gui_backgroundBase {
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
			class effectHit: ACE_gui_backgroundBase {
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
	class GVAR(ScreenEffectsPain) {
		duration = 1;
		idd = 1111;
		movingenable = 0;
		onLoad = QUOTE(uiNamespace setVariable [QGVAR(ScreenEffectsPain), _this select 0];);

		class controlsBackground {
			class painScreen: ACE_gui_backgroundBase {
				text = QUOTE(PATHTOF(data\painScreen.paa));
				colorText[] = {1, 1, 1, 0.5};
				idc = 11115;
				x = safezoneX;
				y = safezoneY;
				w = safezoneW;
				h = safezoneH;
			};
		};
	};
};
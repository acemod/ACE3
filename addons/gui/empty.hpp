#include "\z\ace\addons\gui\UI\define.hpp"

class ACE_common_empty_screen {
	idd = 679123;
	onLoad = "uiNamespace setVariable [""ACE_common_empty_screen"", _this select 0]";
	onUnload = "if (missionNamespace getvariable [""ACE_common_DISABLE_USER_INPUT_SCREEN"", false)]) then { createDialog ""ACE_common_empty_screen""; }";
	class controlsBackground {
		class background : ACE_gui_backgroundBase {
			idc = 1;
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			text = "";
			moving = 0;
		};
	};

	class controls {
	};
};

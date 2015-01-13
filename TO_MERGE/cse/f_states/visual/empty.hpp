class cse_empty_screen {
	idd = 679123;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_empty_screen', _this select 0];";
	onUnload = "if (!isnil 'CSE_DISABLE_USER_INPUT_SCREEN') then { createDialog 'cse_empty_screen';};";
	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
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
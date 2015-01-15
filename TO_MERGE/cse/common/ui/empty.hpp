class GVAR(empty_screen) {
	idd = 679123;
	movingEnable = false;
	onLoad = QUOTE(uiNamespace setVariable [QGVAR(empty_screen), _this select 0];);
	onUnload = QUOTE(if (missionNamespace getvariable [QGVAR(DISABLE_USER_INPUT_SCREEN), false]) then { createDialog QGVAR(empty_screen);};);
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
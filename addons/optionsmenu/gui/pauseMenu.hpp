class ACE_Open_SettingsMenu_BtnBase : ACE_gui_buttonBase {
	idc = -1;
	text = "Configure [CSE]";
	x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
	y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
	w = "14 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
	animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	color[] = {1, 1, 1, 1};
	color2[] = {0,0,0, 1};				
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground[] = {1,1,1,1};
	colorbackground2[] = {1,1,1,1};
	colorDisabled[] = {0.5,0.5,0.5,0.8};
	colorFocused[] = {0,0,0,1};
	periodFocus = 1;
	periodOver = 1;
	action = "(findDisplay 49) closeDisplay 0; createDialog 'ACE_settingsMenu';";
};

class RscStandardDisplay;
class RscDisplayMPInterrupt: RscStandardDisplay {
	class controls {
		class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
	};
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay {
	class controls {
		class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
	};
};
class RscDisplayInterrupt: RscStandardDisplay {
	class controls {
		class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
	};
};
class RscDisplayInterruptEditor3D: RscStandardDisplay {
	class controls {
		class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
	};
};
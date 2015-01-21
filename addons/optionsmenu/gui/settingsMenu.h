class cse_settingsMenu {
	idd = 145246;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_settingsMenu', _this select 0]; [] call cse_fnc_onSettingsMenuOpen; ['cse_settingsMenu', true] call cse_fnc_gui_blurScreen;missionNamespace setVariable ['CSE_SETTINGS_MENU_OPEN', true];";
	onUnload = "uiNamespace setVariable ['cse_settingsMenu', nil]; saveProfileNamespace; ['cse_settingsMenu', false] call cse_fnc_gui_blurScreen; missionNamespace setVariable ['CSE_SETTINGS_MENU_OPEN', nil];"; 
	class controlsBackground {
		class HeaderBackground: cse_gui_backgroundBase{
			idc = -1;
			type = CT_STATIC;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_LEFT + ST_SHADOW;
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.95, 0.95, 0.95, 0.75};
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			text = "";
		};
		class CenterBackground: HeaderBackground {
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			h = "2.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
			colorText[] = {0, 0, 0, "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
			colorBackground[] = {0,0,0,"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.9])"};
		};
		class LeftBackground: CenterBackground {
			y = "4.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			h = "12.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
		class RightBackground: LeftBackground {
			x = "26.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			w = "12.9 * (((safezoneW / safezoneH) min 1.2) / 40)";
		};
	};

	class controls {
		class HeaderName {
			idc = 1;
			type = CT_STATIC;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			style = ST_LEFT + ST_SHADOW;
			font = "PuristaMedium";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			colorText[] = {0.95, 0.95, 0.95, 0.75};
			colorBackground[] = {0,0,0,0};
			text = "Configure [CSE]";
		};

		class actionClose : cse_gui_buttonBase {
			idc = 10;
			text = "Close";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6 * (((safezoneW / safezoneH) min 1.2) / 40)";
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
			action = "closedialog 0;";
		};
		class actionUnassign: actionClose {
			idc = 11;
			text = "Unassign";
			x = "33 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			action = "[0, 0, 0, 0] call cse_fnc_settingsMenuUpdateKeyBinding_F;";
		};

		class labelShow : cse_gui_staticBase {
			idc = 12;
			x = "2 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "4 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "Show:";
		};
		class labelShow2: cse_gui_staticBase {
			idc = 13;
			x = "2 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "30 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
		};

		class selectionAction_1 : cse_gui_buttonBase {
			idc = 1000;
			text = "Menus";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "9.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
			animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
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
			action = "[nil, 0] call cse_fnc_onListBoxShowSelectionChanged;";
		};
		class selectionAction_2 : selectionAction_1 {
			idc = 1001;
			text = "Actions";
			x = "10.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "[nil, 1] call cse_fnc_onListBoxShowSelectionChanged;";
		};
		class selectionAction_3 : selectionAction_1 {
			idc = 1002;
			text = "Settings";
			x = "20 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "[nil, 2] call cse_fnc_onListBoxShowSelectionChanged;";
		};
		class selectionAction_4 : selectionAction_1 {
			idc = 1003;
			text = "Colors";
			x = "29.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			action = "[nil, 3] call cse_fnc_onListBoxShowSelectionChanged;";
		};

		class listBoxSettingsList: cse_gui_listNBox {
			idc = 200;
			x = "2 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "23 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7)";
			colorBackground[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {0, 0, 0, 0.9};
			columns[] = {0.0, 0.5};
		};

		class labelTitle: cse_gui_staticBase {
			idc = 250;
			x = "27.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "5.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};

		class labelKey: cse_gui_staticBase {
			idc = 300;
			x = "27.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "6.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "Key:";
		};

		class Label2: labelKey {
			idc = 301;
			y = "7.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "Shift:";
		};

		class Label3: labelKey {
			idc = 302;
			y = "8.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "Ctrl:";
		};
		class Label4: labelKey {
			idc = 303;
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			text = "Alt:";
		};
		class comboBox1: cse_gui_comboBoxBase {
			idc = 400;
			x = "32.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "7.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class comboBox2: comboBox1 {
			idc = 401;
			y = "8.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};
		class comboBox3: comboBox1 {
			idc = 402;
			y = "9.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
		};

		class labelDesc: cse_gui_staticBase {
			idc = 251;
			x = "27.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "11 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "11 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
			style = ST_LEFT + ST_MULTI;
			lineSpacing = 1;
			sizeEx = 0.03;
		};

		class actionEdit: actionClose {
			idc = 150;
			text = "Edit";
			x = "26.1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			action = "if (!CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F) then{ ctrlSetText [252, 'Press the key you want to assign to this action..']; CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F = true; };";
		};
		class actionCancel: actionClose {
			idc = 151; 
			text = "Cancel";
			x = "20 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			action = "ctrlSetText [252, '']; CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F = false; ";
		};


		class notificationDesc: cse_gui_staticBase {
			idc = 252;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "";
			style = ST_CENTER + ST_SHADOW;
			sizeEx = 0.05;
		};

		class selectionAction_5 : selectionAction_1 {
			idc = 1100;
			text = "Fix Animation";
			x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "17.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			action = "if ([player] call cse_fnc_canInteract && {animationState player == 'deadState' || animationState player == 'unconscious'} && {(vehicle player == player)}) then { [player, 'amovppnemstpsnonwnondnon'] call cse_fnc_broadcastAnim; };";
		};
	};
};
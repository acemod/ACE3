if (isnil "CSE_F_KEYBINDINGS_MENUS") then {
	CSE_F_KEYBINDINGS_MENUS = [];
};
if (isnil "CSE_F_KEYBINDINGS_ACTIONS") then {
	CSE_F_KEYBINDINGS_ACTIONS = [];
};
if (isnil "CSE_F_CLIENT_SIDE_SETTINGS") then {
	CSE_F_CLIENT_SIDE_SETTINGS = [];
};

CSE_SETTINGS_MENU_EDIT_CURRENT_SETTING_F = false;
CSE_DISPLAY_MENU = false;
CSE_KEY_RELEASED = false;
CSE_DISABLE_KEY_INPUT_F = false;
CSE_KEY_COMBINATION_PRESSED = [0,0,0,0];
if (hasInterface) then {
	[] spawn {
		waitUntil {!isNull player && (player == player) && !(isNull (findDisplay 46))};
		sleep 3;
		cse_displayEventHandler_config_keyPressed_f = findDisplay 46 displayAddEventHandler ["keyDown", cse_fnc_onKeyPressed_f ];
		cse_displayEventHandler_config_keyReleaded_f = findDisplay 46 displayAddEventHandler ["keyUp", cse_fnc_onKeyReleased_f];
	};
};
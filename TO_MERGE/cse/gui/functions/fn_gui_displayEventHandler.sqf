/**
 * fn_gui_displayEventHandler.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

[] spawn {
	waitUntil {!isNull player && (player == player) && !(isNull (findDisplay 46))};
	CSE_KEY_COUNTER = 0;
	CSE_DISPLAY_MENU = false;
	CSE_MENU_ONRELEASE = false;


	CSE_KEY_PRESSED_HANDLER = {
		// state of Shift, Ctrl and Alt
		//if (!(_this select 2)) then {
			if !([player] call cse_fnc_isAwake) exitwith{};
			_MENU_VAR = format['CSE_GUI_MENU_%1', (_this select 1)];
			if (isnil _MENU_VAR) exitwith {};

			_menu = (call compile _MENU_VAR) select 0;

			_states = _menu select 4;
			if (((_states select 1) == 0) && (_this select 2)) exitwith {};
			if (((_states select 1) == 1) && !(_this select 2)) exitwith {};

			if (((_states select 2) == 0) && (_this select 3)) exitwith {};
			if (((_states select 2) == 1) && !(_this select 3)) exitwith {};

			if (((_states select 3) == 0) && (_this select 4)) exitwith {};
			if (((_states select 3) == 1) && !(_this select 4)) exitwith {};

			if (CSE_DISPLAY_MENU && !CSE_KEY_RELEASED) exitwith {};
			if (CSE_DISPLAY_MENU && CSE_KEY_RELEASED) exitwith { closeDialog 145201;};
			if (dialog) exitwith { closeDialog 0; };

			_STARTINGTIME = time;
			CSE_DISPLAY_MENU = true;
			CSE_KEY_RELEASED = false;
			//null = [_this,_STARTINGTIME,(call compile _MENU_VAR) select 0] spawn {
			_handle = [_this,_STARTINGTIME] spawn {
				waituntil{CSE_KEY_RELEASED || (time - ((_this select 1)) > 0.25)};
				if (!CSE_KEY_RELEASED) then {

					CSE_MENU_ONRELEASE = true;
					waituntil {CSE_KEY_RELEASED};
					CSE_MENU_ONRELEASE = false;
					closeDialog 145201;
				 } else {
				 	CSE_KEY_RELEASED = true;
				 };
				waituntil {!dialog};
				CSE_DISPLAY_MENU = false;
			};
			[(_menu select 0),(_menu select 1),(_menu select 3)] call cse_fnc_gui_keyPressed;
		//};
		false;
	};
/*

	cse_displayEventHandler_Dialog = findDisplay 46 displayAddEventHandler ["keyDown", CSE_KEY_PRESSED_HANDLER];
	cse_displayEventHandler_DialogReleased = findDisplay 46 displayAddEventHandler ["keyUp", {
			_MENU_VAR = format['CSE_GUI_MENU_%1', (_this select 1)];
			if (CSE_DISPLAY_MENU) then {
				if (!isnil _MENU_VAR) then {
					CSE_KEY_RELEASED = true;
				};
			};
	}];*/
};

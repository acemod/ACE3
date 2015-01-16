/**
 * fn_onKeyPressed_f.sqf
 * @Descr: Executed on a key pressed. Handles all CSE keybindings
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


// Returns the control, the keyboard code and the state of Shift, Ctrl and Alt.
private ["_control","_var","_keyBinding","_keyCodePressed","_shiftPressed","_ctrlPressed","_altPressed","_name","_onPressed","_idd", "_state","_STARTINGTIME","_handle", "_returnOnPressed"];
_control = _this select 0;
_keyCodePressed = _this select 1;
_shiftPressed = _this select 2;
_ctrlPressed = _this select 3;
_altPressed = _this select 4;

if (missionNamespace getVariable ['CSE_SETTINGS_MENU_OPEN', false]) exitwith {
 	false;
};
_returnOnPressed = false;
if ((findDisplay 46) == _control && _keyCodePressed != 0) then {
	if ([player] call cse_fnc_canInteract) then {
		{
			_name = _x select 0;
			_keyBinding = _x select 1;
			_onPressed = _x select 2;
			_idd = _x select 3;
			_state = _x select 4;

			_shiftBinding = _keyBinding select 1;
			_ctrlBinding = _keyBinding select 2;
			_altBinding = _keyBinding select 3;

			if ((_keyBinding select 0) == _keyCodePressed) then {

				if ((_shiftBinding == 0) && _shiftPressed) exitwith {};
				if ((_shiftBinding == 1) && !_shiftPressed) exitwith {};

				if ((_ctrlBinding == 0) && _ctrlPressed) exitwith {};
				if ((_ctrlBinding == 1) && !_ctrlPressed) exitwith {};

				if ((_altBinding == 0) && _altPressed) exitwith {};
				if ((_altBinding == 1) && !_altPressed) exitwith {};

				if (CSE_DISPLAY_MENU && !CSE_KEY_RELEASED) exitwith {};
				if (CSE_DISPLAY_MENU && CSE_KEY_RELEASED) exitwith { closeDialog _idd;};

				if (dialog) exitwith { closeDialog 0; };
				_state set [ 0, true]; // activated/open , not released
				_state set [ 1, false];
				CSE_KEY_COMBINATION_PRESSED = _keyBinding;
				CSE_DISPLAY_MENU = true;
				CSE_KEY_RELEASED = false;

				_handle = [_forEachIndex, time] spawn {
					_menu = CSE_F_KEYBINDINGS_MENUS select (_this select 0);
					_state = _menu select 4;
					waituntil{CSE_KEY_RELEASED || (time - ((_this select 1) ) > (0.25 * accTime))};
					if (!CSE_KEY_RELEASED) then {
						waituntil {CSE_KEY_RELEASED};
						closeDialog (_menu select 3);
					} else {
						CSE_KEY_RELEASED = true;
					};
					waituntil {!dialog};
					_state set [ 0, false];
					CSE_DISPLAY_MENU = false;
				};
				_returnOnPressed = _this call _onPressed;
			};
		}foreach CSE_F_KEYBINDINGS_MENUS;

		if (isNil "_returnOnPressed") then {
			{
				_name = _x select 0;
				_keyBinding = _x select 1;
				_onPressed = _x select 2;

				_shiftBinding = _keyBinding select 1;
				_ctrlBinding = _keyBinding select 2;
				_altBinding = _keyBinding select 3;

				if ((_keyBinding select 0) == _keyCodePressed) then {
					if ((_shiftBinding == 0) && _shiftPressed) exitwith {};
					if ((_shiftBinding == 1) && !_shiftPressed) exitwith {};

					if ((_ctrlBinding == 0) && _ctrlPressed) exitwith {};
					if ((_ctrlBinding == 1) && !_ctrlPressed) exitwith {};

					if ((_altBinding == 0) && _altPressed) exitwith {};
					if ((_altBinding == 1) && !_altPressed) exitwith {};

					CSE_KEY_COMBINATION_PRESSED = _keyBinding;
					_returnOnPressed = _this call _onPressed;
				};
			}foreach CSE_F_KEYBINDINGS_ACTIONS;
		};
	};
};
if (isnil "_returnOnPressed") exitwith {false};
//_returnOnPressed
false;
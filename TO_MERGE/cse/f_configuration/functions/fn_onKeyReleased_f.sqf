/**
 * fn_onKeyReleased_f.sqf
 * @Descr: Handles all keyreleased from CSE
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


// _this =  the control, the keyboard code and the state of Shift, Ctrl and Alt.


if (CSE_DISABLE_KEY_INPUT_F) exitwith {
	(( _this select 1) > 0);
};

if ((findDisplay 46) == (_this select 0)) then {
	_keyCodePressed = _this select 1;
	{
		_keyBinding = _x select 1;
		_state = _x select 4;
		if ((_keyBinding select 0) == _keyCodePressed) then {
			if (!(_state select 0) ) exitwith {};
			_state set [ 0, false];
			CSE_KEY_RELEASED = true;
		};
	}foreach CSE_F_KEYBINDINGS_MENUS;
} else {
	false;
};
false;
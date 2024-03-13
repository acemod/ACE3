#include "\a3\ui_f\hpp\definedikcodes.inc"
#include "..\script_component.hpp"
/*
	 * Author: john681611
	 * Runs a Quick time Event.
	 *
	 * Argument: CodeLength (pos Number)
	 * 0: Object - where are you inputting values to <OBJECT>
	 * 1: String - command to execute <STRING>
	 * 2: Array - command parameters <ARRAY>
	 * 3: String - command execution code <STRING>
	 * 4: Array - keyCode <ARRAY>
	 * 5: Number - interaction distance (default 10) <NUMBER>
	 *
	 * Return Value:
	 * None
	 *
	 * Example:
	 * [car, "hint", "Yay", 1, ["↑", "↓", "→", "←"]] call ace_common_fnc_runQTE
	 *
	 * Public: Yes
 */

params ["_veh", "_command", "_command_params", "_command_exec_code", "_keyCode", ["_max_distance", 10]];

GVAR(QTEVeh) = _veh;
GVAR(QTECommand) = _command;
GVAR(QTECommandParams) = _command_params;
GVAR(QTECommandExecCode) = _command_exec_code;
GVAR(QTEMaxDistance) = _max_distance;
GVAR(QTECode) = _keyCode;
GVAR(QTEHistory) = [];

hint format ["%1: \n %2", localize LSTRING(QTEInput), [GVAR(QTECode)] call FUNC(getFormattedQTECode)];

findDisplay 46 displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	private _override = false;
	private _inputKeys = [DIK_UP, DIK_DOWN, DIK_LEFT, DIK_RIGHT];
	if (ACE_player distance GVAR(QTEVeh) > GVAR(QTEMaxDistance)) exitWith {
		hint (localize LSTRING(QTECancelled));
		findDisplay 46 displayRemoveEventHandler ["KeyUp", _thisEventHandler];
		_override;
	};

	switch (GVAR(QTEInputKeys)) do {
		case "WASD": {
			_inputKeys = [DIK_W, DIK_S, DIK_A, DIK_D];
		};
		case "IJKL": {
			_inputKeys = [DIK_I, DIK_K, DIK_J, DIK_L];
		};
		case "NUMPAD": {
			_inputKeys = [DIK_NUMPAD8, DIK_NUMPAD2, DIK_NUMPAD4, DIK_NUMPAD6];
		};
		default {
			_inputKeys = [DIK_UP, DIK_DOWN, DIK_LEFT, DIK_RIGHT];
		};
	};

	if (!(_key in _inputKeys)) exitWith {
		_override;
	};

	if ((GVAR(QTEHoldKey) isEqualTo "Ctrl" and !_ctrl) ||
	(GVAR(QTEHoldKey) isEqualTo "Shift" and !_shift) ||
	(GVAR(QTEHoldKey) isEqualTo "Alt" and !_alt)) exitWith {
		GVAR(QTEHistory) = [];
		hintSilent format ["%1: \n %2 \n %3", localize LSTRING(QTEInput), [GVAR(QTECode)] call FUNC(getFormattedQTECode), [GVAR(QTEHistory)] call FUNC(getFormattedQTECode)];
		_override;
	};
	_override = true;

	if (_key isEqualTo (_inputKeys select 0)) then {
		GVAR(QTEHistory) pushBack "↑";
	};

	if (_key isEqualTo (_inputKeys select 1)) then {
		GVAR(QTEHistory) pushBack "↓";
	};

	if (_key isEqualTo (_inputKeys select 2)) then {
		GVAR(QTEHistory) pushBack "←";
	};

	if (_key isEqualTo (_inputKeys select 3)) then {
		GVAR(QTEHistory) pushBack "→";
	};
	if (GVAR(QTEHistory) isEqualTo GVAR(QTECode)) exitWith {
		hint (localize LSTRING(QTEAccepted));
		GVAR(QTEHistory) = [];
		GVAR(QTECommandParams) remoteExec [GVAR(QTECommand), GVAR(QTECommandExecCode)];
		findDisplay 46 displayRemoveEventHandler ["KeyUp", _thisEventHandler];
		_override;
	};

	if (!(GVAR(QTEHistory) isEqualTo (GVAR(QTECode) select [0, count GVAR(QTEHistory)]))) then {
		GVAR(QTEHistory) = [];
	};

	hintSilent format ["%1: \n %2 \n %3", localize LSTRING(QTEInput), [GVAR(QTECode)] call FUNC(getFormattedQTECode), [GVAR(QTEHistory)] call FUNC(getFormattedQTECode)];
	_override;
}];

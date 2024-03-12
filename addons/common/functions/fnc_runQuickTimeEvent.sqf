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
	 * [car, "hint", "Yay", 1, ["↑", "↓", "→", "←"]] call ace_common_fnc_runQuickTimeEvent
	 *
	 * Public: Yes
 */

params ["_veh", "_command", "_command_params", "_command_exec_code", "_keyCode", ["_max_distance", 10]];

GVAR(keyCodeVeh) = _veh;
GVAR(keyCodeCommand) = _command;
GVAR(keyCodeCommandParams) = _command_params;
GVAR(keyCodeCommandExecCode) = _command_exec_code;
GVAR(keyCodeMaxDistance) = _max_distance;
GVAR(keyCodeCode) = _keyCode;
GVAR(keyCodeHistory) = [];



hint format ["Command (Hold CTRL down): \n %1", [GVAR(keyCodeCode)] call FUNC(getFormattedQuickTimeEventCode)];

findDisplay 46 displayAddEventHandler ["KeyUp", {
	params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
	private _override = false;
	if (ACE_player distance GVAR(keyCodeVeh) > GVAR(keyCodeMaxDistance)) exitWith {
		hint "Command Cancelled";
		findDisplay 46 displayRemoveEventHandler ["KeyUp", _thisEventHandler];
		_override;
	};

	if (!(_key in [DIK_UP, DIK_DOWN, DIK_LEFT, DIK_RIGHT])) exitWith {
		_override;
	};

	if (!_ctrl) exitWith {
		GVAR(keyCodeHistory) = [];
		hintSilent format ["Command (Hold CTRL down): \n %1 \n %2", [GVAR(keyCodeCode)] call FUNC(getFormattedQuickTimeEventCode), [GVAR(keyCodeHistory)] call FUNC(getFormattedQuickTimeEventCode)];
		_override;
	};
	_override = true;

	if (_key isEqualTo DIK_UP) then {
		GVAR(keyCodeHistory) pushBack "↑";
	};

	if (_key isEqualTo DIK_DOWN) then {
		GVAR(keyCodeHistory) pushBack "↓";
	};

	if (_key isEqualTo DIK_LEFT) then {
		GVAR(keyCodeHistory) pushBack "←";
	};

	if (_key isEqualTo DIK_RIGHT) then {
		GVAR(keyCodeHistory) pushBack "→";
	};
	if (GVAR(keyCodeHistory) isEqualTo GVAR(keyCodeCode)) exitWith {
		hint "Accepted!";
		GVAR(keyCodeHistory) = [];
		GVAR(keyCodeCommandParams) remoteExec [GVAR(keyCodeCommand), GVAR(keyCodeCommandExecCode)];
		findDisplay 46 displayRemoveEventHandler ["KeyUp", _thisEventHandler];
		_override;
	};

	if (!(GVAR(keyCodeHistory) isEqualTo (GVAR(keyCodeCode) select [0, count GVAR(keyCodeHistory)]))) then {
		GVAR(keyCodeHistory) = [];
	};

	hintSilent format ["Command (Hold CTRL down): \n %1 \n %2", [GVAR(keyCodeCode)] call FUNC(getFormattedQuickTimeEventCode), [GVAR(keyCodeHistory)] call FUNC(getFormattedQuickTimeEventCode)];
	_override;
}];


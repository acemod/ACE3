#include "..\script_component.hpp"
/*
 * Author: Brett Mayson
 * Register a launcher to a missile defense system.
 *
 * Arguments:
 * 0: ID <String> - The ID of the missile defense system to modify
 * 1: Launcher <Object> - The launcher object to register.
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missile_defense_registerLauncher
 *
 * Public: No
 */

params ["_id", "_launcher"];

if (!isServer) exitWith {
    ERROR("missile_defense functions only run on server");
};

private _system = GVAR(systems) getOrDefault [_id, -1];
if (_system isEqualTo -1) exitWith {
    ERROR_1("Missile defense system with ID '%1' does not exist",_id);
};

private _launchers = _system getOrDefault ["launchers", []];
if (_launcher in _launchers) exitWith {
    ERROR_1("Missile defense launcher '%1' already registered",_launcher);
};

_launcher setVariable [QGVAR(system), _id, true];
_launcher setVariable [QGVAR(state), LAUNCH_STATE_IDLE];
_launcher setVariable [QGVAR(lastLaunchTime), 0];

_launchers pushBackUnique _launcher;

[QGVAR(registerLauncher), [_id, _launcher], _launcher] call CBA_fnc_targetEvent;

TRACE_2("Registered missile defense launcher",_launcher,_id);

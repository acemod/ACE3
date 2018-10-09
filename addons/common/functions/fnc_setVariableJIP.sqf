#include "script_component.hpp"
/*
 * Author: commy2
 * Sets a public object namespace variable that gets reset with the same value after respawn, so JIP clients keep the value.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Variable name <STRING>
 * 2: Any value <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "varname", 5] call ace_common_fnc_setVariableJIP
 *
 * Public: No
 */

params ["_unit", "_varName", "_value"];

private _respawnVariables = _unit getVariable ["ACE_respawnVariables", []];

if !(_varName in _respawnVariables) then {
    _respawnVariables pushBack _varName;
    _unit setVariable ["ACE_respawnVariables", _respawnVariables, true];
};

_unit setVariable [_varName, _value, true];

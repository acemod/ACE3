#include "script_component.hpp"
/*
 * Author: commy2
 * Handle player changes.
 *
 * Arguments:
 * 0: New Player Unit <OBJECT>
 * 1: Old Player Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_tripod_fnc_handlePlayerChanged
 *
 * Public: No
*/

params ["_newPlayer", "_oldPlayer"];

if (_newPlayer getVariable [QGVAR(adjusting), false]) then {
    _newPlayer setVariable [QGVAR(adjusting), false, true];
};

if (_oldPlayer getVariable [QGVAR(adjusting), false]) then {
    _oldPlayer setVariable [QGVAR(adjusting), false, true];
};

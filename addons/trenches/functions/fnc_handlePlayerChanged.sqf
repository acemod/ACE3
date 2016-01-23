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
 * Public: No
*/
#include "script_component.hpp"

params ["_newPlayer", "_oldPlayer"];

if (_newPlayer getVariable [QGVAR(isDigging), false]) then {
    [_newPlayer] call FUNC(digCancel);
};

if (_oldPlayer getVariable [QGVAR(isDigging), false]) then {
    [_oldPlayer] call FUNC(digCancel);
};

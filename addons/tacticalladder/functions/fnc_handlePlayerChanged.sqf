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
 * [bob, kevin] call ace_tacticalladder_fnc_handlePlayerChanged
 *
 * Public: No
*/
#include "script_component.hpp"

if (isNull GETGVAR(ladder,objNull)) exitWith {};

params ["_newPlayer", "_oldPlayer"];

if (GVAR(ladder) in attachedObjects _newPlayer) then {
    [_newPlayer, 1] call FUNC(cancelTLdeploy);
};

if (GVAR(ladder) in attachedObjects _oldPlayer) then {
    [_oldPlayer, 1] call FUNC(cancelTLdeploy);
};

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

if (isNull (GETMVAR(ladder,objNull))) exitWith {};

params ["_newPlayer", "_oldPlayer"];

if (GVAR(ladder) in attachedObjects _newPlayer) then {
    [_newPlayer, GVAR(ladder)] call FUNC(cancelTLdeploy);
};

if (GVAR(ladder) in attachedObjects _oldPlayer) then {
    [_oldPlayer, GVAR(ladder)] call FUNC(cancelTLdeploy);
};

/*
 * Author: commy2
 * Handle opening of interaction menu.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_tacticalladder_fnc_handleInteractMenuOpened
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (!isNull GETMVAR(GVAR(ladder),objNull) && {GVAR(ladder) in attachedObjects _unit}) then {
    [_unit, 1] call FUNC(cancelTLdeploy);
};

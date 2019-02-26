#include "script_component.hpp"
/*
 * Author: commy2
 * Handle death.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_tacticalladder_fnc_handleKilled
 *
 * Public: No
*/

params ["_unit"];

if (!isNull GETMVAR(ladder,objNull) && {GVAR(ladder) in attachedObjects _unit}) then {
    [_unit, 1] call FUNC(cancelTLdeploy);
};

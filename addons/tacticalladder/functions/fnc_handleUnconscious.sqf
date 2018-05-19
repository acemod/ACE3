/*
 * Author: commy2
 * Handle unconsciousness.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_tacticalladder_fnc_handleUnconscious
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

if (!isNull GETMVAR(ladder,objNull) && {GVAR(ladder) in attachedObjects _unit}) then {
    [_unit, 1] call FUNC(cancelTLdeploy);
};

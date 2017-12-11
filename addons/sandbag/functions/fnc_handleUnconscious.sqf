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
 * [bob] call ace_sandbag_fnc_handleUnconscious
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

if (_unit getVariable [QGVAR(isDeploying), false]) then {
    [_unit] call FUNC(deployCancel);
};

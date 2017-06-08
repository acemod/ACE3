/*
 * Author: GitHawk
 * Disables being able to rearm a vehicle's turrets. [Global Effects]
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Disable <BOOL>(optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank] call ace_rearm_fnc_disable
 * [tank, false] call ace_rearm_fnc_disable
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_disable", true, [true]]
];

_vehicle setVariable [QGVAR(disabled), _disable, true];

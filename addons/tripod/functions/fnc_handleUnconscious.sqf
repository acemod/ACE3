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
 * [bob] call ace_tripod_fnc_handleUnconscious
 *
 * Public: No
*/
#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

if (_unit getVariable [QGVAR(adjusting), false]) then {
    _unit setVariable [QGVAR(adjusting), false, true];
};

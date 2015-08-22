/*
 * Author: Jonpas
 * Check if a unit can connect a tow bar.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Connect <BOOL>
 *
 * Example:
 * [tank, player] call ace_towing_fnc_canConnectTowBar
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

!(_target distance _unit > TOWING_ACTION_DISTANCE) &&
    {isNil {_target getVariable QGVAR(isTowing)}} &&
    {isNil {_target getVariable QGVAR(isTowed)}} &&
    {_unit getVariable [QGVAR(isTilting), 0] == 0}

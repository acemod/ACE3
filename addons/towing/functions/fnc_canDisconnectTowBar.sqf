/*
 * Author: Jonpas
 * Check if a unit can disconnect a tow bar.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Disconnect <BOOL>
 *
 * Example:
 * [tank, player] call ace_logistics_fnc_canDisconnectTowBar
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

!(_target distance _unit > TOWING_ACTION_DISTANCE) &&
    {!isNil {_target getVariable QGVAR(isTowing)} || !isNil {_target getVariable QGVAR(isTowed)}}

/*
 * Author: GitHawk, Jonpas
 * Check if a unit can connect a tilt cable.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Connect <BOOL>
 *
 * Example:
 * [tank, player] call ace_tilting_fnc_canConnectCable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

(_target distance _unit < ACTION_DISTANCE) &&
{isNil {_target getVariable QGVAR(up)}} &&
{!(_unit getVariable [QGVAR(connecting), false])} &&
{(vectorUp _target) select 2 < 0.7 ||
    {_unit getVariable [QGVAR(stage), 0] == 1}
}

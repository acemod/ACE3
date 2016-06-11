/*
 * Author: GitHawk, Jonpas
 * Check if a unit can cut a tilt cable.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Disconnect <BOOL>
 *
 * Example:
 * [tank, player] call ace_tilting_fnc_canDisconnectCable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

(_target distance _unit < ACTION_DISTANCE) &&
{_target getVariable [QGVAR(up), objNull] == _unit} &&
{_unit getVariable [QGVAR(stage), 0] != 0}

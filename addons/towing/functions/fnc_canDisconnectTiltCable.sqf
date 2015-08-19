/*
 * Author: GitHawk
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
 * [tank, player] call ace_logistics_fnc_canDisconnectTiltCable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

!(_target distance _unit > TOWING_ACTION_DISTANCE) &&
{_target getVariable [QGVAR(tiltUp), _unit] == _unit} &&
{_unit getVariable [QGVAR(isTilting), 0] == 2}

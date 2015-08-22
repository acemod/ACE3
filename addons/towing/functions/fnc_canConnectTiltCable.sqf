/*
 * Author: GitHawk
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
 * [tank, player] call ace_towing_fnc_canConnectTiltCable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_unit"];

!(_target distance _unit > TOWING_ACTION_DISTANCE) &&
    {isNil {_target getVariable QGVAR(tiltUp)}} &&
    {isNil {_unit getVariable QGVAR(towConnecting)}} &&
    {((vectorUp _target) select 2) < 0.7 || _unit getVariable [QGVAR(isTilting), 0] == 1}

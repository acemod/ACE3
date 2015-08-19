/*
 * Author: GitHawk
 * Disconnects the tilting rope.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_towing_fnc_disconnectTiltCable
 *
 * Public: no
 */
#include "script_component.hpp"

private ["_rope"];
params ["_unit"];

_rope = _unit getVariable [QGVAR(tiltRope), nil];
if !(isNil "_rope") then {
    ropeDestroy _rope;
};

(_unit getVariable QGVAR(tiltVehicle)) setVariable [QGVAR(tiltUp), nil, true];
(_unit getVariable QGVAR(tiltVehicleTow)) setVariable [QGVAR(tiltUp), nil, true];

_unit setVariable [QGVAR(tiltVehicle), nil];
_unit setVariable [QGVAR(tiltVehicleTow), nil];
_unit setVariable [QGVAR(isTilting), nil];
_unit setVariable [QGVAR(tiltRope), nil];

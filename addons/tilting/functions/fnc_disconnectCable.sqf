/*
 * Author: GitHawk
 * Disconnects the tilt cable.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_tilting_fnc_disconnectCable
 *
 * Public: no
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _rope = _unit getVariable [QGVAR(tiltRope), nil];
if !(isNil "_rope") then {
    ropeDestroy _rope;
};

(_unit getVariable QGVAR(tiltVehicle)) setVariable [QGVAR(tiltUp), nil, true];

_unit setVariable [QGVAR(tiltVehicle), nil];
_unit setVariable [QGVAR(tiltingStage), nil];
_unit setVariable [QGVAR(tiltRope), nil];

if (GVAR(placeAction) == PLACE_WAITING) then {
    [_unit] call FUNC(cancelConnect);
};

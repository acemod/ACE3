/*
 * Author: Jonpas
 * Cancels cable connection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_tilting_fnc_cancelConnect
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

GVAR(placeAction) = PLACE_CANCEL;

private _rope = _unit getVariable [QGVAR(tiltRope), nil];
if !(isNil "_rope") then {
    ropeDestroy _rope;
};

(_unit getVariable QGVAR(tiltVehicle)) setVariable [QGVAR(tiltUp), nil, true];

_unit setVariable [QGVAR(tiltVehicle), nil];
_unit setVariable [QGVAR(tiltingStage), nil];
_unit setVariable [QGVAR(tiltRope), nil];
_unit setVariable [QGVAR(tiltingStage), 0];

[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

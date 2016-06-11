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

(_unit getVariable QGVAR(stagedInfo)) params ["_rope", "_helper", "_vehicle"];

if !(isNil "_rope") then {
    ropeDestroy _rope;
};

if !(isNil "_helper") then {
    deleteVehicle _helper;
};

_vehicle setVariable [QGVAR(up), nil, true];

_unit setVariable [QGVAR(stagedInfo), nil];
_unit setVariable [QGVAR(stage), 0];

[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

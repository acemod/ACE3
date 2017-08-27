/*
 * Author: Dystopian
 * Clean variables on unit respawn.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_refuel_fnc_handleRespawn
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("respawn",_unit);

if (isNull (_unit getVariable [QGVAR(nozzle), objNull])) exitWith {};

_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
_unit setVariable [QGVAR(isRefueling), false];
_unit setVariable [QGVAR(nozzle), nil, true];
_unit setVariable [QGVAR(hint), nil];

/*
 * Author: GitHawk, Jonpas
 * Handles medical on set dead event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_refuel_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
_nozzle = _unit getVariable [QGVAR(nozzle), objNull];
if !(isNull _nozzle) then {
    REFUEL_UNIT_DROP_NOZZLE
};

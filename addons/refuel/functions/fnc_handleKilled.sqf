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

params [["_unit", objNull, [objNull]]];

if (!local _unit) exitWith {};

_unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];
private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
if !(isNull _nozzle) then {
    [_unit, _nozzle] call FUNC(dropNozzle);
};

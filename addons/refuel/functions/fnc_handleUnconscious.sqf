/*
 * Author: GitHawk, Jonpas
 * Handles medical on unconscious event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Is Unconscious <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, true] call ace_refuel_fnc_handleUnconscious
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_isUnconscious"];

if (!local _unit || {!_isUnconscious}) exitWith {};

private "_nozzle";

[_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
_nozzle = _unit getVariable [QGVAR(nozzle), objNull];
if !(isNull _nozzle) then {
    REFUEL_UNIT_DROP_NOZZLE
};

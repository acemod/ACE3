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
 * [player, true] call ace_refuel_fnc_handleUnconscious
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_isUnconscious", false, [false]]];

if (!local _unit || {!_isUnconscious}) exitWith {};

[_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
if !(isNull _nozzle) then {
    [_unit, _nozzle] call FUNC(dropNozzle);
};

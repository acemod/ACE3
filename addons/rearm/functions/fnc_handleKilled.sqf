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
 * [unit] call ace_rearm_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if (!local _unit) exitWith {};

_unit setVariable [QGVAR(selectedWeaponOnRearm), nil];
[_unit, false, false] call FUNC(dropAmmo);

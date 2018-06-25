#include "script_component.hpp"
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
 * [unit] call ace_rearm_fnc_handleUnconscious
 *
 * Public: No
 */

params ["_unit", "_isUnconscious"];

if (!local _unit || {!_isUnconscious}) exitWith {};

[_unit, false, false] call FUNC(dropAmmo);

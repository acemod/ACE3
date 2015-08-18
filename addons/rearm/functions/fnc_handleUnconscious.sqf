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
#include "script_component.hpp"

params ["_unit", "_isUnconscious"];

if (!local _unit || {!_isUnconscious}) exitWith {};

private "_dummy";
_dummy = _unit getVariable [QGVAR(dummy), objNull];

if (!isNull _dummy) then {
    _dummy setVariable [QGVAR(carriedMagazine), _unit getVariable QGVAR(carriedMagazine)];
    detach _dummy;
};

_unit setVariable [QGVAR(dummy), nil];

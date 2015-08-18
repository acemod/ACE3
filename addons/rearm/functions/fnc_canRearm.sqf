/*
 * Author: GitHawk, Jonpas
 * Check if a unit can rearm.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Rearm <BOOL>
 *
 * Example:
 * [player, tank] call ace_rearm_fnc_canRearm
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_magazineClass", "_magazines", "_turretPath"];
params ["_target", "_unit"];

if (GVAR(level) == 0 || {isNull _unit} || {!(_unit isKindOf "CAManBase")} || {!local _unit} || {_target distance _unit > REARM_ACTION_DISTANCE}) exitWith {false};

_magazineClass = _unit getVariable QGVAR(carriedMagazine);
if (isNil "_magazineClass") exitWith {false};

([_target, _magazines, _magazineClass] call FUNC(getNeedRearmMagazines)) select 0

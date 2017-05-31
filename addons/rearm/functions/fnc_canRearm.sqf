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

private ["_dummy","_magazineClass"];
params [["_target", objNull, [objNull]], ["_unit", objNull, [objNull]]];

if (!alive _target) exitWith {false};

if (GVAR(level) == 0 || {isNull _unit} || {!(_unit isKindOf "CAManBase")} || {!local _unit} || {([_unit, _target] call EFUNC(interaction,getInteractionDistance)) > REARM_ACTION_DISTANCE} || {_target getVariable [QGVAR(disabled), false]}) exitWith {false};

_dummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _dummy) exitwith {false};
_magazineClass = _dummy getVariable QGVAR(magazineClass);
if (isNil "_magazineClass") exitWith {false};

([_target, _magazineClass] call FUNC(getNeedRearmMagazines)) select 0

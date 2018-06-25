#include "script_component.hpp"
/*
 * Author: GitHawk, Jonpas
 * Check if a unit can rearm.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Can Rearm <BOOL>
 *
 * Example:
 * [tank, player] call ace_rearm_fnc_canRearm
 *
 * Public: No
 */

params ["_vehicle", "_unit"];

if (!alive _vehicle) exitWith {false};
if (GVAR(level) == 0 || {isNull _unit} || {!(_unit isKindOf "CAManBase")} || {!local _unit} || {_vehicle distance _unit > REARM_ACTION_DISTANCE} || {_vehicle getVariable [QGVAR(disabled), false]}) exitWith {false};

private _dummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _dummy) exitwith {false};
private _magazineClass = _dummy getVariable QGVAR(magazineClass);
if (isNil "_magazineClass") exitWith {false};

private _needRearmMags = [_vehicle] call FUNC(getNeedRearmMagazines);

// Testing if vehicle needs rearm on any magazines of class _magazineClass
private _needsRearm = ({(_x select 0) isEqualTo _magazineClass} count _needRearmMags) > 0;

_needsRearm

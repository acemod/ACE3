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
#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

if (!alive _vehicle) exitWith {false};
if (GVAR(level) == 0 || {isNull _unit} || {!(_unit isKindOf "CAManBase")} || {!local _unit} || {_vehicle distance _unit > REARM_ACTION_DISTANCE} || {_vehicle getVariable [QGVAR(disabled), false]}) exitWith {false};

private _dummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _dummy) exitwith {false};
private _magazineClass = _dummy getVariable QGVAR(magazineClass);
if (isNil "_magazineClass") exitWith {false};

([_vehicle, _magazineClass] call FUNC(getNeedRearmMagazines)) select 0

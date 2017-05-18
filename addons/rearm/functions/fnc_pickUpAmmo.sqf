/*
 * Author: GitHawk
 * Starts progress bar for picking up a specific kind of magazine from the ground.
 *
 * Arguments:
 * 0: Ammo Dummy <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, player] call ace_rearm_fnc_pickUpAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_dummy", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

private _attachedDummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _attachedDummy) exitWith {};

_dummy attachTo [_unit, [0,1,0], "pelvis"];

private _nearUnits = _unit nearObjects ["CAManBase", 100];
// disableCollisionWith damage with the nearby units:
[QGVAR(makeDummyEH), [_dummy, [[-1,0,0],[0,0,1]]], _nearUnits] call CBA_fnc_targetEvent;

_unit setVariable [QGVAR(dummy), _dummy];

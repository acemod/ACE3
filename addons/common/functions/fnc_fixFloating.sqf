/*
 * Author: commy2
 * Attempt to fix floating physx with disabled damage after setPosXXX commands.
 * Handles the "fixFloating" event
 *
 * Arguments:
 * PhysX object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_common_fnc_fixFloating
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

// setHitPointDamage requires local object
if (!local _object) exitWith {};
//Ignore mans
if (_object isKindOf "CAManBase") exitWith {};

//We need to manually set allowDamage to true for setHitIndex to function
[QGVAR(blockDamage), [_object, 0]] call CBA_fnc_localEvent;

// save and restore hitpoints, see below why
private _hitPointDamages = getAllHitPointsDamage _object;

// get correct format for objects without hitpoints
if (_hitPointDamages isEqualTo []) then {
    _hitPointDamages = [[],[],[]];
};

// this prevents physx objects from floating when near other physx objects with allowDamage false
_object setDamage damage _object;

{
    _object setHitIndex [_forEachIndex, _x];
} forEach (_hitPointDamages select 2);

//manually re-enable allowDamage to previous setting (ref statusEffect_funcs)
private _effectVarName = format [QGVAR(effect_%1), "blockDamage"];
private _effectNumber = _object getVariable [_effectVarName, 0];
[QGVAR(blockDamage), [_object, _effectNumber]] call CBA_fnc_localEvent;

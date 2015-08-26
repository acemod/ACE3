/*
 * Author: commy2
 * Attempt to fix floating physx with disabled damage after setPosXXX commands.
 *
 * Arguments:
 * Physx object (Object)
 *
 * Return Value:
 * Nothing
 *
 */
#include "script_component.hpp"

private "_object";

_object = _this;

// setHitPointDamage requires local object
if (!local _object) exitWith {};

// save and restore hitpoints, see below why
private ["_hitPointsAndSelections", "_hitPointDamages", "_hitSelectionDamages"];

_hitPointsAndSelections = [_object, true] call FUNC(getHitpoints);
_hitPointsAndSelections params ["_hitpoints", "_hitselections"];

_hitPointDamages = [_hitpoints, {_object getHitPointDamage _this}] call FUNC(map);
_hitSelectionDamages = [_hitselections, {_object getHit _this}] call FUNC(map);

// this prevents physx objects from floating when near other physx objects with allowDamage false
//_object setDamage damage _object;

{
	_object setHitPointDamage [_x, _hitPointDamages select _forEachIndex];
} forEach _hitpoints;

{
	_object setHit [_x, _hitSelectionDamages select _forEachIndex];
} forEach _hitselections;
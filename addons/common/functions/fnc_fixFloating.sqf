/*
 * Author: commy2
 * Attempt to fix floating physx with disabled damage after setPosXXX commands.
 *
 * Arguments:
 * PhysX object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private "_object";

_object = _this;

// setHitPointDamage requires local object
if (!local _object) exitWith {};

// save and restore hitpoints, see below why
private ["_hitPoints", "_hitPointDamages"];

_hitPoints = [_object] call FUNC(getHitpoints);
_hitPointDamages = [_hitPoints, {_object getHitPointDamage _this}] call FUNC(map);

// this prevents physx objects from floating when near other physx objects with allowDamage false
_object setDamage damage _object;

{
    _object setHitPointDamage [_x, _hitPointDamages select _forEachIndex];
} forEach _hitPoints;

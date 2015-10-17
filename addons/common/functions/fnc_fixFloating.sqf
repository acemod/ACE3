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
private "_hitPointDamages";
_hitPointDamages = getAllHitPointsDamage _object;

// get correct format for objects without hitpoints
if (_hitPointDamages isEqualTo []) then {
    _hitPointDamages = [[],[],[]];
};

//manualy set allowDamage true or setHitIndex does not work
_object allowDamage true;

// this prevents physx objects from floating when near other physx objects with allowDamage false
_object setDamage damage _object;

{
    _object setHitIndex [_forEachIndex, _x];
} forEach (_hitPointDamages select 2);

//reset allowDamage to what it should be
[_object] call FUNC(handleAllowDamage);

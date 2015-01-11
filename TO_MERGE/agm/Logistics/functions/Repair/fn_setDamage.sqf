/*
 * Author: commy2, KoffeinFlummi 
 *
 * Sets the structural damage of a vehicle without altering the hitPoints.
 * THIS NEEDS TO BE CALLED FROM THE PC WHERE THE VEHICLE IS LOCAL.
 *
 * Arguments:
 * 0: Vehicle
 * 1: Damage
 *
 * Return Value:
 * None
 */

#include <Macros.hqf>

private ["_vehicle", "_damage", "_hitPoints", "_damageHitPoint"];

_vehicle = _this select 0;
_damage = _this select 1;

_hitPoints = [];
{
	_damageHitPoint = _vehicle getHitPointDamage _x;
	if (isNil "_damageHitPoint") then {_damageHitPoint = 0};

	_hitPoints set [_forEachIndex, _damageHitPoint];
} forEach ALL_HITPOINTS;

_vehicle setDamage _damage;

{
	_vehicle setHitPointDamage [_x, _hitPoints select _forEachIndex];
} forEach ALL_HITPOINTS;

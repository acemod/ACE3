#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Sets vehicle damage based on HitIndex. Failing that it falls back to HitPoint name
 *
 * Arguments:
 * 0: The vehicle
 * 1: Hit Index
 * 2: Hit Point
 * 3: Damage
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, 234, "HitHull"] call ace_vehicleDamage_fnc_knockOut
 *
 *
 * Public: No
 */
params ["_vehicle", "_hitIndex", "_hitPoint", "_damage", ["_capDamageAtCurret", true]];

private _currentDamage = _vehicle getHitPointDamage _hitPoint;
if (_capDamageAtCurret && { _damage <_currentDamage }) exitWith {
    TRACE_4("capping damage at current",_capDamageAtCurret,_damage,_currentDamage,_hitPoint);
};

TRACE_4("adding damage to vehicle",_vehicle,_hitIndex,_hitPoint,_damage);
if (_hitPoint isEqualTo "#structural") then {
    _hitPoint = "hithull";
    _hitIndex = -1;
};
if (_hitIndex >= 0) then {
    _vehicle setHitIndex [_hitIndex, _damage, true];
} else {
    _vehicle setHitPointDamage [_hitPoint, _damage, true];
};

if (_hitPoint isEqualTo "hitengine" && { _damage > 0.9 }) then {
    _vehicle call EFUNC(cookoff,engineFire);
};


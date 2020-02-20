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
params ["_vehicle", "_hitIndex", "_hitPoint", "_damage"];
if (_hitIndex >= 0) then {
    _vehicle setHitIndex [_hitIndex, _damage, true];
} else {
    _vehicle setHitPointDamage [_hitPoint, _damage, true];
};


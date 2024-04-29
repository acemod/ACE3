#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets vehicle damage based on HitIndex. Failing that it falls back to HitPoint name.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hit index <NUMBER>
 * 2: Hit point <STRING>
 * 3: Damage <NUMBER>
 * 4: Source of damage <OBJECT>
 * 5: Person who caused damage <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 12, "Hit_Engine", 1, player, player] call ace_vehicle_damage_fnc_addDamage
 *
 * Public: No
 */

params ["_vehicle", "_hitIndex", "_hitPoint", "_damage", "_source", "_instigator"];

private _currentDamage = _vehicle getHitPointDamage _hitPoint;

if (_damage < _currentDamage) exitWith {
    TRACE_4("capping damage at current",_capDamageAtCurret,_damage,_currentDamage,_hitPoint);
};

TRACE_4("adding damage to vehicle",_vehicle,_hitIndex,_hitPoint,_damage);

if (_hitPoint == "#structural") then {
    _hitPoint = "hithull";
    _hitIndex = -1;
};

if (_hitIndex >= 0) then {
    _vehicle setHitIndex [_hitIndex, _damage, true, _source, _instigator];
} else {
    _vehicle setHitPointDamage [_hitPoint, _damage, true, _source, _instigator];
};

if (_hitPoint == "HitEngine" && {_damage >= 0.9}) then {
    [QEGVAR(cookoff,engineFire), _vehicle] call CBA_fnc_serverEvent;
};

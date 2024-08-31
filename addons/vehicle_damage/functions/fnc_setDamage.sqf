#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets vehicle damage based on HitIndex. Failing that it falls back to HitPoint name.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hit point <STRING>
 * 2: Hit index <NUMBER>
 * 3: Damage <NUMBER>
 * 4: Source of damage <OBJECT>
 * 5: Person who caused damage <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "HitEngine", 1, 0.25, player, player] call ace_vehicle_damage_fnc_setDamage
 *
 * Public: No
 */

params ["_vehicle", "_hitPoint", "_hitIndex", "_damage", "_source", "_instigator"];
TRACE_6("setDamage",_vehicle,_hitPoint,_hitIndex,_damage,_source,_instigator);

private _currentDamage = _vehicle getHitPointDamage _hitPoint;

if (_damage < _currentDamage) exitWith {
    TRACE_3("capping damage at current",_damage,_currentDamage,_hitPoint);
};

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
    [QEGVAR(cookoff,engineFireServer), _vehicle] call CBA_fnc_serverEvent;
};

/*
 * Author: KoffeinFlummi, Glowbal
 * Cache a handleDamage call to execute it 3 frames later
 *
 * Arguments:
 *
 * Return Value:
 * <nil>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_damageBodyParts", "_cache_params", "_cache_damages"];
params ["_target"];

_damageBodyParts = _target getvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];
_cache_params = _target getVariable [QGVAR(cachedHandleDamageParams), []];
_cache_damages = _target getVariable QGVAR(cachedDamages);

{
    _x params ["_unit","_selectionName","_amountOfDamage","_sourceOfDamage","_typeOfProjectile","_typeOfDamage"];
    if !(isNull _sourceOfDamage && {_typeOfProjectile == ""} && {vehicle _unit == _unit} && {(_selectionName == "head" || isBurning _unit)}) then {
        _part = [_selectionName] call FUNC(selectionNameToNumber);
        if (_part < 0) exitwith {};
        _damageBodyParts set [_part, (_damageBodyParts select _part) + (_cache_damages select _foreachIndex)];
    };
}foreach _cache_params;
_target setvariable [QGVAR(bodyPartStatus), _damageBodyParts, true];

EXPLODE_6_PVT(_damageBodyParts,_headDamage,_torsoDamage,_handsDamageR,_handsDamageL,_legsDamageR,_legsDamageL);
_target setHitPointDamage ["hitHead", _headDamage min 0.95];
_target setHitPointDamage ["hitBody", _torsoDamage min 0.95];
_target setHitPointDamage ["hitHands", (_handsDamageR + _handsDamageL) min 0.95];
_target setHitPointDamage ["hitLegs", (_legsDamageR + _legsDamageL) min 0.95];

{
    _target setHitPointDamage [_x, (_damageBodyParts select _foreachIndex) min 0.95];
}foreach GVAR(HITPOINTS);

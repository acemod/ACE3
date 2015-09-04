/*
 * Author: KoffeinFlummi, Glowbal
 * Handle damage basic medical
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
TRACE_1("ACE_DEBUG: HandleDamage_BASIC Called",_target);

_damageBodyParts = _target getvariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];
_cache_params = _target getVariable [QGVAR(cachedHandleDamageParams), []];
_cache_damages = _target getVariable QGVAR(cachedDamages);

TRACE_4("ACE_DEBUG: HandleDamage BASIC",_unit, _damageBodyParts,_cache_params,_cache_damages);

{
    _x params ["_unit","_selectionName","_amountOfDamage","_sourceOfDamage","_typeOfProjectile","_typeOfDamage"];
    if !(isNull _sourceOfDamage && {_typeOfProjectile == ""} && {vehicle _unit == _unit} && {(_selectionName == "head" || isBurning _unit)}) then {
        _part = [_selectionName] call FUNC(selectionNameToNumber);
        if (_part < 0) exitwith {};

        private ["_newDamage", "_pain"];
        _newDamage = (_cache_damages select _foreachIndex);
        _damageBodyParts set [_part, (_damageBodyParts select _part) + _newDamage];
        _unit setvariable [QGVAR(bodyPartStatus), _damageBodyParts];

        if (alive _unit && {!(_unit getvariable ["ACE_isUnconscious", false])}) then {
            // If it reaches this, we can assume that the hit did not kill this unit, as this function is called 3 frames after the damage has been passed.
            if ([_unit, _part, if (_part > 1) then {_newDamage * 1.3} else {_newDamage * 2}] call FUNC(determineIfFatal)) then {
                [_unit] call FUNC(setUnconscious);
            };
        };
        _pain = _unit getVariable [QGVAR(pain), 0];
        _pain = _pain + _newDamage * (1 - (_unit getVariable [QGVAR(morphine), 0]));
        _unit setVariable [QGVAR(pain), _pain min 1, true];
    };
}foreach _cache_params;

// We broadcast the value across the net here, in order to avoid broadcasting it multiple times earlier in the above code block
_target setvariable [QGVAR(bodyPartStatus), _damageBodyParts, true];
TRACE_2("ACE_DEBUG: HandleDamage BASIC Broadcast value here",_unit, _target getvariable QGVAR(bodyPartStatus));

EXPLODE_6_PVT(_damageBodyParts,_headDamage,_torsoDamage,_handsDamageR,_handsDamageL,_legsDamageR,_legsDamageL);
_target setHitPointDamage ["hitHead", _headDamage min 0.95];
_target setHitPointDamage ["hitBody", _torsoDamage min 0.95];
_target setHitPointDamage ["hitHands", (_handsDamageR + _handsDamageL) min 0.95];
_target setHitPointDamage ["hitLegs", (_legsDamageR + _legsDamageL) min 0.95];

{
    _target setHitPointDamage [_x, (_damageBodyParts select _foreachIndex) min 0.95];
}foreach GVAR(HITPOINTS);

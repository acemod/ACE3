/*
 * Author: KoffeinFlummi, Glowbal, commy2
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

params ["_unit", "_selection", "_newDamage"];

TRACE_1("ACE_DEBUG: HandleDamage_BASIC Called",_unit);

private ["_pain"];

_pain = _unit getVariable [QGVAR(pain), 0];
_pain = _pain + (_newDamage / 4) * (1 - (_unit getVariable [QGVAR(morphine), 0]));
_unit setVariable [QGVAR(pain), _pain min 1, true];

private ["_headDamage", "_bodyDamage", "_handsDamageL", "_handsDamageR", "_legsDamageL", "_legsDamageR"];

_headDamage = _unit getHitPointDamage "HitHead";
_bodyDamage = _unit getHitPointDamage "HitBody";
_handsDamageL = _unit getHitPointDamage "HitLeftArm";
_handsDamageR = _unit getHitPointDamage "HitRightArm";
_legsDamageL = _unit getHitPointDamage "HitLeftLeg";
_legsDamageR = _unit getHitPointDamage "HitRightLeg";

_unit setVariable [QGVAR(bodyPartStatus), [_headDamage, _bodyDamage, _handsDamageL, _handsDamageR, _legsDamageL, _legsDamageR], true];

_unit setHitPointDamage ["HitHands", _handsDamageL + _handsDamageR];
_unit setHitPointDamage ["HitLegs", _legsDamageL + _legsDamageR];

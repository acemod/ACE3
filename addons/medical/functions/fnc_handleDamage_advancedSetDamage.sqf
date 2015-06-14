/*
 * Author: Glowbal
 * Sets the hitpoint damage for au nit to the correct values
 *
 * Arguments:
 * 0: Unit for which the hitpoint damage will be sorted out <OBJECT>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_unit);

if (!local _unit) exitwith {};

private ["_bodyStatus", "_headDamage", "_torsoDamage", "_handsDamage", "_legsDamage"];

// ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"]
_bodyStatus = _unit getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];

EXPLODE_6_PVT(_bodyStatus,_headDamage,_torsoDamage,_handsDamageR,_handsDamageL,_legsDamageR,_legsDamageL);

_unit setHitPointDamage ["hitHead", _headDamage min 0.95];
_unit setHitPointDamage ["hitBody", _torsoDamage min 0.95];
_unit setHitPointDamage ["hitHands", (_handsDamageR + _handsDamageL) min 0.95];
_unit setHitPointDamage ["hitLegs", (_legsDamageR + _legsDamageL) min 0.95];

if (_bodyStatus isEqualTo [0,0,0,0,0,0]) then {
    _unit setDamage 0;
};

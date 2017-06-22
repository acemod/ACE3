/*
 * Author: Glowbal
 * Sets the hitpoint damage for au nit to the correct values
 *
 * Arguments:
 * 0: Unit for which the hitpoint damage will be sorted out <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_handleDamage_advancedSetDamage
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

if (!local _unit) exitWith {};

// ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"]
private _bodyStatus = _unit getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];

_bodyStatus params ["_headDamage", "_torsoDamage", "_handsDamageR", "_handsDamageL", "_legsDamageR", "_legsDamageL"];

_unit setHitPointDamage ["hitHead", _headDamage min 0.95];
_unit setHitPointDamage ["hitBody", _torsoDamage min 0.95];
_unit setHitPointDamage ["hitHands", (_handsDamageR + _handsDamageL) min 0.95];
_unit setHitPointDamage ["hitLegs", (_legsDamageR + _legsDamageL) min 0.95];

if (_bodyStatus isEqualTo [0,0,0,0,0,0]) then {
    _unit setDamage 0;
};

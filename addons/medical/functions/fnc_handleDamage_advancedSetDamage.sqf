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

private ["_unit", "_bodyStatus", "_headDamage", "_torsoDamage", "_handsDamage", "_legsDamage"];
_unit = _this select 0;

if (!local _unit) exitwith {};

_bodyStatus = _unit getvariable [QGVAR(bodyPartStatus),[0,0,0,0,0,0]];
// ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"]
_headDamage = _bodyStatus select 0;
if (_headDamage > 0.95) then {
    _unit setHitPointDamage ["hitHead", 0.95];
} else {
    _unit setHitPointDamage ["hitHead", _headDamage];
};

_torsoDamage = _bodyStatus select 1;
if (_torsoDamage > 0.95) then {
    _unit setHitPointDamage ["hitBody", 0.95];
} else {
    _unit setHitPointDamage ["hitBody", _torsoDamage];
};


_handsDamage = (_bodyStatus select 2) + (_bodyStatus select 3);
if (_handsDamage > 0.95) then {
    _unit setHitPointDamage ["hitHands", 0.95];
} else {
    _unit setHitPointDamage ["hitHands", _handsDamage];
};

_legsDamage =  (_bodyStatus select 4) + (_bodyStatus select 5);
if (_legsDamage > 0.95) then {
    _unit setHitPointDamage ["hitLegs", 0.95];
} else {
    _unit setHitPointDamage ["hitLegs", _legsDamage];
};

if ({_x > 0} count _bodyStatus == 0) then {
    _unit setDamage 0;
};

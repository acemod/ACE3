/**
 * fnc_setDamageBodyPart.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_bodyStatus", "_headDamage", "_torsoDamage", "_handsDamage", "_legsDamage"];
_unit = _this select 0;

if (!local _unit) exitwith {
    // execute only local
};

_bodyStatus = [_unit,QGVAR(bodyPartStatus),[0,0,0,0,0,0]] call EFUNC(common,getDefinedVariable);
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

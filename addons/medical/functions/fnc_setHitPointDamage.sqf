/*
 * Author: KoffeinFlummi
 * My very own setHitPointDamage since BIS' one is buggy when affecting a remote unit.
 * It also doesn't change the overall damage. This does.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: HitPoint <STRING>
 * 2: Damage <NUMBER>
 * 3: Disable overall damage adjustment (optional) <BOOL>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"
#define LEGDAMAGETRESHOLD1 1
#define LEGDAMAGETRESHOLD2 1.7
#define ARMDAMAGETRESHOLD1 1
#define ARMDAMAGETRESHOLD2 1.7

private ["_unit", "_selection", "_damage", "_selections", "_damages", "_damageOld", "_damageSumOld", "_damageNew", "_damageSumNew", "_damageFinal", "_armdamage", "_legdamage"];

_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;

// Unit isn't local, give function to machine where it is.
if !(local _unit) exitWith {
    [_this, QUOTE(DFUNC(setHitPointDamage)), _unit] call EFUNC(common,execRemoteFnc);
};

// Check if overall damage adjustment is disabled
if (count _this > 3 && {_this select 3}) exitWith {
    _unit setHitPointDamage [_selection, _damage];
};

_selections = [
    "HitHead",
    "HitBody",
    "HitLeftArm",
    "HitRightArm",
    "HitLeftLeg",
    "HitRightLeg"
];

if !(_selection in _selections) exitWith {
    _unit setHitPointDamage [_selection, _damage];
};

GVAR(unit) = _unit;
_damages = [_selections, {GVAR(unit) getHitPointDamage _this}] call EFUNC(common,map);

_damageOld = damage _unit;
_damageSumOld = 0;
{
    _damageSumOld = _damageSumOld + _x;
} forEach _damages;
_damageSumOld = _damageSumOld max 0.001;

_damages set [_selections find _selection, _damage];

_damageSumNew = 0;
{
    _damageSumNew = _damageSumNew + _x;
} forEach _damages;

_damageNew = _damageSumNew / 6;
if (_damageOld > 0) then {
    _damageNew = _damageOld * (_damageSumNew / _damageSumOld);
};

// prevent death
if (_damageNew >= 0.9) then {
    _unit setDamage 0.9;
    [_unit] call FUNC(setDead);
} else {
    _unit setDamage _damageNew;
};

{
    _damageFinal = (_damages select _forEachIndex);
    _unit setHitPointDamage [_x, _damageFinal];
} forEach _selections;

// Leg Damage
_legdamage = (_unit getHitPointDamage "HitLeftLeg") + (_unit getHitPointDamage "HitRightLeg");
if (_legdamage >= LEGDAMAGETRESHOLD1) then {
    if (_unit getHitPointDamage "HitLegs" != 1) then {_unit setHitPointDamage ["HitLegs", 1]};
} else {
    if (_unit getHitPointDamage "HitLegs" != 0) then {_unit setHitPointDamage ["HitLegs", 0]};
};
// @todo: force prone for completely fucked up legs.


// Arm Damage
_armdamage = (_unit getHitPointDamage "HitLeftArm") + (_unit getHitPointDamage "HitRightArm");
if (_armdamage >= ARMDAMAGETRESHOLD1) then {
    if (_unit getHitPointDamage "HitHands" != 1) then {_unit setHitPointDamage ["HitHands", 1]};
} else {
    if (_unit getHitPointDamage "HitHands" != 0) then {_unit setHitPointDamage ["HitHands", 0]};
};
// @todo: Drop weapon for full damage.

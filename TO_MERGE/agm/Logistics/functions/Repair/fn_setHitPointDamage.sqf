/*
 * Author: commy2, KoffeinFlummi
 *
 * My very own setHitPointDamage since BIS's one is buggy when affecting a remote unit.
 * It also doesn't change the overall damage. This does.
 *
 * Arguments:
 * 0: vehicle
 * 1: selection
 * 2: damage
 * 4: disable overall damage adjustment (optional)
 *
 * Return Value:
 * -
 */

#include <Macros.hqf>

private ["_vehicle", "_selection", "_damage", "_hitPoints", "_damageHitPoint", "_damageOld", "_damageSumOld", "_damageSumNew", "_damageNew"];

_vehicle = _this select 0;
_selection = _this select 1;
_damage = _this select 2;

// Unit isn't local, give function to machine where it is.
if !(local _vehicle) exitWith {
  [_this, "AGM_Repair_fnc_setHitPointDamage", _vehicle] call AGM_Core_fnc_execRemoteFnc;
};

// Check if overall damage adjustment is disabled
if (count _this > 3 && {_this select 3}) exitWith {
  _vehicle setHitPointDamage [_selection, _damage];
};

if !(_selection in ALL_HITPOINTS) exitWith {
  _vehicle setHitPointDamage [_selection, _damage];
};

_hitPoints = [];
{
  _damageHitPoint = _vehicle getHitPointDamage _x;
  if (isNil "_damageHitPoint") then {_damageHitPoint = 0};

  _hitPoints set [_forEachIndex, _damageHitPoint];
} forEach ALL_HITPOINTS;

_damageOld = damage _vehicle;
_damageSumOld = 0;
{
  _damageSumOld = _damageSumOld + _x;
} forEach _hitPoints;
_damageSumOld = _damageSumOld max 0.001;

_hitPoints set [ALL_HITPOINTS find _selection, _damage];

_damageSumNew = 0;
{
  _damageSumNew = _damageSumNew + _x;
} forEach _hitPoints;

_damageNew = _damageSumNew / count ALL_HITPOINTS;
if (_damageOld > 0) then {
  _damageNew = _damageOld * (_damageSumNew / _damageSumOld);
};

_vehicle setDamage _damageNew;

{
  _vehicle setHitPointDamage [_x, _hitPoints select _forEachIndex];
} forEach ALL_HITPOINTS;

/*
 * Author: KoffeinFlummi
 *
 * My very own setHitPointDamage since BIS's one is buggy when affecting a remote unit.
 * It also doesn't change the overall damage. This does.
 *
 * Arguments:
 * 0: unit
 * 1: selection
 * 2: damage
 * 3: disable overall damage adjustment (optional)
 *
 * Return Value:
 * -
 */

private ["_unit", "_selection", "_damage", "_selections", "_damages", "_damageOld", "_damageSumOld", "_damageNew", "_damageSumNew", "_damageFinal"];

_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;

// Unit isn't local, give function to machine where it is.
if !(local _unit) exitWith {
  [_this, "AGM_Medical_fnc_setHitPointDamage", _unit] call AGM_Core_fnc_execRemoteFnc;
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

AGM_Medical_Unit = _unit;
_damages = [_selections, {AGM_Medical_Unit getHitPointDamage _this}] call AGM_Core_fnc_map;

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

if (_unit getVariable ["AGM_isUnconscious", False]) then {
  if (_damageNew > 0.9 and {AGM_Medical_PreventDeathWhileUnconscious}) then {
    _damageNew = 0.89;
  };
} else {
  if (_damageNew > 0.9 and {AGM_Medical_PreventInstaDeath}) then {
    _damageNew = 0.89;
  };
};

_unit setDamage _damageNew;

{
  _damageFinal = (_damages select _forEachIndex);
  if (_unit getVariable ["AGM_isUnconscious", False]) then {
    if (_damageFinal > 0.9 and {AGM_Medical_PreventDeathWhileUnconscious}) then {
      _damageFinal = 0.89;
    };
  } else {
    if (_damageFinal > 0.9 and {AGM_Medical_PreventInstaDeath}) then {
      _damageFinal = 0.89;
    };
  };

  _unit setHitPointDamage [_x, _damageFinal];
} forEach _selections;

/*
 * Author: KoffeinFlummi
 *
 * Kills the given unit with a morphine overdose.
 *
 * Arguments:
 * 0: Unit
 *
 * Return Value:
 * None
 */

_unit = _this select 0;

if (!AGM_Medical_EnableOverdosing) exitWith {};

if !(local _unit) exitWith {
  [_this, "AGM_Medical_fnc_overdose", _unit] call AGM_Core_fnc_execRemoteFnc;
};

if !(_unit getVariable ["AGM_isUnconscious", False]) then {
  [_unit, 99999] call AGM_Medical_fnc_knockOut;
} else {
  if !(scriptDone (_unit getVariable "AGM_WakeUpTimer")) then {
    terminate (_unit getVariable "AGM_WakeUpTimer");
  };
};

_unit playAction "GestureSpasm4";

_unit spawn {
  sleep 20;
  [_this, "HitHead", 1, True] call AGM_Medical_fnc_setHitPointDamage;
};

/*
 * Author: KoffeinFlummi, commy2
 *
 * Creates ear ringing effect with set strength.
 *
 * Arguments:
 * 0: strength of ear ringing (Number between 0 and 1)
 *
 * Return Value:
 * none
 */
#include "script_component.hpp"

private ["_unit", "_strength"];

_unit = _this select 0;
_strength = _this select 1;

if (_unit getVariable ["ACE_hasEarPlugsin", false]) then {
  _strength = _strength / 4;
};

GVAR(newStrength) = GVAR(newStrength) max _strength;

if (missionNamespace getVariable [QGVAR(isEarRingingPlaying), false]) exitWith {};

_fnc_removeEarRinging = {
  EXPLODE_2_PVT(_this,_params,_pfhId);
  EXPLODE_2_PVT(_params,_startTime,_duration);

  // Exit if the delay is not met yet
  if (time < _startTime + _duration) exitWith {};

  GVAR(isEarRingingPlaying) = false;
  [_pfhId] call cba_fnc_removePerFrameHandler;
};

if (profileNamespace getVariable [QGVAR(DisableEarRinging), false]) exitWith {};

if (_strength > 0.75) exitWith {
  playSound "ACE_EarRinging_Heavy";
  GVAR(isEarRingingPlaying) = true;
  [_fnc_removeEarRinging, 0.25, [time, 7.0] ] call CBA_fnc_addPerFrameHandler;
};
if (_strength > 0.5) exitWith {
  playSound "ACE_EarRinging_Medium";
  GVAR(isEarRingingPlaying) = true;
  [_fnc_removeEarRinging, 0.25, [time, 5.0] ] call CBA_fnc_addPerFrameHandler;
};
if (_strength > 0.2) exitWith {
  playSound "ACE_EarRinging_Weak";
  GVAR(isEarRingingPlaying) = true;
  [_fnc_removeEarRinging, 0.25, [time, 3.0] ] call CBA_fnc_addPerFrameHandler;
};

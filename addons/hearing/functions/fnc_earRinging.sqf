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
  GVAR(isEarRingingPlaying) = false;
  // Delete this PFH, so it is only executed once
  [(_this select 1)] call cba_fnc_removePerFrameHandler;
};

if (_strength > 0.75) exitWith {
  playSound "ACE_EarRinging_Heavy";
  GVAR(isEarRingingPlaying) = true;
  [_fnc_removeEarRinging, 7.0, [] ] call CBA_fnc_addPerFrameHandler;
};
if (_strength > 0.5) exitWith {
  playSound "ACE_EarRinging_Medium";
  GVAR(isEarRingingPlaying) = true;
  [_fnc_removeEarRinging, 5.0, [] ] call CBA_fnc_addPerFrameHandler;
};
if (_strength > 0.2) exitWith {
  playSound "ACE_EarRinging_Weak";
  GVAR(isEarRingingPlaying) = true;
  [_fnc_removeEarRinging, 3.0, [] ] call CBA_fnc_addPerFrameHandler;
};

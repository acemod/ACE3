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

if (_strength > 0.75) exitWith {
  playSound "ACE_EarRinging_Heavy";
  GVAR(isEarRingingPlaying) = true;
  0 spawn {
    sleep 7;
    GVAR(isEarRingingPlaying) = false;
  };
};
if (_strength > 0.5) exitWith {
  playSound "ACE_EarRinging_Medium";
  GVAR(isEarRingingPlaying) = true;
  0 spawn {
    sleep 5;
    GVAR(isEarRingingPlaying) = false;
  };
};
if (_strength > 0.2) exitWith {
  playSound "ACE_EarRinging_Weak";
  GVAR(isEarRingingPlaying) = true;
  0 spawn {
    sleep 3;
    GVAR(isEarRingingPlaying) = false;
  };
};

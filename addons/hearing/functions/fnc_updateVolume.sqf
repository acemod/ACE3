// by commy2 and CAA-Picard
#include "script_component.hpp"

#define STRENGHTODEAFNESS 3
#define MAXDEAFNESS 1.1

// Exit if combat deafness is disabled
if !(GVAR(enableCombatDeafness)) exitWith {};

// Check if new noises increase deafness
if (GVAR(newStrength) * STRENGHTODEAFNESS > GVAR(currentDeafness)) then {
  GVAR(currentDeafness) = GVAR(newStrength) * STRENGHTODEAFNESS min MAXDEAFNESS;
};
GVAR(newStrength) = 0;

// Recover rate is slower if deafness is severe
_recoverRate = 0.01;
if (GVAR(currentDeafness) > 0.7) then {
  _recoverRate = 0.005;
  if (GVAR(currentDeafness) > 0.9) then {
    _recoverRate = 0.002;
  };
};

// Deafness recovers with time
GVAR(currentDeafness) = GVAR(currentDeafness) - _recoverRate max 0;

// needed until Bohemia fixes playSound to actually use the second argument
_volume = (1 - GVAR(currentDeafness) max 0)^2 max 0.04;

// Earplugs reduce hearing 50%
if ([ACE_player] call FUNC(hasEarPlugsIn)) then {
  _volume = _volume min GVAR(EarplugsVolume);
};

// Reduce volume if player is unconscious
if (ACE_player getVariable ["ACE_isUnconscious", false]) then {
  _volume = _volume min GVAR(UnconsciousnessVolume);
};

if (!(missionNameSpace getVariable [QGVAR(disableVolumeUpdate), false])) then {
  0.1 fadeSound _volume;
  0.1 fadeSpeech _volume;
  ACE_player setVariable ["tf_globalVolume", _volume];
  ACE_player setVariable ["acre_sys_core_globalVolume", _volume];
};

//hintSilent format ["GVAR(currentDeafness), _Volume = %1, %2", GVAR(currentDeafness), _volume];

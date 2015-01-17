// by KoffeinFlummi and CAA-Picard
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_params,_pfhId);

_interval = time - GVAR(lastUpdateTime);

// Update the g-forces at constant game time intervals
if (_interval < INTERVAL) exitWith {};
GVAR(lastUpdateTime) = time;

/*if !(vehicle ACE_player isKindOf "Air") exitWith {
    GVAR(GForces) = [];
    GVAR(GForces_Index) = 0;
    waitUntil {sleep 5; (vehicle _player isKindOf "Air") or ((getPos _player select 2) > 5)};
};*/

_newVel = velocity (vehicle ACE_player);

_accel = ((_newVel vectorDiff GVAR(oldVel)) vectorMultiply (1 / INTERVAL)) vectorAdd [0, 0, 9.8];
_currentGForce = (_accel vectorDotProduct vectorUp (vehicle ACE_player)) / 9.8;

// Cap maximum G's to +- 10 to avoid g-effects when the update is low fps.
_currentGForce = (_currentGForce max -10) min 10;

GVAR(GForces) set [GVAR(GForces_Index), _currentGForce];
GVAR(GForces_Index) = (GVAR(GForces_Index) + 1) % round (AVERAGEDURATION / INTERVAL);
GVAR(oldVel) = _newVel;

/*
* source: http://en.wikipedia.org/wiki/G-LOC
* untrained persons without gsuit will fall unconscious between 4 and 6G
* pilots in gsuits will sustain up to 9G
* a person is for average 12 seconds unconscious
* after being unconscious, a person is unable to do simple tasks for average 15 seconds
*
* _upTolerance converts the effective 9G of a pilot to virtual 5.4G (= 0.8*0.75*9G)
* pilots with gsuit will get unconscious at an _average of 9G
* normal men without gsuit will get unconscious at an _average of 5.4G
*/

_average = 0;
if (count GVAR(GForces) > 0) then {
  _sum = 0;
  {
    _sum = _sum + _x;
  } forEach GVAR(GForces);
  _average = _sum / (count GVAR(GForces));
};

_downTolerance = ACE_player getVariable ["ACE_GForceCoef",
  getNumber (configFile >> "CfgVehicles" >> (typeOf ACE_player) >> "ACE_GForceCoef")];
_upTolerance = _downTolerance * getNumber (configFile >> "CfgWeapons" >> (uniform ACE_player) >> "ACE_GForceCoef");

["GForces", [_average, _upTolerance], {format ["_g _avgG _avgG*_upTol: %1, %2, %3", _currentGForce, _this select 0, (_this select 0) * (_this select 1)]}] call EFUNC(common,log);

// @todo: Sort the interaction with medical
if (((_average * _upTolerance) > MAXVIRTUALG) and {isClass (configFile >> "CfgPatches" >> "ACE_Medical") and {!(ACE_player getVariable ["ACE_isUnconscious", false])}}) then {
  [ACE_player, (10 + floor(random 5))] call EFUNC(medical,knockOut);
};

if ((abs _average > 2) and !(ACE_player getVariable ["ACE_isUnconscious", false])) then {
  if (_average > 0) then {
    _strength = 1.2 - (((_average - 2) * _upTolerance) / (MAXVIRTUALG - 2));
    GVAR(GForces_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[_strength,_strength,0,0,0,0.1,0.5]];
    addCamShake [((abs _average) - 2) / 3, 1, 15];
  } else {
    _strength = 1.2 - ((((-1 * _average) - 2) * _downTolerance) / (MAXVIRTUALG - 2));
    GVAR(GForces_CC) ppEffectAdjust [1,1,0,[1,0.2,0.2,1],[0,0,0,0],[1,1,1,1],[_strength,_strength,0,0,0,0.1,0.5]];
    addCamShake [((abs _average) - 2) / 5, 1, 15];
  };
} else {
  GVAR(GForces_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
};

GVAR(GForces_CC) ppEffectCommit INTERVAL;

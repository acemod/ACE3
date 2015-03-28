// TMR: Small Arms - Recoil initialization and functions
// (C) 2013 Ryan Schultz. See LICENSE.
// Edited for compatability in ACE by KoffeinFlummi
// Edited by commy2

#include "script_component.hpp"

private ["_unit", "_weapon", "_projectile"];

_unit = _this select 0;
_weapon = _this select 1;
_projectile = _this select 6;

if (_weapon in ["Throw", "Put"]) exitWith {};

private ["_lastFired", "_burst"];

_lastFired = _unit getVariable [QUOTE(GVAR(lastFired)), -1];
_burst = _unit getVariable [QUOTE(GVAR(burst)), 0];

if (time - _lastFired < 0.45) then {
  private "_startDisperse";
  _burst = _burst + 1;
  _unit setVariable [QUOTE(GVAR(burst)), _burst, false];

  _startDisperse = [1, 3] select (cameraView == "GUNNER");

  if (_burst > _startDisperse) then {
    // Reset burst size for calcs
    _burst = _burst - _startDisperse;

    // Increase dispersion cap if player is not using sights
    _sightsBurst = [30, 0] select (cameraView == "GUNNER");

    // Increase initial dispersion and cap if player is moving
    if (speed _unit > 0.5) then {
      _sightsBurst = 25;
      _burst = _burst + 15;
    };

    // Maximum possible dispersion (without _sightsBurst mod)
    _maxBurst = 50;

    if (isWeaponRested _unit) then {_maxBurst = 25};
    if (isWeaponDeployed _unit) then {_maxBurst = 18};

    // Cap the dispersion
    _burst = (_burst min _maxBurst) + _sightsBurst;

    // Add random variance
    _elevAngle = (_burst / 300) - random (_burst / 300) * 2;
    _travAngle = (_burst / 260) - random (_burst / 260) * 2;

    [_projectile, _travAngle, _elevAngle] call EFUNC(common,changeProjectileDirection);
  };
} else {

  // Long enough delay, reset burst
  _unit setVariable [QUOTE(GVAR(burst)), 0, false];
};

_unit setVariable [QUOTE(GVAR(lastFired)), time, false];

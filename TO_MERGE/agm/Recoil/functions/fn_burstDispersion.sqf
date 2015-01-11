// TMR: Small Arms - Recoil initialization and functions
// (C) 2013 Ryan Schultz. See LICENSE.
// Edited prefixes for compatability in AGM_Realism by KoffeinFlummi
// Edited by commy2

private ["_unit", "_weapon", "_projectile"];

_unit = _this select 0;
_weapon = _this select 1;
_projectile = _this select 6;

if (_weapon in ["Throw", "Put"]) exitWith {};

private ["_lastFired", "_burst"];

_lastFired = _unit getVariable ["AGM_Recoil_lastFired", -1];
_burst = _unit getVariable ["AGM_Recoil_Burst", 0];

if (time - _lastFired < 0.45) then {
  private "_startDisperse";
  _burst = _burst + 1;
  _unit setVariable ["AGM_Recoil_Burst", _burst, false];

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

    if (_unit getVariable ["AGM_weaponRested", false]) then {_maxBurst = 25};
    if (_unit getVariable ["AGM_bipodDeployed", false]) then {_maxBurst = 18};

    // Cap the dispersion
    _burst = (_burst min _maxBurst) + _sightsBurst;

    // Add random variance
    _elevAngle = (_burst / 300) - random (_burst / 300) * 2;
    _travAngle = (_burst / 260) - random (_burst / 260) * 2;

    ["Burst", [_travAngle, _elevAngle]] call AGM_Debug_fnc_log;

    [_projectile, _travAngle, _elevAngle] call AGM_Core_fnc_changeProjectileDirection;
  };
} else {

  // Long enough delay, reset burst
  _unit setVariable ["AGM_Recoil_Burst", 0, false];
};

_unit setVariable ["AGM_Recoil_lastFired", time, false];

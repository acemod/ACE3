/*
 * Authors: KoffeinFlummi, esteldunedain
 *
 * Changes the bullet trajectory depending on wind, density and temperature.
 *
 * Arguments:
 * Fired EH
 *
 * Return Value:
 * none
 */

private ["_unit", "_ammoType", "_round", "_dispersion", "_additionalVel"];

_unit = _this select 0;
_ammoType = _this select 4;
_round = _this select 5;

if !(local _unit) exitWith {};
if !([_unit] call AGM_Core_fnc_isPlayer) exitWith {};
if (_round isKindOf "GrenadeHand") exitWith {};

// Additional dispersion
_dispersion = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "AGM_Bullet_Dispersion");

// Powder temp effect
_additionalVel = (vectorMagnitude (velocity _round)) * ((((AGM_Wind_currentTemperature + 273.13) / 288.13 - 1) / 2.5 + 1 ) - 1);

[_round, ((random 2) - 1) * _dispersion, ((random 2) - 1) * _dispersion, _additionalVel] call AGM_Core_fnc_changeProjectileDirection;

_this spawn {
  _ammoType = _this select 4;
  _round = _this select 5;

  _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "airFriction");
  _simulation = getText (configFile >> "CfgAmmo" >> _ammoType >> "simulation");
  _time = time;

  if (_airFriction >= 0 || {_simulation == "shotMissile"} || {_simulation == "shotRocket"}) then {
    // Do not correct for airDensity if airFriction is not logical on the first place
    _airFriction = -0.0007;
    while {!isNull _round and alive _round} do {
      _deltaTime = time - _time;

      _velocity = velocity _round;
      _velocityNew =  _velocity
                      // Calculate approximate wind drag
                      vectorDiff (wind vectorMultiply (vectorMagnitude (_velocity vectorDiff wind) * AGM_Wind_currentRelativeDensity * _airFriction * _deltaTime));
      _round setVelocity _velocityNew;

      _time = time;
      sleep 0.05;
    };
  } else {
    // Calculate total drag based on aparent wind
    while {!isNull _round and alive _round} do {
      _deltaTime = time - _time;

      // See https://github.com/KoffeinFlummi/AGM/issues/996 and See https://github.com/KoffeinFlummi/AGM/issues/1732
      _velocity = velocity _round;
      _aparentWind = wind vectorDiff _velocity;
      _velocityNew = (_velocity
                      // Undo engine's drag calculation (airFriction * V^2 * dt)
                      vectorDiff (_velocity vectorMultiply (vectorMagnitude _velocity * _airFriction * _deltaTime)))
                      // Calculate total drag based on aparent wind
                      vectorDiff (_aparentWind vectorMultiply (vectorMagnitude _aparentWind * AGM_Wind_currentRelativeDensity * _airFriction * _deltaTime));

      _round setVelocity _velocityNew;

      _time = time;
      sleep 0.05;
    };
  };
};

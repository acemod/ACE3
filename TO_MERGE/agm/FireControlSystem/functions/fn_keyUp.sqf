/*
 * Author: KoffeinFlummi
 *
 * Calculates the offsets for all weapons needed to hit the current target.
 *
 * Arguments:
 * 0: The vehicle
 * 1: Range Override (Optional)
 *
 * Return Value:
 * none
 */

private ["_ammoType", "_viewDiff", "_posArrival", "_airFriction", "_timeToLive", "_maxElev", "_vehicle", "_posTarget", "_distance", "_simulationStep", "_posX", "_velocityMagnitude", "_magazines", "_movingAzimuth", "_FCSElevation", "_velocityX", "_velocityY", "_weaponDirection", "_velocityTarget", "_FCSAzimuth", "_FCSMagazines", "_dirArrival", "_i", "_magazineType", "_angleTarget", "_offset", "_timeToTarget", "_initSpeed"];

_vehicle = _this select 0;
_distance = _this select 1;

_magazines = magazines _vehicle;

if (_distance == 0) then {
  _distance = [
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FCSDistanceInterval"),
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FCSMaxDistance"),
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FCSMinDistance")
  ] call AGM_Core_fnc_getTargetDistance; // maximum distance: 5000m, 5m precision
};

_weaponDirection = _vehicle weaponDirection currentWeapon _vehicle;
_angleTarget = asin (_weaponDirection select 2);

if (count _this > 2) then {
  _distance = _this select 2;
};

if (!(isNil "AGM_FCS_backgroundCalculation") and {!(scriptDone AGM_FCS_backgroundCalculation)}) then {
  terminate AGM_FCS_backgroundCalculation;
};

// MOVING TARGETS
_movingAzimuth = 0;
if (time - AGM_FCSTime > 1 and AGM_FCSTime != -1 and count _this < 3) then {
  // calculate speed of target
  _posTarget = [
    (getPos _vehicle select 0) + _distance * (_weaponDirection select 0),
    (getPos _vehicle select 1) + _distance * (_weaponDirection select 1),
    (getPos _vehicle select 2) + _distance * (_weaponDirection select 2)
  ];
  _velocityTarget = [
    ((_posTarget select 0) - (AGM_FCSPosition select 0)) / (time - AGM_FCSTime),
    ((_posTarget select 1) - (AGM_FCSPosition select 1)) / (time - AGM_FCSTime),
    ((_posTarget select 2) - (AGM_FCSPosition select 2)) / (time - AGM_FCSTime)
  ];

  // estimate time to target
  _magazineType = currentMagazine _vehicle;
  _ammoType       = getText   (configFile >> "CfgMagazines" >> _magazineType >> "ammo");
  _initSpeed      = getNumber (configFile >> "CfgMagazines" >> _magazineType >> "initSpeed");
  _airFriction    = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "airFriction");
  _timeToLive     = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "timeToLive");
  _simulationStep = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "simulationStep");

  if (_simulationStep != 0) then {
    _posX = 0;
    _velocityX = _initSpeed;
    _velocityY = 0;
    _timeToTarget = 0;
    for "_i" from 1 to ((floor (_timeToLive / _simulationStep)) + 1) do {
      _posX = _posX + _velocityX * _simulationStep;
      if (_posX >= _distance) exitWith { // bullet passed the target
        _timeToTarget = _i * _simulationStep;
      };
      _velocityMagnitude = sqrt (_velocityX^2 + _velocityY^2);
      _velocityX = _velocityX + _velocityX * _velocityMagnitude * _airFriction * _simulationStep;
      _velocityY = _velocityY + _velocityY * _velocityMagnitude * _airFriction * _simulationStep - 9.81 * _simulationStep;
    };

    // calculate offsets
    _posArrival = [
      (_posTarget select 0) + (_velocityTarget select 0) * _timeToTarget,
      (_posTarget select 1) + (_velocityTarget select 1) * _timeToTarget,
      (_posTarget select 2) + (_velocityTarget select 2) * _timeToTarget
    ];
    _dirArrival = [
      ((_posArrival select 0) - (getPos _vehicle select 0)) / (_posArrival distance (getPos _vehicle)),
      ((_posArrival select 1) - (getPos _vehicle select 1)) / (_posArrival distance (getPos _vehicle)),
      ((_posArrival select 2) - (getPos _vehicle select 2)) / (_posArrival distance (getPos _vehicle))
    ];

    _movingAzimuth = ((_dirArrival select 0) atan2 (_dirArrival select 1)) - ((_weaponDirection select 0) atan2 (_weaponDirection select 1));
    _angleTarget = asin (_dirArrival select 2);
    _distance = floor (_posArrival distance (getPos _vehicle));
  };
};
AGM_FCSEnabled = false;
AGM_FCSTime = -1;

// CALCULATE AZIMUTH CORRECTION
_viewDiff = _vehicle getVariable "AGM_FCSViewDiff";
_FCSAzimuth = _movingAzimuth;
if (_viewDiff != 0) then {
  _FCSAzimuth = (atan (_distance / _viewDiff) - (abs _viewDiff / _viewDiff) * 90) + _movingAzimuth;
};

// CALCULATE OFFSET FOR CURRENT WEAPON
_FCSMagazines = [];
_FCSElevation = [];

_magazineType   = currentMagazine _vehicle;
_ammoType       = getText   (configFile >> "CfgMagazines" >> _magazineType >> "ammo");
if !(getText (configFile >> "CfgAmmo" >> _ammoType >> "simulation") == "shotMissile") then {
  _maxElev        = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "maxElev");
  _initSpeed      = getNumber (configFile >> "CfgMagazines" >> _magazineType >> "initSpeed");
  _airFriction    = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "airFriction");
  _timeToLive     = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "timeToLive");
  _simulationStep = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "simulationStep");

  _offset = [_distance, _angleTarget, _maxElev, _initSpeed, _airFriction, _timeToLive, _simulationStep] call AGM_FCS_fnc_getAngle;

  _FCSMagazines = _FCSMagazines + [_magazineType];
  _FCSElevation = _FCSElevation + [_offset];
};

_vehicle setVariable ["AGM_FCSDistance",  _distance,     true];
_vehicle setVariable ["AGM_FCSMagazines", _FCSMagazines, true];
_vehicle setVariable ["AGM_FCSElevation", _FCSElevation, true];
_vehicle setVariable ["AGM_FCSAzimuth",   _FCSAzimuth,   true];

// CALCULATE OFFSETS FOR OTHER WEAPONS IN THE BACKGROUND
AGM_FCS_backgroundCalculation = [_vehicle, _magazines, _distance, _angleTarget, _FCSMagazines, _FCSElevation] spawn {
  _vehicle      = _this select 0;
  _magazines    = _this select 1;
  _distance     = _this select 2;
  _angleTarget  = _this select 3;
  _FCSMagazines = _this select 4;
  _FCSElevation = _this select 5;

  {
    if !(_x in _FCSMagazines) then {
      _ammoType       = getText   (configFile >> "CfgMagazines" >> _x >> "ammo");
      if !(getText (configFile >> "CfgAmmo" >> _ammoType >> "simulation") == "shotMissile") then {
        _maxElev        = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "maxElev");
        _initSpeed      = getNumber (configFile >> "CfgMagazines" >> _x >> "initSpeed");
        _airFriction    = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "airFriction");
        _timeToLive     = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "timeToLive");
        _simulationStep = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "simulationStep");

        _offset = [_distance, _angleTarget, _maxElev, _initSpeed, _airFriction, _timeToLive, _simulationStep] call AGM_FCS_fnc_getAngle;

        _FCSMagazines = _FCSMagazines + [_x];
        _FCSElevation = _FCSElevation + [_offset];
      };
    };
  } forEach _magazines;

  _vehicle setVariable ["AGM_FCSMagazines", _FCSMagazines, true];
  _vehicle setVariable ["AGM_FCSElevation", _FCSElevation, true];
};

[format ["%1: %2", localize "STR_AGM_FireControlSystem_ZeroedTo", _distance]] call AGM_Core_fnc_displayTextStructured;

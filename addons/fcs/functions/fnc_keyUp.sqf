/*
 * Author: KoffeinFlummi
 *
 * Calculates the offsets for all weapons needed to hit the current target.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Turret <CONFIG>
 * 2: Current Distance <NUMBER>
 * 3: Show Hint <BOOL>
 * 4: Play Sound <BOOL>
 *
 * Return Value:
 * none
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_turretConfig", "_weapons", "_magazines", "_showHint", "_playSound", "_i"];

params ["_vehicle", "_turret", "_distance", ["_showHint",false], ["_playSound"]];

_turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);
if (isNil "_distance" || {_distance > -1}) then {
    _distance = call FUNC(getRange);
};

_weapons = _vehicle weaponsTurret _turret;
_magazines = _vehicle magazinesTurret _turret;

if (_distance == 0) then {
    _distance = [
        getNumber (_turretConfig >> QGVAR(DistanceInterval)),
        getNumber (_turretConfig >> QGVAR(MaxDistance)),
        getNumber (_turretConfig >> QGVAR(MinDistance))
    ] call EFUNC(common,getTargetDistance); // maximum distance: 5000m, 5m precision
};

private ["_weapon", "_weaponDirection", "_angleTarget"];
_weapon = _vehicle currentWeaponTurret _turret;
_weaponDirection = _vehicle weaponDirection _weapon; // @todo doesn't work for sub turrets

if (_turret isEqualTo ([_vehicle] call EFUNC(common,getTurretCommander))) then {
    _weaponDirection = eyeDirection _vehicle;
};

if (_weaponDirection isEqualTo [0,0,0]) then {  // dummy value for non main turrets
    _weaponDirection = [1,0,0];
};
_weaponDirection params ["_weaponDirectionX", "_weaponDirectionY", "_weaponDirectionZ"];
_angleTarget = asin _weaponDirectionZ;

if (!(isNil QGVAR(backgroundCalculation)) and {!(scriptDone GVAR(backgroundCalculation))}) then {
    terminate GVAR(backgroundCalculation);
};

private ["_movingAzimuth", "_posTarget", "_velocityTarget"];

// MOVING TARGETS
_movingAzimuth = 0;
if (ACE_time - GVAR(ACE_time) > 1 and GVAR(ACE_time) != -1 and count _this < 3) then {
    // calculate speed of target
    (getPos _vehicle) params ["_vehicleX", "_vehicleY", "_vehicleZ"];
    _posTarget = [
        _vehicleX + _distance * _weaponDirectionX,
        _vehicleY + _distance * _weaponDirectionY,
        _vehicleZ + _distance * _weaponDirectionZ
    ];
    GVAR(position) params ["_positionX", "_positionY", "_positionZ"];
    _posTarget params ["_posTargetX", "_posTargetY", "_posTargetZ"];
    _velocityTarget = [
        (_posTargetX - _positionx) / (ACE_time - GVAR(ACE_time)),
        (_posTargetY - _positionY) / (ACE_time - GVAR(ACE_time)),
        (_posTargetZ - _positionX) / (ACE_time - GVAR(ACE_time))
    ];

    private ["_magazineType", "_ammoType", "_initSpeed", "_airFriction", "_timeToLive", "_simulationStep", "_initSpeedCoef", "_velocityMagnitude"];

    // estimate ACE_time to target
    _magazineType = _vehicle currentMagazineTurret _turret;
    _ammoType       = getText   (configFile >> "CfgMagazines" >> _magazineType >> "ammo");
    _initSpeed      = getNumber (configFile >> "CfgMagazines" >> _magazineType >> "initSpeed");
    _airFriction    = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "airFriction");
    _timeToLive     = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "timeToLive");
    _simulationStep = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "simulationStep");

    _initSpeedCoef = getNumber(configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
    if (_initSpeedCoef < 0) then {
        _initSpeed = _initSpeed * -_initSpeedCoef;
    };
    if (_initSpeedCoef > 0) then {
        _initSpeed = _initSpeedCoef;
    };

    if (_simulationStep != 0) then {
        private ["_posX", "_velocityX", "_velocityY", "_timeToTarget"];

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

        private ["_posArrival", "_dirArrival"];
        _velocityTarget params ["_velocityTargetX", "_velocityTargetY", "_velocityTargetZ"]
        // calculate offsets
        _posArrival = [
            _posTargetX + _velocityTargetX * _timeToTarget,
            _posTargetY + _velocityTargetY * _timeToTarget,
            _posTargetZ + _velocityTargetZ * _timeToTarget
        ];
        _posArrival params ["_posArrivalX", "_posArrivalY", "_posArrivalZ"];
        _dirArrival = [
            (_posArrivalX - _vehicleX) / (_posArrival distance (getPos _vehicle)),
            (_posArrivalY - _vehicleY) / (_posArrival distance (getPos _vehicle)),
            (_posArrivalZ - _vehicleX) / (_posArrival distance (getPos _vehicle))
        ];
        _dirArrival params ["_dirArrivalX", "_dirArrivalY", "_dirArrivalZ"];
        _movingAzimuth = (_dirArrivalX atan2 _dirArrivalY) - (_weaponDirectionX atan2 _weaponDirectionY);
        _angleTarget = asin _dirArrivalZ;
        _distance = floor (_posArrival distance (getPos _vehicle));
    };
};
GVAR(enabled) = false;
GVAR(ACE_time) = -1;

private ["_viewDiff", "_FCSAzimuth", "_FCSMagazines", "_FCSElevation"];

// CALCULATE AZIMUTH CORRECTION
_viewDiff = _vehicle getVariable format ["%1_%2", QGVAR(ViewDiff), _turret];
_FCSAzimuth = _movingAzimuth;

if (_viewDiff != 0) then {
    _FCSAzimuth = (atan (_distance / _viewDiff) - (abs _viewDiff / _viewDiff) * 90) + _movingAzimuth;
};

// CALCULATE OFFSET
_FCSMagazines = [];
_FCSElevation = [];

{
    private ["_magazine", "_ammoType"];
    _magazine = _x;
    _ammoType = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");

    if !(getText (configFile >> "CfgAmmo" >> _ammoType >> "simulation") == "shotMissile") then {
        private ["_maxElev", "_initSpeed", "_airFriction", "_offset"];

        _maxElev     = getNumber (_turretConfig >> "maxElev");
        _initSpeed   = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
        _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammoType >> "airFriction");

        {
            private ["_weapon", "_muzzles", "_weaponMagazines", "_muzzleMagazines"];
            _weapon = _x;
            _muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");
            _weaponMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
            {
                if (_x != "this") then {
                    _muzzleMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines");
                    _weaponMagazines append _muzzleMagazines;
                };
            } count _muzzles;
            if (_magazine in _weaponMagazines) exitWith {
                _initSpeedCoef = getNumber(configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
                if (_initSpeedCoef < 0) then {
                    _initSpeed = _initSpeed * -_initSpeedCoef;
                };
                if (_initSpeedCoef > 0) then {
                    _initSpeed = _initSpeedCoef;
                };
            };
        } count _weapons;

        _offset = "ace_fcs" callExtension format ["%1,%2,%3,%4", _initSpeed, _airFriction, _angleTarget, _distance];
        _offset = parseNumber _offset;

        _FCSMagazines = _FCSMagazines + [_magazine];
        _FCSElevation = _FCSElevation + [_offset];
    };
} count _magazines;

[_vehicle, format ["%1_%2", QGVAR(Distance), _turret],      _distance] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Magazines), _turret], _FCSMagazines] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Elevation), _turret], _FCSElevation] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Azimuth), _turret],     _FCSAzimuth] call EFUNC(common,setVariablePublic);

if(_playSound) then {
    playSound "ACE_Sound_Click";
};

if(_showHint) then {
    [format ["%1: %2", localize LSTRING(ZeroedTo), _distance]] call EFUNC(common,displayTextStructured);
};

/*
 * Author: KoffeinFlummi
 *
 * Calculates the offsets for all weapons needed to hit the current target.
 *
 * Arguments:
 * 0: The vehicle
 *
 * Return Value:
 * none
 */

#include "script_component.hpp"

private ["_vehicle", "_turret", "_turretConfig", "_distance", "_weapons", "_magazines", "_showHint", "_playSound"];

_vehicle = _this select 0;
_turret = _this select 1;

_turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);

_distance = call FUNC(getRange);

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

_angleTarget = asin (_weaponDirection select 2);

if (count _this > 2) then {
    if((_this select 2) > -1) then {
        _distance = _this select 2;
    };
};

if (!(isNil QGVAR(backgroundCalculation)) and {!(scriptDone GVAR(backgroundCalculation))}) then {
    terminate GVAR(backgroundCalculation);
};

private ["_movingAzimuth", "_posTarget", "_velocityTarget"];

// MOVING TARGETS
_movingAzimuth = 0;
if (ACE_time - GVAR(ACE_time) > 1 and GVAR(ACE_time) != -1 and count _this < 3) then {
    // calculate speed of target
    _posTarget = [
        (getPos _vehicle select 0) + _distance * (_weaponDirection select 0),
        (getPos _vehicle select 1) + _distance * (_weaponDirection select 1),
        (getPos _vehicle select 2) + _distance * (_weaponDirection select 2)
    ];
    _velocityTarget = [
        ((_posTarget select 0) - (GVAR(position) select 0)) / (ACE_time - GVAR(ACE_time)),
        ((_posTarget select 1) - (GVAR(position) select 1)) / (ACE_time - GVAR(ACE_time)),
        ((_posTarget select 2) - (GVAR(position) select 2)) / (ACE_time - GVAR(ACE_time))
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
            } forEach _muzzles;
            if (_magazine in _weaponMagazines) exitWith {
                _initSpeedCoef = getNumber(configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
                if (_initSpeedCoef < 0) then {
                    _initSpeed = _initSpeed * -_initSpeedCoef;
                };
                if (_initSpeedCoef > 0) then {
                    _initSpeed = _initSpeedCoef;
                };
            };
        } forEach _weapons;
        
        _offset = "ace_fcs" callExtension format ["%1,%2,%3,%4", _initSpeed, _airFriction, _angleTarget, _distance];
        _offset = parseNumber _offset;

        _FCSMagazines = _FCSMagazines + [_magazine];
        _FCSElevation = _FCSElevation + [_offset];
    };
} forEach _magazines;

[_vehicle, format ["%1_%2", QGVAR(Distance), _turret],      _distance] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Magazines), _turret], _FCSMagazines] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Elevation), _turret], _FCSElevation] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Azimuth), _turret],     _FCSAzimuth] call EFUNC(common,setVariablePublic);

_showHint = false;
if( (count _this) > 3) then {
    _showHint = _this select 3;
};

_playSound = true;
if( (count _this) > 3) then {
    _playSound = _this select 4;
};

if(_playSound) then {
    playSound "ACE_Sound_Click";
};

if(_showHint) then {
    [format ["%1: %2", localize "STR_ACE_FCS_ZeroedTo", _distance]] call EFUNC(common,displayTextStructured);
};
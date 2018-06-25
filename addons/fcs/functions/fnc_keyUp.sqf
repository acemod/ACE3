#include "script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Calculates the offsets for all weapons needed to hit the current target.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car, [turret]] call ace_fcs_fnc_keyUp
 *
 * Public: No
 */

params ["_vehicle", "_turret", "_distance", ["_showHint", false], ["_playSound", true]];
TRACE_5("params",_vehicle,_turret,_distance,_showHint,_playSound);

private _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);

if (isNil "_distance") then {
    _distance = [
        getNumber (_turretConfig >> QGVAR(DistanceInterval)),
        getNumber (_turretConfig >> QGVAR(MaxDistance)),
        getNumber (_turretConfig >> QGVAR(MinDistance))
    ] call FUNC(getRange);
} else {
    ((uiNamespace getVariable ["ACE_dlgRangefinder", displayNull]) displayCtrl 1713151) ctrlSetText ([_distance, 4, 0] call CBA_fnc_formatNumber);
};

// MOVING TARGETS
private _weapon = _vehicle currentWeaponTurret _turret;
private _weaponDirection = _vehicle weaponDirection _weapon; // @todo doesn't work for sub turrets

if (_turret isEqualTo ([_vehicle] call EFUNC(common,getTurretCommander))) then {
    _weaponDirection = eyeDirection _vehicle;
};

if (_weaponDirection isEqualTo [0,0,0]) then {  // dummy value for non main turrets
    _weaponDirection = [1,0,0];
};

private _angleTarget = asin (_weaponDirection select 2);

private _movingAzimuth = 0;

if (CBA_missionTime - GVAR(time) > 1 && GVAR(time) != -1 && isNil {_this select 2}) then {
    // calculate speed of target
    private _posTarget = (getPosASL _vehicle) vectorAdd (_weaponDirection vectorMultiply _distance);
    private _velocityTarget = (_posTarget vectorDiff GVAR(position)) vectorMultiply (1 / (CBA_missionTime - GVAR(time)));

    // estimate time to target
    private _magazine       = _vehicle currentMagazineTurret _turret;
    private _ammo           = getText   (configFile >> "CfgMagazines" >> _magazine >> "ammo");
    private _initSpeed      = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
    private _airFriction    = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
    private _timeToLive     = getNumber (configFile >> "CfgAmmo" >> _ammo >> "timeToLive");
    private _simulationStep = getNumber (configFile >> "CfgAmmo" >> _ammo >> "simulationStep");
    private _initSpeedCoef  = getNumber (configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
    private _simulationType = getText (configFile >> "CfgAmmo" >> _ammo >> "simulation");

    // More BIS fix
    if (_simulationType == "shotBullet") then {
        if (_initSpeedCoef < 0) then {
            _initSpeed = _initSpeed * - _initSpeedCoef;
        };

        if (_initSpeedCoef > 0) then {
            _initSpeed = _initSpeedCoef;
        };
    };

    if (_simulationStep != 0) then {
        private _posX = 0;
        private _velocityX = _initSpeed;
        private _velocityY = 0;
        private _timeToTarget = 0;

        for "_i" from 1 to (floor (_timeToLive / _simulationStep) + 1) do {
            _posX = _posX + _velocityX * _simulationStep;

            if (_posX >= _distance) exitWith { // bullet passed the target
                _timeToTarget = _i * _simulationStep;
            };

            private _velocityMagnitude = sqrt (_velocityX ^ 2 + _velocityY ^ 2);

            _velocityX = _velocityX + _velocityX * _velocityMagnitude * _airFriction * _simulationStep;
            _velocityY = _velocityY + _velocityY * _velocityMagnitude * _airFriction * _simulationStep - 9.81 * _simulationStep;
        };

        // calculate offsets
        private _posArrival = _posTarget vectorAdd (_velocityTarget vectorMultiply _timeToTarget);
        private _dirArrival = (_posArrival vectorDiff getPosASL _vehicle) vectorMultiply (1 / (_posArrival vectorDistance getPosASL _vehicle));

        _movingAzimuth = ((_dirArrival select 0) atan2 (_dirArrival select 1)) - ((_weaponDirection select 0) atan2 (_weaponDirection select 1));
        _angleTarget = asin (_dirArrival select 2);
        _distance = floor (_posArrival distance (getPosASL _vehicle));
    };
};

GVAR(enabled) = false;
GVAR(time) = -1;

// CALCULATE AZIMUTH CORRECTION
private _viewDiff = _vehicle getVariable format ["%1_%2", QGVAR(ViewDiff), _turret];
private _FCSAzimuth = _movingAzimuth;

if (_viewDiff != 0) then {
    _FCSAzimuth = (atan (_distance / _viewDiff) - (abs _viewDiff / _viewDiff) * 90) + _movingAzimuth;
};

[_vehicle, format ["%1_%2", QGVAR(Azimuth),   _turret],   _FCSAzimuth] call EFUNC(common,setVariablePublic);

// CALCULATE SOLUTION
[_vehicle,_turret,_distance,_angleTarget] call FUNC(calculateSolution);

if (_playSound) then {
    playSound "ACE_Sound_Click";
};

if (_showHint) then {
    [format ["%1: %2", localize LSTRING(ZeroedTo), _distance]] call EFUNC(common,displayTextStructured);
};

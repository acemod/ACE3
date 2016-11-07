/*
 * Author: Ruthberg
 * Calculates the zero angle correction for the new zero range based on current zero range and bore height (distance between bore- and sight axis)
 *
 * Arguments:
 * 0: Zero range <NUMBER>
 * 1: Bore height <NUMBER>
 * 2: Weapon <OBJECT>
 * 3: Ammo <CLASS>
 * 4: Magazine <CLASS>
 * 5: Advanced Ballistics enabled? <BOOL>
 *
 * Return Value:
 * zeroAngleCorrection
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_oldZeroRange", "_newZeroRange", "_boreHeight"/*in cm*/, "_weapon", "_ammo", "_magazine", "_advancedBallistics"];

// Get Weapon and Ammo Configurations
private _AmmoCacheEntry = uiNamespace getVariable format[QEGVAR(advanced_ballistics,%1), _ammo];
if (isNil "_AmmoCacheEntry") then {
     _AmmoCacheEntry = _ammo call EFUNC(advanced_ballistics,readAmmoDataFromConfig);
};
private _WeaponCacheEntry = uiNamespace getVariable format[QEGVAR(advanced_ballistics,%1), _weapon];
if (isNil "_WeaponCacheEntry") then {
     _WeaponCacheEntry = _weapon call EFUNC(advanced_ballistics,readWeaponDataFromConfig);
};

_AmmoCacheEntry params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable"];
_WeaponCacheEntry params ["_barrelTwist", "_twistDirection", "_barrelLength"];

_initSpeed = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
_initSpeedCoef = getNumber(configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
if (_initSpeedCoef > 0) then {
    _initSpeed = _initSpeedCoef;
};
if (_initSpeedCoef < 0) then {
    _initSpeed = _initSpeed * (-1 * _initSpeedCoef);
};
private _vanillaZero = 0; // in degrees
{
    private _offset = [_vanillaZero, _oldZeroRange, _initSpeed, _airFriction, 1000, 0, 0, 0, 0, 0, 0,  "", false] call FUNC(calculateZeroAngle);
    _vanillaZero = _vanillaZero + _offset;
    if (_offset < 0.01) exitWith {};
} forEach [1, 2, 3];

// Standard atmosphere (optionally overwrite with ace setting)
private _temperature = 15;
private _barometricPressure = 1013.25;
private _relativeHumidity = 0.5;

if (_advancedBallistics) then {
    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,barrelLengthInfluenceEnabled), false]) then {
        private _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _initSpeed] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
        _initSpeed = _initSpeed + _barrelVelocityShift;
    };
};

private _zeroAngle = 0; // in degrees
{ 
    private _offset = [_zeroAngle, _newZeroRange, _initSpeed, _airFriction, 1000, _boreHeight, _temperature, _barometricPressure, _relativeHumidity, _ballisticCoefficients select 0, _dragModel, _atmosphereModel, _advancedBallistics] call FUNC(calculateZeroAngle);
    _zeroAngle = _zeroAngle + _offset;
    if (_offset < 0.01) exitWith {};
} forEach [1, 2, 3];

private _zeroAngleCorrection = _zeroAngle - _vanillaZero;

missionNamespace setVariable [format[QGVAR(%1_%2_%3_%4_%5_%6_%7), _oldZeroRange, _newZeroRange, _boreHeight, _weapon, _ammo, _magazine, _advancedBallistics], _zeroAngleCorrection];

_zeroAngleCorrection

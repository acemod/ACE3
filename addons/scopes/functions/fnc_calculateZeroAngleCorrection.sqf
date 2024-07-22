#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the zero angle correction for the new zero range based on current zero range and bore height (distance between bore- and sight axis)
 *
 * Arguments:
 * 0: Old Zero range <NUMBER>
 * 1: New Zero range <NUMBER>
 * 2: Bore height <NUMBER>
 * 3: Weapon <OBJECT>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Advanced Ballistics enabled? <BOOL>
 *
 * Return Value:
 * zeroAngleCorrection <NUMBER>
 *
 * Example:
 * [5, 6, 7, gun, ammo, magazine, true] call ace_scopes_fnc_calculateZeroAngleCorrection
 *
 * Public: No
 */

params ["_oldZeroRange", "_newZeroRange", "_boreHeight"/*in cm*/, "_weapon", "_ammo", "_magazine", "_advancedBallistics"];

// When FFV from vehicles currentZeroing will report 0 so just bail
if (_oldZeroRange <= 0) exitWith { 0 };

private _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
private _initSpeed = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
private _initSpeedCoef = getNumber(configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
if (_initSpeedCoef > 0) then {
    _initSpeed = _initSpeedCoef;
};
if (_initSpeedCoef < 0) then {
    _initSpeed = _initSpeed * (-1 * _initSpeedCoef);
};

private _zeroAngle = "ace_advanced_ballistics" callExtension format ["replicateVanillaZero:%1:%2:%3", _oldZeroRange, _initSpeed, _airFriction];
private _vanillaZero = parseNumber _zeroAngle;

#ifdef DISABLE_DISPERSION
    _vanillaZero = 0;
#endif

private _trueZero = if (!_advancedBallistics) then {
    _zeroAngle = "ace_advanced_ballistics" callExtension format ["calcZero:%1:%2:%3:%4", _newZeroRange, _initSpeed, _airFriction, _boreHeight];
    (parseNumber _zeroAngle)
} else {
    // Get Weapon and Ammo Configurations
    private _AmmoCacheEntry = uiNamespace getVariable format[QEGVAR(advanced_ballistics,%1), _ammo];
    if (isNil "_AmmoCacheEntry") then {
         _AmmoCacheEntry = _ammo call EFUNC(advanced_ballistics,readAmmoDataFromConfig);
    };
    private _WeaponCacheEntry = uiNamespace getVariable format[QEGVAR(advanced_ballistics,%1), _weapon];
    if (isNil "_WeaponCacheEntry") then {
         _WeaponCacheEntry = _weapon call EFUNC(advanced_ballistics,readWeaponDataFromConfig);
    };

    _AmmoCacheEntry params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocityVariationSD"];
    _WeaponCacheEntry params ["_barrelTwist", "_twistDirection", "_barrelLength"];

    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,barrelLengthInfluenceEnabled), false]) then {
        private _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _initSpeed] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
        _initSpeed = _initSpeed + _barrelVelocityShift;
    };

    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,ammoTemperatureEnabled), false]) then {
        private _ammoTemperatureVelocityShift = ([_ammoTempMuzzleVelocityShifts, GVAR(zeroReferenceTemperature)] call EFUNC(advanced_ballistics,calculateAmmoTemperatureVelocityShift));
        _initSpeed = _initSpeed + _ammoTemperatureVelocityShift;
    };

    _zeroAngle = "ace_advanced_ballistics" callExtension format ["calcZeroAB:%1:%2:%3:%4:%5:%6:%7:%8:%9", _newZeroRange, _initSpeed, _boreHeight, GVAR(zeroReferenceTemperature), GVAR(zeroReferenceBarometricPressure), GVAR(zeroReferenceHumidity), _ballisticCoefficients select 0, _dragModel, _atmosphereModel];
    (parseNumber _zeroAngle)
};

private _zeroAngleCorrection = _trueZero - _vanillaZero;

missionNamespace setVariable [format[QGVAR(%1_%2_%3_%4_%5_%6_%7), _oldZeroRange, _newZeroRange, _boreHeight, _weapon, _ammo, _magazine, _advancedBallistics], _zeroAngleCorrection];

_zeroAngleCorrection

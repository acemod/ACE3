#include "script_component.hpp"
/*
 * Author: Glowbal, Ruthberg
 *
 * Handles advanced ballistics for (BulletBase) projectiles. Called from the unified fired EH only for players.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_handleFired
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

if (!(_ammo isKindOf "BulletBase")) exitWith {};
if (!alive _projectile) exitWith {};
if (underwater _unit) exitWith {};

private _abort = !local _unit;
if (_abort) then {
    private _bulletVelocity = velocity _projectile;
    private _muzzleVelocity = vectorMagnitude _bulletVelocity;

    private _maxRange = uiNamespace getVariable format[QGVAR(maxRange_%1), _ammo];
    if (isNil "_maxRange") then {
        private _airFriction = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction");
        private _maxRange = if (_airFriction < 0) then {
            private _maxTime = ((_vanillaInitialSpeed - BULLET_TRACE_MIN_VELOCITY) / (BULLET_TRACE_MIN_VELOCITY * -_airFriction * _vanillaInitialSpeed)) max getNumber(configFile >> "CfgAmmo" >> _ammo >> "tracerEndTime");
            -ln(1 - _airFriction * _vanillaInitialSpeed * _maxTime) / _airFriction
        } else {
            _vanillaInitialSpeed * getNumber(configFile >> "CfgAmmo" >> _ammo >> "tracerEndTime")
        };
        uiNamespace setVariable [format[QGVAR(maxRange_%1), _ammo], _maxRange];
    };
    if (ACE_player distance _unit > _maxRange && {ACE_player distance ((getPosASL _unit) vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply _maxRange)) > _maxRange}) exitWith {};

    private _ammoCount = (_unit ammo _muzzle) + 1;
    private _tracersEvery = getNumber(configFile >> "CfgMagazines" >> _magazine >> "tracersEvery");
    private _lastRoundsTracer = getNumber(configFile >> "CfgMagazines" >> _magazine >> "lastRoundsTracer");
    if (_ammoCount <= _lastRoundsTracer || {_tracersEvery > 0 && {(_ammoCount - _lastRoundsTracer) % _tracersEvery == 0}}) exitWith { _abort = false };

    if (GVAR(bulletTraceEnabled) && {_muzzleVelocity > BULLET_TRACE_MIN_VELOCITY} && {cameraView == "GUNNER"}) then {
        if (currentWeapon ACE_player == binocular ACE_player) exitWith { _abort = false };
        if (currentWeapon ACE_player == primaryWeapon ACE_player && {count primaryWeaponItems ACE_player > 2}) then {
            private _opticsName = (primaryWeaponItems ACE_player) select 2;
            private _opticType = getNumber(configFile >> "CfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            if (_opticType == 2) exitWith { _abort = false };
        };
    };
};
if (_abort) exitWith {};

// Get Weapon and Ammo Configurations
private _AmmoCacheEntry = uiNamespace getVariable format[QGVAR(%1), _ammo];
if (isNil "_AmmoCacheEntry") then {
     _AmmoCacheEntry = _ammo call FUNC(readAmmoDataFromConfig);
};
private _WeaponCacheEntry = uiNamespace getVariable format[QGVAR(%1), _weapon];
if (isNil "_WeaponCacheEntry") then {
     _WeaponCacheEntry = _weapon call FUNC(readWeaponDataFromConfig);
};

_AmmoCacheEntry params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocityVariationSD"];
_WeaponCacheEntry params ["_barrelTwist", "_twistDirection", "_barrelLength"];

private _temperature = nil; // We need the variable in this scope. So we need to init it here.

private _ammoCount = _unit ammo _muzzle;
private _bulletVelocity = velocity _projectile;
private _muzzleVelocity = vectorMagnitude _bulletVelocity;

if (GVAR(barrelLengthInfluenceEnabled)) then {
    _muzzleVelocity = _muzzleVelocity + ([_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _muzzleVelocity] call FUNC(calculateBarrelLengthVelocityShift));
};
if (GVAR(ammoTemperatureEnabled)) then {
    _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    _muzzleVelocity = _muzzleVelocity + ([_ammoTempMuzzleVelocityShifts, _temperature] call FUNC(calculateAmmoTemperatureVelocityShift));
};
if (GVAR(muzzleVelocityVariationEnabled)) then {
    private _time = round (CBA_missionTime / 2);
    // Generate seed from publicly known values (via Cantor pairing function)
    private _seed = 0.5 * (_time + _ammoCount) * (_time + _ammoCount + 1) + _ammoCount;
    // Generate normally distributed random number (via Box–Muller transform)
    private _z = sqrt(-2.0 * ln(0.00000001 max (-_seed random 1))) * cos(_seed random 360);

    _muzzleVelocity = _muzzleVelocity * (_z * _muzzleVelocityVariationSD + 1);
};

_bulletVelocity = (vectorNormalized _bulletVelocity) vectorMultiply _muzzleVelocity;
_projectile setVelocity _bulletVelocity;

private _bulletTraceVisible = false;
if (GVAR(bulletTraceEnabled) && {_muzzleVelocity > BULLET_TRACE_MIN_VELOCITY} && {cameraView == "GUNNER"}) then {
    if (currentWeapon ACE_player == binocular ACE_player) then {
        _bulletTraceVisible = true;
    } else {
        if (currentWeapon ACE_player == primaryWeapon ACE_player && count primaryWeaponItems ACE_player > 2) then {
            private _opticsName = (primaryWeaponItems ACE_player) select 2;
            private _opticType = getNumber(configFile >> "CfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            _bulletTraceVisible = _opticType == 2;
        };
    };
};

private _stabilityFactor = 1.5;
if (_caliber * _bulletLength * _bulletMass * _barrelTwist > 0) then {
    if (isNil "_temperature") then {
        _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    };
    private _barometricPressure = ((getPosASL _projectile) select 2) call EFUNC(weather,calculateBarometricPressure);
    _stabilityFactor = [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call FUNC(calculateStabilityFactor);
};

GVAR(currentbulletID) = (GVAR(currentbulletID) + 1) % 10000;

"ace_advanced_ballistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", GVAR(currentbulletID), _ammoCount, _airFriction, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _stabilityFactor, _twistDirection, _transonicStabilityCoef, getPosASL _projectile, _bulletVelocity, EGVAR(common,mapLatitude), EGVAR(weather,currentTemperature), EGVAR(common,mapAltitude), EGVAR(weather,currentHumidity), EGVAR(weather,currentOvercast), CBA_missionTime toFixed 6];

GVAR(allBullets) pushBack [_projectile, _caliber, _bulletTraceVisible, GVAR(currentbulletID)];

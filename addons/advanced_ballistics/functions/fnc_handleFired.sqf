/*
 * Author: Glowbal, Ruthberg
 *
 * Handles advanced ballistics for (BulletBase) projectiles
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

// Early Quiting
if (!hasInterface) exitWith {};
if (!GVAR(enabled)) exitWith {};

// Parameterization
private ["_abort", "_AmmoCacheEntry", "_WeaponCacheEntry", "_opticsName", "_opticType", "_bulletTraceVisible", "_temperature", "_barometricPressure", "_bulletMass", "_bulletLength", "_muzzleVelocity", "_muzzleVelocityShift", "_bulletVelocity", "_bulletLength", "_barrelTwist", "_stabilityFactor", "_aceTimeSecond", "_barrelVelocityShift", "_ammoTemperatureVelocityShift"];

params ["_unit", "_weapon", "", "_mode", "_ammo", "_magazine", "_bullet"];

_abort = false;

if (!(_ammo isKindOf "BulletBase")) exitWith {};
if (!alive _bullet) exitWith {};
if (!([_unit] call EFUNC(common,isPlayer))) exitWith {};
if (_unit distance ACE_player > GVAR(simulationRadius)) exitWith {};
if (underwater _unit) exitWith {};
if (!GVAR(simulateForEveryone) && !(local _unit)) then {
    // The shooter is non local
    _abort = true;
    if (GVAR(simulateForSnipers)) then {
        if (currentWeapon _unit == primaryWeapon _unit && count primaryWeaponItems _unit > 2) then {
            _opticsName = (primaryWeaponItems _unit) select 2;
            _opticType = getNumber(configFile >> "CfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            _abort = _opticType != 2; // We only abort if the non local shooter is not a sniper
        };
    };
    if (GVAR(simulateForGroupMembers) && _abort) then {
        _abort = (group ACE_player) != (group _unit);
    };
};
//if (!GVAR(vehicleGunnerEnabled) && !(_unit isKindOf "Man")) then { _abort = true; }; // We currently do not have firedEHs on vehicles
if (GVAR(disabledInFullAutoMode) && getNumber(configFile >> "CfgWeapons" >> _weapon >> _mode >> "autoFire") == 1) then { _abort = true; };

if (_abort || !(GVAR(extensionAvailable))) exitWith {
    if (missionNamespace getVariable [QEGVAR(windDeflection,enabled), false]) then {
        EGVAR(windDeflection,trackedBullets) pushBack [_bullet, getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction")];
    };
};

// Get Weapon and Ammo Configurations
_AmmoCacheEntry = uiNamespace getVariable format[QGVAR(%1), _ammo];
if (isNil "_AmmoCacheEntry") then {
     _AmmoCacheEntry = _ammo call FUNC(readAmmoDataFromConfig);
};
_WeaponCacheEntry = uiNamespace getVariable format[QGVAR(%1), _weapon];
if (isNil "_WeaponCacheEntry") then {
     _WeaponCacheEntry = _weapon call FUNC(readWeaponDataFromConfig);
};

_AmmoCacheEntry params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable"];
_WeaponCacheEntry params ["_barrelTwist", "_twistDirection", "_barrelLength"];


_bulletVelocity = velocity _bullet;
_muzzleVelocity = vectorMagnitude _bulletVelocity;

_barrelVelocityShift = 0;
if (GVAR(barrelLengthInfluenceEnabled)) then {
    _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _muzzleVelocity] call FUNC(calculateBarrelLengthVelocityShift);
};

_ammoTemperatureVelocityShift = 0;
if (GVAR(ammoTemperatureEnabled)) then {
    _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    _ammoTemperatureVelocityShift = ([_ammoTempMuzzleVelocityShifts, _temperature] call FUNC(calculateAmmoTemperatureVelocityShift));
};

if (GVAR(ammoTemperatureEnabled) || GVAR(barrelLengthInfluenceEnabled)) then {
    _muzzleVelocityShift = _barrelVelocityShift + _ammoTemperatureVelocityShift;
    TRACE_4("shift",_muzzleVelocity,_muzzleVelocityShift, _barrelVelocityShift, _ammoTemperatureVelocityShift);
    if (_muzzleVelocityShift != 0) then {
        _muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
        _bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift));
        _bullet setVelocity _bulletVelocity;
    };
};

_bulletTraceVisible = false;
if (GVAR(bulletTraceEnabled) && cameraView == "GUNNER") then {
    if (currentWeapon ACE_player in ["ACE_Vector", "Binocular", "Rangefinder", "Laserdesignator"]) then {
        _bulletTraceVisible = true;
    } else {
        if (currentWeapon ACE_player == primaryWeapon ACE_player && count primaryWeaponItems ACE_player > 2) then {
            _opticsName = (primaryWeaponItems ACE_player) select 2;
            _opticType = getNumber(configFile >> "CfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            _bulletTraceVisible = _opticType == 2;
        };
    };
};

_stabilityFactor = 1.5;
if (_caliber > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
    if (isNil "_temperature") then {
        _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    };
    _barometricPressure = ((getPosASL _bullet) select 2) call EFUNC(weather,calculateBarometricPressure);
    _stabilityFactor = [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call FUNC(calculateStabilityFactor);
};

GVAR(currentbulletID) = (GVAR(currentbulletID) + 1) % 10000;

_aceTimeSecond = floor ACE_time;
"ace_advanced_ballistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", GVAR(currentbulletID), _airFriction, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _stabilityFactor, _twistDirection, _muzzleVelocity, _transonicStabilityCoef, getPosASL _bullet, EGVAR(common,mapLatitude), EGVAR(weather,currentTemperature), EGVAR(common,mapAltitude), EGVAR(weather,currentHumidity), overcast, _aceTimeSecond, ACE_time - _aceTimeSecond];

GVAR(allBullets) pushBack [_bullet, _caliber, _bulletTraceVisible, GVAR(currentbulletID)];

if (isNil QGVAR(BulletPFH)) then {
    GVAR(BulletPFH) = [FUNC(handleFirePFH), GVAR(simulationInterval), []] call CBA_fnc_addPerFrameHandler;
};

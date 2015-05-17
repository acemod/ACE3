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
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_weapon", "_mode", "_ammo", "_magazine", "_caliber", "_bullet", "_abort", "_AmmoCacheEntry", "_WeaponCacheEntry", "_opticsName", "_opticType", "_bulletTraceVisible", "_temperature", "_barometricPressure", "_bulletMass", "_bulletLength", "_muzzleVelocity", "_muzzleVelocityShift", "_bulletVelocity", "_bulletSpeed", "_bulletLength", "_barrelTwist", "_stabilityFactor"];
_unit     = _this select 0;
_weapon   = _this select 1;
_mode     = _this select 3;
_ammo     = _this select 4;
_magazine = _this select 5;
_bullet   = _this select 6;

_abort = false;
if (!hasInterface) exitWith {};
if (!alive _bullet) exitWith {};
if (!GVAR(enabled)) exitWith {};
if (!([_unit] call EFUNC(common,isPlayer))) exitWith {};
if (underwater _unit) exitWith {};
if (!(_ammo isKindOf "BulletBase")) exitWith {};
if (_unit distance ACE_player > GVAR(simulationRadius)) exitWith {};
if (GVAR(onlyActiveForLocalPlayers) && !(local _unit)) then {
    if (GVAR(alwaysSimulateForSnipers)) then {
        // The shooter is non local
        if (currentWeapon _unit == primaryWeapon _unit && count primaryWeaponItems _unit > 2) then {
            _opticsName = (primaryWeaponItems _unit) select 2;
            _opticType = getNumber(configFile >> "CfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            _abort = _opticType != 2; // We only abort if the non local shooter is not a sniper
        };
    } else {
        _abort = true;
    };
};
//if (!GVAR(vehicleGunnerEnabled) && !(_unit isKindOf "Man")) then { _abort = true; }; // We currently do not have firedEHs on vehicles
if (GVAR(disabledInFullAutoMode) && getNumber(configFile >> "CfgWeapons" >> _weapon >> _mode >> "autoFire") == 1) then { _abort = true; };

if (_abort || !(GVAR(extensionAvailable))) exitWith {
    [_bullet, getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction")] call EFUNC(winddeflection,updateTrajectoryPFH);
};

_AmmoCacheEntry = uiNamespace getVariable format[QGVAR(%1), _ammo];
if (isNil {_AmmoCacheEntry}) then {
     _AmmoCacheEntry = _ammo call FUNC(readAmmoDataFromConfig);
};
_WeaponCacheEntry = uiNamespace getVariable format[QGVAR(%1), _weapon];
if (isNil {_WeaponCacheEntry}) then {
     _WeaponCacheEntry = _weapon call FUNC(readWeaponDataFromConfig);
};

_bulletVelocity = velocity _bullet;
_muzzleVelocity = vectorMagnitude _bulletVelocity;

if (GVAR(barrelLengthInfluenceEnabled)) then {
    _muzzleVelocityShift = [_WeaponCacheEntry select 2, _AmmoCacheEntry select 10, _AmmoCacheEntry select 11, _muzzleVelocity] call FUNC(calculateBarrelLengthVelocityShift);
    if (_muzzleVelocityShift != 0) then {
        _bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift));
        _bullet setVelocity _bulletVelocity;
        _muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
    };
};

if (GVAR(ammoTemperatureEnabled)) then {
    _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    _muzzleVelocityShift = [_AmmoCacheEntry select 9, _temperature] call FUNC(calculateAmmoTemperatureVelocityShift);
    if (_muzzleVelocityShift != 0) then {
        _bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift));
        _bullet setVelocity _bulletVelocity;
        _muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
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

_caliber = _AmmoCacheEntry select 1;
_bulletLength = _AmmoCacheEntry select 2;
_bulletMass = _AmmoCacheEntry select 3;
_barrelTwist = _WeaponCacheEntry select 0;
_stabilityFactor = 1.5;

if (_caliber > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
    _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    _barometricPressure = ((getPosASL _bullet) select 2) call EFUNC(weather,calculateBarometricPressure);
    _stabilityFactor = [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call FUNC(calculateStabilityFactor);
};

GVAR(currentbulletID) = (GVAR(currentbulletID) + 1) % 10000;

"ace_advanced_ballistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", GVAR(currentbulletID), _AmmoCacheEntry select 0, _AmmoCacheEntry select 6, _AmmoCacheEntry select 7, _AmmoCacheEntry select 8, _AmmoCacheEntry select 5, _stabilityFactor, _WeaponCacheEntry select 1, _muzzleVelocity, _AmmoCacheEntry select 4, getPosASL _bullet, EGVAR(weather,Latitude), EGVAR(weather,currentTemperature), EGVAR(weather,Altitude), EGVAR(weather,currentHumidity), overcast, floor(time), time - floor(time)];

[{
    private ["_args", "_index", "_bullet", "_caliber", "_bulletTraceVisible", "_bulletVelocity", "_bulletPosition"];
    _args = _this select 0;
    _bullet = _args select 0;
    _caliber = _args select 1;
    _bulletTraceVisible = _args select 2;
    _index = _args select 3;
    
    _bulletVelocity = velocity _bullet;
    _bulletPosition = getPosASL _bullet;
    
    _bulletSpeed = vectorMagnitude _bulletVelocity;
    
    if (!alive _bullet || _bulletSpeed < 100) exitWith {
        [_this select 1] call cba_fnc_removePerFrameHandler;
    };
    
    if (_bulletTraceVisible && _bulletSpeed > 600) then {
        drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[sqrt(0.006*_caliber),sqrt(0.003*_caliber)],[[0,0,0,0.6],[0,0,0,0.4]],[1,0],0,0,"","",""];
    };

    call compile ("ace_advanced_ballistics" callExtension format["simulate:%1:%2:%3:%4:%5:%6:%7", _index, _bulletVelocity, _bulletPosition, ACE_wind, ASLToATL(_bulletPosition) select 2, floor(time), time - floor(time)]);

}, GVAR(simulationInterval), [_bullet, _caliber, _bulletTraceVisible, GVAR(currentbulletID)]] call CBA_fnc_addPerFrameHandler;

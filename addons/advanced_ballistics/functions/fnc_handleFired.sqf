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

private ["_unit", "_weapon", "_mode", "_ammo", "_magazine", "_caliber", "_bullet", "_abort", "_index", "_opticsName", "_opticType", "_bulletTraceVisible", "_temperature", "_barometricPressure", "_atmosphereModel", "_bulletMass", "_bulletLength", "_airFriction", "_dragModel", "_muzzleVelocity", "_muzzleVelocityShift", "_bulletVelocity", "_bulletSpeed", "_bulletLength", "_barrelTwist", "_twistDirection", "_stabilityFactor", "_transonicStabilityCoef", "_ballisticCoefficients", "_velocityBoundaries"];
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
            _opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            _abort = _opticType != 2; // We only abort if the non local shooter is not a sniper
        };
    } else {
        _abort = true;
    };
};
//if (!GVAR(vehicleGunnerEnabled) && !(_unit isKindOf "Man")) then { _abort = true; }; // We currently do not have firedEHs on vehicles
if (GVAR(disabledInFullAutoMode) && getNumber(configFile >> "cfgWeapons" >> _weapon >> _mode >> "autoFire") == 1) then { _abort = true; };

if (_abort || !(GVAR(extensionAvailable))) exitWith {
    [_bullet, getNumber(configFile >> "cfgAmmo" >> _ammo >> "airFriction")] call EFUNC(winddeflection,updateTrajectoryPFH);
};

_airFriction = getNumber(configFile >> "cfgAmmo" >> _ammo >> "airFriction");

_bulletVelocity = velocity _bullet;
_muzzleVelocity = vectorMagnitude _bulletVelocity;

if (GVAR(barrelLengthInfluenceEnabled)) then {
    _muzzleVelocityShift = [_ammo, _weapon, _muzzleVelocity] call FUNC(calculateBarrelLengthVelocityShift);
    if (_muzzleVelocityShift != 0) then {
        _bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift));
        _bullet setVelocity _bulletVelocity;
        _muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
    };
};

if (GVAR(ammoTemperatureEnabled)) then {
    _temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
    _muzzleVelocityShift = [_ammo, _temperature] call FUNC(calculateAmmoTemperatureVelocityShift);
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
            _opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
            _bulletTraceVisible = _opticType == 2;
        };
    };
};

_caliber = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_caliber");
_bulletLength = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_bulletLength");
_bulletMass = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_bulletMass");
_barrelTwist = getNumber(configFile >> "cfgWeapons" >> _weapon >> "ACE_barrelTwist");
_stabilityFactor = 1.5;

if (_caliber > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
    _temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
    _barometricPressure = ((getPosASL _bullet) select 2) call EFUNC(weather,calculateBarometricPressure);
    _stabilityFactor = [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call FUNC(calculateStabilityFactor);
};

_twistDirection = 1;
if (isNumber(configFile >> "cfgWeapons" >> _weapon >> "ACE_twistDirection")) then {
    _twistDirection = getNumber(configFile >> "cfgWeapons" >> _weapon >> "ACE_twistDirection");
    if (_twistDirection != -1 && _twistDirection != 0 &&  _twistDirection != 1) then {
        _twistDirection = 1;
    };
};

_transonicStabilityCoef = 0.5;
if (isNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_transonicStabilityCoef")) then {
    _transonicStabilityCoef = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_transonicStabilityCoef");
};

_dragModel = 1;
_ballisticCoefficients = [];
_velocityBoundaries = [];
_atmosphereModel = "ICAO";
if (isNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_dragModel")) then {
    _dragModel = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_dragModel");
    if (!(_dragModel in [1, 2, 5, 6, 7, 8])) then {
        _dragModel = 1;
    };
};
if (isArray(configFile >> "cfgAmmo" >> _ammo >> "ACE_ballisticCoefficients")) then {
    _ballisticCoefficients = getArray(configFile >> "cfgAmmo" >> _ammo >> "ACE_ballisticCoefficients");
};
if (isArray(configFile >> "cfgAmmo" >> _ammo >> "ACE_velocityBoundaries")) then {
    _velocityBoundaries = getArray(configFile >> "cfgAmmo" >> _ammo >> "ACE_velocityBoundaries");
};
if (isText(configFile >> "cfgAmmo" >> _ammo >> "ACE_standardAtmosphere")) then {
    _atmosphereModel = getText(configFile >> "cfgAmmo" >> _ammo >> "ACE_standardAtmosphere");
};

GVAR(currentbulletID) = (GVAR(currentbulletID) + 1) % 10000;

"ace_advanced_ballistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", GVAR(currentbulletID), _airFriction, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _stabilityFactor, _twistDirection, _muzzleVelocity, _transonicStabilityCoef, getPosASL _bullet, EGVAR(weather,Latitude), EGVAR(weather,currentTemperature), EGVAR(weather,Altitude), EGVAR(weather,currentHumidity), overcast, floor(time), time - floor(time)];

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
        drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[0.0157480315*_caliber,0.00787401574*_caliber],[[0,0,0,0.6],[0,0,0,0.4]],[1,0],0,0,"","",""];
    };

    call compile ("ace_advanced_ballistics" callExtension format["simulate:%1:%2:%3:%4:%5:%6:%7", _index, _bulletVelocity, _bulletPosition, ACE_wind, ASLToATL(_bulletPosition) select 2, floor(time), time - floor(time)]);

}, GVAR(simulationInterval), [_bullet, _caliber, _bulletTraceVisible, GVAR(currentbulletID)]] call CBA_fnc_addPerFrameHandler;

/*
 * Author: Glowbal, Ruthberg
 * Handles wind deflection for projectiles using the advanced ballistics dll extension.
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
 * Example:
 * [clientFiredBIS-XEH] call ace_winddeflection_fnc_handleFired
 *
 * Public: No
 */
#include "script_component.hpp"
#include "definesh.h"

private ["_unit", "_weapon", "_mode", "_ammo", "_magazine", "_caliber", "_bullet", "_index", "_opticsName", "_opticType", "_bulletTraceVisible", "_temperature", "_barometricPressure", "_atmosphereModel", "_bulletMass", "_bulletLength", "_bulletTranslation", "_airFriction", "_dragModel", "_velocityBoundaryData", "_muzzleVelocity", "_muzzleVelocityCoef", "_muzzleVelocityShift", "_bulletVelocity", "_bulletSpeed", "_bulletLength", "_bulletWeight", "_barrelTwist", "_twistDirection", "_stabilityFactor", "_transonicStabilityCoef", "_ACE_Elevation", "_ACE_Windage", "_ID"];
_unit     = _this select 0;
_weapon   = _this select 1;
_mode     = _this select 3;
_ammo     = _this select 4;
_magazine = _this select 5;
_bullet   = _this select 6;

if (isDedicated) exitWith {};
if (!alive _bullet) exitWith {};
if (!(isPlayer _unit)) exitWith {};
if (underwater _unit) exitWith {};
if (!(_ammo isKindOf "BulletBase")) exitWith {};
if (_unit distanceSqr ACE_player > 9000000) exitWith {};
if (GVAR(ONLY_ACTIVE_FOR_LOCAL_PLAYER) && _unit != ACE_player) exitWith {};
if (!GVAR(VehicleGunnerEnabled) && !(_unit isKindOf "Man")) exitWith {};
if (GVAR(DISABLED_IN_FULL_AUTO_MODE) && getNumber(configFile >> "cfgWeapons" >> _weapon >> _mode >> "autoFire") == 1) exitWith {};

_airFriction = getNumber(configFile >> "cfgAmmo" >> _ammo >> "airFriction");
_muzzleVelocity = getNumber(configFile >> "cfgMagazines" >> _magazine >> "initSpeed");
_muzzleVelocityCoef = getNumber(configFile >> "cfgWeapons" >> _weapon >> "initSpeed");
if (_muzzleVelocityCoef > 0) then {
	_muzzleVelocity = _muzzleVelocityCoef;
};
if (_muzzleVelocityCoef < 0) then {
	_muzzleVelocity = _muzzleVelocity * (-1 * _muzzleVelocityCoef);
};

_muzzleAccessory = (primaryWeaponItems _unit) select 0;
if (_muzzleAccessory != "" && isNumber(configFile >> "cfgWeapons" >> _muzzleAccessory >> "ItemInfo" >> "MagazineCoef" >> "initSpeed")) then {
	_initSpeedCoef = getNumber(configFile >> "cfgWeapons" >> _muzzleAccessory >> "ItemInfo" >> "MagazineCoef" >> "initSpeed");
	_muzzleVelocity = _muzzleVelocity * _initSpeedCoef;
};

if (GVAR(BarrelLengthInfluenceEnabled)) then {
	_muzzleVelocityShift = [_ammo, _weapon, _muzzleVelocity] call FUNC(calculateBarrelLengthVelocityShift);
	if (_muzzleVelocityShift != 0) then {
		_bulletVelocity = velocity _bullet;
		_bulletSpeed = vectorMagnitude _bulletVelocity;
		_bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift * (_bulletSpeed / _muzzleVelocity)));
		_bullet setVelocity _bulletVelocity;
		_muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
	};
};

if (GVAR(AmmoTemperatureEnabled)) then {
	_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
	_muzzleVelocityShift = [_ammo, _temperature] call FUNC(calculateAmmoTemperatureVelocityShift);
	if (_muzzleVelocityShift != 0) then {
		_bulletVelocity = velocity _bullet;
		_bulletSpeed = vectorMagnitude _bulletVelocity;
		_bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift * (_bulletSpeed / _muzzleVelocity)));
		_bullet setVelocity _bulletVelocity;
		_muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
	};
};

_bulletTraceVisible = false;
if (GVAR(BulletTraceEnabled) && currentWeapon ACE_player == primaryWeapon ACE_player && count primaryWeaponItems ACE_player > 2) then {
	_opticsName = (primaryWeaponItems ACE_player) select 2;
	_opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
	_bulletTraceVisible = (_opticType == 2 || currentWeapon ACE_player in ["Binocular", "Rangefinder", "Laserdesignator"]) && cameraView == "GUNNER";
};

_caliber = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_caliber");
_bulletLength = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_bulletLength");
_bulletMass = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_bulletMass");
_barrelTwist = getNumber(configFile >> "cfgWeapons" >> _weapon >> "ACE_barrelTwist");
_stabilityFactor = 1.5;

if (_caliber > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
	_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
	_barometricPressure = 1013.25 * exp(-(GVAR(Altitude) + ((getPosASL _bullet) select 2)) / 7990) - 10 * overcast;
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
if (GVAR(AdvancedAirDragEnabled)) then {
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
};

_index = count GVAR(bulletDatabase);
if (count GVAR(bulletDatabaseFreeIndices) > 0) then {
	_index = GVAR(bulletDatabaseFreeIndices) select 0;
	GVAR(bulletDatabaseFreeIndices) = GVAR(bulletDatabaseFreeIndices) - [_index];
};

"AdvancedBallistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", _index, _airFriction, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _stabilityFactor, _twistDirection, _muzzleVelocity, _transonicStabilityCoef, getPosASL _bullet, GVAR(Latitude), EGVAR(weather, currentTemperature), GVAR(Altitude), EGVAR(weather, currentHumidity), overcast, floor(time), time - floor(time)];
GVAR(bulletDatabase) set[_index, [_bullet, _caliber, _bulletTraceVisible, _index]];

if ((GVAR(bulletDatabaseOccupiedIndices) pushBack _index) == 0) then {
	[{
		private ["_bulletDatabaseEntry", "_index", "_bullet", "_caliber", "_bulletTraceVisible", "_bulletVelocity", "_bulletPosition"];
		
		{
			_bulletDatabaseEntry = (GVAR(bulletDatabase) select _x);
			_bullet = _bulletDatabaseEntry select 0;
			_index  = _bulletDatabaseEntry select 3;
			if (!alive _bullet) then {
				GVAR(bulletDatabaseOccupiedIndices) = GVAR(bulletDatabaseOccupiedIndices) - [_index];
				GVAR(bulletDatabaseFreeIndices) pushBack _index;
			};
			true
		} count GVAR(bulletDatabaseOccupiedIndices);
		
		if (count GVAR(bulletDatabaseOccupiedIndices) == 0) exitWith {
			GVAR(bulletDatabase) = [];
			GVAR(bulletDatabaseOccupiedIndices) = [];
			GVAR(bulletDatabaseFreeIndices) = [];
			[_this select 1] call cba_fnc_removePerFrameHandler;
		};
		
		{
			_bulletDatabaseEntry = (GVAR(bulletDatabase) select _x);
			_bullet              = _bulletDatabaseEntry select 0;
			_caliber             = _bulletDatabaseEntry select 1;
			_bulletTraceVisible  = _bulletDatabaseEntry select 2;
			_index               = _bulletDatabaseEntry select 3;
			
			_bulletVelocity = velocity _bullet;
			_bulletPosition = getPosASL _bullet;
			
			if (_bulletTraceVisible && vectorMagnitude _bulletVelocity > 600) then {
				drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[0.4*_caliber,0.2*_caliber],[[0,0,0,0.6],[0,0,0,0.4]],[1,0],0,0,"","",""];
			};
			
			call compile ("AdvancedBallistics" callExtension format["simulate:%1:%2:%3:%4:%5:%6:%7", _index, _bulletVelocity, _bulletPosition, wind, ASLToATL(_bulletPosition) select 2, floor(time), time - floor(time)]);
			
			true
		} count GVAR(bulletDatabaseOccupiedIndices);
		
	}, 0, []] call CBA_fnc_addPerFrameHandler;
};

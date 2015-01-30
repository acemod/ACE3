#include "defines.h"

private ["_unit", "_weapon", "_mode", "_ammo", "_magazine", "_caliber", "_bullet", "_index", "_opticsName", "_opticType", "_bulletTraceVisible", "_temperature", "_barometricPressure", "_atmosphereModel", "_bulletMass", "_bulletLength", "_bulletTranslation", "_airFriction", "_dragModel", "_velocityBoundaryData", "_muzzleVelocity", "_muzzleVelocityShift", "_bulletVelocity", "_bulletSpeed", "_bulletLength", "_bulletWeight", "_barrelTwist", "_twistDirection", "_stabilityFactor", "_transonicStabilityCoef", "_cse_AB_Elevation", "_cse_AB_Windage", "_ID"];
_unit     = _this select 0;
_weapon   = _this select 1;
_mode     = _this select 3;
_ammo     = _this select 4;
_bullet   = _this select 5;
_magazine = _this select 6;

if (!isClass (configFile >> 'CfgPatches' >> 'CBA_main')) then {
	_bullet = _this select 6;
	_magazine = _this select 5;
};

if (isDedicated) exitWith {};
if (!alive _bullet) exitWith {};
if (!(isPlayer _unit)) exitWith {};
if (underwater _unit) exitWith {};
if (!(_ammo isKindOf "BulletBase")) exitWith {};
if (_unit distanceSqr player > 9000000) exitWith {};
if (cse_AB_OnlyActiveForLocalPlayer && !(local _unit)) exitWith {};
if (cse_AB_OnlyActiveForPlayerGroup && (group _unit != group player)) exitWith {};
if (!cse_AB_VehicleGunnerEnabled && !(_unit isKindOf "Man")) exitWith {};
if (cse_AB_DisabledInFullAutoMode && getNumber(configFile >> "cfgWeapons" >> _weapon >> _mode >> "autoFire") == 1) exitWith {};
if (!isServer && !((gunner _unit) getVariable ["cse_enabled_AdvancedBallistics", false])) exitWith {};

_airFriction = getNumber(configFile >> "cfgAmmo" >> _ammo >> "airFriction");
_muzzleVelocity = getNumber(configFile >> "cfgMagazines" >> _magazine >> "initSpeed");

_muzzleAccessory = (primaryWeaponItems _unit) select 0;
if (_muzzleAccessory != "" && isNumber(configFile >> "cfgWeapons" >> _muzzleAccessory >> "ItemInfo" >> "MagazineCoef" >> "initSpeed")) then {
	_initSpeedCoef = getNumber(configFile >> "cfgWeapons" >> _muzzleAccessory >> "ItemInfo" >> "MagazineCoef" >> "initSpeed");
	_muzzleVelocity = _muzzleVelocity * _initSpeedCoef;
};

if (cse_AB_BarrelLengthInfluenceEnabled) then {
	_muzzleVelocityShift = [_ammo, _weapon, _muzzleVelocity] call cse_ab_ballistics_fnc_barrel_length_muzzle_velocity;
	if (_muzzleVelocityShift != 0) then {
		_bulletVelocity = velocity _bullet;
		_bulletSpeed = vectorMagnitude _bulletVelocity;
		_bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift * (_bulletSpeed / _muzzleVelocity)));
		_bullet setVelocity _bulletVelocity;
		_muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
	};
};

if (cse_AB_AmmoTemperatureEnabled) then {
	_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
	_muzzleVelocityShift = [_ammo, _temperature] call cse_ab_ballistics_fnc_ammo_temperature_muzzle_velocity;
	if (_muzzleVelocityShift != 0) then {
		_bulletVelocity = velocity _bullet;
		_bulletSpeed = vectorMagnitude _bulletVelocity;
		_bulletVelocity = _bulletVelocity vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply (_muzzleVelocityShift * (_bulletSpeed / _muzzleVelocity)));
		_bullet setVelocity _bulletVelocity;
		_muzzleVelocity = _muzzleVelocity + _muzzleVelocityShift;
	};
};

_opticsName = "";
_opticType = 0;
if (currentWeapon player == primaryWeapon player && count primaryWeaponItems player > 2) then {
	_opticsName = (primaryWeaponItems player) select 2;
	_opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
};

_bulletTraceVisible = (_opticType == 2 || currentWeapon player in ["Binocular", "Rangefinder", "Laserdesignator"]) && cameraView == "GUNNER";

if (cse_AB_MilTurretsEnabled) then {
	[_bullet, _unit] call cse_ab_ballistics_fnc_apply_turret_adjustments;
};

_caliber = getNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_caliber");
_bulletLength = getNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_bulletLength");
_bulletMass = getNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_bulletMass");
_barrelTwist = getNumber(configFile >> "cfgWeapons" >> _weapon >> "AB_barrelTwist");
_stabilityFactor = 1.5;

if (_caliber > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
	_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
	_barometricPressure = 1013.25 * exp(-(cse_AB_Altitude + ((getPosASL _bullet) select 2)) / 7990) - 10 * overcast;
	_stabilityFactor = [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call cse_ab_ballistics_fnc_calculate_stability_factor;
};

_twistDirection = 1;
if (isNumber(configFile >> "cfgWeapons" >> _weapon >> "AB_twistDirection")) then {
	_twistDirection = getNumber(configFile >> "cfgWeapons" >> _weapon >> "AB_twistDirection");
	if (_twistDirection != -1 && _twistDirection != 0 &&  _twistDirection != 1) then {
		_twistDirection = 1;
	};
};

_transonicStabilityCoef = 0.5;
if (isNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_transonicStabilityCoef")) then {
	_transonicStabilityCoef = getNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_transonicStabilityCoef");
};

_dragModel = 1;
_ballisticCoefficients = [];
_velocityBoundaries = [];
_atmosphereModel = "ICAO";
if (cse_AB_AdvancedAirDragEnabled) then {
	if (isNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_dragModel")) then {
		_dragModel = getNumber(configFile >> "cfgAmmo" >> _ammo >> "AB_dragModel");
		if (!(_dragModel in [1, 2, 5, 6, 7, 8])) then {
			_dragModel = 1;
		};
	};
	if (isArray(configFile >> "cfgAmmo" >> _ammo >> "AB_ballisticCoefficients")) then {
		_ballisticCoefficients = getArray(configFile >> "cfgAmmo" >> _ammo >> "AB_ballisticCoefficients");
	};
	if (isArray(configFile >> "cfgAmmo" >> _ammo >> "AB_velocityBoundaries")) then {
		_velocityBoundaries = getArray(configFile >> "cfgAmmo" >> _ammo >> "AB_velocityBoundaries");
	};
	if (isText(configFile >> "cfgAmmo" >> _ammo >> "AB_standardAtmosphere")) then {
		_atmosphereModel = getText(configFile >> "cfgAmmo" >> _ammo >> "AB_standardAtmosphere");
	};
};

_index = count cse_AB_bulletDatabase;
if (count cse_AB_bulletDatabaseFreeIndices > 0) then {
	_index = cse_AB_bulletDatabaseFreeIndices select 0;
	cse_AB_bulletDatabaseFreeIndices = cse_AB_bulletDatabaseFreeIndices - [_index];
};

"AdvancedBallistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", _index, _airFriction, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _stabilityFactor, _twistDirection, _muzzleVelocity, _transonicStabilityCoef, getPosASL _bullet, cse_AB_Latitude, cse_AB_Temperature, cse_AB_Altitude, cse_AB_Humidity, overcast, floor(time), time - floor(time)];
cse_AB_bulletDatabase set[_index, [_bullet, _caliber, _bulletTraceVisible, _index]];

if ((cse_AB_bulletDatabaseOccupiedIndices pushBack _index) == 0) then {
	["AdvancedBallistics", "onEachFrame", {
		private ["_bulletDatabaseEntry", "_index", "_bullet", "_caliber", "_bulletTraceVisible", "_bulletVelocity", "_bulletPosition", "_bulletVelocityShift", "_bulletPositionShift"];

		{
			_bulletDatabaseEntry = (cse_AB_bulletDatabase select _x);
			_bullet = _bulletDatabaseEntry select 0;
			_index  = _bulletDatabaseEntry select 3;
			if (!alive _bullet) then {
				cse_AB_bulletDatabaseOccupiedIndices = cse_AB_bulletDatabaseOccupiedIndices - [_index];
				cse_AB_bulletDatabaseFreeIndices pushBack _index;
			};
			true
		} count cse_AB_bulletDatabaseOccupiedIndices;

		if (count cse_AB_bulletDatabaseOccupiedIndices == 0) exitWith {
			cse_AB_bulletDatabase = [];
			cse_AB_bulletDatabaseOccupiedIndices = [];
			cse_AB_bulletDatabaseFreeIndices = [];
			["AdvancedBallistics", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};

		{
			_bulletDatabaseEntry = (cse_AB_bulletDatabase select _x);
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
		} count cse_AB_bulletDatabaseOccupiedIndices;

	}] call BIS_fnc_addStackedEventHandler;
};

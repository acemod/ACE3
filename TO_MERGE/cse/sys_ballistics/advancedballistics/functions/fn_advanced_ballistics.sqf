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

_bulletTraceVisible = false;
if (cse_AB_BulletTraceEnabled && currentWeapon player == primaryWeapon player && count primaryWeaponItems player > 2) then {
	_opticsName = (primaryWeaponItems player) select 2;
	_opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
	_bulletTraceVisible = (_opticType == 2 || currentWeapon player in ["Binocular", "Rangefinder", "Laserdesignator"]) && cameraView == "GUNNER";
};

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

cse_AB_bulletDatabase          set[_index, [_bullet, _caliber, _airFriction, _muzzleVelocity, _stabilityFactor, _transonicStabilityCoef, _twistDirection, _unit, _bulletTraceVisible, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _index]];
cse_AB_bulletDatabaseStartTime set[_index, time];
cse_AB_bulletDatabaseSpeed     set[_index, 0];
cse_AB_bulletDatabaseFrames    set[_index, 1];
cse_AB_bulletDatabaseLastFrame set[_index, time];
cse_AB_bulletDatabaseHDeflect  set[_index, 0];
cse_AB_bulletDatabaseSpinDrift set[_index, 0];

if ((cse_AB_bulletDatabaseOccupiedIndices pushBack _index) == 0) then {
	["AdvancedBallistics", "onEachFrame", {
		private ["_bulletDatabaseEntry", "_bullet", "_caliber", "_muzzleVelocity", "_frames", "_speed", "_airFriction", "_airFrictionRef", "_dragModel", "_atmosphereModel", "_ballisticCoefficient", "_ballisticCoefficients", "_velocityBoundaries", "_airDensity", "_stabilityFactor", "_transonicStabilityCoef", "_twistDirection", "_unit", "_bulletTraceVisible", "_index", "_temperature", "_humidity", "_deltaT", "_TOF", "_bulletPosition", "_bulletVelocity", "_bulletSpeed", "_trueVelocity", "_trueSpeed", "_bulletSpeedAvg", "_wind", "_drag", "_dragRef", "_vect", "_accel", "_accelRef", "_centripetalAccel", "_pressure", "_pressureDeviation", "_windSourceObstacle", "_windSourceTerrain", "_height", "_roughnessLength"];

		{
			_bullet = (cse_AB_bulletDatabase select _x) select 0;
			_index  = (cse_AB_bulletDatabase select _x) select 13;
			if (!alive _bullet) then {
				cse_AB_bulletDatabaseOccupiedIndices = cse_AB_bulletDatabaseOccupiedIndices - [_index];
				cse_AB_bulletDatabaseFreeIndices pushBack _index;
			};
			true
		} count cse_AB_bulletDatabaseOccupiedIndices;

		if (count cse_AB_bulletDatabaseOccupiedIndices == 0) exitWith {
			cse_AB_bulletDatabase          = [];
			cse_AB_bulletDatabaseStartTime = [];
			cse_AB_bulletDatabaseSpeed     = [];
			cse_AB_bulletDatabaseFrames    = [];
			cse_AB_bulletDatabaseLastFrame = [];
			cse_AB_bulletDatabaseHDeflect  = [];
			cse_AB_bulletDatabaseSpinDrift = [];
			cse_AB_bulletDatabaseOccupiedIndices = [];
			cse_AB_bulletDatabaseFreeIndices = [];
			["AdvancedBallistics", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};

		{
			_bulletDatabaseEntry    = (cse_AB_bulletDatabase select _x);
			_bullet                 = _bulletDatabaseEntry select 0;
			_caliber                = _bulletDatabaseEntry select 1;
			_airFriction            = _bulletDatabaseEntry select 2;
			_muzzleVelocity         = _bulletDatabaseEntry select 3;
			_stabilityFactor        = _bulletDatabaseEntry select 4;
			_transonicStabilityCoef = _bulletDatabaseEntry select 5;
			_twistDirection         = _bulletDatabaseEntry select 6;
			_unit                   = _bulletDatabaseEntry select 7;
			_bulletTraceVisible     = _bulletDatabaseEntry select 8;
			_ballisticCoefficients  = _bulletDatabaseEntry select 9;
			_velocityBoundaries     = _bulletDatabaseEntry select 10;
			_atmosphereModel        = _bulletDatabaseEntry select 11;
			_dragModel              = _bulletDatabaseEntry select 12;
			_index                  = _bulletDatabaseEntry select 13;

			_TOF = time - (cse_AB_bulletDatabaseStartTime select _index);

			_bulletVelocity = velocity _bullet;
			_bulletPosition = getPosASL _bullet;

			_bulletSpeed = vectorMagnitude _bulletVelocity;
			_bulletDir = (_bulletVelocity select 0) atan2 (_bulletVelocity select 1);

			_speed = (cse_AB_bulletDatabaseSpeed select _index);
			cse_AB_bulletDatabaseSpeed set[_index, _speed + _bulletSpeed];

			_frames = (cse_AB_bulletDatabaseFrames select _index);
			cse_AB_bulletDatabaseFrames set[_index, _frames + 1];

			_bulletSpeedAvg = (_speed / _frames);

			if ((cse_AB_Precision < 2) || {_frames % cse_AB_Precision == _index % cse_AB_Precision}) then {
				_deltaT = time - (cse_AB_bulletDatabaseLastFrame select _index);
				cse_AB_bulletDatabaseLastFrame set[_index, time];

				_trueVelocity = _bulletVelocity;
				_trueSpeed = _bulletSpeed;
				_wind = [0, 0, 0];
				if (cse_AB_WindEnabled && (vectorMagnitude wind) > 0) then {
					_windSourceObstacle = _bulletPosition vectorDiff ((vectorNormalized wind) vectorMultiply 10);
					_windSourceTerrain = _bulletPosition vectorDiff ((vectorNormalized wind) vectorMultiply 100);

					if (!(lineIntersects [_bulletPosition, _windSourceObstacle]) && !(terrainIntersectASL [_bulletPosition, _windSourceTerrain])) then {
						_wind = wind;
						_height = ASLToATL(_bulletPosition) select 2;
						_height = 0 max _height min 20;
						if (_height < 20) then {
							_roughnessLength = _bulletPosition call cse_ab_ballistics_fnc_calculate_roughness_length;
							_wind = _wind vectorMultiply (ln(_height / _roughnessLength) / ln(20 / _roughnessLength));
						};

						_trueVelocity = _bulletVelocity vectorDiff _wind;
						_trueSpeed = vectorMagnitude _trueVelocity;
					};
				};

				_airFrictionRef = _airFriction;
				if (cse_AB_AdvancedAirDragEnabled && (count _ballisticCoefficients) == (count _velocityBoundaries) + 1) then {
					_dragRef = _deltaT * _airFrictionRef * _bulletSpeed * _bulletSpeed;
					_accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
					_bulletVelocity = _bulletVelocity vectorDiff _accelRef;

					_ballisticCoefficient = (_ballisticCoefficients select 0);
					for "_i" from (count _velocityBoundaries) - 1 to 0 step -1 do {
						if (_bulletSpeed < (_velocityBoundaries select _i)) exitWith {
							_ballisticCoefficient = (_ballisticCoefficients select (_i + 1));
						};
					};

					if (cse_AB_AtmosphericDensitySimulationEnabled) then {
						_pressure = 1013.25 * exp(-(cse_AB_Altitude + (_bulletPosition select 2)) / 7990) - 10 * overcast;
						_temperature = GET_TEMPERATURE_AT_HEIGHT(_bulletPosition select 2);
						_humidity = cse_AB_Humidity;
						if (cse_AB_Humidity < 1 && fog > 0) then {
							private ["_fogValue", "_fogDecay", "_fogBase"];
							_fogValue = fogParams select 0;
							_fogDecay = fogParams select 1;
							_fogBase = fogParams select 2;
							_fogDensity = 1 - 0.05 * (_fogDecay / _fogValue * (_height - _fogBase))^2;
							if (_fogDensity > 0) then {
								_humidity = 1;
							} else {
								_humidity = cse_AB_Humidity + (1 - cse_AB_Humidity) * (0 max (1 + _fogDensity));
							};
						};
						_airDensity = STD_AIR_DENSITY_ICAO;
						if (_humidity > 0) then {
							private ["_pSat", "_vaporPressure", "_partialPressure"];
							// Saturation vapor pressure calculated according to: http://wahiduddin.net/calc/density_algorithms.htm
							_pSat = 6.1078 * 10 ^ ((7.5 * _temperature) / (_temperature + 237.3));
							_vaporPressure = _humidity * _pSat;
							_partialPressure = (_pressure * 100)- _vaporPressure;

							_airDensity = (_partialPressure * DRY_AIR_MOLAR_MASS + _vaporPressure * WATER_VAPOR_MOLAR_MASS) / (UNIVERSAL_GAS_CONSTANT * KELVIN(_temperature));
						} else {
							_airDensity = (_pressure * 100) / (SPECIFIC_GAS_CONSTANT_DRY_AIR * KELVIN(_temperature));
						};

						if (_atmosphereModel == "ICAO") then {
							_ballisticCoefficient = (STD_AIR_DENSITY_ICAO / _airDensity) * _ballisticCoefficient;
						} else {
							_ballisticCoefficient = (STD_AIR_DENSITY_ASM / _airDensity) * _ballisticCoefficient;
						};
					};

					_drag = _deltaT * ([_dragModel, _ballisticCoefficient, _trueSpeed] call cse_ab_ballistics_fnc_calculate_retardation);
					_accel = (vectorNormalized _trueVelocity) vectorMultiply (_drag);
					_bulletVelocity = _bulletVelocity vectorDiff _accel;
				} else {
					if (cse_AB_AtmosphericDensitySimulationEnabled) then {
						_pressureDeviation = 1013.25 * exp(-(cse_AB_Altitude + (_bulletPosition select 2)) / 7990) - 1013.25 - 10 * overcast;
						_temperature = GET_TEMPERATURE_AT_HEIGHT(_bulletPosition select 2);
						_humidity = cse_AB_Humidity;
						if (cse_AB_Humidity < 1 && fog > 0) then {
							private ["_fogValue", "_fogDecay", "_fogBase"];

							_fogValue = fogParams select 0;
							_fogDecay = fogParams select 1;
							_fogBase = fogParams select 2;
							_fogDensity = 1 - 0.05 * (_fogDecay / _fogValue * (_height - _fogBase))^2;
							if (_fogDensity > 0) then {
								_humidity = 1;
							} else {
								_humidity = cse_AB_Humidity + (1 - cse_AB_Humidity) * (0 max (1 + _fogDensity));
							};
						};
						_airFriction = _airFriction + ((_temperature - 15) * 0.0000015 + _humidity * 0.0000040 + _pressureDeviation * -0.0000009);
					};

					if (_airFriction != _airFrictionRef || vectorMagnitude _wind > 0) then {
						_dragRef = _deltaT * _airFrictionRef * _bulletSpeed * _bulletSpeed;
						_accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
						_bulletVelocity = _bulletVelocity vectorDiff _accelRef;

						_drag = _deltaT * _airFriction * _trueSpeed * _trueSpeed;
						_accel = (vectorNormalized _trueVelocity) vectorMultiply (_drag);
						_bulletVelocity = _bulletVelocity vectorAdd _accel;
					};
				};

				if (cse_AB_CoriolisEnabled && _bulletSpeedAvg > 0) then {
					_horizontalDeflection = 0.0000729 * (_unit distanceSqr _bullet) * sin(cse_AB_Latitude) / _bulletSpeedAvg;
					_horizontalDeflectionPartial = _horizontalDeflection - (cse_AB_bulletDatabaseHDeflect select _index);
					cse_AB_bulletDatabaseHDeflect set[_index, _horizontalDeflection];
					_vect = [sin(_bulletDir + 90) * _horizontalDeflectionPartial, cos(_bulletDir + 90) * _horizontalDeflectionPartial, 0];

					_bulletPosition = _bulletPosition vectorAdd _vect;
				};

				if (cse_AB_EoetvoesEnabled) then {
					_centripetalAccel = 2 * 0.0000729 * (_muzzleVelocity / -32.2) * cos(cse_AB_Latitude) * sin(_bulletDir);
					_accel = [0, 0, -(_centripetalAccel * _deltaT)];

					_bulletVelocity = _bulletVelocity vectorAdd _accel;
				};

				if (cse_AB_SpinDriftEnabled) then {
					_spinDrift = _twistDirection * 0.0254 * 1.25 * (_stabilityFactor + 1.2) * _TOF ^ 1.83;
					_spinDriftPartial = _spinDrift - (cse_AB_bulletDatabaseSpinDrift select _index);
					cse_AB_bulletDatabaseSpinDrift set[_index, _spinDrift];
					_vect = [sin(_bulletDir + 90) * _spinDriftPartial, cos(_bulletDir + 90) * _spinDriftPartial, 0];

					_bulletPosition = _bulletPosition vectorAdd _vect;
				};
			};

			if (cse_AB_TransonicRegionEnabled && _transonicStabilityCoef < 1) then {
				if (_bulletSpeed < 345 && _bulletSpeedAvg > 340 && _bulletSpeed > 335) then {
					_accel = [(random 0.8) - 0.4, (random 0.8) - 0.4, (random 0.8) - 0.4];
					_accel = _accel vectorMultiply (1 - _transonicStabilityCoef);
					_bulletVelocity = _bulletVelocity vectorAdd _accel;
				};
			};

			if (_bulletTraceVisible && _bulletSpeed > 600 && _bullet distanceSqr _unit > 400) then {
				drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[0.4*_caliber,0.2*_caliber],[[0,0,0,0.6],[0,0,0,0.4]],[1,0],0,0,"","",""];
			};

			_bullet setVelocity _bulletVelocity;
			_bullet setPosASL _bulletPosition;
			true
		} count cse_AB_bulletDatabaseOccupiedIndices;

	}] call BIS_fnc_addStackedEventHandler;
};

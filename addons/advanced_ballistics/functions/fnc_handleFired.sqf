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
#include "defines.h"

private ["_unit", "_weapon", "_mode", "_ammo", "_magazine", "_caliber", "_bullet", "_index", "_opticsName", "_opticType", "_bulletTraceVisible", "_temperature", "_barometricPressure", "_atmosphereModel", "_bulletMass", "_bulletLength", "_bulletTranslation", "_airFriction", "_dragModel", "_velocityBoundaryData", "_muzzleVelocity", "_muzzleVelocityCoef", "_muzzleVelocityShift", "_bulletVelocity", "_bulletSpeed", "_bulletLength", "_bulletWeight", "_barrelTwist", "_twistDirection", "_stabilityFactor", "_transonicStabilityCoef", "_ACE_Elevation", "_ACE_Windage", "_ID"];
_unit     = _this select 0;
_weapon   = _this select 1;
_mode     = _this select 3;
_ammo     = _this select 4;
_magazine = _this select 5;
_bullet   = _this select 6;

if (isDedicated) exitWith {};
if (!alive _bullet) exitWith {};
if (!([_unit] call EFUNC(common,isPlayer))) exitWith {};
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

_muzzleAccessory = "";
switch (currentWeapon _unit) do {
    case primaryWeapon _unit: { _muzzleAccessory = (primaryWeaponItems _unit) select 0; };
    case handgunWeapon _unit: { _muzzleAccessory = (handgunItems _unit) select 0; };
};

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

// TODO: Make _bulletTraceVisible global and toggle it with events
_bulletTraceVisible = false;
if (GVAR(BulletTraceEnabled) && currentWeapon ACE_player == primaryWeapon ACE_player && count primaryWeaponItems ACE_player > 2) then {
    _opticsName = (primaryWeaponItems ACE_player) select 2;
    _opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
    _bulletTraceVisible = (_opticType == 2 || currentWeapon ACE_player in ["ACE_Vector", "Binocular", "Rangefinder", "Laserdesignator"]) && cameraView == "GUNNER";
};

_caliber = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_caliber");
_bulletLength = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_bulletLength");
_bulletMass = getNumber(configFile >> "cfgAmmo" >> _ammo >> "ACE_bulletMass");
_barrelTwist = getNumber(configFile >> "cfgWeapons" >> _weapon >> "ACE_barrelTwist");
_stabilityFactor = 1.5;

if (_caliber > 0 && _bulletLength > 0 && _bulletMass > 0 && _barrelTwist > 0) then {
    _temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL _unit) select 2);
    _barometricPressure = 1013.25 * exp(-(EGVAR(weather,Altitude) + ((getPosASL _bullet) select 2)) / 7990) - 10 * overcast;
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

#ifdef USE_ADVANCEDBALLISTICS_DLL
    "AdvancedBallistics" callExtension format["new:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", _index, _airFriction, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _stabilityFactor, _twistDirection, _muzzleVelocity, _transonicStabilityCoef, getPosASL _bullet, EGVAR(weather,Latitude), EGVAR(weather,currentTemperature), EGVAR(weather,Altitude), EGVAR(weather,currentHumidity), overcast, floor(time), time - floor(time)];
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

                call compile ("AdvancedBallistics" callExtension format["simulate:%1:%2:%3:%4:%5:%6:%7", _index, _bulletVelocity, _bulletPosition, ACE_wind, ASLToATL(_bulletPosition) select 2, floor(time), time - floor(time)]);

                true
            } count GVAR(bulletDatabaseOccupiedIndices);

        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };
#else
    GVAR(bulletDatabase)          set[_index, [_bullet, _caliber, _airFriction, _muzzleVelocity, _stabilityFactor, _transonicStabilityCoef, _twistDirection, _unit, _bulletTraceVisible, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _dragModel, _index]];
    GVAR(bulletDatabaseStartTime) set[_index, time];
    GVAR(bulletDatabaseSpeed)     set[_index, 0];
    GVAR(bulletDatabaseFrames)    set[_index, 1];
    GVAR(bulletDatabaseLastFrame) set[_index, time];
    GVAR(bulletDatabaseHDeflect)  set[_index, 0];
    GVAR(bulletDatabaseSpinDrift) set[_index, 0];

    if ((GVAR(bulletDatabaseOccupiedIndices) pushBack _index) == 0) then {
        [{
            private ["_bulletDatabaseEntry", "_bullet", "_caliber", "_muzzleVelocity", "_frames", "_speed", "_airFriction", "_airFrictionRef", "_dragModel", "_atmosphereModel", "_ballisticCoefficient", "_ballisticCoefficients", "_velocityBoundaries", "_airDensity", "_stabilityFactor", "_transonicStabilityCoef", "_twistDirection", "_unit", "_bulletTraceVisible", "_index", "_temperature", "_humidity", "_deltaT", "_TOF", "_bulletPosition", "_bulletVelocity", "_bulletSpeed", "_trueVelocity", "_trueSpeed", "_bulletSpeedAvg", "_wind", "_drag", "_dragRef", "_vect", "_accel", "_accelRef", "_centripetalAccel", "_pressure", "_pressureDeviation", "_windSourceObstacle", "_windSourceTerrain", "_height", "_roughnessLength"];

            {
                _bullet = (GVAR(bulletDatabase) select _x) select 0;
                _index  = (GVAR(bulletDatabase) select _x) select 13;
                if (!alive _bullet) then {
                    GVAR(bulletDatabaseOccupiedIndices) = GVAR(bulletDatabaseOccupiedIndices) - [_index];
                    GVAR(bulletDatabaseFreeIndices) pushBack _index;
                };
                true
            } count GVAR(bulletDatabaseOccupiedIndices);

            if (count GVAR(bulletDatabaseOccupiedIndices) == 0) exitWith {
                GVAR(bulletDatabase)          = [];
                GVAR(bulletDatabaseStartTime) = [];
                GVAR(bulletDatabaseSpeed)     = [];
                GVAR(bulletDatabaseFrames)    = [];
                GVAR(bulletDatabaseLastFrame) = [];
                GVAR(bulletDatabaseHDeflect)  = [];
                GVAR(bulletDatabaseSpinDrift) = [];
                GVAR(bulletDatabaseOccupiedIndices) = [];
                GVAR(bulletDatabaseFreeIndices) = [];
                [_this select 1] call cba_fnc_removePerFrameHandler;
            };

            {
                _bulletDatabaseEntry    = GVAR(bulletDatabase) select _x;
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

                _TOF = time - (GVAR(bulletDatabaseStartTime) select _index);

                _bulletVelocity = velocity _bullet;
                _bulletPosition = getPosASL _bullet;

                _bulletSpeed = vectorMagnitude _bulletVelocity;
                _bulletDir = (_bulletVelocity select 0) atan2 (_bulletVelocity select 1);

                _speed = (GVAR(bulletDatabaseSpeed) select _index);
                GVAR(bulletDatabaseSpeed) set[_index, _speed + _bulletSpeed];

                _frames = (GVAR(bulletDatabaseFrames) select _index);
                GVAR(bulletDatabaseFrames) set[_index, _frames + 1];

                _bulletSpeedAvg = (_speed / _frames);

                if ((GVAR(SimulationPrecision) < 2) || {_frames % GVAR(SimulationPrecision) == _index % GVAR(SimulationPrecision)}) then {
                    _deltaT = time - (GVAR(bulletDatabaseLastFrame) select _index);
                    GVAR(bulletDatabaseLastFrame) set[_index, time];

                    _trueVelocity = _bulletVelocity;
                    _trueSpeed = _bulletSpeed;
                    _wind = [0, 0, 0];
                    if (GVAR(WindEnabled) && (vectorMagnitude ACE_wind) > 0) then {
                        _windSourceObstacle = _bulletPosition vectorDiff ((vectorNormalized ACE_wind) vectorMultiply 10);
                        _windSourceTerrain = _bulletPosition vectorDiff ((vectorNormalized ACE_wind) vectorMultiply 100);

                        if (!(lineIntersects [_bulletPosition, _windSourceObstacle]) && !(terrainIntersectASL [_bulletPosition, _windSourceTerrain])) then {
                            _wind = ACE_wind;
                            _height = ASLToATL(_bulletPosition) select 2;
                            _height = 0 max _height min 20;
                            if (_height < 20) then {
                                _roughnessLength = _bulletPosition call FUNC(calculateRoughnessLength);
                                _wind = _wind vectorMultiply (ln(_height / _roughnessLength) / ln(20 / _roughnessLength));
                            };

                            _trueVelocity = _bulletVelocity vectorDiff _wind;
                            _trueSpeed = vectorMagnitude _trueVelocity;
                        };
                    };

                    _airFrictionRef = _airFriction;
                    if (GVAR(AdvancedAirDragEnabled) && (count _ballisticCoefficients) == (count _velocityBoundaries) + 1) then {
                        _dragRef = _deltaT * _airFrictionRef * _bulletSpeed * _bulletSpeed;
                        _accelRef = (vectorNormalized _bulletVelocity) vectorMultiply (_dragRef);
                        _bulletVelocity = _bulletVelocity vectorDiff _accelRef;

                        _ballisticCoefficient = (_ballisticCoefficients select 0);
                        for "_i" from (count _velocityBoundaries) - 1 to 0 step -1 do {
                            if (_bulletSpeed < (_velocityBoundaries select _i)) exitWith {
                                _ballisticCoefficient = (_ballisticCoefficients select (_i + 1));
                            };
                        };

                        if (GVAR(AtmosphericDensitySimulationEnabled)) then {
                            _pressure = 1013.25 * exp(-(EGVAR(weather,Altitude) + (_bulletPosition select 2)) / 7990) - 10 * overcast;
                            _temperature = GET_TEMPERATURE_AT_HEIGHT(_bulletPosition select 2);
                            _humidity = EGVAR(weather,currentHumidity);
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

                        _drag = _deltaT * ([_dragModel, _ballisticCoefficient, _trueSpeed] call FUNC(calculateRetardation));
                        _accel = (vectorNormalized _trueVelocity) vectorMultiply (_drag);
                        _bulletVelocity = _bulletVelocity vectorDiff _accel;
                    } else {
                        if (GVAR(AtmosphericDensitySimulationEnabled)) then {
                            _pressureDeviation = 1013.25 * exp(-(EGVAR(weather,Altitude) + (_bulletPosition select 2)) / 7990) - 1013.25 - 10 * overcast;
                            _temperature = GET_TEMPERATURE_AT_HEIGHT(_bulletPosition select 2);
                            _humidity = EGVAR(weather,currentHumidity);
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

                    if (GVAR(CoriolisEnabled) && _bulletSpeedAvg > 0) then {
                        _horizontalDeflection = 0.0000729 * (_unit distanceSqr _bullet) * sin(EGVAR(weather,Latitude)) / _bulletSpeedAvg;
                        _horizontalDeflectionPartial = _horizontalDeflection - (GVAR(bulletDatabaseHDeflect) select _index);
                        GVAR(bulletDatabaseHDeflect) set[_index, _horizontalDeflection];
                        _vect = [sin(_bulletDir + 90) * _horizontalDeflectionPartial, cos(_bulletDir + 90) * _horizontalDeflectionPartial, 0];

                        _bulletPosition = _bulletPosition vectorAdd _vect;
                    };

                    /*
                    // Negligible effect on the trajectory
                    if (GVAR(EoetvoesEnabled)) then {
                        _centripetalAccel = 2 * 0.0000729 * (_muzzleVelocity / -32.2) * cos(EGVAR(weather,Latitude)) * sin(_bulletDir);
                        _accel = [0, 0, -(_centripetalAccel * _deltaT)];

                        _bulletVelocity = _bulletVelocity vectorAdd _accel;
                    };
                    //*/

                    if (GVAR(SpinDriftEnabled)) then {
                        _spinDrift = _twistDirection * 0.0254 * 1.25 * (_stabilityFactor + 1.2) * _TOF ^ 1.83;
                        _spinDriftPartial = _spinDrift - (GVAR(bulletDatabaseSpinDrift) select _index);
                        GVAR(bulletDatabaseSpinDrift) set[_index, _spinDrift];
                        _vect = [sin(_bulletDir + 90) * _spinDriftPartial, cos(_bulletDir + 90) * _spinDriftPartial, 0];

                        _bulletPosition = _bulletPosition vectorAdd _vect;
                    };
                };

                if (GVAR(TransonicRegionEnabled) && _transonicStabilityCoef < 1) then {
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
            } count GVAR(bulletDatabaseOccupiedIndices);

        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };
#endif

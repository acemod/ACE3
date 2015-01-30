/**
 * fn_ammo_temperature_muzzle_velocity.sqf
 * @Descr: ?
 * @Author: Ruthberg
 *
 * @Arguments: [Ammo Class Name, Temperature in C]
 * @Return: [Muzzle Velocity Shift in m/s]
 * @PublicAPI: true
 */


#include "defines.h"

private ["_ammo", "_temperature", "_muzzleVelocityTable", "_muzzleVelocityShift", "_temperatureIndexA", "_temperatureIndexB", "_temperatureRatio"];
_ammo           = _this select 0;
_temperature    = _this select 1;

_muzzleVelocityTable = [];

if (isArray(configFile >> "cfgAmmo" >> _ammo >> "AB_ammoTempMuzzleVelocityShifts")) then {
	_muzzleVelocityTable = getArray(configFile >> "cfgAmmo" >> _ammo >> "AB_ammoTempMuzzleVelocityShifts");
};

if (count _muzzleVelocityTable != 11) exitWith { 0 };

_temperatureIndexA = floor((_temperature + 15) / 5);
_temperatureIndexA = 0 max _temperatureIndexA;
_temperatureIndexA = _temperatureIndexA min 10;

_temperatureIndexB = ceil((_temperature + 15) / 5);
_temperatureIndexB = 0 max _temperatureIndexB;
_temperatureIndexB = _temperatureIndexB min 10;

_temperatureRatio = ((_temperature + 15) / 5) - floor((_temperature + 15) / 5);

_muzzleVelocityShift = (_muzzleVelocityTable select _temperatureIndexA) * (1 - _temperatureRatio) + (_muzzleVelocityTable select _temperatureIndexB) * _temperatureRatio;

_muzzleVelocityShift

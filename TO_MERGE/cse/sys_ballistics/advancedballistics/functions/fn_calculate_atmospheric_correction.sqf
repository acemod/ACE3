/**
 * fn_calculate_atmospheric_correction.sqf
 * @Descr: ?
 * @Author: Ruthberg
 *
 * @Arguments: [Ballistic Coefficient, Temperature in C, Pressure in hPa, Relative Humidity as ratio in 0.0-1.0, Atm.Model = "ICAO" || "ASM"]
 * @Return: [Corrected Ballistic Coefficient]
 * @PublicAPI: true
 */


#include "defines.h"

private ["_ballisticCoefficient", "_temperature", "_pressure", "_relativeHumidity", "_atmosphereModel", "_airDensity"];
_ballisticCoefficient = _this select 0;
_temperature          = _this select 1; // in C
_pressure             = _this select 2; // in hPa
_relativeHumidity     = _this select 3; // as ratio 0-1
_atmosphereModel      = _this select 4; // "ICAO" or "ASM"

_airDensity = [_temperature, _pressure, _relativeHumidity] call cse_ab_ballistics_fnc_calculate_air_density;

if (_atmosphereModel == "ICAO") then {
	(STD_AIR_DENSITY_ICAO / _airDensity) * _ballisticCoefficient
} else {
	(STD_AIR_DENSITY_ASM / _airDensity) * _ballisticCoefficient
};

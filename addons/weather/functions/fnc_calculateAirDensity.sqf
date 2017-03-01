/*
 * Author: Ruthberg
 * Calculates the air density
 *
 * Arguments:
 * 0: temperature - degrees celsius <NUMBER>
 * 1: pressure - hPa <NUMBER>
 * 2: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * density of air - kg * m^(-3) <NUMBER>
 *
 * Example:
 * [0, 1020, 0.5] call ace_weather_fnc_calculateAirDensity
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_temperature", "_pressure", "_relativeHumidity"];

_pressure = _pressure * 100; // hPa to Pa

if (_relativeHumidity > 0) then {
    // Saturation vapor pressure calculated according to: http://wahiduddin.net/calc/density_algorithms.htm
    // 610.78 gives pressure in Pa - https://en.wikipedia.org/wiki/Density_of_air
    private _pSat = 610.78 * 10 ^ ((7.5 * _temperature) / (_temperature + 237.3));
    private _vaporPressure = _relativeHumidity * _pSat;
    private _partialPressure = _pressure - _vaporPressure;

    (_partialPressure * DRY_AIR_MOLAR_MASS + _vaporPressure * WATER_VAPOR_MOLAR_MASS) / (UNIVERSAL_GAS_CONSTANT * KELVIN(_temperature))
} else {
    _pressure / (SPECIFIC_GAS_CONSTANT_DRY_AIR * KELVIN(_temperature))
};

/*
 * Author: Ruthberg
 *
 * Calculates the air density
 *
 * Arguments:
 * 0: temperature - degrees celcius <NUMBER>
 * 1: pressure - hPa <NUMBER>
 * 2: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * 0: density of air - kg * m^(-3) <NUMBER>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_3(_temperature,_pressure,_relativeHumidity);

_pressure = _pressure * 100; // hPa to Pa

if (_relativeHumidity > 0) then {
    private ["_pSat", "_vaporPressure", "_partialPressure"];
    // Saturation vapor pressure calculated according to: http://wahiduddin.net/calc/density_algorithms.htm
    _pSat = 6.1078 * 10 ^ ((7.5 * _temperature) / (_temperature + 237.3));
    _vaporPressure = _relativeHumidity * _pSat;
    _partialPressure = _pressure - _vaporPressure;

    (_partialPressure * DRY_AIR_MOLAR_MASS + _vaporPressure * WATER_VAPOR_MOLAR_MASS) / (UNIVERSAL_GAS_CONSTANT * KELVIN(_temperature))
} else {
    _pressure / (SPECIFIC_GAS_CONSTANT_DRY_AIR * KELVIN(_temperature))
};

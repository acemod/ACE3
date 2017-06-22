/*
 * Author: Ruthberg
 *
 * Calculates the atmospherically corrected ballistic coefficient
 *
 * Arguments:
 * 0: ballistic coefficient - G1-G7 <NUMBER>
 * 1: temperature - degrees celcius <NUMBER>
 * 2: pressure - hPa <NUMBER>
 * 3: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 * 4: atmosphereModel - ICAO or ASM <STRING>
 *
 * Return Value:
 * corrected ballistic coefficient <NUMBER>
 *
 * Example:
 * [2, 5, 5, 0.5, "ASM"] call ace_advanced_ballistics_fnc_calculateAtmosphericCorrection
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_ballisticCoefficient", "_temperature"/*in C*/, "_pressure"/*in hPa*/, "_relativeHumidity"/*as ratio 0-1*/, "_atmosphereModel"/*"ICAO" or "ASM"*/];

private _airDensity = [_temperature, _pressure, _relativeHumidity] call EFUNC(weather,calculateAirDensity);

if (_atmosphereModel == "ICAO") then {
    (STD_AIR_DENSITY_ICAO / _airDensity) * _ballisticCoefficient
} else {
    (STD_AIR_DENSITY_ASM / _airDensity) * _ballisticCoefficient
};

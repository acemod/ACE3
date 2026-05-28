#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the atmospherically corrected ballistic coefficient.
 *
 * Arguments:
 * 0: Ballistic coefficient - G1-G7 <NUMBER>
 * 1: Temperature - °C <NUMBER>
 * 2: Pressure - hPa <NUMBER>
 * 3: Relative humidity - value between 0 and 1 <NUMBER>
 * 4: Atmospheric model - "ICAO" or "ASM" <STRING>
 *
 * Return Value:
 * Corrected ballistic coefficient <NUMBER>
 *
 * Example:
 * [0.151, 5, 1013.25, 0.5, "ICAO"] call ace_advanced_ballistics_fnc_calculateAtmosphericCorrection
 *
 * Public: No
 */

params ["_ballisticCoefficient", "_temperature", "_pressure", "_relativeHumidity", "_atmosphereModel"];

private _airDensity = [_temperature, _pressure, _relativeHumidity] call EFUNC(weather,calculateAirDensity);

([STD_AIR_DENSITY_ASM, STD_AIR_DENSITY_ICAO] select (_atmosphereModel == "ICAO")) / _airDensity * _ballisticCoefficient // return

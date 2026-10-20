#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates wind chill based on temperature and wind speed using the North American and UK wind chill index
 *
 * Arguments:
 * 0: Temperature in degrees Celsius <NUMBER>
 * 1: Wind speed in m/s <NUMBER>
 *
 * Return Value:
 * Wind chill temperature in degrees Celsius <NUMBER>
 *
 * Example:
 * [0, 10] call ace_weather_fnc_calculateWindChill
 *
 * Public: No
 */

// Source: https://en.wikipedia.org/wiki/Wind_chill

params ["_temperatureCelsius", "_windSpeedMS"];

// Constants for the North American and UK wind chill formula
#define WIND_CHILL_BASE_OFFSET 13.12
#define TEMP_COEFFICIENT 0.6215
#define WIND_COEFFICIENT 11.37
#define WIND_EXPONENT 0.16
#define COMBINED_COEFFICIENT 0.3965

// Threshold values
#define MAX_TEMP_FOR_WIND_CHILL 10  // Wind chill only applies below 10°C
#define MIN_WIND_SPEED_MS 1.39      // Minimum 5 km/h (1.39 m/s) for wind chill effect

if (_temperatureCelsius > MAX_TEMP_FOR_WIND_CHILL) exitWith { _temperatureCelsius };
if (_windSpeedMS < MIN_WIND_SPEED_MS) exitWith { _temperatureCelsius };

private _windSpeedKMH = _windSpeedMS * 3.6; // wind speed in km/h

// North American and UK wind chill formula:
// Twc = 13.12 + 0.6215T - 11.37(V^0.16) + 0.3965T(V^0.16)
// Where T is air temperature in °C and V is wind speed in km/h
private _windPowerTerm = _windSpeedKMH ^ WIND_EXPONENT;
private _windChill = WIND_CHILL_BASE_OFFSET + 
                     (TEMP_COEFFICIENT * _temperatureCelsius) - 
                     (WIND_COEFFICIENT * _windPowerTerm) + 
                     (COMBINED_COEFFICIENT * _temperatureCelsius * _windPowerTerm);

_windChill

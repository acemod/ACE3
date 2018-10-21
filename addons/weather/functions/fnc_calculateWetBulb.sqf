#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates wet bulb based on temperature and relative humidity
 *
 * Arguments:
 * 0: temperature - degrees celsius <NUMBER>
 * 1: pressure - hPa <NUMBER>
 * 2: relativeHumidity - value between 0.0 and 1.0 <NUMBER>
 *
 * Return Value:
 * wet bulb <NUMBER>
 *
 * Example:
 * [0, 1020, 0.5] call ace_weather_fnc_calculateWetBulb
 *
 * Public: No
 */

params ["_temperature", "_pressure", "_relativeHumidity"];

// Source: http://cosmoquest.org/forum/showthread.php?155366-Calculating-Wet-Bulb-Temperature-from-RH-amp-Dry-Bulb
private _es = 6.112 * exp((17.67 * _temperature) / (_temperature + 243.5));
private _e = _es * _relativeHumidity;
private _eDiff = _es - _e;
private _eGuessPrev = _es;
private _cTempDelta = 3.3145;
private _twGuess = _temperature;

for "_j" from 1 to 50 do {
    _twGuess = _twGuess - _cTempDelta;
    private _eguess = 6.112 * exp((17.67 * _twGuess) / (_twGuess + 243.5));
    _eguess = _eguess - (_pressure * (_temperature - _twGuess) * 0.00066 * (1 + (0.00115 * _twGuess)));
    _eDiff = _eguess - _e;
    if (abs(_eDiff) <= 0.001) exitWith {};
    _cTempDelta = _eDiff / ((_eguessprev - _eguess) / _cTempDelta);
    _eguessprev = _eguess;
};

_twGuess

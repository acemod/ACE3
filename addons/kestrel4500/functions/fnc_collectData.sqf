/*
 * Author: Ruthberg
 * Gathers the weather data for the Kestrel 4500
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_playerDir", "_windSpeed", "_crosswind", "_headwind", "_humidity", "_temperature", "_humidity", "_barometricPressure", "_altitude"];

if (isNil QGVAR(MIN) || isNil QGVAR(MAX)) then {
    _temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL ACE_player) select 2);
    _humidity = EGVAR(weather,currentHumidity);
    _barometricPressure = ((getPosASL ACE_player) select 2) call EFUNC(weather,calculateBarometricPressure);
    _altitude = EGVAR(weather,Altitude) + ((getPosASL ACE_player) select 2);
    GVAR(MIN) = [0, 0, 0, 0, _temperature, _humidity, _barometricPressure, _altitude];
    GVAR(MAX) = [0, 0, 0, 0, _temperature, _humidity, _barometricPressure, _altitude];
};

{
    GVAR(ENTRIES) set [_x, (GVAR(ENTRIES) select _x) + 1];
} forEach [0, 4, 5, 6 ,7];

// Direction
_playerDir = getDir ACE_player;
GVAR(MIN) set [0, (GVAR(MIN) select 0) min _playerDir];
GVAR(MAX) set [0, _playerDir max (GVAR(MAX) select 0)];
GVAR(TOTAL) set [0, (GVAR(TOTAL) select 0) + _playerDir];

if (GVAR(MinAvgMaxMode) == 1) then {
    {
        GVAR(ENTRIES) set [_x, (GVAR(ENTRIES) select _x) + 1];
    } forEach [1, 2, 3];

    // Wind SPD
    _windSpeed = call FUNC(measureWindSpeed);
    GVAR(MIN) set [1, (GVAR(MIN) select 1) min _windSpeed];
    GVAR(MAX) set [1, _windSpeed max (GVAR(MAX) select 1)];
    GVAR(TOTAL) set [1, (GVAR(TOTAL) select 1) + _windSpeed];

    // CROSSWIND
    _crosswind = 0;
    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        _crosswind = abs(sin(GVAR(RefHeading) - _playerDir) * _windSpeed);
    } else {
        _crosswind = abs(sin(GVAR(RefHeading)) * _windSpeed);
    };
    GVAR(MIN) set [2, (GVAR(MIN) select 2) min _crosswind];
    GVAR(MAX) set [2, _crosswind max (GVAR(MAX) select 2)];
    GVAR(TOTAL) set [2, (GVAR(TOTAL) select 2) + _crosswind];

    // HEADWIND
    _headwind = 0;
    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        _headwind = abs(cos(GVAR(RefHeading) - _playerDir) * _windSpeed);
    } else {
        _headwind = abs(cos(GVAR(RefHeading)) * _windSpeed);
    };
    GVAR(MIN) set [3, (GVAR(MIN) select 3) min _headwind];
    GVAR(MAX) set [3, _headwind max (GVAR(MAX) select 3)];
    GVAR(TOTAL) set [3, (GVAR(TOTAL) select 3) + _headwind];
};

// TEMP
_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL ACE_player) select 2);
GVAR(MIN) set [4, (GVAR(MIN) select 4) min _temperature];
GVAR(MAX) set [4, _temperature max (GVAR(MAX) select 4)];
GVAR(TOTAL) set [4, (GVAR(TOTAL) select 4) + _temperature];

// HUMIDITY
_humidity = EGVAR(weather,currentHumidity);
GVAR(MIN) set [5, (GVAR(MIN) select 5) min _humidity];
GVAR(MAX) set [5, _humidity max (GVAR(MAX) select 5)];
GVAR(TOTAL) set [5, (GVAR(TOTAL) select 5) + _humidity];

// BARO
_barometricPressure = ((getPosASL ACE_player) select 2) call EFUNC(weather,calculateBarometricPressure);
GVAR(MIN) set [6, (GVAR(MIN) select 6) min _barometricPressure];
GVAR(MAX) set [6, _barometricPressure max (GVAR(MAX) select 6)];
GVAR(TOTAL) set [6, (GVAR(TOTAL) select 6) + _barometricPressure];

// ALTITUDE
_altitude = EGVAR(weather,Altitude) + ((getPosASL ACE_player) select 2);
GVAR(MIN) set [7, (GVAR(MIN) select 7) min _altitude];
GVAR(MAX) set [7, _altitude max (GVAR(MAX) select 7)];
GVAR(TOTAL) set [7, (GVAR(TOTAL) select 7) + _altitude];
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
#include "defines.h"

private ["_playerDir", "_windSpeed", "_windDir", "_crosswind", "_headwind", "_humidity", "_temperature", "_humidity", "_barometricPressure", "_altitude"];

if (isNil QUOTE(EGVAR(advanced_ballistics,Altitude))) then {EGVAR(advanced_ballistics,Altitude) = 0};

if (isNil QUOTE(GVAR(Kestrel4500_MIN)) || isNil QUOTE(GVAR(Kestrel4500_MAX))) then {
    _temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL ACE_player) select 2);
    _humidity = EGVAR(weather,currentHumidity);
	_barometricPressure = 1013.25 * exp(-(EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2)) / 7990) - 10 * overcast;
	_altitude = EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2);
	GVAR(Kestrel4500_MIN) = [0, 0, 0, 0, _temperature, _humidity, _barometricPressure, _altitude];
	GVAR(Kestrel4500_MAX) = [0, 0, 0, 0, _temperature, _humidity, _barometricPressure, _altitude];
};

{
	GVAR(Kestrel4500_ENTRIES) set [_x, (GVAR(Kestrel4500_ENTRIES) select _x) + 1];
} forEach [0, 4, 5, 6 ,7];

// Direction
_playerDir = getDir ACE_player;
GVAR(Kestrel4500_MIN) set [0, (GVAR(Kestrel4500_MIN) select 0) min _playerDir];
GVAR(Kestrel4500_MAX) set [0, _playerDir max (GVAR(Kestrel4500_MAX) select 0)];
GVAR(Kestrel4500_TOTAL) set [0, (GVAR(Kestrel4500_TOTAL) select 0) + _playerDir];

if (GVAR(Kestrel4500_MinAvgMaxMode) == 1) then {
	{
		GVAR(Kestrel4500_ENTRIES) set [_x, (GVAR(Kestrel4500_ENTRIES) select _x) + 1];
	} forEach [1, 2, 3];
	
	// Wind SPD
	_windSpeed = vectorMagnitude ACE_wind;
	_windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);

	if (isClass (configFile >> "CfgPatches" >> "ACE_Advanced_Ballistics")) then {
		_windSpeed = (eyePos ACE_player) call EFUNC(advanced_ballistics,calculateWindSpeed);
	};

	_windSpeed = cos(_playerDir - _windDir) * _windSpeed;
	GVAR(Kestrel4500_MIN) set [1, (GVAR(Kestrel4500_MIN) select 1) min abs(_windSpeed)];
	GVAR(Kestrel4500_MAX) set [1, abs(_windSpeed) max (GVAR(Kestrel4500_MAX) select 1)];
	GVAR(Kestrel4500_TOTAL) set [1, (GVAR(Kestrel4500_TOTAL) select 1) + abs(_windSpeed)];

	// CROSSWIND
	_crosswind = abs(sin(Kestrel4500_RefHeading - _playerDir) * _windSpeed);
	GVAR(Kestrel4500_MIN) set [2, (GVAR(Kestrel4500_MIN) select 2) min _crosswind];
	GVAR(Kestrel4500_MAX) set [2, _crosswind max (GVAR(Kestrel4500_MAX) select 2)];
	GVAR(Kestrel4500_TOTAL) set [2, (GVAR(Kestrel4500_TOTAL) select 2) + _crosswind];

	// HEADWIND
	_headwind = abs(cos(Kestrel4500_RefHeading - _playerDir) * _windSpeed);
	GVAR(Kestrel4500_MIN) set [3, (GVAR(Kestrel4500_MIN) select 3) min _headwind];
	GVAR(Kestrel4500_MAX) set [3, _headwind max (GVAR(Kestrel4500_MAX) select 3)];
	GVAR(Kestrel4500_TOTAL) set [3, (GVAR(Kestrel4500_TOTAL) select 3) + _headwind];
};

// TEMP
_temperature = GET_TEMPERATURE_AT_HEIGHT((getPosASL ACE_player) select 2);
GVAR(Kestrel4500_MIN) set [4, (GVAR(Kestrel4500_MIN) select 4) min _temperature];
GVAR(Kestrel4500_MAX) set [4, _temperature max (GVAR(Kestrel4500_MAX) select 4)];
GVAR(Kestrel4500_TOTAL) set [4, (GVAR(Kestrel4500_TOTAL) select 4) + _temperature];

// HUMIDITY
_humidity = EGVAR(weather,currentHumidity);
GVAR(Kestrel4500_MIN) set [5, (GVAR(Kestrel4500_MIN) select 5) min _humidity];
GVAR(Kestrel4500_MAX) set [5, _humidity max (GVAR(Kestrel4500_MAX) select 5)];
GVAR(Kestrel4500_TOTAL) set [5, (GVAR(Kestrel4500_TOTAL) select 5) + _humidity];

// BARO
_barometricPressure = 1013.25 * exp(-(EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2)) / 7990) - 10 * overcast;
GVAR(Kestrel4500_MIN) set [6, (GVAR(Kestrel4500_MIN) select 6) min _barometricPressure];
GVAR(Kestrel4500_MAX) set [6, _barometricPressure max (GVAR(Kestrel4500_MAX) select 6)];
GVAR(Kestrel4500_TOTAL) set [6, (GVAR(Kestrel4500_TOTAL) select 6) + _barometricPressure];

// ALTITUDE
_altitude = EGVAR(advanced_ballistics,Altitude) + ((getPosASL ACE_player) select 2);
GVAR(Kestrel4500_MIN) set [7, (GVAR(Kestrel4500_MIN) select 7) min _altitude];
GVAR(Kestrel4500_MAX) set [7, _altitude max (GVAR(Kestrel4500_MAX) select 7)];
GVAR(Kestrel4500_TOTAL) set [7, (GVAR(Kestrel4500_TOTAL) select 7) + _altitude];
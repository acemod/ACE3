#include "script_component.hpp"

private ["_playerDir", "_windSpeed", "_windDir", "_crosswind", "_headwind", "_humidity", "_temperature", "_humidity", "_barometricPressure", "_altitude"];

if (isNil "cse_AB_Altitude") then {AB_Altitude = 0};
if (isNil "cse_AB_Temperature") then {AB_Temperature = 0};

if (isNil "cse_ab_Kestrel4500_MIN" || isNil "cse_ab_Kestrel4500_MAX") then {
	_temperature = 15;
	_humidity = humidity;
	if ((["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_f)) then {
		_temperature = ((getPosASL player) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
		_humidity = ((getPosASL player) select 2) call cse_ab_ballistics_fnc_get_humidity_at_height;
	};
	_barometricPressure = 1013.25 * exp(-(AB_Altitude + ((getPosASL player) select 2)) / 7990) - 10 * overcast;
	_altitude = AB_Altitude + ((getPosASL player) select 2);
	cse_ab_Kestrel4500_MIN = [0, 0, 0, 0, _temperature, _humidity, _barometricPressure, _altitude];
	cse_ab_Kestrel4500_MAX = [0, 0, 0, 0, _temperature, _humidity, _barometricPressure, _altitude];
};

{
	cse_ab_Kestrel4500_ENTRIES set [_x, (cse_ab_Kestrel4500_ENTRIES select _x) + 1];
} forEach [0, 4, 5, 6 ,7];

// Direction
_playerDir = getDir player;
cse_ab_Kestrel4500_MIN set [0, (cse_ab_Kestrel4500_MIN select 0) min _playerDir];
cse_ab_Kestrel4500_MAX set [0, _playerDir max (cse_ab_Kestrel4500_MAX select 0)];
cse_ab_Kestrel4500_TOTAL set [0, (cse_ab_Kestrel4500_TOTAL select 0) + _playerDir];

if (cse_ab_Kestrel4500_MinAvgMaxMode == 1) then {
	{
		cse_ab_Kestrel4500_ENTRIES set [_x, (cse_ab_Kestrel4500_ENTRIES select _x) + 1];
	} forEach [1, 2, 3];

	// Wind SPD
	_windSpeed = vectorMagnitude wind;
	_windDir = (wind select 0) atan2 (wind select 1);

	if (call cse_ab_Kestrel4500_fnc_hasAdvancedBallisticsEnabled) then {
		_windSpeed = (eyePos player) call cse_ab_ballistics_fnc_calculate_wind_speed;
	};

	_windSpeed = cos(_playerDir - _windDir) * _windSpeed;
	cse_ab_Kestrel4500_MIN set [1, (cse_ab_Kestrel4500_MIN select 1) min abs(_windSpeed)];
	cse_ab_Kestrel4500_MAX set [1, abs(_windSpeed) max (cse_ab_Kestrel4500_MAX select 1)];
	cse_ab_Kestrel4500_TOTAL set [1, (cse_ab_Kestrel4500_TOTAL select 1) + abs(_windSpeed)];

	// CROSSWIND
	_crosswind = abs(sin(cse_ab_Kestrel4500_RefHeading - _playerDir) * _windSpeed);
	cse_ab_Kestrel4500_MIN set [2, (cse_ab_Kestrel4500_MIN select 2) min _crosswind];
	cse_ab_Kestrel4500_MAX set [2, _crosswind max (cse_ab_Kestrel4500_MAX select 2)];
	cse_ab_Kestrel4500_TOTAL set [2, (cse_ab_Kestrel4500_TOTAL select 2) + _crosswind];

	// HEADWIND
	_headwind = abs(cos(cse_ab_Kestrel4500_RefHeading - _playerDir) * _windSpeed);
	cse_ab_Kestrel4500_MIN set [3, (cse_ab_Kestrel4500_MIN select 3) min _headwind];
	cse_ab_Kestrel4500_MAX set [3, _headwind max (cse_ab_Kestrel4500_MAX select 3)];
	cse_ab_Kestrel4500_TOTAL set [3, (cse_ab_Kestrel4500_TOTAL select 3) + _headwind];
};

// TEMP
_temperature = 15;
if ((["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_f)) then {
	_temperature = ((getPosASL player) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
};
cse_ab_Kestrel4500_MIN set [4, (cse_ab_Kestrel4500_MIN select 4) min _temperature];
cse_ab_Kestrel4500_MAX set [4, _temperature max (cse_ab_Kestrel4500_MAX select 4)];
cse_ab_Kestrel4500_TOTAL set [4, (cse_ab_Kestrel4500_TOTAL select 4) + _temperature];

// HUMIDITY
_humidity = humidity;
if ((["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_f)) then {
	_humidity = ((getPosASL player) select 2) call cse_ab_ballistics_fnc_get_humidity_at_height;
};
cse_ab_Kestrel4500_MIN set [5, (cse_ab_Kestrel4500_MIN select 5) min _humidity];
cse_ab_Kestrel4500_MAX set [5, _humidity max (cse_ab_Kestrel4500_MAX select 5)];
cse_ab_Kestrel4500_TOTAL set [5, (cse_ab_Kestrel4500_TOTAL select 5) + _humidity];

// BARO
_barometricPressure = 1013.25 * exp(-(AB_Altitude + ((getPosASL player) select 2)) / 7990) - 10 * overcast;
cse_ab_Kestrel4500_MIN set [6, (cse_ab_Kestrel4500_MIN select 6) min _barometricPressure];
cse_ab_Kestrel4500_MAX set [6, _barometricPressure max (cse_ab_Kestrel4500_MAX select 6)];
cse_ab_Kestrel4500_TOTAL set [6, (cse_ab_Kestrel4500_TOTAL select 6) + _barometricPressure];

// ALTITUDE
_altitude = AB_Altitude + ((getPosASL player) select 2);
cse_ab_Kestrel4500_MIN set [7, (cse_ab_Kestrel4500_MIN select 7) min _altitude];
cse_ab_Kestrel4500_MAX set [7, _altitude max (cse_ab_Kestrel4500_MAX select 7)];
cse_ab_Kestrel4500_TOTAL set [7, (cse_ab_Kestrel4500_TOTAL select 7) + _altitude];
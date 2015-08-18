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

private ["_playerDir", "_playerAltitude", "_temperature", "_humidity", "_barometricPressure", "_altitude", "_airDensity", "_densityAltitude", "_chill", "_heatIndex", "_dewPoint", "_wetBulb", "_fnc_updateMemory", "_windSpeed", "_crosswind", "_headwind"];
_playerDir = getDir ACE_player;
_playerAltitude = (getPosASL ACE_player) select 2;
_temperature = _playerAltitude call EFUNC(weather,calculateTemperatureAtHeight);
_humidity = EGVAR(weather,currentHumidity);
_barometricPressure = _playerAltitude call EFUNC(weather,calculateBarometricPressure);
_altitude = EGVAR(common,mapAltitude) + _playerAltitude;
_airDensity = [_temperature, _barometricPressure, _humidity] call EFUNC(weather,calculateAirDensity);
_densityAltitude = _airDensity call EFUNC(weather,calculateDensityAltitude);
_chill = [_temperature, _humidity] call EFUNC(weather,calculateWindChill);
_heatIndex = [_temperature, _humidity] call EFUNC(weather,calculateHeatIndex);
_dewPoint = [_temperature, _humidity] call EFUNC(weather,calculateDewPoint);
_wetBulb = [_temperature, _barometricPressure, _humidity] call EFUNC(weather,calculateWetBulb);

if (isNil QGVAR(MIN) || isNil QGVAR(MAX)) then {
    GVAR(MIN) = [0, _playerDir, 0, 0, 0, _temperature, _chill, _humidity, _heatIndex, _dewPoint, _wetBulb, _barometricPressure, _altitude, _densityAltitude];
    GVAR(MAX) = [0, _playerDir, 0, 0, 0, _temperature, _chill, _humidity, _heatIndex, _dewPoint, _wetBulb, _barometricPressure, _altitude, _densityAltitude];
};

{
    GVAR(ENTRIES) set [_x, (GVAR(ENTRIES) select _x) + 1];
} forEach [1, 5, 6, 7, 8, 9, 10, 11, 12, 13];

_fnc_updateMemory = {
    PARAMS_2(_slot,_value);
    GVAR(MIN)   set [_slot, (GVAR(MIN) select _slot) min _value];
    GVAR(MAX)   set [_slot, _value max (GVAR(MAX) select _slot)];
    GVAR(TOTAL) set [_slot, (GVAR(TOTAL) select _slot) + _value];
};

[0, _playerDir] call _fnc_updateMemory;

if (GVAR(MinAvgMaxMode) == 1) then {
    {
        GVAR(ENTRIES) set [_x, (GVAR(ENTRIES) select _x) + 1];
    } forEach [2, 3, 4];

    // Wind SPD
    _windSpeed = call FUNC(measureWindSpeed);
    [2, _windSpeed] call _fnc_updateMemory;

    // CROSSWIND
    _crosswind = 0;
    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        _crosswind = abs(sin(GVAR(RefHeading) - _playerDir) * _windSpeed);
    } else {
        _crosswind = abs(sin(GVAR(RefHeading)) * _windSpeed);
    };
    [3, _crosswind] call _fnc_updateMemory;

    // HEADWIND
    _headwind = 0;
    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        _headwind = cos(GVAR(RefHeading) - _playerDir) * _windSpeed;
    } else {
        _headwind = cos(GVAR(RefHeading)) * _windSpeed;
    };
    if (abs(_headwind) > abs(GVAR(MAX) select 4)) then {
        GVAR(MAX) set [4, _headwind];
    };
    if (abs(_headwind) < abs(GVAR(MIN) select 4)) then {
        GVAR(MIN) set [4, _headwind];
    };
    GVAR(TOTAL) set [4, (GVAR(TOTAL) select 4) + _headwind];
};

[5, _temperature] call _fnc_updateMemory;
[6, _chill] call _fnc_updateMemory;
[7, _humidity] call _fnc_updateMemory;
[8, _heatIndex] call _fnc_updateMemory;
[9, _dewPoint] call _fnc_updateMemory;
[10, _wetBulb] call _fnc_updateMemory;
[11, _barometricPressure] call _fnc_updateMemory;
[12, _altitude] call _fnc_updateMemory;
[13, _densityAltitude] call _fnc_updateMemory;

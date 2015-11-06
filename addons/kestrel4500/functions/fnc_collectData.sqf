/*
 * Author: Ruthberg
 * Gathers the weather data for the Kestrel 4500
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_kestrel4500_fnc_collectData
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_playerDir", "_playerAltitude", "_temperature", "_humidity", "_barometricPressure", "_altitude", "_airDensity", "_densityAltitude", "_chill", "_heatIndex", "_dewPoint", "_wetBulb", "_windSpeed", "_crosswind", "_headwind"];
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
} count [1, 5, 6, 7, 8, 9, 10, 11, 12, 13];


[0, _playerDir] call FUNC(updateMemory);

if (GVAR(MinAvgMaxMode) == 1) then {
    {
        GVAR(ENTRIES) set [_x, (GVAR(ENTRIES) select _x) + 1];
    } count [2, 3, 4];

    // Wind SPD
    _windSpeed = call FUNC(measureWindSpeed);
    [2, _windSpeed] call FUNC(updateMemory);

    // CROSSWIND
    _crosswind = 0;
    if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
        _crosswind = abs(sin(GVAR(RefHeading) - _playerDir) * _windSpeed);
    } else {
        _crosswind = abs(sin(GVAR(RefHeading)) * _windSpeed);
    };
    [3, _crosswind] call FUNC(updateMemory);

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

{ _x call FUNC(updateMemory); true } count [[5, _temperature],[6, _chill],[7, _humidity],[8, _heatIndex],[9, _dewPoint],[10, _wetBulb],[11, _barometricPressure],[12, _altitude],[13, _densityAltitude]];

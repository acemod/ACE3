/*
 * Author: Ruthberg
 *
 * Calculates the wind speed at a given world position
 *
 * Arguments:
 * 0: _this - world position <posASL>
 *
 * Return Value:
 * 0: wind speed - m/s <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_windSpeed", "_windDir", "_newWindSpeed", "_windSource"];

fnc_polar2vect = {
    private ["_mag2D"];
    _mag2D = (_this select 0) * cos((_this select 2));
    [_mag2D * sin((_this select 1)), _mag2D * cos((_this select 1)), (_this select 0) * sin((_this select 2))];
};

_windSpeed = vectorMagnitude ACE_wind;
_windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);

// Terrain effect on wind
if (_windSpeed > 0.05) then {
    _newWindSpeed = 0;
    {
        _windSource = [100, _windDir + 180, _x] call fnc_polar2vect;
        if (!(terrainIntersectASL [_this, _this vectorAdd _windSource])) exitWith {
            _newWindSpeed = cos(_x * 9) * _windSpeed;
        };
        _windSource = [100, _windDir + 180 + _x, 0] call fnc_polar2vect;
        if (!(terrainIntersectASL [_this, _this vectorAdd _windSource])) exitWith {
            _newWindSpeed = cos(_x * 9) * _windSpeed;
        };
        _windSource = [100, _windDir + 180 - _x, 0] call fnc_polar2vect;
        if (!(terrainIntersectASL [_this, _this vectorAdd _windSource])) exitWith {
            _newWindSpeed = cos(_x * 9) * _windSpeed;
        };
    } forEach [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    _windSpeed = _newWindSpeed;
};

// Obstacle effect on wind
if (_windSpeed > 0.05) then {
    _newWindSpeed = 0;
    {
        _windSource = [20, _windDir + 180, _x] call fnc_polar2vect;
        if (!(lineIntersects [_this, _this vectorAdd _windSource])) exitWith {
            _newWindSpeed = cos(_x * 2) * _windSpeed;
        };
        _windSource = [20, _windDir + 180 + _x, 0] call fnc_polar2vect;
        if (!(lineIntersects [_this, _this vectorAdd _windSource])) exitWith {
            _newWindSpeed = cos(_x * 2) * _windSpeed;
        };
        _windSource = [20, _windDir + 180 - _x, 0] call fnc_polar2vect;
        if (!(lineIntersects [_this, _this vectorAdd _windSource])) exitWith {
            _newWindSpeed = cos(_x * 2) * _windSpeed;
        };
    } forEach [0, 5, 10, 15, 20, 25, 30, 35, 40, 45];
    _windSpeed = _newWindSpeed;
};
_windSpeed = 0 max _windSpeed;

_windSpeed

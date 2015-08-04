/*
 * Author: Ruthberg
 *
 * Calculates the true wind speed at a given world position
 *
 * Arguments:
 * 0: world position - posASL <POSTION>
 * 1: Account for wind gradient <BOOL>
 * 2: Account for terrain <BOOL>
 * 3: Account for obstacles <BOOL>
 *
 * Return Value:
 * wind speed - m/s <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_fnc_polar2vect", "_windSpeed", "_windDir", "_windDirAdjusted", "_height", "_newWindSpeed", "_windSource", "_roughnessLength"];

params ["_position", "_windGradientEnabled", "_terrainEffectEnabled", "_obstacleEffectEnabled"];

_fnc_polar2vect = {
    private ["_mag2D"];
    params ["_x", "_y", "_z"];
    _mag2D = _x * cos(_z);
    [_mag2D * sin(_y), _mag2D * cos(_y), _x * sin(_z)];
};

_windSpeed = vectorMagnitude ACE_wind;
_windDir = (ACE_wind select 0) atan2 (ACE_wind select 1);
_windDirAdjusted = _windDir + 180;

// Wind gradient
if (_windGradientEnabled) then {
    if (_windSpeed > 0.05) then {
        _height = (ASLToATL _position) select 2;
        _height = 0 max _height min 20;
        if (_height < 20) then {
            _roughnessLength = _position call FUNC(calculateRoughnessLength);
            _windSpeed = _windSpeed * abs(ln(_height / _roughnessLength) / ln(20 / _roughnessLength));
        };
    };
};

// Terrain effect on wind
if (_terrainEffectEnabled) then {
    if (_windSpeed > 0.05) then {
        _newWindSpeed = 0;
        {
            _windSource = [100, _windDirAdjusted, _x] call _fnc_polar2vect;
            if (!(terrainIntersectASL [_position, _position vectorAdd _windSource])) exitWith {
                _newWindSpeed = cos(_x * 9) * _windSpeed;
            };
            _windSource = [100, _windDirAdjusted + _x, 0] call _fnc_polar2vect;
            if (!(terrainIntersectASL [_position, _position vectorAdd _windSource])) exitWith {
                _newWindSpeed = cos(_x * 9) * _windSpeed;
            };
            _windSource = [100, _windDirAdjusted - _x, 0] call _fnc_polar2vect;
            if (!(terrainIntersectASL [_position, _position vectorAdd _windSource])) exitWith {
                _newWindSpeed = cos(_x * 9) * _windSpeed;
            };
        } count [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        _windSpeed = _newWindSpeed;
    };
};

// Obstacle effect on wind
if (_obstacleEffectEnabled) then {
    if (_windSpeed > 0.05) then {
        _newWindSpeed = 0;
        {
            _windSource = [20, _windDirAdjusted, _x] call _fnc_polar2vect;
            if (!(lineIntersects [_position, _position vectorAdd _windSource])) exitWith {
                _newWindSpeed = cos(_x * 2) * _windSpeed;
            };
            _windSource = [20, _windDirAdjusted + _x, 0] call _fnc_polar2vect;
            if (!(lineIntersects [_position, _position vectorAdd _windSource])) exitWith {
                _newWindSpeed = cos(_x * 2) * _windSpeed;
            };
            _windSource = [20, _windDirAdjusted - _x, 0] call _fnc_polar2vect;
            if (!(lineIntersects [_position, _position vectorAdd _windSource])) exitWith {
                _newWindSpeed = cos(_x * 2) * _windSpeed;
            };
        } count [0, 5, 10, 15, 20, 25, 30, 35, 40, 45];
        _windSpeed = _newWindSpeed;
    };
};

_windSpeed = 0 max _windSpeed;

_windSpeed

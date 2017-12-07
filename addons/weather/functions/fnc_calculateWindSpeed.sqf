/*
 * Author: Ruthberg
 * Calculates the true wind speed at a given world position
 *
 * Arguments:
 * 0: world position - posASL <POSTION>
 * 1: Account for wind gradient (used in advanced ballistics) <BOOL>
 * 2: Account for terrain <BOOL>
 * 3: Account for obstacles <BOOL>
 *
 * Return Value:
 * wind speed - m/s <NUMBER>
 *
 * Example:
 * [eyePos ACE_player, true, true, true] call ace_weather_fnc_calculateWindSpeed;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_position", "_windGradientEnabled", "_terrainEffectEnabled", "_obstacleEffectEnabled"];

private _fnc_polar2vect = {
    params ["_mag","_dir","_elev"];
    private _mag2D = _mag * cos(_elev);
    [_mag2D * sin(_dir), _mag2D * cos(_dir), _mag * sin(_elev)];
};

private _windSpeed = vectorMagnitude wind;
private _windDir = (wind select 0) atan2 (wind select 1);
private _windDirAdjusted = _windDir + 180;

// Wind gradient
if (_windGradientEnabled) then {
    if (_windSpeed > 0.05) then {
        private _height = (ASLToATL _position) select 2;
        if (_height > 0 && _height < 20) then {
            private _roughnessLength = _position call FUNC(calculateRoughnessLength);
            _windSpeed = _windSpeed * (0 max (ln(_height / _roughnessLength) / ln(20 / _roughnessLength)));
        };
    };
};

// Terrain effect on wind
if (_terrainEffectEnabled) then {
    if (_windSpeed > 0.05) then {
        private _newWindSpeed = 0;
        {
            private _windSource = [100, _windDirAdjusted, _x] call _fnc_polar2vect;
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
            nil
        } count [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        _windSpeed = _newWindSpeed;
    };
};

// Obstacle effect on wind
if (_obstacleEffectEnabled) then {
    if (_windSpeed > 0.05) then {
        private _newWindSpeed = 0;
        {
            private _windSource = [20, _windDirAdjusted, _x] call _fnc_polar2vect;
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
            nil
        } count [0, 5, 10, 15, 20, 25, 30, 35, 40, 45];
        _windSpeed = _newWindSpeed;
    };
};

_windSpeed = 0 max _windSpeed;

_windSpeed

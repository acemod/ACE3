/*
 * Author: Ruthberg
 * Calculates the terrain roughness length at a given world position
 *
 * Arguments:
 * world position <posASL>
 *
 * Return Value:
 * roughness length <NUMBER>
 *
 * Example:
 * (getPosASL player) call ace_weather_fnc_calculateRoughnessLength
 *
 * Public: No
 */
#include "script_component.hpp"

// Source: http://es.ucsc.edu/~jnoble/wind/extrap/index.html
#define ROUGHNESS_LENGTHS [0.0002, 0.0005, 0.0024, 0.03, 0.055, 0.1, 0.2, 0.4, 0.8, 1.6]

private _windSource = _this vectorDiff ((vectorNormalized wind) vectorMultiply 25);

private _nearBuildings = count (_windSource nearObjects ["Building", 50]);
private _isWater = surfaceIsWater _windSource;

if (_nearBuildings == 0 && _isWater) exitWith {
    0.0005
};

if (_nearBuildings >= 10) exitWith {
    1.6
};

ROUGHNESS_LENGTHS select (2 + (_nearBuildings min 6))

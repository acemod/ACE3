/*
 * Author: Ruthberg
 *
 * Calculates the terrain roughness length at a given world position
 *
 * Arguments:
 * world position <posASL>
 *
 * Return Value:
 * roughness length <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_roughness_lengths", "_windSource", "_nearBuildings", "_isWater"];

// Source: http://es.ucsc.edu/~jnoble/wind/extrap/index.html
_roughness_lengths = [0.0002, 0.0005, 0.0024, 0.03, 0.055, 0.1, 0.2, 0.4, 0.8, 1.6];

_windSource = _this vectorDiff ((vectorNormalized ACE_wind) vectorMultiply 25);

_nearBuildings = count (_windSource nearObjects ["Building", 50]);
_isWater = surfaceIsWater _windSource;

if (_nearBuildings == 0 && _isWater) exitWith {
    0.0005
};

if (_nearBuildings >= 10) exitWith {
    1.6
};

_roughness_lengths select (2 + (_nearBuildings min 6))

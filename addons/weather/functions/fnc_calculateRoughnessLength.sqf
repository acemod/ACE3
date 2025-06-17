#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the terrain roughness length at a given world position
 *
 * Arguments:
 * World position ASL <ARRAY>
 *
 * Return Value:
 * Roughness length <NUMBER>
 *
 * Example:
 * (getPosASL player) call ace_weather_fnc_calculateRoughnessLength
 *
 * Public: No
 */

// Source: http://es.ucsc.edu/~jnoble/wind/extrap/index.html
#define ROUGHNESS_LENGTHS [0.0002, 0.0005, 0.0024, 0.03, 0.055, 0.1, 0.2, 0.4, 0.8, 1.6]

private _windSource = ASLToAGL (_this vectorDiff ((vectorNormalized wind) vectorMultiply 25));
private _nearBuildingCount = {
    private _bb = boundingBoxReal [_x, "ViewGeometry"];
    private _height = _bb#1#2 - _bb#0#2;
    private _volume = (_bb#1#0 - _bb#0#0) * (_bb#1#1 - _bb#0#1) * _height;

    (_height > 0.3) && {_volume > 10}
} count (_windSource nearObjects ["Building", 50]);
private _nearTreeCount = count nearestTerrainObjects [_windSource, ["TREE"], 50, false];
private _isWater = surfaceIsWater _windSource;

if (_nearBuildingCount == 0 && _isWater) exitWith {
    0.0005
};

private _roughnessIndex = _nearBuildingCount + round (_nearTreeCount / 9);
ROUGHNESS_LENGTHS select (2 + _roughnessIndex min 9)

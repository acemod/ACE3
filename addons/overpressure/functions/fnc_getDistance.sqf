/*
 * Author: commy2 and esteldunedain
 *
 * Calculate the distance to the first intersection of a line
 *
 * Argument:
 * 0: Pos ASL of origin (Array)
 * 1: Direction (Array)
 * 2: Max distance to search (Number)
 *
 * Return value:
 * Distance to intersection (+- 0.1 m)
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_posASL,_direction,_maxDistance);

private ["_distance", "_interval", "_line", "_intersections", "_terrainIntersect", "_lastTerrainIntersect"];

_distance = _maxDistance;
_interval = _distance;
_line = [_posASL, []];
_terrainIntersect = false;
_lastTerrainIntersect = false;

while {
    _interval > 0.1
} do {
    _lastTerrainIntersect = _terrainIntersect;
    _interval = _interval / 2;

    _line set [1, _posASL vectorAdd (_direction vectorMultiply _distance)];

    _intersections = {
        _x isKindOf "Static" || {_x isKindOf "AllVehicles"}
    } count (lineIntersectsWith _line);

    _terrainIntersect = if (_intersections > 0) then {
        false
    } else {
        terrainIntersectASL _line
    };

    _distance = _distance + ([1, -1] select (_intersections > 0 || _terrainIntersect)) * _interval;

    if (_distance > _maxDistance) exitWith {_distance = 999};
};

if (_distance > _maxDistance) exitWith {_distance};

// If the intersection was with the terrain, check slope
if (_terrainIntersect || _lastTerrainIntersect) exitWith {
    private ["_slope","_angle"];
    _slope = surfaceNormal (_posASL vectorAdd (_direction vectorMultiply _distance));
    // Calculate the angle between the terrain and the back blast direction
    _angle = 90 - acos (- (_slope vectorDotProduct _direction));

    //systemChat format ["Angle: %1", _angle];
    // Angles is below 25º, no backblast at all
    if (_angle < 25) exitWith {_distance = 999};
    // Angles is below 45º the distance is increased according to the difference
    if (_angle < 45) exitWith {_distance = _distance * (5 - 4 * sqrt ((_angle - 25)/20))};
    // Angles above 45º create full backblast
};

_distance

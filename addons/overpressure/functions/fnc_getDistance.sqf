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

private ["_distance", "_interval", "_line", "_intersections"];

_distance = _maxDistance;
_interval = _distance;
_line = [_posASL, []];

while {
    _interval > 0.1
} do {
    _interval = _interval / 2;

    _line set [1, _posASL vectorAdd (_direction vectorMultiply _distance)];

    _intersections = {
        _x isKindOf "Static" || {_x isKindOf "AllVehicles"}
    } count (lineIntersectsWith _line);

    _distance = _distance + ([1, -1] select (_intersections > 0 || {terrainIntersectASL _line})) * _interval;

    if (_distance > _maxDistance) exitWith {_distance = 999};
};

_distance

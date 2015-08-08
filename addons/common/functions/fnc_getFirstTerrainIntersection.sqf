/*
 * Author: Ruthberg
 *
 * Returns the the first intersection with an object between two positions
 *
 * Arguments:
 * 0: PositionASL (ARRAY with Position)
 * 1: PositionATL (Position with Position)
 * 2: Accuracy (NUMBER)
 * Return Value:
 * 0: Intersects (BOOLEAN)
 * 1: Intersection (PositionASL)
 *
 * Public: Yes
*/
#include "script_component.hpp"

private ["_distance", "_lower", "_upper", "_mid", "_intersection", "_result", "_dir"];

params ["_source", "_destination", "_accuracy"];

_result = [false, [0, 0, 0]];

_distance = _source vectorDistance _destination;

if (terrainIntersectASL [_source, _destination]) then {
    _lower = 0;
    _upper = 1;
    _mid = 0.5;

    _dir = _source vectorFromTo _destination;

    while {(_upper - _lower) * _distance > _accuracy} do {
        _mid = _lower + (_upper - _lower) / 2;

        _intersection = terrainIntersectASL [_source, _source vectorAdd (_dir vectorMultiply (_mid * _distance))];

        if (_intersection) then {
            _upper = _mid;
        } else {
            _lower = _mid;
        };
    };

    _mid = _lower + (_upper - _lower) / 2;
    _result = [true, _source vectorAdd (_dir vectorMultiply (_mid * _distance))];
};

_result

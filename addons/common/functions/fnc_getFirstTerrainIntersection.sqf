/*
 * Author: Ruthberg
 * Returns the the first intersection with an object between two positions. @todo rewrite using lineIntersectsSurfaces?
 *
 * Arguments:
 * 0: PositionASL <ARRAY>
 * 1: PositionATL <ARRAY>
 * 2: Accuracy <NUMBER>
 *
 * Return Value:
 * 0: Intersects <BOOL>
 * 1: Intersection Position ASL <ARRAY>
 *
 * Example:
 * [[1,2,3], [0,0,5], 5] call ace_common_fnc_getFirstTerrainIntersection
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_source", "_destination", "_accuracy"];

private _result = [false, [0, 0, 0]];

private _distance = _source vectorDistance _destination;

if (terrainIntersectASL [_source, _destination]) then {
    private _lower = 0;
    private _upper = 1;
    private _mid = 0.5;

    private _dir = _source vectorFromTo _destination;

    while {(_upper - _lower) * _distance > _accuracy} do {
        _mid = _lower + (_upper - _lower) / 2;

        if (terrainIntersectASL [_source, _source vectorAdd (_dir vectorMultiply (_mid * _distance))]) then {
            _upper = _mid;
        } else {
            _lower = _mid;
        };
    };

    _mid = _lower + (_upper - _lower) / 2;
    _result = [true, _source vectorAdd (_dir vectorMultiply (_mid * _distance))];
};

_result

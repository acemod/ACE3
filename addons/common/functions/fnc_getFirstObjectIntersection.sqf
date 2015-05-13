/**
 * fn_getFirstIntersection.sqf
 * @Descr: Returns the the first intersection with an object between two positions
 * @Author: Ruthberg
 *
 * @Arguments: [position PositionASL, position PositionASL, accuracy FLOAT]
 * @Return: [intersects BOOL, intersection PositionASL]
 * @PublicAPI: true
 */
 #include "script_component.hpp"

private ["_source", "_destination", "_accuracy", "_distance", "_lower", "_upper", "_mid", "_intersections", "_result", "_dir"];
_source      = _this select 0;
_destination = _this select 1;
_accuracy    = _this select 2;

_result = [false, [0, 0, 0]];

_distance = _source vectorDistance _destination;

if (count (lineIntersectsWith [_source, _destination]) > 0) then {
    _lower = 0;
    _upper = 1;
    _mid = 0.5;

    _dir = _source vectorFromTo _destination;

    while {(_upper - _lower) * _distance > _accuracy} do {
        _mid = _lower + (_upper - _lower) / 2;

        _intersections = count (lineIntersectsWith [_source, _source vectorAdd (_dir vectorMultiply (_mid * _distance))]);

        if (_intersections > 0) then {
            _upper = _mid;
        } else {
            _lower = _mid;
        };
    };

    _mid = _lower + (_upper - _lower) / 2;
    _result = [true, _source vectorAdd (_dir vectorMultiply (_mid * _distance))];
};

_result

#include "script_component.hpp"

params ["_list", "_checkPos"];
private _spots = [];
private _outliers = [];
private _spot = [];
(_list select 0) params ["_testPos"];
{
    _x params ["_samplePos"];
    if(!lineIntersects [_samplePos, _checkPos] && {!terrainIntersectASL [_samplePos, _checkPos]}) then {
        if(_samplePos distance _testPos < 2) then {
            _spot pushBack _samplePos;
        } else {
            _outliers pushBack _samplePos;
        };
    };
} forEach _list;
_spots pushBack _spot;

if(count _outliers > 0) then {
    for "_i" from 1 to 3 do {
        private _remainingSpots = _outliers;
        _outliers = [];
        _spot = [];
        _testPos = (_remainingSpots select 0);
        {
            private _samplePos = _x;
            if(!lineIntersects [_samplePos, _checkPos] && {!terrainIntersectASL [_samplePos, _checkPos]}) then {
                if(_samplePos distance _testPos < 2) then {
                    _spot pushBack _samplePos;
                } else {
                    _outliers pushBack _samplePos;
                };
            };
        } forEach _remainingSpots;
        _spots pushBack _spot;
    };
};
private _largest = 0;
private _largestSpot = [];
{
    if(count _x > _largest) then {
        _largest = count _x;
        _largestSpot = _x;
    };
} forEach _spots;
// player sideChat format["g: %1", _spots];
_largestSpot select (random (floor(count _largestSpot)));
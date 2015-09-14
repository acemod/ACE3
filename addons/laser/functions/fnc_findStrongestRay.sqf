/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: ?
 *
 * Return Value:
 * ?
 *
 * Example:
 * [?, ?] call ace_laser_fnc_findStringestRay
 *
 * Public: No
 */
#include "script_component.hpp"
private["_largest", "_largestSpot", "_outliers", "_remainingSpots", "_spot", "_spots", "_testPos"];
params ["_list", "_checkPos"];
_spots = [];
_outliers = [];
_spot = [];
_testPos = (_list select 0) select 0;
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
        _remainingSpots = _outliers;
        _outliers = [];
        _spot = [];
        _testPos = (_remainingSpots select 0);
        {
            _x params ["_samplePos"];
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
_largest = 0;
_largestSpot = [];
{
    if((count _x) > _largest) then {
        _largest = (count _x);
        _largestSpot = _x;
    };
} forEach _spots;
// player sideChat format["g: %1", _spots];
_largestSpot select (random (floor(count _largestSpot)));

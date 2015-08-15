/*
 * Author: ?
 * ?
 *
 * Arguments:
 * 0: ? <?>
 *
 * Return Value:
 * ? <?>
 *
 * Example:
 * [?] call ace_laser_fnc_shootRay
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_distance", "_resultPos", "_fidelity", "_lastPos", "_i", "_nextPos"];
scopeName "main";
 params ["_pos", "_vec"];
_distance = 0;
_resultPos = nil;
_fidelity = [1000,100,10,1,0.1];
_lastPos = +_pos;
{
    scopeName "mainSearch";
    for "_i" from 1 to 10 do {
        _nextPos = _lastPos vectorAdd (_vec vectorMultiply _x);
        if(terrainIntersectASL [_lastPos, _nextPos] || {lineIntersects [_lastPos, _nextPos]}) then {
            _resultPos = _lastPos;
            breakTo "mainSearch";
        } else {
            _distance = _distance + _x;
            _lastPos = _nextPos;
        };
    };
} forEach _fidelity;
[_resultPos, _distance];

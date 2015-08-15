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
 * [?] call ace_laser_fnc_shootCone
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_i", "_divergence","_pos","_vec","_longestReturn","_shortestReturn","_resultPositions","_p1","_p2","_p","_v","_cp","_vecRotateMap","_result", "_resultPos","_distance","_count","_pos2","_radOffset","_offset","_offsetPos","_offsetVector"];
params ["_pos", "_vec", ["_divergence", 0.3], ["_count", "3"]];

_longestReturn = -1000000000;
_shortestReturn = 1000000000;
_resultPositions = [];
_p1 = [0,0,0];
_p2 = +_vec;
_p = (_vec call CBA_fnc_vect2polar);
_v = [(_p select 0), (_p select 1), (_p select 2)+90] call CBA_fnc_polar2vect;
_cp = _vec vectorCrossProduct _v;

_vecRotateMap = [_cp, _p1, _p2] call FUNC(rotateVectLineGetMap);

_result = [_pos, _vec] call FUNC(shootRay);
_resultPos = _result select 0;
if(!isNil "_resultPos") then {
    _distance = _result select 1;
    if(_distance < _shortestReturn) then {
        _shortestReturn = _distance;
    };
    if(_distance > _longestReturn) then {
        _longestReturn = _distance;
    };
    _resultPositions pushBack _result;
#ifdef DEBUG_MODE_FULL
    // DRAW_LINES set[(count DRAW_LINES), [_pos, _resultPos, [0, 1, 0, 1]]];
    drawLine3D [ASLtoATL _pos, ASLtoATL _resultPos, [1,0,0,1]];
#endif
};


_pos2 = _pos vectorAdd (_vec vectorMultiply 1000);
{
    for "_i" from 0 to ceil(_count*_x) do {
        _radOffset = random 360;
        _offset = [_vecRotateMap, (((360/_count)*_i)+_radOffset) mod 360] call FUNC(rotateVectLine);
        _offsetPos = _pos2 vectorAdd (_offset vectorMultiply (_divergence*_x));
        _offsetVector = _pos vectorFromTo _offsetPos;
        _result = [_pos, _offsetVector] call FUNC(shootRay);
        _resultPos = _result select 0;
        if(!isNil "_resultPos") then {
            _distance = _result select 1;
            if(_distance < _shortestReturn) then {
                _shortestReturn = _distance;
            };
            if(_distance > _longestReturn) then {
                _longestReturn = _distance;
            };
            _resultPositions pushBack _result;
#ifdef DEBUG_MODE_FULL
            // DRAW_LINES set[(count DRAW_LINES), [_pos, _resultPos, [0, 1, 0, 1]]];
            drawLine3D [ASLtoATL _pos, ASLtoATL _resultPos, [1,0,0,1]];
#endif
        };
    };
} forEach [1,0.5,0.25];
[_longestReturn, _shortestReturn, _resultPositions];

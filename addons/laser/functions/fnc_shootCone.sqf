#include "script_component.hpp"
//#define DEBUG_MODE_FULL

params ["_pos", "_vec", ["_divergence", 0.3], ["_count", 3], ["_ignoreObj1", objNull]];

private _longestReturn = -1000000000;
private _shortestReturn = 1000000000;
private _resultPositions = [];
private _p1 = [0,0,0];
private _p2 = +_vec;
private _p = (_vec call CBA_fnc_vect2polar);
private _v = [(_p select 0), (_p select 1), (_p select 2)+90] call CBA_fnc_polar2vect;
private _cp = _vec vectorCrossProduct _v;

private _vecRotateMap = [_cp, _p1, _p2] call FUNC(rotateVectLineGetMap);

private _result = [_pos, _vec, _ignoreObj1] call FUNC(shootRay);
private _resultPos = _result select 0;

if (!isNil "_resultPos") then {
    private _distance = _result select 1;
    if (_distance < _shortestReturn) then {
        _shortestReturn = _distance;
    };
    if (_distance > _longestReturn) then {
        _longestReturn = _distance;
    };
    _resultPositions pushBack _result;
#ifdef DEBUG_MODE_FULL
    drawLine3D [ASLtoAGL _pos, ASLtoAGL _resultPos, [1,0,0,1]];
#endif
};


private _pos2 = _pos vectorAdd (_vec vectorMultiply 1000);
{
    for "_i" from 0 to ceil(_count*_x) do {
        private _radOffset = random 360;
        private _offset = [_vecRotateMap, (((360/_count)*_i)+_radOffset) mod 360] call FUNC(rotateVectLine);
        private _offsetPos = _pos2 vectorAdd (_offset vectorMultiply (_divergence*_x));
        private _offsetVector = _pos vectorFromTo _offsetPos;
        _result = [_pos, _offsetVector, _ignoreObj1] call FUNC(shootRay);
        _resultPos = _result select 0;
        if (!isNil "_resultPos") then {
            private _distance = _result select 1;
            if (_distance < _shortestReturn) then {
                _shortestReturn = _distance;
            };
            if (_distance > _longestReturn) then {
                _longestReturn = _distance;
            };
            _resultPositions pushBack _result;
#ifdef DEBUG_MODE_FULL
            drawLine3D [ASLtoAGL _pos, ASLtoAGL _resultPos, [1,0,0,1]];
#endif
        };
    };
} forEach [1,0.5,0.25];

[_longestReturn, _shortestReturn, _resultPositions];

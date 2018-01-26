/*
 * Author: Nou
 * Shoots multiple rays in a dispersion pattern.
 *
 * Arguments:
 * 0: Origin position ASL <ARRAY>
 * 1: Direction (normalized) <ARRAY>
 * 2: Divergence (mils) <NUMBER> (default: 0.3)
 * 3: Count at each divergence level <NUMBER> (default: 3)
 * 4: Ignore vehicle 1 (e.g. Player's vehicle) <OBJECT> (default: objNull)
 *
 * Return Value:
 * [_longestReturn, _shortestReturn, _resultPositions] <ARRAY>
 *
 * Example:
 * [getPosASL player, [0,1,0]] call ace_laser_fnc_shootCone
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

BEGIN_COUNTER(shootCone);

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

// Check first with a perfect ray to the center
private _result = [_pos, _vec, _ignoreObj1] call FUNC(shootRay);
private _resultPos = _result select 0;

if (!isNil "_resultPos") then {
    private _distance = _result select 1;
    if (_distance < _shortestReturn) then { _shortestReturn = _distance; };
    if (_distance > _longestReturn) then { _longestReturn = _distance; };
    _resultPositions pushBack _result;
};

private _pos2 = _pos vectorAdd (_vec vectorMultiply 1000);
// Try at 3 radius (full, half, quarter of specified divergence)
{
    private _radOffset = random 360;
    for "_i" from 1 to ceil(_count*_x) do { // Will always do at least 1
        private _offset = [_vecRotateMap, (((360/_count)*_i)+_radOffset) mod 360] call FUNC(rotateVectLine);
        private _offsetPos = _pos2 vectorAdd (_offset vectorMultiply (_divergence*_x));

        private _offsetVector = _pos vectorFromTo _offsetPos;
        _result = [_pos, _offsetVector, _ignoreObj1] call FUNC(shootRay);
        _resultPos = _result select 0;
        if (!isNil "_resultPos") then {
            private _distance = _result select 1;
            if (_distance < _shortestReturn) then { _shortestReturn = _distance; };
            if (_distance > _longestReturn) then { _longestReturn = _distance; };
            _resultPositions pushBack _result;
        };
    };
} forEach [1,0.5,0.25];

END_COUNTER(shootCone);

[_longestReturn, _shortestReturn, _resultPositions];

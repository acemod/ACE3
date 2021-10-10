#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * call ace_vector_fnc_getRelativeHeightLength
 *
 * Public: No
 */

GVAR(pData) params ["_distanceP1", "_directionP1"];
_directionP1 params ["_azimuthP1", "_inclinationP1"];
private _distanceP2 = call FUNC(getDistance);
private _directionP2 = call FUNC(getDirection);
_directionP2 params ["_azimuthP2", "_inclinationP2"];

if (_distanceP1 < -999 || {_distanceP2 < -999}) exitWith {
    [-1000, -1000]    // return
};

private _position1 = [_distanceP1, _azimuthP1, _inclinationP1] call CBA_fnc_polar2vect;
private _position2 = [_distanceP2, _azimuthP2, _inclinationP2] call CBA_fnc_polar2vect;

private _length = _position1 distance2D _position2;
private _height = abs ((_position1 vectorDiff _position2) select 2);

[_height, _length]

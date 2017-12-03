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

#include "script_component.hpp"

private _distanceP1 = GVAR(pData) select 0;
private _directionP1 = GVAR(pData) select 1;
private _azimuthP1 = _directionP1 select 0;
private _inclinationP1 = _directionP1 select 1;
private _distanceP2 = call FUNC(getDistance);
private _directionP2 = call FUNC(getDirection);
private _azimuthP2 = _directionP2 select 0;
private _inclinationP2 = _directionP2 select 1;

private _azimuth = abs (_azimuthP1 - _azimuthP2);
private _inclination = abs (_inclinationP1 - _inclinationP2);
private _height = sqrt (_distanceP1 ^ 2 + _distanceP2 ^ 2 - 2 * _distanceP1 * _distanceP2 * cos _inclination);
private _length = sqrt (_distanceP1 ^ 2 + _distanceP2 ^ 2 - 2 * _distanceP1 * _distanceP2 * cos _azimuth);

if (_inclination < 0) then {_height = -1 * _height};

if (_distanceP1 < -999 || {_distanceP2 < -999}) exitWith {
    [-1000, -1000]    // return
};

[_height, _length]

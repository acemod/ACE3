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

private ["_distanceP1", "_directionP1", "_azimuthP1", "_inclinationP1", "_distanceP2", "_directionP2", "_azimuthP2", "_inclinationP2"];

_distanceP1 = GVAR(pData) select 0;
_directionP1 = GVAR(pData) select 1;
_azimuthP1 = _directionP1 select 0;
_inclinationP1 = _directionP1 select 1;

_distanceP2 = call FUNC(getDistance);
_directionP2 = call FUNC(getDirection);
_azimuthP2 = _directionP2 select 0;
_inclinationP2 = _directionP2 select 1;

private ["_azimuth", "_inclination", "_height", "_length"];

_azimuth = abs (_azimuthP1 - _azimuthP2);
_inclination = abs (_inclinationP1 - _inclinationP2);
_height = sqrt (_distanceP1 ^ 2 + _distanceP2 ^ 2 - 2 * _distanceP1 * _distanceP2 * cos _inclination);
_length = sqrt (_distanceP1 ^ 2 + _distanceP2 ^ 2 - 2 * _distanceP1 * _distanceP2 * cos _azimuth);

if (_inclination < 0) then {_height = -1 * _height};

if (_distanceP1 < -999 || {_distanceP2 < -999}) exitWith {
    [-1000, -1000]    // return
};

[_height, _length]

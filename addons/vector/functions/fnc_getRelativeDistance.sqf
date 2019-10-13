#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Number <NUMBER>
 *
 * Example:
 * call ace_vector_fnc_getRelativeDistance
 *
 * Public: No
 */

GVAR(pData) params ["_distanceP1", "_directionP1"];
_directionP1 params ["_azimuthP1", "_inclinationP1"];
private _distanceP2 = call FUNC(getDistance);
private _directionP2 = call FUNC(getDirection);
_directionP2 params ["_azimuthP2", "_inclinationP2"];


private _relDirection = sqrt ((_azimuthP1 - _azimuthP2) ^ 2 + (_inclinationP1 - _inclinationP2) ^ 2);
private _relDistance = sqrt (_distanceP1 ^ 2 + _distanceP2 ^ 2 - 2 * _distanceP1 * _distanceP2 * cos _relDirection);

if (_distanceP1 < -999 || {_distanceP2 < -999}) exitWith {
    -1000    // return
};

_relDistance

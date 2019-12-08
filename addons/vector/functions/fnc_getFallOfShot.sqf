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
 * call ace_vector_fnc_getFallOfShot
 *
 * Public: No
 */


GVAR(pData) params ["_distanceP1", "_directionP1"];
_directionP1 params ["_azimuthP1", "_inclinationP1"];
private _distanceP2 = call FUNC(getDistance);
private _directionP2 = call FUNC(getDirection);
_directionP2 params ["_azimuthP2", "_inclinationP2"];

private _abscissa = _distanceP1 * sin (_azimuthP1 - _azimuthP2);
private _ordinate = _distanceP1 * cos (_inclinationP1 - _inclinationP2) - _distanceP2 * cos (_azimuthP1 - _azimuthP2);
private _applicate = (sin _inclinationP2 * _distanceP2) - (sin _inclinationP1 * _distanceP1);

if (_distanceP1 < -999 || {_distanceP2 < -999}) exitWith {
    [-1000, -1000, -1000]    // return
};

[_abscissa, _ordinate, _applicate]

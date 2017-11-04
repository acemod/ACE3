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
 * call ace_vector_fnc_getHeightDistance
 *
 * Public: No
 */

#include "script_component.hpp"

private _distance = call FUNC(getDistance);
private _direction = call FUNC(getDirection);

private _azimuth = _direction select 0;
private _inclination = _direction select 1;

if (_distance < -999) exitWith {
    [-1000, -1000]    // return
};

[sin _inclination * _distance, cos _inclination * _distance]

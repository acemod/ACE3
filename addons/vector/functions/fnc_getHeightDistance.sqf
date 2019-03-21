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
 * call ace_vector_fnc_getHeightDistance
 *
 * Public: No
 */

private _distance = call FUNC(getDistance);
private _direction = call FUNC(getDirection);

_direction params ["_azimuth", "_inclination"];

if (_distance < -999) exitWith {
    [-1000, -1000]    // return
};

[sin _inclination * _distance, cos _inclination * _distance]

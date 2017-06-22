/*
 * Author: commy2
 * Reports near units.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Near Units <ARRAY>
 *
 * Example:
 * call ACE_laserpointer_fnc_getNearUnits
 *
 * Public: No
 */
#include "script_component.hpp"

private _camPosAGL = positionCameraToWorld [0, 0, 0];

// handle RHS / bugged vehicle slots
if !((_camPosAGL select 0) isEqualType 0) exitWith { [] };

private _nearUnits = [];

{
    _nearUnits append crew _x;
} forEach nearestObjects [_camPosAGL, ["AllVehicles"], MAX_LASER_RANGE];

_nearUnits

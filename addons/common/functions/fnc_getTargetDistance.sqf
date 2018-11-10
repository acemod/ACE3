#include "script_component.hpp"
/*
 * Author: VKing
 * Get the distance to the next object the player is looking at. Used for laser distance measurements.
 *
 * Arguments:
 * 0: Measurement Accuracy (default: 1) <NUMBER>
 * 1: Maximum measure distance (default: 5000) <NUMBER>
 * 2: Minimum measure distance (default: 0) <NUMBER>
 *
 * Return Value:
 * Distance in meters <NUMBER>
 *
 * Example:
 * [5,20000,56] call ace_common_fnc_getTargetDistance
 *
 * Public: Yes
 */

params [["_accuracy",1], ["_maxDistance",5000], ["_minDistance",0]];

private _camPosition = AGLToASL positionCameraToWorld [0, 0, 0];
private _aimLinePos = AGLToASL positionCameraToWorld [0, 0, _maxDistance];

private _LIS = lineIntersectsSurfaces [_camPosition, _aimLinePos];

private _distance = 0;
if (count _LIS > 0) then {
    _distance = _camPosition vectorDistance ((_LIS select 0) select 0);
} else {
    _distance = _maxDistance;
};

_distance = _distance max _minDistance;

_accuracy = _accuracy max 1;
_distance = (round (_distance/_accuracy)) * _accuracy;

_distance

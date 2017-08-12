/*
 * Author: commy2
 * Get players viewing direction and slope.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Azimuth <NUMBER>
 * 1: Inclination <NUMBER>
 *
 * Example:
 * [] call ace_common_fnc_getTargetAzimuthAndInclination
 *
 * Public: Yes
 */
#include "script_component.hpp"

private _position = ATLToASL positionCameraToWorld [0, 0, 0];
private _direction = ATLToASL positionCameraToWorld [0, 0, 1];

private _azimuth = ((_direction select 0) - (_position select 0)) atan2 ((_direction select 1) - (_position select 1));
private _inclination = asin ((_direction select 2) - (_position select 2));

if (_azimuth < 0) then {_azimuth = _azimuth + 360};

[_azimuth, _inclination]

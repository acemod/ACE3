/*
 * Author: commy2
 * Get players viewing direction and slope
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Azimuth <NUMBER>
 * 1: Inclination <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_position", "_direction", "_azimuth", "_inclination"];

_position = ATLToASL positionCameraToWorld [0, 0, 0];
_direction = ATLToASL positionCameraToWorld [0, 0, 1];
_position params ["_posX","_posY","_posZ"];
_direction params ["_dirX","_dirY","_dirZ"];
_azimuth = (_dirX - _posX) atan2 (_dirY - _posY);
_inclination = asin (_dirZ - _posZ);

if (_azimuth < 0) then {_azimuth = _azimuth + 360};

[_azimuth, _inclination]

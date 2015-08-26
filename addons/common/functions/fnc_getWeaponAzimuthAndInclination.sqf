/*
 * Author: commy2
 * Get players weapon direction and slope
 *
 * Arguments:
 * 0: Weapon name <STRING>
 *
 * Return Value:
 * 0: Azimuth <NUMBER>
 * 1: Inclination <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_direction", "_azimuth", "_inclination"];

params ["_weapon"];

_direction = ACE_player weaponDirection _weapon;

_direction params ["_dirX", "_dirY", "_dirZ"];
_azimuth = _dirX atan2 _dirY;
_inclination = asin _dirZ;

if (_azimuth < 0) then {_azimuth = _azimuth + 360};

[_azimuth, _inclination]

/*
 * Author: commy2
 * Get local players weapon direction and slope.
 *
 * Arguments:
 * 0: Weapon name <STRING>
 *
 * Return Value:
 * 0: Azimuth <NUMBER>
 * 1: Inclination <NUMBER>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_weapon"];

private ["_direction", "_azimuth", "_inclination"];

_direction = ACE_player weaponDirection _weapon;

_azimuth = (_direction select 0) atan2 (_direction select 1);
_inclination = asin (_direction select 2);

if (_azimuth < 0) then {_azimuth = _azimuth + 360};

[_azimuth, _inclination]

#include "script_component.hpp"
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
 * Example:
 * ["gun"] call ace_common_fnc_getWeaponAzimuthAndInclination
 *
 * Public: Yes
 */

params ["_weapon"];

private _direction = ACE_player weaponDirection _weapon;

private _azimuth = (_direction select 0) atan2 (_direction select 1);
private _inclination = asin (_direction select 2);

if (_azimuth < 0) then {_azimuth = _azimuth + 360};

[_azimuth, _inclination]

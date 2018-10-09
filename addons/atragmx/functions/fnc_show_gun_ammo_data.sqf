#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shows/Hides the gun ammo data controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_gun_ammo_data
 *
 * Public: No
 */

GVAR(showGunAmmoData) = _this;

{ctrlShow [_x, _this]} forEach [12000, 120000, 12001, 120010, 12002, 120020, 12003, 120030, 12004, 120040, 12005, 120050, 12006, 120060, 120061, 12007, 12008, 12009, 12010, 12011];

if (_this) then {
    [] call FUNC(update_gun_ammo_data);
};

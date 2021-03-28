#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Cycles through the gun list
 *
 * Arguments:
 * step <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_gun_list
 *
 * Public: No
 */

if (!(GVAR(showMainPage) || GVAR(showGunList))) exitWith {};

[(GVAR(currentGun) + (count GVAR(gunList)) + _this) % (count GVAR(gunList)), true, true] call FUNC(change_gun);

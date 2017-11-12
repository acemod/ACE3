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
 * call ace_atragmx_fnc_cycle_scope_unit
 *
 * Public: No
 */
#include "script_component.hpp"

if (!(GVAR(showMainPage) || GVAR(showGunList))) exitWith {};

[(GVAR(currentGun) + (count GVAR(gunList)) + _this) % (count GVAR(gunList)), true, true] call FUNC(change_gun);

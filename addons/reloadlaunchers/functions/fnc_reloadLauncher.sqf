#include "script_component.hpp"
/*
 * Author: commy2, johnb43
 * Reload a launcher
 * If the ammo argument is nil, a full magazine will be given.
 *
 * Arguments:
 * 0: Unit to do the reloading <OBJECT>
 * 1: Target to rload <OBJECT>
 * 2: weapon name <STRING>
 * 3: missile name <STRING>
 * 4: Ammo count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "weapon", "missile"] call ace_reloadlaunchers_fnc_reloadLauncher
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine", "_ammo"];
TRACE_5("params",_unit,_target,_weapon,_magazine,_ammo);

// Add magazine to launcher immediately
_target addWeaponItem [_weapon, [_magazine, _ammo], true];

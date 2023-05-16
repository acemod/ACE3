#include "script_component.hpp"
/*
 * Author: commy2
 * Reload a launcher
 *
 * Arguments:
 * 0: Unit to do the reloading <OBJECT>
 * 1: Target to rload <OBJECT>
 * 2: weapon name <STRING>
 * 3: missile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "weapon", "missile"] call ace_reloadlaunchers_fnc_reloadLauncher
 *
 * Public: No
 */

params ["_unit","_target","_weapon","_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

_target selectWeapon _weapon;

if (currentWeapon _target != _weapon) exitWith {};
if (currentMagazine _target != "") exitWith {};

_target addWeaponItem [_weapon, _magazine, true];

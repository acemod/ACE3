/*
 * Author: commy2
 * Reload a launcher
 *
 * Arguments:
 * 0: Unit to do the reloading (Object)
 * 1: Target to rload (Object)
 * 2: weapon name (String)
 * 3: missile name (String)
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_target","_weapon","_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

_target selectWeapon _weapon;

if (currentWeapon _target != _weapon) exitWith {};
if (currentMagazine _target != "") exitWith {};

// command is wip, reload time for launchers is not intended.
_target addWeaponItem [_weapon, _magazine]; 

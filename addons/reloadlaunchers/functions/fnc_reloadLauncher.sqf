/*
 * Author: commy2
 *
 * Reload a launcher
 *
 * Argument:
 * 0: Unit to do the reloading (Object)
 * 1: Target to rload (Object)
 * 2: weapon name (String)
 * 3: missile name (String)
 *
 * Return value:
 * NONE
 */
#include "script_component.hpp"

PARAMS_4(_unit,_target,_weapon,_magazine);

_target selectWeapon _weapon;

if (currentWeapon _target != _weapon) exitWith {};
if (currentMagazine _target != "") exitWith {};

// command is wip, reload ACE_time for launchers is not intended.
_target addWeaponItem [_weapon, _magazine]; 

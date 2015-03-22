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

private ["_unit", "_weapon", "_magazine"];

_unit = _this select 0;
_target = _this select 1;
_weapon = _this select 2;
_magazine = _this select 3;

_target selectWeapon _weapon;

if (currentWeapon _target != _weapon) exitWith {};
if (currentMagazine _target != "") exitWith {};

// command is wip, reload time for launchers is not intended.
_target addWeaponItem [_weapon, _magazine]; 

/*
 * Author: commy2
 *
 * Reload a launcher
 *
 * Argument:
 * 0: Unit to reload (Object)
 * 1: weapon name (String)
 * 2: missile name (String)
 *
 * Return value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_weapon", "_magazine"];

_unit = _this select 0;
_weapon = _this select 1;
_magazine = _this select 2;

_unit selectWeapon _weapon;

if (currentWeapon _unit != _weapon) exitWith {};
if (currentMagazine _unit != "") exitWith {};

// command is wip, reload time for launchers is not intended.
_unit addWeaponItem [_weapon, _magazine]; 

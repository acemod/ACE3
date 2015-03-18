/*
 * Author: commy2
 *
 * Check of the unit can reload the launcher of target unit.
 *
 * Argument:
 * 0: Unit to do the reloading (Object)
 * 1: Unit eqipped with launcher (Object)
 *
 * Return value:
 * NONE
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

if (!alive _target) exitWith {false};
if !([_unit, _target, []] call EFUNC(common,canInteractWith)) exitWith {false};

private "_weapon";
_weapon = secondaryWeapon _unit;

// has secondary weapon equipped
if (_weapon == "" || {currentWeapon _target != _weapon}) exitWith {false};

// check if the target really needs to be reloaded
if (currentMagazine _target != "") exitWith {false};

// check if the launcher is compatible
if (getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(enabled)) == 0) exitWith {false};

// check if the reloader has a magazine compatible with targets launcher
count ([_unit, _weapon] call FUNC(getLoadableMissiles)) > 0

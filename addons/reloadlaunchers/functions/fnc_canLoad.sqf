#include "script_component.hpp"
/*
 * Author: commy2
 * Check of the unit can reload the launcher of target unit.
 *
 * Arguments:
 * 0: Unit to do the reloading <OBJECT>
 * 1: Unit eqipped with launcher <OBJECT>
 * 2: weapon name <STRING>
 * 3: missile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "weapon", "missile"] call ace_reloadlaunchers_fnc_canLoad
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

if (!alive _target) exitWith {false};
if (vehicle _target != _target) exitWith {false};
if !([_unit, _target, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

// target is awake
if (_target getVariable ["ACE_isUnconscious", false]) exitWith {false};

// has secondary weapon equipped
if !(_weapon in weapons _target) exitWith {false};

// check if the target really needs to be reloaded
if (count secondaryWeaponMagazine _target > 0) exitWith {false};

// check if the launcher is compatible
if (getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(enabled)) == 0) exitWith {false};

// check if the magazine compatible with targets launcher
_magazine in ([_unit, _weapon] call FUNC(getLoadableMissiles))

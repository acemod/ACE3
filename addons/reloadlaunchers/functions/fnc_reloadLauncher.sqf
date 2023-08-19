#include "script_component.hpp"
/*
 * Author: commy2
 * Reload a launcher for the unit who has the launcher.
 *
 * Arguments:
 * 0: Unit executing the reload <OBJECT>
 * 1: Unit equipped with the launcher <OBJECT>
 * 2: Launcher name <STRING>
 * 3: Missile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, "launch_RPG32_F", "RPG32_F"] call ace_reloadlaunchers_fnc_reloadLauncher
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

_target selectWeapon _weapon;

if (currentWeapon _target != _weapon) exitWith {};
if (currentMagazine _target != "") exitWith {};

_target addWeaponItem [_weapon, _magazine, true];

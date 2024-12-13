#include "..\script_component.hpp"
/*
 * Author: Timi007, Cplhardcore
 * Checks if target unit can accept given launcher.
 * Does not check if the launcher exists in the inventory of the player.
 *
 * Arguments:
 * 0: Unit that passes the launcher <OBJECT>
 * 1: Unit to pass the launcher to <OBJECT>
 * 2: launcher classname <STRING>
 *
 * Return Value:
 * Unit can pass launcher <BOOL>
 *
 * Example:
 * [_player, _target, "launch_NLAW_F"] call ace_interaction_fnc_canTakeLauncher
 *
 * Public: No
 */

params ["_player", "_target", "_launcher"];

if (!GVAR(enableLauncherTaking)) exitWith {false};
if (_launcher isEqualTo "") exitWith {false};
if ((!isNull objectParent _target) && {(vehicle _player) isNotEqualTo (vehicle _target)}) exitWith {false};
private _hasLauncher = secondaryWeapon _target;
if (_hasLauncher != "") exitWith {false};

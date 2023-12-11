#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Return all magazine types from reloader's inventory that are compatible with the given launcher.
 *
 * Arguments:
 * 0: Unit wanting to execute the reload <OBJECT>
 * 1: Launcher name <STRING>
 *
 * Return Value:
 * Reloable magazines <ARRAY>
 *
 * Example:
 * [player, "launch_RPG32_F"] call ace_reloadlaunchers_fnc_getLoadableMissiles
 *
 * Public: No
 */

params ["_unit", "_weapon"];
TRACE_2("params",_unit,_weapon);

// Look for primary muzzle magazines only
(compatibleMagazines [_weapon, "this"]) arrayIntersect (magazines _unit)

#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Whether or not we should adjust the HUD element down.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Turret Path <ARRAY> (default: Driver turret)
 *
 * Return Value:
 * Whether or not to adjust hud <BOOL>
 *
 * Example:
 * [player, player, [0]] call ace_missile_hud_fnc_shouldAdjustHud
 *
 * Public: No
 */
params ["_player", "_vehicle", ["_turretPath", [-1]]];

private _adjustDown = false;
// Flares display will block ours, if present just move ours down a bit
{
    if ((getText (configFile >> "CfgWeapons" >> _x >> "simulation")) == "cmlauncher") exitWith {_adjustDown = true};
} forEach (_vehicle weaponsTurret _turretPath);

_adjustDown

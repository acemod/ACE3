/*
 * Author: Commy2
 * Swap barrel callback
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_swapBarrelCallback
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_player", "_weapon"];
TRACE_2("params",_player,_weapon);

// Barrel mount gesture
_player playAction QGVAR(GestureMountMuzzle);
playSound "ACE_BarrelSwap";

private _temp = _player getVariable [format [QGVAR(%1_temp), _weapon], 0];
private _barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

// Instruct the server to load the coolest spare barrel into the weapon and
// store the removed barrel with the former weapon temperature. The server
// also updates the current weapon temperature to match that of the new
// loaded barrel.
["spareBarrelsLoadCoolest", [_player, _weapon, _temp, _barrelMass]] call EFUNC(common,serverEvent);

// Store the update time
_player setVariable [format [QGVAR(%1_time), _weapon], ACE_time];

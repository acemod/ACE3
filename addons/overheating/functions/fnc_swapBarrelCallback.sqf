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
#include "script_component.hpp"

params ["_player", "_weapon"];
TRACE_2("params",_player,_weapon);

// Barrel mount gesture
_player playAction QGVAR(GestureMountMuzzle);
playSound "ACE_BarrelSwap";

// don't consume the barrel, but rotate through them.
[localize LSTRING(SwappedBarrel), QUOTE(PATHTOF(UI\spare_barrel_ca.paa))] call EFUNC(common,displayTextPicture);

// Publish the temperature variable
_player setVariable [format [QGVAR(%1_temp), _weapon], 0, true];
// Store the update time
_player setVariable [format [QGVAR(%1_time), _weapon], ACE_time];

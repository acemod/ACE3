#include "script_component.hpp"
/*
 * Author: veteran29
 * Check if the player can check his own ammo.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Can check ammo <BOOL>
 *
 * Example:
 * [cursorObject] call ace_reload_fnc_canCheckAmmoSelf
 *
 * Public: No
 */

params ["_player"];

_player call CBA_fnc_canUseWeapon && {!((vehicle _player) isKindOf "StaticWeapon")}

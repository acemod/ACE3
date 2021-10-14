#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Checks if the player can pickup an intel object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Can pickup <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_intelitems_fnc_canPickup
 *
 * Public: No
 */

params ["_object", "_player"];

private _magazineClass = getText (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(magazine));

_magazineClass != "" && {_player canAdd _magazineClass}

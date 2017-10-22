/*
 * Author: TCVM
 * Checks if the player can unload ammo from the CSW
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * Can Unload Ammo <BOOL>
 *
 * Example:
 * [CSW] call ace_csw_fnc_canUnloadAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params["_csw"];

count (magazines _csw) > 0

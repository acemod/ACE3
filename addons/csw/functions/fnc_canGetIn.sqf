/*
 * Author: TCVM
 * Checks if the player can get in the weapon
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_canGetIn
 *
 * Public: No
 */
#include "script_component.hpp"

params["_weapon"];

alive _weapon && (((crew _weapon) isEqualTo [] || {!(alive (gunner _weapon))}))


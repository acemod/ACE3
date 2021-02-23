#include "script_component.hpp"
/*
 * Author: veteran29
 * Checks if player can wipe goggles.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can wipe goggles <BOOL>
 *
 * Example:
 * [] call ace_goggles_fnc_canWipeGlasses
 *
 * Public: No
 */

GVAR(effects) in [2, 3] && {!GETVAR(ACE_player,ACE_isUnconscious,false)} // return

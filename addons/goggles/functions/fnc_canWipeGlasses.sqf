#include "script_component.hpp"
/*
 * Author: veteran29
 * Checks if player can wipe goggles.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Can goggles be wiped <BOOL>
 *
 * Example:
 * [] call ace_goggles_fnc_canWipeGlasses
 *
 * Public: No
 */

// Can only wipe if full effects setting is set
if (GVAR(effects) != 2) exitWith {false};

!GETVAR(ACE_player,ACE_isUnconscious,false) // return

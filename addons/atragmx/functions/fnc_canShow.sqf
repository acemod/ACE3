/*
 * Authors: Ruthberg
 * Tests if the ATragMX can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow (bool)
 *
 * Example:
 * call ace_atragmx_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

("ACE_ATragMX" in (uniformItems ACE_player)) || ("ACE_ATragMX" in (vestItems ACE_player)) && !(underwater ACE_player);

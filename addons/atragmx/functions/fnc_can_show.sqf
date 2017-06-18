/*
 * Authors: Ruthberg
 * Tests if the ATragMX dialog can be shown
 *
 * Arguments:
 * None
 *
 * Return Value:
 * can_show <BOOL>
 *
 * Example:
 * call ace_atragmx_fnc_can_show
 *
 * Public: No
 */
#include "script_component.hpp"

(("ACE_ATragMX" in (uniformItems ACE_player)) || ("ACE_ATragMX" in (vestItems ACE_player))) && !(underwater ACE_player);

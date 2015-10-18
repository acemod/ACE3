/*
 * Authors: Ruthberg
 * Tests if the Kestrel 4500 can be shown
 *
 * Arguments:
 * None
 *
 * Return Value:
 * canShow <BOOL>
 *
 * Example:
 * call ace_kestrel4500_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

("ACE_Kestrel4500" in (uniformItems ACE_player)) || ("ACE_Kestrel4500" in (vestItems ACE_player))

/*
 * Authors: Ruthberg
 * Tests if the Range Card copy can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow (bool)
 *
 * Example:
 * [] call ace_rangecard_fnc_canShowCopy
 *
 * Public: No
 */
#include "script_component.hpp"

(GVAR(ammoClassCopy) != "" && GVAR(magazineClassCopy) != "" && GVAR(weaponClassCopy) != "" && !GVAR(RangeCardOpened) && !(underwater ACE_player) && ("ACE_RangeCard" in (uniformItems ACE_player)) || ("ACE_RangeCard" in (vestItems ACE_player)))

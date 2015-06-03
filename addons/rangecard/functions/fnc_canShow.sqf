/*
 * Authors: Ruthberg
 * Tests if the Range Card can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow (bool)
 *
 * Example:
 * [] call ace_rangecard_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

(GVAR(ammoClass) != "" && GVAR(magazineClass) != "" && GVAR(weaponClass) != "" && !GVAR(RangeCardOpened) && !(underwater ACE_player) && ("ACE_RangeCard" in (uniformItems ACE_player)) || ("ACE_RangeCard" in (vestItems ACE_player)))

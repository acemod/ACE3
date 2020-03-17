#include "script_component.hpp"
/*
 * Authors: Ruthberg
 * Tests if the Range Card copy can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow <BOOL>
 *
 * Example:
 * [] call ace_rangecard_fnc_canShowCopy
 *
 * Public: No
 */

GVAR(ammoClassCopy) != "" &&
GVAR(magazineClassCopy) != "" &&
GVAR(weaponClassCopy) != "" &&
!GVAR(RangeCardOpened) &&
"ACE_RangeCard" in ([ACE_player] call EFUNC(common,uniqueItems))

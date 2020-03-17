#include "script_component.hpp"
/*
 * Authors: Ruthberg
 * Tests if the Range Card can be shown
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * canShow <BOOL>
 *
 * Example:
 * [] call ace_rangecard_fnc_canShow
 *
 * Public: No
 */

GVAR(ammoClass) != "" &&
GVAR(magazineClass) != "" &&
GVAR(weaponClass) != "" &&
!GVAR(RangeCardOpened) &&
"ACE_RangeCard" in ([ACE_player] call EFUNC(common,uniqueItems))

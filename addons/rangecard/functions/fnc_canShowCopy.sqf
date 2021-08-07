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
 {GVAR(magazineClassCopy) != ""} &&
 {GVAR(weaponClassCopy) != ""} &&
 {!GVAR(RangeCardOpened)} &&
 {[_player, "ACE_RangeCard"] call EFUNC(common,hasItem)}

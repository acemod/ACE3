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
{GVAR(magazineClass) != ""} &&
{GVAR(weaponClass) != ""} &&
{!GVAR(RangeCardOpened)} &&
{[_player, "ACE_RangeCard"] call EFUNC(common,hasItem)}

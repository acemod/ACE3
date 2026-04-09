#include "..\script_component.hpp"
/*
 * Authors: Ruthberg
 * Checks if the range card can be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can show? <BOOL>
 *
 * Example:
 * [] call ace_rangecard_fnc_canShow
 *
 * Public: No
 */

!GVAR(rangeCardOpened) && {[ACE_player, "ACE_RangeCard"] call EFUNC(common,hasItem)} // return

#include "..\script_component.hpp"
/*
 * Authors: Ruthberg
 * Checks if the range card copy can be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can show? <BOOL>
 *
 * Example:
 * [] call ace_rangecard_fnc_canShowCopy
 *
 * Public: No
 */

!GVAR(rangeCardOpened) && {GVAR(rangeCardCopyInfo) isNotEqualTo []} && {[ACE_player, "ACE_RangeCard"] call EFUNC(common,hasItem)} // return

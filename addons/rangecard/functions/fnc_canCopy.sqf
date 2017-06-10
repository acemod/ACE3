/*
 * Authors: Ruthberg
 * Checks if the target has a copyable range card
 *
 * Arguments:
 * unit <OBJECT>
 *
 * Return Value:
 * canShow <BOOL>
 *
 * Example:
 * [bob] call ace_rangecard_fnc_canCopy
 *
 * Public: No
 */
#include "script_component.hpp"

((primaryWeapon _this) != "" && [_this] call EFUNC(common,isPlayer) && [_this, "ACE_RangeCard"] call EFUNC(common,hasItem))

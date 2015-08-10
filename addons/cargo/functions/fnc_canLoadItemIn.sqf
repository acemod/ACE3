/*
 * Author: Glowbal
 * Check if item can be loaded into other Object
 *
 * Arguments:
 * 0: Any object <OBJECT>
 * 1: Object <OBJECT>
 *
 * Return value:
 * Can load in <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_item", "_vehicle"];

if (speed _vehicle > 1 || (((getPos _vehicle) select 2) > 3)) exitwith {false};

private "_itemSize";
_itemSize = ([_item] call FUNC(getSizeItem));
_itemSize > 0 && {alive _item && alive _vehicle} && {(_item distance _vehicle <= MAX_LOAD_DISTANCE)} && {_itemSize <= ([_vehicle] call FUNC(getCargoSpaceLeft))};

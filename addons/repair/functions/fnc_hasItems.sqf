#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if the engineer has all items.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Items required <ARRAY>
 *
 * Return Value:
 * Has Items <BOOL>
 *
 * Example:
 * [engineer, [items]] call ace_repair_fnc_hasItems
 *
 * Public: Yes
 */

params ["_unit", "_items"];
TRACE_2("params",_unit,_items);

[_unit, _items] call EFUNC(common,hasItem);

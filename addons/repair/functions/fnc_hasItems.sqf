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
#include "script_component.hpp"

params ["_unit", "_items"];
TRACE_2("params",_unit,_items);

private ["_return"];

_return = true;
{
    if (typeName _x == "ARRAY" && {({[_unit, _x] call EFUNC(common,hasItem)} count _x == 0)}) exitwith {
        _return = false;
    };
    if (typeName _x == "STRING" && {!([_unit, _x] call EFUNC(common,hasItem))}) exitwith {
        _return = false;
    };
} forEach _items;

_return;

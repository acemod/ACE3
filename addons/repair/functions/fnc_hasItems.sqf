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

private _return = true;
{
    if ((_x isEqualType []) && {({[_unit, _x] call EFUNC(common,hasItem)} count _x == 0)}) exitWith {
        _return = false;
    };
    if ((_x isEqualType "") && {!([_unit, _x] call EFUNC(common,hasItem))}) exitWith {
        _return = false;
    };
} forEach _items;

_return;

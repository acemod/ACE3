/*
 * Author: Glowbal
 * Check if the engineer has all items.
 *
 * Arguments:
 * 0: Engineer <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY<STRING>>
 *
 * ReturnValue:
 * Has the items <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_engineer", "_items"];
TRACE_2("params",_engineer,_items);

private ["_return"];

_return = true;
{
    if (typeName _x == "ARRAY" && {({[_engineer, _x] call EFUNC(common,hasItem)} count _x == 0)}) exitwith {
        _return = false;
    };
    if (typeName _x == "STRING" && {!([_engineer, _x] call EFUNC(common,hasItem))}) exitwith {
        _return = false;
    };
} forEach _items;

_return;

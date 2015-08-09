/*
 * Author: Glowbal
 * Use Equipment items if any is available.
 *
 * Arguments:
 * 0: Engineer <OBJECT>
 * 1: Items <ARRAY<STRING>>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_engineer", "_items"];
TRACE_2("params",_engineer,_items);

private ["_itemUsedInfo", "_itemsUsedBy"];

_itemsUsedBy = [];
{
    // handle a one of type use item
    if (typeName _x == "ARRAY") then {
        {
            _itemUsedInfo = [_engineer, _x] call FUNC(useItem);
            if (_itemUsedInfo select 0) exitwith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
        } forEach _x;
    };

    // handle required item
    if (typeName _x == "STRING") then {
        _itemUsedInfo = [_engineer, _x] call FUNC(useItem);
        if (_itemUsedInfo select 0) exitwith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
    };
} forEach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

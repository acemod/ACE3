/*
 * Author: Glowbal
 * Use Equipment items if any is available.
 *
 * Arguments:
 * 0: Engineer <OBJECT>
 * 2: Items <ARRAY<STRING>>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_engineer", "_patient", "_items", "_itemUsedInfo", "_itemsUsedBy"];
_engineer = _this select 0;
_items = _this select 1;

_itemsUsedBy = [];
{
    // handle a one of type use item
    if (typeName _x == "ARRAY") then {
        {
            _itemUsedInfo = [_engineer, _x] call FUNC(useItem);
            if (_itemUsedInfo select 0) exitwith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
        }foreach _x;
    };

    // handle required item
    if (typeName _x == "STRING") then {
        _itemUsedInfo = [_engineer, _x] call FUNC(useItem);
        if (_itemUsedInfo select 0) exitwith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
    };
}foreach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

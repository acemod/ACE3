/*
 * Author: Glowbal
 * Use Equipment items if any is available.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item classnames <ARRAY>
 *
 * Return Value:
 * [Had Item to Use <BOOL>, Array of units that used the items <ARRAY>] <ARRAY>
 *
 * Example:
 * [unit, ["classname1", "classname2"]] call ace_repair_fnc_useItems
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_items"];
TRACE_2("params",_unit,_items);

private _itemsUsedBy = [];
{
    // handle a one of type use item
    if (_x isEqualType []) then {
        {
            private _itemUsedInfo = [_unit, _x] call FUNC(useItem);
            if (_itemUsedInfo select 0) exitWith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
        } forEach _x;
    };

    // handle required item
    if (_x isEqualType "") then {
        private _itemUsedInfo = [_unit, _x] call FUNC(useItem);
        if (_itemUsedInfo select 0) exitWith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
    };
} forEach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

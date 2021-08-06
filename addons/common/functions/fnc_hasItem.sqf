#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if unit has item. Note: case-sensitive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item Classname <STRING or ARRAY of STRING>
 *
 * Return Value:
 * Unit has Item <BOOL>
 *
 * Example:
 * [bob, "item"] call ace_common_fnc_hasItem
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_item", "", ["", [""]]]];

if (_item isEqualType "") then {
    _item = [_item];
};

private _return = false;
private _unitItems = _unit call EFUNC(common,uniqueItems);
{
    _return = _x in _unitItems;
    if (!_return) then {break};
} forEach _item;

_return

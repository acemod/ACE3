/*
 * Author: Glowbal
 * Use Equipment items if any is available. Priority: 1) Medic, 2) Patient. If in vehicle: 3) Crew
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY<STRING>>
 *
 * ReturnValue:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_medic", "_patient", "_items", "_itemUsedInfo", "_itemsUsedBy"];
params ["_medic", "_patient", "_items"];

_itemsUsedBy = [];
{
    // handle a one of type use item
    if (typeName _x == "ARRAY") then {
        {
            _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);
            if (_itemUsedInfo select 0) exitWith { _itemsUsedBy pushBack [(_itemUsedInfo select 1), _x]};
        } forEach _x;
    };

    // handle required item
    if (typeName _x == "STRING") then {
        _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);
        if (_itemUsedInfo select 0) exitWith { _itemsUsedBy pushBack [(_itemUsedInfo select 1), _x]};
    };
} forEach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

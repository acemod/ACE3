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
    if (_x isEqualType []) then {
        {
            _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);
            if (_itemUsedInfo select 0) exitwith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
        } foreach _x;
    };

    // handle required item
    if (_x isEqualType "") then {
        _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);
        if (_itemUsedInfo select 0) exitwith { _itemsUsedBy pushback [(_itemUsedInfo select 1), _x]};
    };
} foreach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

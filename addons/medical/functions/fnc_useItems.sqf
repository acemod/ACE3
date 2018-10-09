#include "script_component.hpp"
/*
 * Author: Glowbal
 * Use Equipment items if any is available. Priority: 1) Medic, 2) Patient. If in vehicle: 3) Crew
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, patient, ["bandage"]] call ace_medical_fnc_useItems
 *
 * Public: Yes
 */

params ["_medic", "_patient", "_items"];

private _itemsUsedBy = [];
{
    // handle a one of type use item
    if (_x isEqualType []) then {
        {
            private _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);
            if (_itemUsedInfo select 0) exitWith { _itemsUsedBy pushBack [(_itemUsedInfo select 1), _x]};
        } forEach _x;
    };

    // handle required item
    if (_x isEqualType "") then {
        private _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);
        if (_itemUsedInfo select 0) exitWith { _itemsUsedBy pushBack [(_itemUsedInfo select 1), _x]};
    };
} forEach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

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
 * 0: success <BOOL>
 * 1: Unit <OBJECT>
 *
 * Example:
 * [unit, patient, ["bandage"]] call ace_medical_treatment_fnc_useItems
 *
 * Public: No
 */

#define HAS_USED_ITEM(itemUsedInfo)    (itemUsedInfo select 0)
#define GET_ITEM_USED_BY(itemUsedInfo) (itemUsedInfo select 1)

params ["_medic", "_patient", "_items"];

private _itemsUsedBy = [];

{
    // handle a one of type use item
    if (_x isEqualType []) then {
        {
            private _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);

            if (HAS_USED_ITEM(_itemUsedInfo)) exitWith {
                _itemsUsedBy pushBack [GET_ITEM_USED_BY(_itemUsedInfo), _x];
            };
        } forEach _x;
    };

    // handle required item
    if (_x isEqualType "") then {
        private _itemUsedInfo = [_medic, _patient, _x] call FUNC(useItem);

        if (HAS_USED_ITEM(_itemUsedInfo)) exitWith {
            _itemsUsedBy pushBack [GET_ITEM_USED_BY(_itemUsedInfo), _x];
        };
    };
} forEach _items;

[count _items == count _itemsUsedBy, _itemsUsedBy];

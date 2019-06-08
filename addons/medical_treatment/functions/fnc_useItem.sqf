#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Uses one of the treatment items. Respects the priority defined by the allowSharedEquipment setting.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY>
 *
 * Return Value:
 * User and Item <ARRAY>
 *
 * Example:
 * [player, cursorObject, ["bandage"]] call ace_medical_treatment_fnc_useItems
 *
 * Public: No
 */

params ["_medic", "_patient", "_items"];

scopeName "Main";

private _useOrder = [[_patient, _medic], [_medic, _patient], [_medic]] select GVAR(allowSharedEquipment);

{
    private _unit      = _x;
    private _unitItems = _x call EFUNC(common,uniqueItems);

    {
        if (_x in _unitItems) then {
            _unit removeItem _x;
            [_unit, _x] breakOut "Main";
        };
    } forEach _items;
} forEach _useOrder;

[objNull, ""]

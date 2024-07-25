#include "..\script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Checks if one of the given items are present between the medic and patient.
 * Does not respect the priority defined by the allowSharedEquipment setting.
 * Will check medic first and then patient if shared equipment is allowed.
 * If medic or patient are in a vehicle then vehicle's inventory will also be checked.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Items <ARRAY>
 *
 * Return Value:
 * Has Item <BOOL>
 *
 * Example:
 * [player, cursorObject, ["ACE_fieldDressing"]] call ace_medical_treatment_fnc_hasItem
 *
 * Public: No
 */

params ["_medic", "_patient", "_items"];

private _fnc_checkItems = {
    params ["_unit"];

    private _unitItems = [_unit, 1] call EFUNC(common,uniqueItems);
    private _unitVehicle = objectParent _unit;
    if (!isNull _unitVehicle) then {
        _unitItems append (itemCargo _unitVehicle);
        _unitItems append (magazineCargo _unitVehicle);
    };
    _items findIf {_x in _unitItems} != -1
};

_medic call _fnc_checkItems || {GVAR(allowSharedEquipment) != 2 && {_patient call _fnc_checkItems}}

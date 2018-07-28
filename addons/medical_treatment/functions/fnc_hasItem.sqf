/*
 * Author: Glowbal
 * Check if the item is present between the patient and the medic
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Item <STRING>
 *
 * Return Value:
 * Has the items <BOOL>
 *
 * Example:
 * [bob, patient, "bandage"] call ACE_medical_treatment_fnc_hasItem
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_medic", "_patient", "_item"];

if (isNil QEGVAR(medical,setting_allowSharedEquipment)) then {
    EGVAR(medical,setting_allowSharedEquipment) = true;
};

if (EGVAR(medical,setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitWith {
    true
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitWith {
    true
};

private _hasItem = false;

if (vehicle _medic != _medic && {vehicle _medic call FUNC(isMedicalVehicle)}) then {
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {[_x, _item] call EFUNC(common,hasItem)}) exitWith {
            _hasItem = true;
        };
    } forEach crew vehicle _medic;
};

_hasItem

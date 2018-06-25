#include "script_component.hpp"
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
 * None
 *
 * Example:
 * [bob, patient, "bandage"] call ace_medical_fnc_hasItem
 *
 * Public: Yes
 */

params ["_medic", "_patient", "_item"];

if (isNil QGVAR(setting_allowSharedEquipment)) then {
    GVAR(setting_allowSharedEquipment) = true;
};
if (GVAR(setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitWith {
    true
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitWith {
    true
};

private _return = false;
if ((vehicle _medic != _medic) && {[vehicle _medic] call FUNC(isMedicalVehicle)}) then {
    private _crew = crew vehicle _medic;
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitWith {
            _return = true;
        };
    } forEach _crew;
};

_return

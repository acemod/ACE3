/*
 * Author: Glowbal
 * Check if the item is present between the patient and the medic
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Item <STRING>
 *
 * ReturnValue:
 * <NIL>
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

private _return = false;
if ((vehicle _medic != _medic) && {[vehicle _medic] call EFUNC(medical,isMedicalVehicle)}) then {
    private _crew = crew vehicle _medic;
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitWith {
            _return = true;
        };
    } forEach _crew;
};

_return

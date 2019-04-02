#include "script_component.hpp"
/*
 * Author: Glowbal
 * Use Equipment if any is available. Priority: 1) Medic, 2) Patient. If in vehicle: 3) Crew
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Item <STRING>
 *
 * ReturnValue:
 * 0: success <BOOL>
 * 1: Unit <OBJECT>
 *
 * Public: No
 */

params ["_medic", "_patient", "_item"];

if (isNil QEGVAR(medical,setting_allowSharedEquipment)) then {
    EGVAR(medical,setting_allowSharedEquipment) = true;
};

if (EGVAR(medical,setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitWith {
    ["ace_useItem", [_patient, _item], _patient] call CBA_fnc_targetEvent;
    [true, _patient]
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitWith {
    ["ace_useItem", [_medic, _item], _medic] call CBA_fnc_targetEvent;
    [true, _medic]
};

private _return = [false, objNull];

if (vehicle _medic != _medic && {vehicle _medic call FUNC(isMedicalVehicle)}) then {
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {[_x, _item] call EFUNC(common,hasItem)}) exitWith {
            ["ace_useItem", [_x, _item], _x] call CBA_fnc_targetEvent;
            _return = [true, _x];
        };
    } forEach crew vehicle _medic;
};

_return

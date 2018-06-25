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
 * Return Value:
 * 0: success <BOOL>
 * 1: Unit <OBJECT>
 *
 * Example:
 * [unit, patient, "bandage"] call ace_repair_fnc_useItem
 *
 * Public: Yes
 */

params ["_medic", "_patient", "_item"];

if (isNil QGVAR(setting_allowSharedEquipment)) then {
    GVAR(setting_allowSharedEquipment) = true;
};

if (GVAR(setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitWith {
    if (local _patient) then {
        ["ace_useItem", [_patient, _item]] call CBA_fnc_localEvent;
    } else {
        ["ace_useItem", [_patient, _item], _patient] call CBA_fnc_targetEvent;
    };
    [true, _patient];
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitWith {
    if (local _medic) then {
        ["ace_useItem", [_medic, _item]] call CBA_fnc_localEvent;
    } else {
        ["ace_useItem", [_medic, _item], _medic] call CBA_fnc_targetEvent;
    };
    [true, _medic];
};

private _return = [false, objNull];
if ([vehicle _medic] call FUNC(isMedicalVehicle) && {vehicle _medic != _medic}) then {
    private _crew = crew vehicle _medic;
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitWith {
            _return = [true, _x];
            if (local _x) then {
                ["ace_useItem", [_x, _item]] call CBA_fnc_localEvent;
            } else {
                ["ace_useItem", [_x, _item], _x] call CBA_fnc_targetEvent;
            };
        };
    } forEach _crew;
};

_return

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
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_medic", "_patient", "_item", "_return","_crew"];
_medic = _this select 0;
_patient = _this select 1;
_item = _this select 2;

if (isnil QGVAR(setting_allowSharedEquipment)) then {
    GVAR(setting_allowSharedEquipment) = true;
};

if (GVAR(setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitwith {
    if (local _patient) then {
        ["useItem", [_patient, _item]] call EFUNC(common,localEvent);
    } else {
        ["useItem", _patient, [_patient, _item]] call EFUNC(common,targetEvent);
    };

    [true, _patient];
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitwith {
    if (local _medic) then {
        ["useItem", [_medic, _item]] call EFUNC(common,localEvent);
    } else {
        ["useItem", _medic, [_medic, _item]] call EFUNC(common,targetEvent);
    };

    [true, _medic];
};

_return = [false, objNull];
if ([vehicle _medic] call FUNC(isMedicalVehicle) && {vehicle _medic != _medic}) then {
    _crew = crew vehicle _medic;
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitwith {
            _return = [true, _x];
            if (local _x) then {
                ["useItem", [_x, _item]] call EFUNC(common,localEvent);
            } else {
                ["useItem", _x, [_x, _item]] call EFUNC(common,targetEvent);
            };
        };
    }foreach _crew;
};

_return;

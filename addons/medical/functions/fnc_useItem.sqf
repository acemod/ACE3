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
 * Public: Yes
 */

#include "script_component.hpp"

private ["_return","_crew"];
params ["_medic", "_patient", "_item"];

if (isnil QGVAR(setting_allowSharedEquipment)) then {
    GVAR(setting_allowSharedEquipment) = true;
};

if (GVAR(setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitwith {
    [[_patient, _item], QUOTE(EFUNC(common,useItem)), _patient] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    [true, _patient];
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitwith {
    [[_medic, _item], QUOTE(EFUNC(common,useItem)), _medic] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    [true, _medic];
};

_return = [false, objNull];
if ([vehicle _medic] call FUNC(isMedicalVehicle) && {vehicle _medic != _medic}) then {
    _crew = crew vehicle _medic;
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitwith {
            _return = [true, _x];
            [[_x, _item], QUOTE(EFUNC(common,useItem)), _x] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
        };
    } foreach _crew;
};

_return

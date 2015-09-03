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

private ["_medic", "_patient", "_item", "_return", "_crew"];
_medic = _this select 0;
_patient = _this select 1;
_item = _this select 2;

if (isnil QGVAR(setting_allowSharedEquipment)) then {
    GVAR(setting_allowSharedEquipment) = true;
};
if (GVAR(setting_allowSharedEquipment) && {[_patient, _item] call EFUNC(common,hasItem)}) exitwith {
    true;
};

if ([_medic, _item] call EFUNC(common,hasItem)) exitwith {
    true;
};

_return = false;
if ((vehicle _medic != _medic) && {[vehicle _medic] call FUNC(isMedicalVehicle)}) then {
    _crew = crew vehicle _medic;
    {
        if ([_medic, _x] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitwith {
            _return = true;
        };
    }foreach _crew;
};

_return;

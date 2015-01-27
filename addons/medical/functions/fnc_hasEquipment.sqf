/**
 * fn_hasEquipment.sqf
 * @Descr: Check if the medic or patient have the right equipment for treatment.
 * @Author: Glowbal
 *
 * @Arguments: [medic OBJECT, patient OBJECT, item STRING (Classname of the item. Expects magazine type.)]
 * @Return: BOOL
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_medic", "_patient", "_item", "_return"];
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
if ([vehicle _medic] call FUNC(isMedicalVehicle) && {(vehicle _medic != _medic)}) then {
    _crew = crew vehicle _medic;
    {
        if ([_x, _medic] call FUNC(canAccessMedicalEquipment) && {([_x, _item] call EFUNC(common,hasItem))}) exitwith {
            _return = true;
        };
    }foreach _crew;
};

_return
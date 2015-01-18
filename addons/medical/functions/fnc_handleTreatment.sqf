/**
 * fnc_handleTreatment.sqf
 * @Descr: entry point for all treatment actions. Handles the syncronization between treatment actions and equipment usages. Will pass on the the treatment action to their category handlers.
 * When using an undefined category, the caller is responsible for cleaning up, including unlocking the treatment mutex.
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, target OBJECT, selectionName STRING, removeItem STRING, category STRING]
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"

diag_log format["handleTreatment has been called - args: %1 ",_this];
systemChat format["handleTreatment has been called - args: %1 ",_this];

private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem","_attributes","_patient", "_continue", "_prevAnim"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_category = _this select 4;

if (!local _caller) exitwith {
    [[_caller, _target, _selectionName, _removeItem, _category], QUOTE(FUNC(handleTreatment)), _caller] call EFUNC(common,execRemoteFnc);
    false;
};

if ([_caller] call FUNC(isSetTreatmentMutex)) exitwith {
    if (_caller == ACE_player) then {
        // display a message - currently occupied with treatment already
    };
    false
};
[_caller, true] call FUNC(treatmentMutex);

if (!([_caller, _target, _removeItem] call FUNC(hasEquipment)) && _removeItem != "") exitwith {
    [_caller,"release"] call FUNC(treatmentMutex);
};

// TODO make dynamic
switch (toLower _category) do {
    case "bandage": {
        ([_caller, _target, _selectionName, _removeItem] call FUNC(handleTreatment_Category_Bandaging));
    };
    case "medication": {
        ([_caller, _target, _selectionName, _removeItem] call FUNC(handleTreatment_Category_Medication));
    };
    case "advanced": {
        ([_caller, _target, _selectionName, _removeItem] call FUNC(handleTreatment_Category_Advanced));
    };
    case "airway": {
        ([_caller, _target, _selectionName, _removeItem] call FUNC(handleTreatment_Category_Airway));
    };
    default {
        // do not handle the request
        false;
    };
};

// Entry point for any un supported treatment actions.
// Expected to have one of the local events call the treatment completed event.
["Medical_performingTreatment", [_caller, _target, _selectionName, _removeItem, _category]] call ace_common_fnc_localEvent;

if ([_target] call FUNC(hasMedicalEnabled)) then {
    [_target] call FUNC(addToInjuredCollection);
};

true;
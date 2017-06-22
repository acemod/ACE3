/*
 * Author: Glowbal
 * Check if the treatment action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Selection name <STRING>
 * 3: ACE_Medical_Treatments Classname <STRING>
 *
 * Return Value:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorTarget, "Head", "SurgicalKit"] call ace_medical_fnc_canTreat
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className"];

if !(_target isKindOf "CAManBase") exitWith { false };

private _config = (ConfigFile >> "ACE_Medical_Actions" >> (["Basic", "Advanced"] select (GVAR(level)>=2)) >> _className);

if !(isClass _config) exitwith {false};

// Allow self treatment check
if (_caller == _target && {getNumber (_config >> "allowSelfTreatment") == 0}) exitwith {false};

private _medicRequired = if (isNumber (_config >> "requiredMedic")) then {
    getNumber (_config >> "requiredMedic");
} else {
    // Check for required class
    if (isText (_config >> "requiredMedic")) exitwith {
        missionNamespace getVariable [(getText (_config >> "requiredMedic")), 0]
    };
    0;
};
if !([_caller, _medicRequired] call FUNC(isMedic)) exitwith { false };

private _items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _target, _items] call FUNC(hasItems))}) exitwith { false };

private _allowedSelections = getArray (_config >> "allowedSelections");
if !("All" in _allowedSelections || {(_selectionName in _allowedSelections)}) exitwith { false };

private _return = true;
if (getText (_config >> "condition") != "") then {
    private _condition = getText (_config >> "condition");
    if (isnil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getVariable _condition;
    };
    if (_condition isEqualType false) then {
        _return = _condition;
    } else {
        _return = [_caller, _target, _selectionName, _className] call _condition;
    };
};
if (!_return) exitwith { false };

private _patientStateCondition = if (isText(_config >> "patientStateCondition")) then {
    missionNamespace getVariable [getText(_config >> "patientStateCondition"), 0]
} else {
    getNumber(_config >> "patientStateCondition")
};
if (_patientStateCondition == 1 && {!([_target] call FUNC(isInStableCondition))}) exitwith {false};

private _locations = getArray (_config >> "treatmentLocations");
if ("All" in _locations) exitwith { true };

private _medFacility = {([_caller] call FUNC(isInMedicalFacility)) || ([_target] call FUNC(isInMedicalFacility))};
private _medVeh = {([_caller] call FUNC(isInMedicalVehicle)) || ([_target] call FUNC(isInMedicalVehicle))};

{
    if (_x == "field") exitwith {_return = true;};
    if (_x == "MedicalFacility" && _medFacility) exitwith {_return = true;};
    if (_x == "MedicalVehicle" && _medVeh) exitwith {_return = true;};
    if !(isnil _x) exitwith {
        private _val = missionNamespace getVariable _x;
        if (_val isEqualType 0) then {
            _return = switch (_val) do {
                case 0: {true}; //AdvancedMedicalSettings_anywhere
                case 1: {call _medVeh}; //AdvancedMedicalSettings_vehicle
                case 2: {call _medFacility}; //AdvancedMedicalSettings_facility
                case 3: {(call _medFacility) || {call _medVeh}}; //AdvancedMedicalSettings_vehicleAndFacility
                default {false}; //Disabled
            };
        };
    };
} foreach _locations;

_return;

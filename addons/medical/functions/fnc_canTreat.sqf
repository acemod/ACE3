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
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorTarget, "Head", "SurgicalKit"] call ace_medical_fnc_canTreat
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_config", "_medicRequired", "_items", "_locations", "_return", "_condition", "_patientStateCondition", "_allowedSelections"];
params ["_caller", "_target", "_selectionName", "_className"];

if !(_target isKindOf "CAManBase") exitWith { false };


_config = (ConfigFile >> "ACE_Medical_Actions" >> (["Basic", "Advanced"] select (GVAR(level)>=2)) >> _className);

if !(isClass _config) exitWith {false};

// Allow self treatment check
if (_caller == _target && {getNumber (_config >> "allowSelfTreatment") == 0}) exitWith {false};

_medicRequired = if (isNumber (_config >> "requiredMedic")) then {
    getNumber (_config >> "requiredMedic");
} else {
    // Check for required class
    if (isText (_config >> "requiredMedic")) exitWith {
        missionNamespace getvariable [(getText (_config >> "requiredMedic")), 0]
    };
    0;
};
if !([_caller, _medicRequired] call FUNC(isMedic)) exitWith { false };

_items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _target, _items] call FUNC(hasItems))}) exitWith { false };

_allowedSelections = getArray (_config >> "allowedSelections");
if !("All" in _allowedSelections || {(_selectionName in _allowedSelections)}) exitWith { false };

_return = true;
if (getText (_config >> "condition") != "") then {
    _condition = getText (_config >> "condition");
    if (isNil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getvariable _condition;
    };
    if (typeName _condition == "BOOL") then {
        _return = _condition;
    } else {
        _return = [_caller, _target, _selectionName, _className] call _condition;
    };
};
if (!_return) exitWith { false };

_patientStateCondition = if (isText(_config >> "patientStateCondition")) then {
    missionNamespace getvariable [getText(_config >> "patientStateCondition"), 0]
} else {
    getNumber(_config >> "patientStateCondition")
};
if (_patientStateCondition == 1 && {!([_target] call FUNC(isInStableCondition))}) exitWith {false};

_locations = getArray (_config >> "treatmentLocations");
if ("All" in _locations) exitWith { true };

private [ "_medFacility", "_medVeh"];
_medFacility = {([_caller] call FUNC(isInMedicalFacility)) || ([_target] call FUNC(isInMedicalFacility))};
_medVeh = {([_caller] call FUNC(isInMedicalVehicle)) || ([_target] call FUNC(isInMedicalVehicle))};

{
    if (_x == "field") exitWith {_return = true;};
    if (_x == "MedicalFacility" && _medFacility) exitWith {_return = true;};
    if (_x == "MedicalVehicle" && _medVeh) exitWith {_return = true;};
    if !(isNil _x) exitWith {
        private "_val";
        _val = missionNamespace getvariable _x;
        if (typeName _val == "SCALAR") then {
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

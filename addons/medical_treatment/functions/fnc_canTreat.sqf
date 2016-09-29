/*
 * Author: Glowbal
 * Check if the treatment action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Selection name <STRING>
 * 3: ACE_Medical_Treatment Classname <STRING>
 *
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorTarget, "Head", "SurgicalKit"] call ace_medical_treatment_fnc_canTreat
 *
 * Public: Yes
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_caller", "_target", "_selectionName", "_className"];

if !(_target isKindOf "CAManBase") exitWith {false};

private _config = configFile >> QGVAR(Actions) >> CUR_LEVEL >> _className;

if !(isClass _config) exitwith {false};

// allow self treatment check
private _isSelf = _caller isEqualTo _target;

if (_isSelf && {getNumber (_config >> "allowSelfTreatment") == 0}) exitwith {false};

private _medicRequired = 0;

if (isNumber (_config >> "requiredMedic")) then {
    _medicRequired = getNumber (_config >> "requiredMedic");
} else {
    if (isText (_config >> "requiredMedic")) then {
        _medicRequired = missionNamespace getVariable [getText (_config >> "requiredMedic"), 0];
    };
};

if !([_caller, _medicRequired] call EFUNC(medical,isMedic)) exitWith {false};

// check selection
private _allowedSelections = getArray (_config >> "allowedSelections");

if !("All" in _allowedSelections || {(_selectionName in _allowedSelections)}) exitWith {false};

// check item
private _items = getArray (_config >> "items");

if (count _items > 0 && {!([_caller, _target, _items] call FUNC(hasItems))}) exitWith {false};

private _condition = true;

if (isText (_config >> "condition")) then {
    _condition = getText (_config >> "condition");

    if (_condition isEqualTo "") exitWith {
        _condition = true;
    };

    if (isNil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getVariable _condition;
    };

    if !(_condition isEqualType false) then {
        _condition = call _condition;
    };
};

if !(_condition) exitWith {false};

private _patientStateCondition = 0;

if (isNumber (_config >> "patientStateCondition")) then {
    _patientStateCondition = getNumber (_config >> "patientStateCondition");
} else {
    if (isText (_config >> "patientStateCondition")) then {
        _patientStateCondition = missionNamespace getVariable [getText (_config >> "patientStateCondition"), 0];
    };
};

if (_patientStateCondition == 1 && {!([_target] call EFUNC(medical,isInStableCondition))}) exitWith {false};

// check allowed locations
private _locations = getArray (_config >> "treatmentLocations");

if ("All" in _locations) then {
    _locations = true;
} else {
    private _medFacility = {([_caller] call EFUNC(medical,isInMedicalFacility)) || ([_target] call EFUNC(medical,isInMedicalFacility))};
    private _medVeh = {([_caller] call EFUNC(medical,isInMedicalVehicle)) || ([_target] call EFUNC(medical,isInMedicalVehicle))};

    {
        if (_x == "field") exitWith { _locations = true; };
        if (_x == "MedicalFacility" && _medFacility) exitWith { _locations = true; };
        if (_x == "MedicalVehicle" && _medVeh) exitWith { _locations = true; };
        if !(isNil _x) exitWith {
            _locations = missionNamespace getVariable _x;

            if !(_locations isEqualType false) then {
                if (_locations isEqualTo 0) exitWith { _locations = true; }; //AdvancedMedicalSettings_anywhere
                if (_locations isEqualTo 1) exitWith { _locations = call _medVeh; }; //AdvancedMedicalSettings_vehicle
                if (_locations isEqualTo 2) exitWith { _locations = call _medFacility; }; //AdvancedMedicalSettings_facility
                if (_locations isEqualTo 3) exitWith { _locations = call _medFacility || {call _medVeh}; }; //AdvancedMedicalSettings_vehicleAndFacility
                _locations = false; //Disabled
            };
        };
    } forEach _locations;
};

_locations

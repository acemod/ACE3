#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if the treatment action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorTarget, "Head", "SurgicalKit"] call ace_medical_treatment_fnc_canTreat
 *
 * Public: Yes
 */

params ["_caller", "_target", "_bodyPart", "_className"];

if !(_target isKindOf "CAManBase") exitWith {false};

private _config = configFile >> QGVAR(Actions) >> _className;

if !(isClass _config) exitWith {false};

// allow self treatment check
private _isSelf = _caller isEqualTo _target;
private _allowSelf = 0;

if (_isSelf) then {
    if (isNumber (_config >> "allowSelfTreatment")) then {
        _allowSelf = getNumber (_config >> "allowSelfTreatment");
    } else {
        if (isText (_config >> "allowSelfTreatment")) then {
            _allowSelf = missionNamespace getVariable [getText (_config >> "allowSelfTreatment"), 0];
        };
    };
};

if (_isSelf && {_allowSelf == 0}) exitWith {false};

private _medicRequired = 0;

if (isNumber (_config >> "requiredMedic")) then {
    _medicRequired = getNumber (_config >> "requiredMedic");
} else {
    if (isText (_config >> "requiredMedic")) then {
        _medicRequired = missionNamespace getVariable [getText (_config >> "requiredMedic"), 0];
    };
};

if !([_caller, _medicRequired] call FUNC(isMedic)) exitWith {false};

// check selection
private _allowedSelections = getArray (_config >> "allowedSelections") apply {toLower _x};

if !("all" in _allowedSelections || {(_bodyPart in _allowedSelections)}) exitWith {false};

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

// check allowed locations
private _locations = getArray (_config >> "treatmentLocations") apply {toLower _x};

if ("all" in _locations) then {
    _locations = true;
} else {
    private _medFacility = {([_caller] call FUNC(isInMedicalFacility)) || ([_target] call FUNC(isInMedicalFacility))};
    private _medVeh = {([_caller] call FUNC(isInMedicalVehicle)) || ([_target] call FUNC(isInMedicalVehicle))};

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

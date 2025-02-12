#include "..\script_component.hpp"
/*
 * Author: Dextro
 * Local Overdose evaluation and function
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Morphine"] call ace_medical_treatment_fnc_medicationLocal
 *
 * Public: No
 */

params ["_patient", "_classname"];

// Medication has no effects on dead units
if (!alive _patient && ACE_OverdoseCooldown <= 0) exitWith {};

// Get overDose from Config
private _defaultConfig = configFile >> QUOTE(ADDON) >> "Medication";
private _medicationConfig = _defaultConfig >> _classname;
private _maxDose = GET_NUMBER(_medicationConfig >> "maxDose",getNumber (_defaultConfig >> "maxDose"));

// Exit if not meds dont case overdose
if (_maxDose == 0) exitWith {};

// Add dose
private _string = ["ACE", _classname] joinString "_";
private _doseHistory = _patient getVariable [_string, []];
_doseHistory pushBackUnique [_string, CBA_MissionTime];

// Check and clean up for overdose
private _updatedHistory = [];
private _currentDose = 0; 
{
    private _medication = _x select 0;
    private _time = _x select 1;
    if (_medication find _classname >= 0 && CBA_MissionTime - _time <= ACE_OverdoseCooldown) then {
        _currentDose = _currentDose + 1;
        _updatedHistory pushBackUnique _x;
    };
} forEach _doseHistory;

// Check and execute overdose 
if (_currentDose > _maxDose) then {
    [QEGVAR(medical,CriticalVitals), _patient] call CBA_fnc_localEvent;
};

// Update dose
_patient setVariable [_string,_updatedHistory];
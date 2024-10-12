#include "..\script_component.hpp"
/*
 * Author: Cplhardcore
 * Handles the overdose effects of a medication.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication Treatment classname <STRING>
 * 2: Incompatable medication <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "morphine"] call ace_medical_treatment_fnc_overDose
 * Public: No
 */

params ["_unit", "_classname"];
private _medicationConfig = (configFile >> "ace_medical_treatment" >> _classname);
private _onOverDose = getText (_medicationConfig >> "onOverDose");

if (isClass (_medicationConfig)) then {
    _medicationConfig = (_medicationConfig >> _classname);
    if (isText (_medicationConfig >> "onOverDose")) then { 
        _onOverDose = getText (_medicationConfig >> "onOverDose"); 
    };
};
TRACE_2("overdose", _classname, _onOverDose);
if (_onOverDose == "") exitWith {
    TRACE_1("CriticalVitals Event", _unit);
    [QEGVAR(medical, CriticalVitals), _unit] call CBA_fnc_localEvent;
};
if (!isNil "_onOverDose" && {isText _onOverDose}) then {
    _onOverDose = compile _onOverDose;
} else {
    _onOverDose = missionNamespace getVariable _onOverDose;
};
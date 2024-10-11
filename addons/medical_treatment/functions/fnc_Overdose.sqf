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
 * [player, "morphine"] call ace_medical_treatment_fnc_OverDose
 * Public: No
 */

 params ["_unit", "_classname"];

private _medicationConfig = (configFile >> "ace_medical_treatment" >> "_classname");
private _onOverDose = getText (_medicationConfig >> "onOverDose");
if (isClass (_medicationConfig >> _className)) then {
     _medicationConfig = (_medicationConfig >> _className);
    if (isText (_medicationConfig  >> "onOverDose")) then { _onOverDose = getText (_medicationConfig >> "onOverDose"); };
};
TRACE_2("overdose",_classname,_onOverDose);
if (_onOverDose == "") exitWith {
    TRACE_1("CriticalVitals Event",_target); // make unconscious
    [QEGVAR(medical,CriticalVitals), _target] call CBA_fnc_localEvent;
};
if (isNil _onOverDose) then {
    _onOverDose = compile _onOverDose;
} else {
    _onOverDose = missionNamespace getVariable _onOverDose;
};
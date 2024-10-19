#include "..\script_component.hpp"
/*
 * Author: Cplhardcore
 * Handles the overdose effects of a medication.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication classname <STRING>
 * 2: Incompatible medication <ARRAY of STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "morphine"] call ace_medical_treatment_fnc_overDose
 * Public: No
 */

params ["_unit", "_classname"];

private _medicationConfig = configFile >> "ace_medical_treatment" >> "Medication";
private _onOverDose = getText (_medicationConfig >> "onOverDose");

if (isClass _medicationConfig) then {
    _medicationConfig = _medicationConfig >> _classname;
    if (isText (_medicationConfig >> "onOverDose")) then { 
        _onOverDose = getText (_medicationConfig >> "onOverDose"); 
    };
};
TRACE_2("overdose",_classname,_onOverDose);

if (_onOverDose == "") exitWith {
    TRACE_1("CriticalVitals Event",_unit);
    [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
};

if (isNil _onOverDose) then {
    _onOverDose = compile _onOverDose;
} else {
    _onOverDose = missionNamespace getVariable _onOverDose;
};

[_target, _className] call _onOverDose

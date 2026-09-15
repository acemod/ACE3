#include "..\script_component.hpp"
/*
 * Author: Cplhardcore
 * Handles the overdose effects of a medication.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Medication classname <STRING>
 * 2: Medication dosage <NUMBER>
 * 3: Overdose threshold <NUMBER>
 * 4: Incompatible medication that caused overdose (can be the medication itself) <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "morphine", 5, 3, "morphine"] call ace_medical_treatment_fnc_overDose
 *
 * Public: No
 */

params ["_unit", "_classname", "_dose", "_limit", "_incompatibleMed"];

private _medicationConfig = configFile >> QUOTE(ADDON) >> "Medication";
private _onOverDose = getText (_medicationConfig >> "onOverDose");

if (isClass _medicationConfig) then {
    _medicationConfig = _medicationConfig >> _classname;
    if (isText (_medicationConfig >> "onOverDose")) then {
        _onOverDose = getText (_medicationConfig >> "onOverDose");
    };
};
TRACE_2("overdose",_classname,_onOverDose);

[QEGVAR(medical,overdose), [_unit, _classname, _dose, _limit, _incompatibleMed]] call CBA_fnc_localEvent;

if (_onOverDose == "") exitWith {
    TRACE_1("CriticalVitals Event",_unit);
    [QEGVAR(medical,CriticalVitals), _unit] call CBA_fnc_localEvent;
};

_onOverDose = if (missionNamespace isNil _onOverDose) then {
    compile _onOverDose
} else {
    missionNamespace getVariable _onOverDose
};

[_unit, _classname, _dose, _limit, _incompatibleMed] call _onOverDose

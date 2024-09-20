#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication Treatment classname <STRING>
 * 2: Max dose (0 to ignore) <NUMBER>
 * 3: Max dose deviation <NUMBER>
 * 3: Incompatable medication <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "morphine", 4, 2, [["x", 1]]] call ace_medical_treatment_fnc_onMedicationUsage
 *
 * Public: No
 */

params ["_target", "_className", "_maxDose", "_maxDoseDeviation", "_incompatibleMedication"];
TRACE_5("onMedicationUsage",_target,_className,_maxDose,_maxDoseDeviation,_incompatibleMedication);

private _overdosedMedications = [];

// Check for overdose from current medication
if (_maxDose > 0) then {
    private _currentDose = [_target, _className] call EFUNC(medical_status,getMedicationCount);
    // Because both {floor random 0} and {floor random 1} return 0
    if (_maxDoseDeviation > 0) then {
        _maxDoseDeviation = _maxDoseDeviation + 1;
    };

    if (_currentDose > _maxDose + (floor random _maxDoseDeviation)) then {
        TRACE_1("exceeded max dose",_currentDose);
        _overdosedMedications pushBackUnique _className;
    };
};

// Check incompatible medication (format [med,limit])
{
    _x params ["_xMed", "_xLimit"];
    private _inSystem = [_target, _xMed] call EFUNC(medical_status,getMedicationCount);
    if (_inSystem> _xLimit) then {
        _overdosedMedications pushBackUnique _xMed;
    };
} forEach _incompatibleMedication;

if (_overdosedMedications isNotEqualTo []) then {
    private _medicationConfig = (configFile >> "ace_medical_treatment" >> "Medication");
    private _onOverDose = getText (_medicationConfig >> "onOverDose");
    if (isClass (_medicationConfig >> _className)) then {
        _medicationConfig = (_medicationConfig >> _className);
        if (isText (_medicationConfig  >> "onOverDose")) then { _onOverDose = getText (_medicationConfig >> "onOverDose"); };
    };
    TRACE_2("overdose",_overdosedMedications,_onOverDose);
    if (_onOverDose == "") exitWith {
        TRACE_1("CriticalVitals Event",_target); // make unconscious
        [QEGVAR(medical,CriticalVitals), _target] call CBA_fnc_localEvent;
    };
    if (isNil _onOverDose) then {
        _onOverDose = compile _onOverDose;
    } else {
        _onOverDose = missionNamespace getVariable _onOverDose;
    };
    [_target, _className, _overdosedMedications] call _onOverDose;
};

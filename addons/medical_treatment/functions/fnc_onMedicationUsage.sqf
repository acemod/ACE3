#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication Treatment classname <STRING>
 * 2: Max dosage <NUMBER>
 * 3: Incompatable medication <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "morphine", 4, [["x", 1]]] call ace_medical_treatment_fnc_onMedicationUsage
 *
 * Public: No
 */

params ["_target", "_className", "_maxDosage", "_incompatabileMeds"];
TRACE_4("onMedicationUsage",_target,_className,_maxDosage,_incompatabileMeds);

private _fnc_getMedicationCount = {
    params ["_target", "_medication"];
    private _return = 0;
    {
        _x params ["_xMed", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem"];
        if (_xMed == _medication) then {
            private _timeInSystem = CBA_missionTime - _timeAdded;
            _return = _return + linearConversion [_timeTillMaxEffect, _maxTimeInSystem, _timeInSystem, 1, 0, true];
        };
    } forEach (_target getVariable [VAR_MEDICATIONS, []]);
    TRACE_2("getMedicationCount",_medication,_return);
    _return
};

private _overdosedMedications = [];

// Check for overdose from current medication
private _currentDose = [_target, _className] call _fnc_getMedicationCount;
if (_currentDose >= floor (_maxDosage + round(random(2))) && {_maxDosage >= 1}) then {
    TRACE_1("exceeded max dose",_currentDose);
    _overdosedMedications pushBackUnique _className;
};

// Check incompatible medication (format [med,limit])
{
    _x params ["_xMed", "_xLimit"];
    private _inSystem = [_target, _xMed] call _fnc_getMedicationCount;
    if (_inSystem> _xLimit) then {
        _overdosedMedications pushBackUnique _xMed;
    };
} forEach _incompatabileMeds;

if ((count _overdosedMedications) > 0) then {
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

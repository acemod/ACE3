#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment class name <STRING>
 * 2: Injection Site Part Number <NUMBER>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [player, "Morphine", 2] call ace_medical_treatment_fnc_treatmentMedicationLocal
 *
 * Public: No
 */
#define MORPHINE_PAIN_SUPPRESSION 0.6

params ["_target", "_className", "_partIndex"];
TRACE_3("treatmentMedicationLocal",_target,_className,_partIndex);

if (!alive _target) exitWith {false};

if (!GVAR(advancedMedication)) exitWith {
    TRACE_1("MedicalSettingAdvancedMedication is:", GVAR(advancedMedication));
    if (_className == "Morphine") exitWith {
        private _painSupress = GET_PAIN_SUPPRESS(_target);
        _target setVariable [VAR_PAIN_SUPP, (_painSupress + MORPHINE_PAIN_SUPPRESSION) min 1, true];
    };
    if (_className == "Epinephrine") exitWith {
        [QEGVAR(medical,WakeUp), _target] call CBA_fnc_localEvent;
    };
};
TRACE_1("Running treatmentMedicationLocal with Advanced configuration for", _target);

private _tourniquets = GET_TOURNIQUETS(_target);

if (_tourniquets select _partIndex > 0) exitWith {
    TRACE_1("unit has tourniquets blocking blood flow on injection site",_tourniquets);
    private _delayedMedications = _target getVariable [QEGVAR(medical,occludedMedications), []];

    _delayedMedications pushBack _this;
    _target setVariable [QEGVAR(medical,occludedMedications), _delayedMedications, true];

    true
};

// Find the proper attributes for the used medication
private _medicationConfig = configFile >> QUOTE(ADDON) >> "Medication";
private _painReduce = getNumber (_medicationConfig >> "painReduce");
private _hrIncreaseLow = getArray (_medicationConfig >> "hrIncreaseLow");
private _hrIncreaseNorm = getArray (_medicationConfig >> "hrIncreaseNormal");
private _hrIncreaseHigh = getArray (_medicationConfig >> "hrIncreaseHigh");
private _timeInSystem = getNumber (_medicationConfig >> "timeInSystem");
private _timeTillMaxEffect = getNumber (_medicationConfig >> "timeTillMaxEffect");
private _maxDose = getNumber (_medicationConfig >> "maxDose");
private _viscosityChange = getNumber (_medicationConfig >> "viscosityChange");
private _inCompatableMedication = [];

if (isClass (_medicationConfig >> _className)) then {
    _medicationConfig = _medicationConfig >> _className;
    if (isNumber (_medicationConfig >> "painReduce")) then { _painReduce = getNumber (_medicationConfig >> "painReduce");};
    if (isArray (_medicationConfig >> "hrIncreaseLow")) then { _hrIncreaseLow = getArray (_medicationConfig >> "hrIncreaseLow"); };
    if (isArray (_medicationConfig >> "hrIncreaseNormal")) then { _hrIncreaseNorm = getArray (_medicationConfig >> "hrIncreaseNormal"); };
    if (isArray (_medicationConfig >> "hrIncreaseHigh")) then { _hrIncreaseHigh = getArray (_medicationConfig >> "hrIncreaseHigh"); };
    if (isNumber (_medicationConfig >> "timeInSystem")) then { _timeInSystem = getNumber (_medicationConfig >> "timeInSystem"); };
    if (isNumber (_medicationConfig >> "timeTillMaxEffect")) then { _timeTillMaxEffect = getNumber (_medicationConfig >> "timeTillMaxEffect"); };
    if (isNumber (_medicationConfig >> "maxDose")) then { _maxDose = getNumber (_medicationConfig >> "maxDose"); };
    if (isArray (_medicationConfig >> "inCompatableMedication")) then { _inCompatableMedication = getArray (_medicationConfig >> "inCompatableMedication"); };
    if (isNumber (_medicationConfig >> "viscosityChange")) then { _viscosityChange = getNumber (_medicationConfig >> "viscosityChange"); };
};

private _heartRate = GET_HEART_RATE(_target);
private _hrIncrease = [_hrIncreaseLow, _hrIncreaseNorm, _hrIncreaseHigh] select (floor ((0 max _heartRate min 110) / 55));
_hrIncrease params ["_minIncrease", "_maxIncrease"];
private _heartRateChange = _minIncrease + random (_maxIncrease - _minIncrease);

// Adjust the medication effects and add the medication to the list
TRACE_3("adjustments",_heartRateChange,_painReduce,_viscosityChange);
[_target, _className, _timeTillMaxEffect, _timeInSystem, _heartRateChange, _painReduce, _viscosityChange] call EFUNC(medical_status,addMedicationAdjustment);

// Check for medication compatiblity
[_target, _className, _maxDose, _inCompatableMedication] call FUNC(onMedicationUsage);

true

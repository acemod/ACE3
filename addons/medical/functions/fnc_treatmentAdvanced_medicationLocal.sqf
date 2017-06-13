/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment classname <STRING>
 * 2: Injection Site Part Number <NUMBER>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [medic, "bandage", 2] call ace_medical_fnc_treatmentAdvanced_medicationLocal
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_target", "_className", "_partNumber"];
TRACE_3("params",_target,_className,_partNumber);

private _tourniquets = _target getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
if ((_tourniquets select _partNumber) > 0) exitWith {
    TRACE_1("unit has tourniquets blocking blood flow on injection site",_tourniquets);
    private _delayedMedications = _target getVariable [QGVAR(occludedMedications), []];
    _delayedMedications pushBack _this;
    _target setVariable [QGVAR(occludedMedications), _delayedMedications, true];
    true
};

// We have added a new dose of this medication to our system, so let's increase it
private _varName = format[QGVAR(%1_inSystem), _className];
private _currentInSystem = _target getVariable [_varName, 0];
_target setVariable [_varName, _currentInSystem + 1];

// Find the proper attributes for the used medication
private _medicationConfig = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Medication");
private _painReduce = getNumber (_medicationConfig >> "painReduce");
private _hrIncreaseLow = getArray (_medicationConfig >> "hrIncreaseLow");
private _hrIncreaseNorm = getArray (_medicationConfig >> "hrIncreaseNormal");
private _hrIncreaseHigh = getArray (_medicationConfig >> "hrIncreaseHigh");
private _timeInSystem = getNumber (_medicationConfig >> "timeInSystem");
private _maxDose = getNumber (_medicationConfig >> "maxDose");
private _viscosityChange = getNumber (_medicationConfig >> "viscosityChange");
private _hrCallback = getText (_medicationConfig >> "hrCallback");

private _inCompatableMedication = [];
if (isClass (_medicationConfig >> _className)) then {
    _medicationConfig = (_medicationConfig >> _className);
    if (isNumber (_medicationConfig >> "painReduce")) then { _painReduce = getNumber (_medicationConfig >> "painReduce");};
    if (isArray (_medicationConfig >> "hrIncreaseLow")) then { _hrIncreaseLow = getArray (_medicationConfig >> "hrIncreaseLow"); };
    if (isArray (_medicationConfig >> "hrIncreaseNormal")) then { _hrIncreaseNorm = getArray (_medicationConfig >> "hrIncreaseNormal"); };
    if (isArray (_medicationConfig >> "hrIncreaseHigh")) then { _hrIncreaseHigh = getArray (_medicationConfig >> "hrIncreaseHigh"); };
    if (isNumber (_medicationConfig >> "timeInSystem")) then { _timeInSystem = getNumber (_medicationConfig >> "timeInSystem"); };
    if (isNumber (_medicationConfig >> "maxDose")) then { _maxDose = getNumber (_medicationConfig >> "maxDose"); };
    if (isArray (_medicationConfig >> "inCompatableMedication")) then { _inCompatableMedication = getArray (_medicationConfig >> "inCompatableMedication"); };
    if (isNumber (_medicationConfig >> "viscosityChange")) then { _viscosityChange = getNumber (_medicationConfig >> "viscosityChange"); };
    if (isText (_medicationConfig >> "hrCallback")) then { _hrCallback = getText (_medicationConfig >> "hrCallback"); };
};
if (isNil _hrCallback) then {
    _hrCallback = compile _hrCallback;
} else {
    _hrCallback = missionNamespace getVariable _hrCallback;
};
if (!(_hrCallback isEqualType {})) then {_hrCallback = {TRACE_1("callback was NOT code",_hrCallback)};};

// Adjust the heart rate based upon config entry
private _heartRate = _target getVariable [QGVAR(heartRate), 70];
if (alive _target) then {
    if (_heartRate > 0) then {
        if (_heartRate <= 45) then {
            [_target, ((_hrIncreaseLow select 0) + random ((_hrIncreaseLow select 1) - (_hrIncreaseLow select 0))), (_hrIncreaseLow select 2), _hrCallback] call FUNC(addHeartRateAdjustment);
        } else {
            if (_heartRate > 120) then {
                [_target, ((_hrIncreaseHigh select 0) + random ((_hrIncreaseHigh select 1) - (_hrIncreaseHigh select 0))), (_hrIncreaseHigh select 2), _hrCallback] call FUNC(addHeartRateAdjustment);
            } else {
                [_target, ((_hrIncreaseNorm select 0) + random ((_hrIncreaseNorm select 1) - (_hrIncreaseNorm select 0))), (_hrIncreaseNorm select 2), _hrCallback] call FUNC(addHeartRateAdjustment);
            };
        };
    };
};

if (_painReduce > 0) then {
    // Reduce pain
    private _painSuppress = _target getVariable [QGVAR(painSuppress), 0];
    _target setVariable [QGVAR(painSuppress), (_painSuppress + _painReduce) max 0];
    if (!GVAR(painIsOnlySuppressed)) then {
        _pain = _target getVariable [QGVAR(pain), 0];
        _target setVariable [QGVAR(pain), (_pain - _painReduce) max 0, true];
    };
};

private _resistance = _target getVariable [QGVAR(peripheralResistance), 100];
_target setVariable [QGVAR(peripheralResistance), (_resistance + _viscosityChange) max 0];

// Call back to ensure that the medication is decreased over time
[_target, _classname, _varName, _maxDose, _timeInSystem, _inCompatableMedication, _viscosityChange, _painReduce] call FUNC(onMedicationUsage);

true

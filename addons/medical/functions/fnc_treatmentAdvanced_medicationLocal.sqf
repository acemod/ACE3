/*
 * Author: Glowbal
 * Handles the medication given to a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_currentInSystem", "_medicationConfig", "_painReduce", "_hrIncreaseLow", "_hrIncreaseNorm", "_hrIncreaseHigh", "_maxDose", "_inCompatableMedication", "_timeInSystem", "_heartRate", "_pain", "_resistance", "_hrCallback", "_varName", "_viscosityChange"];
params ["_target", "_className"];

// We have added a new dose of this medication to our system, so let's increase it
_varName = format[QGVAR(%1_inSystem), _className];
_currentInSystem = _target getvariable [_varName, 0];
_currentInSystem = _currentInSystem + 1;
_target setvariable [_varName, _currentInSystem];

// Find the proper attributes for the used medication
_medicationConfig = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Medication");
_painReduce = getNumber (_medicationConfig >> "painReduce");
_hrIncreaseLow = getArray (_medicationConfig >> "hrIncreaseLow");
_hrIncreaseNorm = getArray (_medicationConfig >> "hrIncreaseNormal");
_hrIncreaseHigh = getArray (_medicationConfig >> "hrIncreaseHigh");
_timeInSystem = getNumber (_medicationConfig >> "timeInSystem");
_maxDose = getNumber (_medicationConfig >> "maxDose");
_viscosityChange = getNumber (_medicationConfig >> "viscosityChange");
_hrCallback = getText (_medicationConfig >> "hrCallback");

_inCompatableMedication = [];
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
    _hrCallback = missionNamespace getvariable _hrCallback;
};

// Adjust the heart rate based upon config entry
_heartRate = _target getvariable [QGVAR(heartRate), 70];
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
    _painSuppress = _target getvariable [QGVAR(painSuppress), 0];
    _target setvariable [QGVAR(painSuppress), (_painSuppress + _painReduce) max 0];
    if (!GVAR(painIsOnlySuppressed)) then {
        _pain = _target getvariable [QGVAR(pain), 0];
        _target setvariable [QGVAR(pain), (_pain - _painReduce) max 0, true];
    };
};

_resistance = _target getvariable [QGVAR(peripheralResistance), 100];
_resistance = _resistance + _viscosityChange;
_target setvariable [QGVAR(peripheralResistance), _resistance max 0];

// Call back to ensure that the medication is decreased over ACE_time
[_target, _classname, _varName, _maxDose, _timeInSystem, _inCompatableMedication, _viscosityChange, _painReduce] call FUNC(onMedicationUsage);

true

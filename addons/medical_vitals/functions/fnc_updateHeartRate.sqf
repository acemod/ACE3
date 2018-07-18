/*
 * Author: Glowbal
 * Update the heart rate
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Sync value? <BOOL>
 *
 * ReturnValue:
 * Current Heart Rate <NUMBER>
 *
 * Example:
 * [player, 1, false] call ace_medical_vitals_fnc_updateHeartRate
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_deltaT", "_syncValue"];

private _hrTargetAdjustment = 0;
private _adjustments = _unit getVariable [VAR_HEART_RATE_ADJ,[]];

if !(_adjustments isEqualTo []) then {
    {
        _x params ["_value", "_timeTillMaxEffect", "_maxTimeInSystem", "_timeInSystem"];
        if (_value != 0 && {_maxTimeInSystem > 0}) then {
            if (_timeInSystem >= _maxTimeInSystem) then {
                _adjustments set [_forEachIndex, nil];
            } else {
                _timeInSystem = _timeInSystem + _deltaT;
                private _effectRatio = ((_timeInSystem / (1 max _timeTillMaxEffect)) ^ 2) min 1;
                _hrTargetAdjustment = _hrTargetAdjustment + _value * _effectRatio * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
                _x set [3, _timeInSystem];
            };
        } else {
            _adjustments set [_forEachIndex, nil];
        };
    } forEach _adjustments;

    _unit setVariable [VAR_HEART_RATE_ADJ, _adjustments - [nil], _syncValue];
};

private _heartRate = GET_HEART_RATE(_unit);

if !IN_CRDC_ARRST(_unit) then {
    private _hrChange = 0;
    private _bloodVolume = GET_BLOOD_VOLUME(_unit);
    if (_bloodVolume > BLOOD_VOLUME_CLASS_4_HEMORRHAGE) then {
        GET_BLOOD_PRESSURE(_unit) params ["_bloodPressureL", "_bloodPressureH"];
        private _meanBP = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;
        private _painLevel = GET_PAIN_PERCEIVED(_unit);

        private _targetBP = 107;
        if (_bloodVolume < BLOOD_VOLUME_CLASS_3_HEMORRHAGE) then {
            _targetBP = _targetBP * (_bloodVolume / DEFAULT_BLOOD_VOLUME);
        };

        private _targetHR = DEFAULT_HEART_RATE;
        if (_bloodVolume < BLOOD_VOLUME_CLASS_2_HEMORRHAGE) then {
            _targetHR = _heartRate * (_targetBP / (45 max _meanBP));
        };
        if (_painLevel > 0.2) then {
            _targetHR = _targetHR max (80 + 50 * _painLevel);
        };
        _targetHR = _targetHR + _hrTargetAdjustment;

        _hrChange = round(_targetHR - _heartRate) / 2;
    } else {
        _hrChange = -round(_heartRate / 10);
    };
    _heartRate = (_heartRate + _deltaT * _hrChange) max 0;
};

_unit setVariable [VAR_HEART_RATE, _heartRate, _syncValue];

_heartRate


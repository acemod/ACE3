/*
 * Author: Glowbal
 * Get the change in the heart rate. Used for the vitals calculations. Calculated in one seconds.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 *
 * ReturnValue:
 * Change in heart Rate <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_deltaT"];

private _hrIncrease = 0;

if (!(_unit getVariable [QGVAR(inCardiacArrest),false])) then {
    private _hrTargetAdjustment = 0;
    private _adjustment = _unit getVariable [QGVAR(heartRateAdjustments), []];
    {
        _x params ["_value", "_timeTillMaxEffect", "_maxTimeInSystem", "_timeInSystem", "_callBack"];
        if (abs _value > 0 && {_maxTimeInSystem > 0}) then {
            if (_timeInSystem >= _maxTimeInSystem) then {
                 _adjustment set [_forEachIndex, ObjNull];
                 [_unit] call _callBack;
            } else {
                _timeInSystem = _timeInSystem + _deltaT;
                private _effectRatio = (_timeInSystem / (1 max _timeTillMaxEffect)) min 1;
                _hrTargetAdjustment = _value * _effectRatio * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
                _x set [3, _timeInSystem];
            };
        } else {
            _adjustment set [_forEachIndex, ObjNull];
            [_unit] call _callBack;
        };
    } forEach _adjustment;

    _adjustment = _adjustment - [ObjNull];
    _unit setVariable [QGVAR(heartRateAdjustments), _adjustment];
    
    if (!(_unit getVariable [QGVAR(inCardiacArrest), false])) then {
        private _heartRate = (_unit getVariable [QGVAR(heartRate), 80]);
        private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME];
        if (_bloodVolume > BLOOD_VOLUME_CLASS_4_HEMORRHAGE) then {
            private _hrChange = 0;
            ([_unit] call FUNC(getBloodPressure)) params ["_bloodPressureL", "_bloodPressureH"];
            private _meanBP = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;
            private _pain = _unit getVariable [QGVAR(pain), 0];
            private _hasPain = _unit getVariable [QGVAR(hasPain), false];
            private _targetBP = 107;
            private _targetHR = 80;
            if (_bloodVolume < BLOOD_VOLUME_CLASS_3_HEMORRHAGE) then {
                _targetBP = _targetBP * (_bloodVolume / DEFAULT_BLOOD_VOLUME);
            };
            if (_hasPain && {_pain > 0.2}) then {
                _targetHR = _targetHR + 50 * _pain;
            };
            _targetHR = _targetHR + _hrTargetAdjustment;
            _hrChange = round(_targetHR - _heartRate) / 2;
            if ((_meanBP > _targetBP && {_heartRate > _targetHR}) || {_bloodVolume < BLOOD_VOLUME_CLASS_2_HEMORRHAGE && {_heartRate < 200}}) then {
                _hrChange = 2 * round(_targetBP - _meanBP);
                if (_hrChange < 0) then {
                    _hrChange = _hrChange / 20;
                };
            };
            _hrIncrease = _hrIncrease + _hrChange;
        } else {
            _hrIncrease = _hrIncrease - (random 5) * round(_heartRate / 10);
        };
    };
};

(_deltaT * _hrIncrease)

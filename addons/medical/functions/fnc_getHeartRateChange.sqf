/*
 * Author: Glowbal
 * Get the change in the heart rate. Used for the vitals calculations. Calculated in one seconds.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Change in heart Rate <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _hrIncrease = 0;

if (!(_unit getVariable [QGVAR(inCardiacArrest),false])) then {
    private _adjustment = _unit getVariable [QGVAR(heartRateAdjustments), []];
    {
        _x params ["_values", "_time", "_callBack"];
        if (abs _values > 0) then {
            if (_time <= 0) then {
                _time = 1;
            };
            private _change = (_values / _time);
            _hrIncrease = _hrIncrease + _change;

            if ( (_time - 1) <= 0) then {
                 _time = 0;
                 _adjustment set [_forEachIndex, ObjNull];
                 [_unit] call _callBack;
            } else {
                _time = _time - 1;
                _adjustment set [_forEachIndex, [_values - _change, _time]];
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
        private _pain = _unit getVariable [QGVAR(pain), 0];        
        private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), DEFAULT_BLOOD_VOLUME];
        if (_bloodVolume > BLOOD_VOLUME_CLASS_4_HEMORRHAGE) then {
            if (_pain > 0.2 && _heartRate < 130) then {
                _hrIncrease = _hrIncrease + round(130 - _heartRate) / 2;
            };
            if (_bloodVolume < BLOOD_VOLUME_CLASS_2_HEMORRHAGE && {_heartRate < 200}) then {
                ([_unit] call FUNC(getBloodPressure)) params ["_bloodPressureL", "_bloodPressureH"];
                private _meanBloodPressure = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;
                _hrIncrease = _hrIncrease + 2 * round(107 - _meanBloodPressure);
            };
        } else {
            _hrIncrease = _hrIncrease - (random 5) * round(_heartRate / 10);
        };
    };
};

_hrIncrease

/*
 * Author: Glowbal
 * Get the change in the heart rate. Used for the vitals calculations. Calculated in one seconds.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Change in heart Rate <NUMBER>
 *
 * Example:
 * [bob] call ACE_medical_fnc_getHeartRateChange
 *
 * Public: No
 */

#include "script_component.hpp"

#define HEART_RATE_MODIFIER 0.02

params ["_unit"];

private _hrIncrease = 0;
if (!(_unit getVariable [QGVAR(inCardiacArrest),false])) then {
    private _heartRate = _unit getVariable [QGVAR(heartRate), 80];
    private _bloodLoss = [_unit] call FUNC(getBloodLoss);

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

    private _bloodVolume = _unit getVariable [QGVAR(bloodVolume), 100];
    if (_bloodVolume > 75) then {
        if (_bloodLoss > 0.0) then {
            if (_bloodLoss < 0.5) then {
                if (_heartRate < 126) then {
                    _hrIncrease = _hrIncrease + 0.05;
                };
            } else {
                if (_bloodLoss < 1) then {
                    if (_heartRate < 161) then {
                        _hrIncrease = _hrIncrease + 0.1;
                    };
                } else {
                    if (_heartRate < 220) then {
                        _hrIncrease = _hrIncrease + 0.15;
                    };
                };
            };
        } else {
            // Stabalize it
            if (_heartRate < (60 + round(random(10)))) then {
                _hrIncrease = _hrIncrease + HEART_RATE_MODIFIER;
            } else {
                if (_heartRate > (77 + round(random(10)))) then {
                    _hrIncrease = _hrIncrease - HEART_RATE_MODIFIER;
                };
            };
        };
    } else {
        _hrIncrease = _hrIncrease - HEART_RATE_MODIFIER;
    };
};
_hrIncrease

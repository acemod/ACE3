/*
 * Author: Glowbal
 * Update the pain suppression
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_deltaT", "_syncValue"];

private _painSupressAdjustment = 0;
private _adjustments = _unit getVariable [VAR_PAIN_SUPP_ADJ, []];

if !(_adjustments isEqualTo []) then {
    {
        _x params ["_value", "_timeTillMaxEffect", "_maxTimeInSystem", "_timeInSystem"];
        if (_value != 0 && {_maxTimeInSystem > 0}) then {
            if (_timeInSystem >= _maxTimeInSystem) then {
                 _adjustments set [_forEachIndex, nil];
            } else {
                _timeInSystem = _timeInSystem + _deltaT;
                private _effectRatio = ((_timeInSystem / (1 max _timeTillMaxEffect)) ^ 2) min 1;
                _painSupressAdjustment = _painSupressAdjustment + _value * _effectRatio * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
                _x set [3, _timeInSystem];
            };
        } else {
            _adjustments set [_forEachIndex, nil];
        };
    } forEach _adjustments;

    _unit setVariable [VAR_PAIN_SUPP_ADJ, _adjustments - [nil], (_syncValue || {_adjustments isEqualTo []})]; // always sync on last run

    _unit setVariable [VAR_PAIN_SUPP, 0 max _painSupressAdjustment, _syncValue];
};

// Handle continuous pain reduction
private _pain = GET_PAIN(_unit);
_unit setVariable [QEGVAR(medical_status,pain), 0 max (_pain - _deltaT / PAIN_FADE_TIME), _syncValue];

// Handles simple medication
if (!EGVAR(medical,advancedMedication)) then {
    private _painSupress = _unit getVariable [VAR_PAIN_SUPP, 0];
    _painSupress = _painSupress - _deltaT / PAIN_SUPPRESSION_FADE_TIME;
    _unit setVariable [VAR_PAIN_SUPP, 0 max _painSupress, _syncValue];
};

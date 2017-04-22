/*
 * Author: Glowbal
 * Update the pain suppression
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Sync value? <BOOL>
 *
 * ReturnValue:
 * nothing
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_deltaT", "_syncValue"];

private _painSupressAdjustment = 0;
private _adjustment = _unit getVariable [QGVAR(painSupressAdjustments), []];

if (!(_adjustment isEqualTo [])) then {
    {
        _x params ["_value", "_timeTillMaxEffect", "_maxTimeInSystem", "_timeInSystem"];
        if (abs _value > 0 && {_maxTimeInSystem > 0}) then {
            if (_timeInSystem >= _maxTimeInSystem) then {
                 _adjustment set [_forEachIndex, ObjNull];
            } else {
                _timeInSystem = _timeInSystem + _deltaT;
                private _effectRatio = ((_timeInSystem / (1 max _timeTillMaxEffect)) ^ 2) min 1;
                _painSupressAdjustment = _painSupressAdjustment + _value * _effectRatio * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
                _x set [3, _timeInSystem];
            };
        } else {
            _adjustment set [_forEachIndex, ObjNull];
        };
    } forEach _adjustment;

    _adjustment = _adjustment - [ObjNull];
    _unit setVariable [QGVAR(painSupressAdjustments), _adjustment, (_syncValue || {_adjustment isEqualTo []})]; // always sync on last run
    
    _unit setVariable [QGVAR(painSuppress), 0 max _painSupressAdjustment, _syncValue];
};

// Handle continuous pain reduction
private _pain = _unit getVariable [QGVAR(pain), 0];
_unit setVariable [QGVAR(pain), 0 max (_pain - _deltaT / PAIN_FADE_TIME), _syncValues];

// Handles simple medication
if (!GVAR(advancedMedication)) then {
    private _painSupress = _unit getVariable [QGVAR(painSuppress), 0];
    _painSupress = _painSupress - _deltaT / PAIN_SUPPRESSION_FADE_TIME;
    _unit setVariable [QGVAR(painSuppress), 0 max _painSupress, _syncValue];
};

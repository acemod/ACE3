#include "..\script_component.hpp"
/*
 * Author: Glowbal, LinkIsGrim
 * Consumes unit's medications and update relevant vitals
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Global Sync Values (medications) <BOOL>
 *
 * Return Value:
 * Values should be synced <BOOL>
 *
 * Example:
 * [player, 1, true] call ace_medical_vitals_fnc_consumeMedications
 *
 * Public: No
 */

params ["_unit", "_deltaT", "_syncValues"];

private _medications = _unit getVariable [VAR_MEDICATIONS, []];

private _hrTargetAdjustment = 0;
private _painSupressAdjustment = 0;
private _peripheralResistanceAdjustment = 0;
private _consumedMedications = [];

{
    _x params ["_medication", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem", "_hrAdjust", "_painAdjust", "_flowAdjust"];

    private _timeInSystem = CBA_missionTime - _timeAdded;
    if (_timeInSystem >= _maxTimeInSystem) then {
        _syncValues = true;
        _medications deleteAt _forEachIndex;
    } else {
        private _effectRatio = (((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;

        _consumedMedications pushBack [_medication, _effectRatio];

        if (_hrAdjust != 0) then { _hrTargetAdjustment = _hrTargetAdjustment + _hrAdjust * _effectRatio; };
        if (_painAdjust != 0) then { _painSupressAdjustment = _painSupressAdjustment + _painAdjust * _effectRatio; };
        if (_flowAdjust != 0) then { _peripheralResistanceAdjustment = _peripheralResistanceAdjustment + _flowAdjust * _effectRatio; };
    };
} forEachReversed _medications;

[QEGVAR(medical,consumeMedications), [_unit, _consumedMedications]] call CBA_fnc_localEvent;

if (_syncValues) then {
    _unit setVariable [VAR_MEDICATIONS, _medications, true]
};

[_unit, _hrTargetAdjustment, _deltaT, _syncValues] call FUNC(updateHeartRate);
[_unit, _painSupressAdjustment, _deltaT, _syncValues] call FUNC(updatePainSuppress);
[_unit, _peripheralResistanceAdjustment, _deltaT, _syncValues] call FUNC(updatePeripheralResistance);

_syncValues // return

#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Gets effective count of medications in a unit's system
 * (each medication dose is scaled from 0..1 based on time till max effect and max time in system)
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Medication (not case sensitive) <STRING>
 * 2: Get raw count (true) or effect ratio (false) <BOOL>(default: true)
 *
 * Return Value:
 * Medication count (float) <NUMBER>
 *
 * Example:
 * [player, "Epinephrine"] call ace_medical_status_fnc_getMedicationCount
 *
 * Public: No
 */

params ["_target", "_medication", ["_getCount", true]];

private _return = 0;
{
    _x params ["_xMed", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem"];
    if (_xMed == _medication) then {
        private _timeInSystem = CBA_missionTime - _timeAdded;
        if (_getCount) then {
            // just return effective count, a medication will always start at 1 and only drop after reaching timeTilMaxEffect
            _return = _return + linearConversion [_timeTillMaxEffect, _maxTimeInSystem, _timeInSystem, 1, 0, true];
        } else {
            // as used in handleUnitVitals, a medication effectiveness will start low, ramp up to timeTillMaxEffect, and then drop off
            _return = _return + (((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
        };
    };
} forEach (_target getVariable [VAR_MEDICATIONS, []]);

TRACE_4("getMedicationCount",_target,_medication,_getCount,_return);
_return

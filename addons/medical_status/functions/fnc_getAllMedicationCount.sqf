#include "..\script_component.hpp"
/*
 * Author: PabstMirror, modified by Cplhardcore
 * Gets effective count of all medications in a unit's system
 * (each medication dose is scaled from 0..1 based on time till max effect and max time in system)
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Get raw count (true) or effect ratio (false) <BOOL>(default: true)
 *
 * Return Value:
 * Dose Count <NUMBER>
 * Medication effectiveness (float) <NUMBER>
 *
 * Example:
 * [player] call ace_medical_status_fnc_getAllMedicationCount
 *
 * Public: No
 */

params ["_target", ["_getCount", true]];

private _results = [];  // Array to store medication info
{
    _x params ["_xMed", "_timeAdded", "_dose", "_timeTillMaxEffect", "_maxTimeInSystem"];
    
    private _timeInSystem = CBA_missionTime - _timeAdded;
    private _medDose = _dose;
    private _medication = _xMed;
    private _effectiveness = 0; 

    if (_getCount) then {
        _effectiveness = linearConversion [_timeTillMaxEffect, _maxTimeInSystem, _timeInSystem, 1, 0, true];
    } else {
        _effectiveness = (((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
    };
    _results pushBack [_medication, _medDose, _effectiveness];

} forEach (_target getVariable [VAR_MEDICATIONS, []]);

TRACE_4("getMedicationCount",_target,_medication,_getCount,_results);

_results
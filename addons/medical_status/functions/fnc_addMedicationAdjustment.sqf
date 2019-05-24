#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror
 * Adds a medication and it's effects
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Medication <STRING>
 * 2: Time in system for the adjustment to reach its peak <NUMBER>
 * 3: Duration the adjustment will have an effect <NUMVER>
 * 4: Heart Rate Adjust <NUMVER>
 * 5: Pain Suppress Adjust <NUMVER>
 * 6: Flow Adjust <NUMVER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Morphine", 120, 60, -10, 0.8, -10] call ace_medical_status_fnc_addMedicationAdjustment
 */
params ["_unit", "_medication", "_timeToMaxEffect", "_maxTimeInSystem", "_hrAdjust", "_painAdjust", "_flowAdjust"];
TRACE_7("addMedicationAdjustment",_unit,_medication,_timeToMaxEffect,_maxTimeInSystem,_hrAdjust,_painAdjust,_flowAdjust);

if (_maxTimeInSystem <= 0) exitWith { WARNING_1("bad value for _maxTimeInSystem - %1",_this); };
_timeToMaxEffect = _timeToMaxEffect max 1;


private _adjustments = _unit getVariable [VAR_MEDICATIONS, []];

_adjustments pushBack [_medication, CBA_missionTime, _timeToMaxEffect, _maxTimeInSystem, _hrAdjust, _painAdjust, _flowAdjust];

_unit setVariable [VAR_MEDICATIONS, _adjustments, true];

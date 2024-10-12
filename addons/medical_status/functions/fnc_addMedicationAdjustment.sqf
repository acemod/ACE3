#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror, Cplhardcore
 * Adds a medication and it's effects
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Medication <STRING>
 * 2: Dose of medication <NUMBER>
 * 3: Time in system for the adjustment to reach its peak <NUMBER>
 * 4: Duration the adjustment will have an effect <NUMBER>
 * 5: Heart Rate Adjust <NUMBER>
 * 6: Pain Suppress Adjust <NUMBER>
 * 7: Flow Adjust <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Morphine", 1, 120, 60, -10, 0.8, -10] call ace_medical_status_fnc_addMedicationAdjustment
 *
 * Public: No
 */
params ["_unit", "_medication", "_dose", "_timeToMaxEffect", "_maxTimeInSystem", "_hrAdjust", "_painAdjust", "_flowAdjust"];
TRACE_8("addMedicationAdjustment",_unit,_medication,_dose,_timeToMaxEffect,_maxTimeInSystem,_hrAdjust,_painAdjust,_flowAdjust);

if (_maxTimeInSystem <= 0) exitWith { WARNING_1("bad value for _maxTimeInSystem - %1",_this); };
_timeToMaxEffect = _timeToMaxEffect max 1;


private _adjustments = _unit getVariable [VAR_MEDICATIONS, []];

_adjustments pushBack [_medication, CBA_missionTime, _dose, _timeToMaxEffect, _maxTimeInSystem, _hrAdjust, _painAdjust, _flowAdjust];

_unit setVariable [VAR_MEDICATIONS, _adjustments, true];

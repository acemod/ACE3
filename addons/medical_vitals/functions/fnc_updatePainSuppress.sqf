#include "script_component.hpp"
/*
 * Author: Glowbal
 * Update the pain suppression
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Pain Suppress Adjustments <NUMBER>
 * 2: Time since last update <NUMBER>
 * 3: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0, 1, false] call ace_medical_vitals_fnc_updatePainSuppress
 *
 * Public: No
 */

params ["_unit", "_painSupressAdjustment", "_deltaT", "_syncValue"];

_unit setVariable [VAR_PAIN_SUPP, 0 max _painSupressAdjustment, _syncValue];

// Handle continuous pain reduction
private _pain = GET_PAIN(_unit);
_unit setVariable [VAR_PAIN, 0 max (_pain - _deltaT / PAIN_FADE_TIME), _syncValue];

// Handles simple medication
if (isNil QEGVAR(medical_treatment,advancedMedication) || {!EGVAR(medical_treatment,advancedMedication)}) then {
    private _painSupress = _unit getVariable [VAR_PAIN_SUPP, 0];
    _painSupress = _painSupress - _deltaT / PAIN_SUPPRESSION_FADE_TIME;
    _unit setVariable [VAR_PAIN_SUPP, 0 max _painSupress, _syncValue];
};

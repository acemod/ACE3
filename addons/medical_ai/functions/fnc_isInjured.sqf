/*
 * Author: BaerMitUmlaut
 * Checks if a unit needs treatment.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Does unit need treatment <BOOL>
 *
 * Example:
 * call ACE_medical_ai_fnc_isInjured
 *
 * Public: No
 */
#include "script_component.hpp"

if !(alive _this) exitWith {false};

private _bloodLoss = [_this] call EFUNC(medical,getBloodLoss);
private _pain = [_this] call EFUNC(medical,getPainLevel);

((_bloodLoss > 0) || {_pain > 0.2})

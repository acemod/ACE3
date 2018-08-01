#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if a unit needs treatment.
 *
 * Arguments:
 * Unit <OBJECT>
 *
 * Return Value:
 * Does unit need treatment <BOOL>
 *
 * Example:
 * player call ACE_medical_ai_fnc_isInjured
 *
 * Public: No
 */

if !(alive _this) exitWith {false};

private _bloodLoss   = GET_BLOOD_LOSS(_this);
private _pain = GET_PAIN_PERCEIVED(_this);
private _unconscious = IS_UNCONSCIOUS(_this);

(_bloodLoss > 0) || {_pain > 0.2} || _unconscious

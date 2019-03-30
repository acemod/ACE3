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

(GET_BLOOD_LOSS(_this) > 0)
|| {GET_PAIN_PERCEIVED(_this) > 0.25}
|| {IS_UNCONSCIOUS(_this)}

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
#include "script_component.hpp"

if !(alive _this) exitWith {false};

private _bloodLoss   = [_this] call EFUNC(medical,getBloodLoss);
private _pain = [_this] call EFUNC(medical,getPainLevel);
private _unconscious = _this getVariable ["ACE_isUnconscious", false];

(_bloodLoss > 0) || {_pain > 0.2} || _unconscious

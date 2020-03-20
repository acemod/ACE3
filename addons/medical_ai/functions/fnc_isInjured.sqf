#include "script_component.hpp"
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

if !(alive _this) exitWith {false};

((_this getVariable [QEGVAR(medical,pain), 0] > 0.2) || {[_this] call EFUNC(medical,getBloodLoss) > 0 || {_this getVariable ["ACE_isUnconscious", false]}})

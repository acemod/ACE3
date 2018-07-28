/*
 * Author: Glowbal
 * Check if a unit is in a stable condition
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * Is in stable condition <BOOL>
 *
 * Example:
 * [player] call ace_medical_fnc_isInStableCondition
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

(alive _unit && {!IS_UNCONSCIOUS(_unit)} && {GET_BLOOD_LOSS(_unit) == 0} && {_unit call FUNC(hasStableVitals)});

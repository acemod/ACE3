#include "script_component.hpp"
/*
 * Author: Glowbal
 * Check if a unit is in a stable condition, needed for PersonalAidKit treatment
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * Is in stable condition <BOOL>
 *
 * Example:
 * [player] call ace_medical_status_fnc_isInStableCondition
 *
 * Public: No
 */

params ["_unit"];

alive _unit
&& {!IS_UNCONSCIOUS(_unit)}
&& {GET_WOUND_BLEEDING(_unit) == 0}
&& {_unit call FUNC(hasStableVitals)}

#include "script_component.hpp"
/*
 * Author: Glowbal, anden3
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

if (!alive _unit) exitWith { false };
if (IS_UNCONSCIOUS(_unit)) exitWith { false };
if (IS_BLEEDING(_unit)) exitWith { false };
if (GET_HEART_RATE(_unit) < QEGVAR(medical_treatment,minHeartRatePAK)) exitWith { false };

private _requiredBloodVolume = DEFAULT_BLOOD_VOLUME * (QEGVAR(medical_treatment,minBloodPAK) / 100);
if (GET_BLOOD_VOLUME(_unit) < _requiredBloodVolume) exitWith { false };

if (QEGVAR(medical_treatment,allowPainPAK) == 0 && { IS_IN_PAIN(_unit) }) exitWith { false };
if (QEGVAR(medical_treatment,allowOpenWoundsPAK) == 0 && { !(GET_OPEN_WOUNDS(_unit) isEqualTo []) }) exitWith { false };

true

#include "script_component.hpp"
/*
 * Author: Glowbal, anden3, dgibso29
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

if (!alive _unit
    || {IS_UNCONSCIOUS(_unit)}
    || {IS_BLEEDING(_unit)}
    || {GET_HEART_RATE(_unit) < EGVAR(medical_treatment,minHeartRatePAK)}
) exitWith {false};

private _requiredBloodVolume = DEFAULT_BLOOD_VOLUME * (EGVAR(medical_treatment,minBloodPAK) / 100);
if (GET_BLOOD_VOLUME(_unit) < _requiredBloodVolume) exitWith {false};

if (EGVAR(medical_treatment,allowPainPAK) == 0 && { IS_IN_PAIN(_unit) }) exitWith {false};
if (EGVAR(medical_treatment,allowFracturesPAK) == 0 && { !(GET_FRACTURES(_unit) isEqualTo []) }) exitWith {false};

// Require at least bandaged wounds.
if (EGVAR(medical_treatment,requiredWoundStatePAK) == 1 && { !(count GET_OPEN_WOUNDS(_unit) == (count GET_BANDAGED_WOUNDS(_unit) + count GET_STITCHED_WOUNDS(_unit))) }) exitWith {false};

// Require stitched wounds.
if (EGVAR(medical_treatment,requiredWoundStatePAK) == 2 && { !(count GET_OPEN_WOUNDS(_unit) ==  count GET_STITCHED_WOUNDS(_unit)) }) exitWith {false};

true

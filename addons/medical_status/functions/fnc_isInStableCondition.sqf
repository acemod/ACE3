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
    || {GET_HEART_RATE(_unit) < EGVAR(medical_treatment,minHeartRatePAK)}
) exitWith {false};

private _requiredBloodVolume = DEFAULT_BLOOD_VOLUME * (EGVAR(medical_treatment,minBloodPAK) / 100);
if (GET_BLOOD_VOLUME(_unit) < _requiredBloodVolume) exitWith {false};

if (EGVAR(medical_treatment,allowPainPAK) == 0 && { IS_IN_PAIN(_unit) }) exitWith {false};

// Untreated fractures have a value of 1. Treated are -1.
if (EGVAR(medical_treatment,allowFracturesPAK) == 0 && { ((GET_FRACTURES(_unit) findIf {_x isEqualTo 1}) != -1) })  exitWith {false};

private _requiredWoundState = EGVAR(medical_treatment,requiredWoundStatePAK);

// Any wounds required.
if (_requiredWoundState == PAK_REQ_OPEN) exitWith {true};

// Parameterize this value to reduce duplication.
private _hasOpenWounds = (GET_OPEN_WOUNDS(_unit) findIf {_x select 2 > 0 && {_x select 3 > 0}}) != -1;

// Bangaded wounds required. This means there can be no open wounds. This check makes sure to ignore any non-bleeding wounds, such as bruises, that would otherwise be counted.
if (_requiredWoundState == PAK_REQ_BANDAGED && _hasOpenWounds) exitWith {false};

// Stitched wounds required. This means there can be no bandaged or open wounds.
if (_requiredWoundState == PAK_REQ_STITCHED && { GET_BANDAGED_WOUNDS(_unit) isNotEqualTo [] } || _hasOpenWounds) exitWith {false};

true

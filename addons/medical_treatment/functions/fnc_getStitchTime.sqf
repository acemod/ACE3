#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject, "head"] call ace_medical_treatment_fnc_getStitchTime
 *
 * Public: No
 */

params ["", "_patient", "_bodyPart"];

count (GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []]) * GVAR(woundStitchTime)

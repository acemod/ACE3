#include "script_component.hpp"
/*
 * Author: mharis001
 * Calculates the Surgical Kit treatment time based on the amount of stitchable wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_getStitchTime
 *
 * Public: No
 */

params ["", "_patient"];

private _index = ALL_BODY_PARTS find toLower _bodyPart;
count ([_patient, _index] call FUNC(getStitchableWounds)) * GVAR(woundStitchTime)

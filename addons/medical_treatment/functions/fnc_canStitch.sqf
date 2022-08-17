#include "script_component.hpp"
/*
 * Author: Katalam, mharis001
 * Checks if the patient can be stitched.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * ReturnValue:
 * Can Stitch <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_medical_treatment_fnc_canStitch
 *
 * Public: No
 */

params ["", "_patient", "_bodyPart"];

private _index = ALL_BODY_PARTS find toLower _bodyPart;
([_patient, _index] call FUNC(getStitchableWounds) isNotEqualTo [])

#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Checks if a splint can be applied to the patient.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * Return Value:
 * Can Splint <BOOL>
 *
 * Example:
 * [player, cursorObject, "LeftLeg"] call ace_medical_treatment_fnc_canSplint
 *
 * Public: No
 */

params ["", "_patient", "_bodyPart"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

(GET_FRACTURES(_patient) select _partIndex) == 1

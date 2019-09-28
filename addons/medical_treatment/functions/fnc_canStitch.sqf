#include "script_component.hpp"
/*
 * Author: Katalam, mharis001
 * Checks if the patient can be stitched.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * ReturnValue:
 * Can Stitch <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_medical_treatment_fnc_canStitch
 *
 * Public: No
 */

params ["", "_patient"];

!(_patient call FUNC(getStitchableWounds) isEqualTo [])

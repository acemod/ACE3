#include "script_component.hpp"
/*
 * Author: Katalam, mharis001, Brett Mayson
 * Checks if the patient can be stitched.
 *
 * Arguments:
 * 0: Medic <OBJECT>
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

params ["_medic", "_patient"];

if ((GVAR(consumeSurgicalKit) == 2) && {!([_medic, _patient, ["ACE_suture"]] call FUNC(hasItem))}) exitWith {false};

(_patient call FUNC(getStitchableWounds) isNotEqualTo [])

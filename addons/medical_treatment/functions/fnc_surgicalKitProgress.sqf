#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, mharis001
 * Handles the surgical kit treatment by periodically closing bandaged wounds.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic <OBJECT>
 *   1: Patient <OBJECT>
 *   2: Body Part <STRING>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Continue Treatment <BOOL>
 *
 * Example:
 * [[objNull, player], 5, 10] call ace_medical_treatment_fnc_surgicalKitProgress
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_medic", "_patient", "_bodyPart"];

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds get _bodyPart;

// Stop treatment if there are no wounds that can be stitched remaining
if (_bandagedWoundsOnPart isEqualTo []) exitWith {false};

// Not enough time has elapsed to stitch a wound
if (_totalTime - _elapsedTime > ([_patient, _patient, _bodyPart] call FUNC(getStitchTime)) - GVAR(woundStitchTime)) exitWith {true};

// Stitch the first possible wound on the body part
private _stitched = [_patient, _bodyPart] call FUNC(stitchWound);

if (!_stitched) exitWith {
    ERROR_1("failed to stitch wound on unit - %1",_patient);
    false
};

// Consume a suture for the next wound if one exists, stop stitching if none are left
if (GVAR(consumeSurgicalKit) == 2 && {_bandagedWoundsOnPart isNotEqualTo []}) then {
    ([_medic, _patient, ["ACE_suture"]] call FUNC(useItem)) params ["_user"];
    !isNull _user
} else {
    true
}

#include "..\script_component.hpp"
/*
 * Author: Katalam, mharis001, Brett Mayson
 * Checks if the patient's body part can be stitched.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 *
 * ReturnValue:
 * Can Stitch <BOOL>
 *
 * Example:
 * [player, cursorTarget, "head"] call ace_medical_treatment_fnc_canStitch
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

if ((GVAR(consumeSurgicalKit) == 2) && {!([_medic, _patient, ["ACE_suture"]] call FUNC(hasItem))}) exitWith {false};

private _isBleeding = false;
{
    _x params ["", "_amountOf", "_bleedingRate"];
    _isBleeding = _amountOf > 0 && {_bleedingRate > 0};
    if (_isBleeding) then {break};
} forEach (GET_OPEN_WOUNDS(_patient) get _bodyPart);

(!_isBleeding && {(GET_BANDAGED_WOUNDS(_patient) getOrDefault [_bodyPart, []]) isNotEqualTo []}) // return

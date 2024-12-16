#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, mharis001, LinkIsGrim
 * Stitches a wound (either the first or a specific wound) from a body part.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Wound Array, will close first wound on body part if empty <ARRAY> (default: [])
 *
 * Return Value:
 * Wound was stitched <BOOL>
 *
 * Example:
 * [player, "head"] call ace_medical_treatment_fnc_stitchWound
 *
 * Public: No
 */

params ["_patient", "_bodyPart", ["_treatedWound", []]];

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _bandagedWoundsOnPart = _bandagedWounds getOrDefault [_bodyPart, []];

// Get the first stitchable wound from bandaged wounds, or make sure the passed wound exists
private _bandagedIndex = (count _bandagedWoundsOnPart) - 1;
if (_treatedWound isEqualTo []) then {
    _treatedWound = _bandagedWoundsOnPart param [_bandagedIndex, _treatedWound];
} else {
    _bandagedIndex = _bandagedWoundsOnPart find _treatedWound;
};

// Wound doesn't exist or there are no bandaged wounds to stitch
if (_bandagedIndex == -1) exitWith {false};

// Remove the wound from bandagedWounds
_bandagedWoundsOnPart deleteAt _bandagedIndex;

_treatedWound params ["_treatedID", "_treatedAmountOf", "", "_treatedDamageOf"];

// Check if we need to add a new stitched wound or increase the amount of an existing one
private _stitchedWounds = GET_STITCHED_WOUNDS(_patient);
private _stitchedWoundsOnPart = _stitchedWounds getOrDefault [_bodyPart, [], true];

private _stitchedIndex = _stitchedWoundsOnPart findIf {
    _x params ["_classID"];
    _classID == _treatedID
};

if (_stitchedIndex == -1) then {
    _stitchedWoundsOnPart pushBack _treatedWound;
} else {
    private _wound = _stitchedWoundsOnPart select _stitchedIndex;
    _wound set [1, (_wound select 1) + _treatedAmountOf];
};

if (GVAR(clearTrauma) == 1) then {
    TRACE_2("trauma - clearing trauma after stitching",_bodyPart,_treatedWound);
    [_patient, _bodyPart, -(_treatedDamageOf * _treatedAmountOf)] call FUNC(addTrauma);
};

_patient setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
_patient setVariable [VAR_STITCHED_WOUNDS, _stitchedWounds, true];

// Check if we fixed limping by stitching this wound (only for leg wounds)
if (
    EGVAR(medical,limping) == 2
    && {_patient getVariable [QEGVAR(medical,isLimping), false]}
    && {_bodyPart in ["leftleg", "rightleg"]}
) then {
    TRACE_3("Updating damage effects",_patient,_bodyPart,local _patient);
    [QEGVAR(medical_engine,updateDamageEffects), _patient, _patient] call CBA_fnc_targetEvent;
};

true // return

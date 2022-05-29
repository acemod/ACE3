#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, mharis001
 * Handles the surgical kit treatment by periodically closing bandaged wounds.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic (not used) <OBJECT>
 *   1: Patient <OBJECT>
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
_args params ["", "_patient"];

private _stitchableWounds = _patient call FUNC(getStitchableWounds);

// Stop treatment if there are no wounds that can be stitched remaining
if (count _stitchableWounds == 0) exitWith {false};

// Not enough time has elapsed to stitch a wound
if (_totalTime - _elapsedTime > ([_patient, _patient] call FUNC(getStitchTime)) - GVAR(woundStitchTime)) exitWith {true};

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _stitchedWounds = GET_STITCHED_WOUNDS(_patient);

// Remove the first stitchable wound from the bandaged wounds
private _bodyPart = (keys _stitchableWounds) select 0;
private _bandagedWoundsOnPart = _bandagedWounds get _bodyPart;
private _treatedWound = _bandagedWoundsOnPart deleteAt (count _bandagedWoundsOnPart - 1);
_treatedWound params ["_treatedID", "_treatedAmountOf", "", "_treatedDamageOf"];

// Check if we need to add a new stitched wound or increase the amount of an existing one
private _woundIndex = (_stitchedWounds getOrDefault [_bodyPart, []]) findIf {
    _x params ["_classID"];
    _classID == _treatedID
};

if (_woundIndex == -1) then {
    (_stitchedWounds getOrDefault [_bodyPart, [], true]) pushBack _treatedWound;
} else {
    private _wound = (_stitchedWounds get _bodyPart) select _woundIndex;
    _wound set [1, (_wound select 1) + _treatedAmountOf];
};

if (GVAR(clearTrauma) == 1) then {
    private _partIndex = ALL_BODY_PARTS find _bodyPart;
    TRACE_2("clearTrauma - clearing trauma after stitching",_bodyPart,_treatedWound);
    private _bodyPartDamage = _patient getVariable [QEGVAR(medical,bodyPartDamage), []];
    _bodyPartDamage set [_partIndex, (_bodyPartDamage select _partIndex) - _treatedDamageOf];
    _patient setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];
    TRACE_2("clearTrauma - healed damage",_bodyPart,_treatedDamageOf);

    switch (_bodyPart) do {
        case "head": { [_patient, true, false, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case "body": { [_patient, false, true, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        case "leftarm";
        case "rightarm": { [_patient, false, false, true, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
        default { [_patient, false, false, false, true] call EFUNC(medical_engine,updateBodyPartVisuals); };
    };
};

_patient setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
_patient setVariable [VAR_STITCHED_WOUNDS, _stitchedWounds, true];

// Check if we fixed limping by stitching this wound (only for leg wounds)
if (
    EGVAR(medical,limping) == 2
    && {_patient getVariable [QEGVAR(medical,isLimping), false]}
    && {_bodyPart isEqualTo "leftleg" || _bodyPart isEqualTo "rightleg"}
) then {
    TRACE_3("Updating damage effects",_patient,_bodyPart,local _patient);
    [QEGVAR(medical_engine,updateDamageEffects), _patient, _patient] call CBA_fnc_targetEvent;
};

true

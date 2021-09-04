#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, mharis001
 * Handles the surgical kit treatment by periodically closing bandaged wounds.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic <OBJECT>
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
_args params ["_medic", "_patient"];

private _stitchableWounds = _patient call FUNC(getStitchableWounds);

// Stop treatment if there are no wounds that can be stitched remaining
if (_stitchableWounds isEqualTo []) exitWith {false};

// magazinesAmmo only returns magazines with ammo, so can check for uses this way
private _allMedicMagazines = magazinesAmmo _medic;
private _hasUsesLeft = _allMedicMagazines findIf {(_x select 0) isEqualTo "ACE_surgicalKit_mag"} != -1;

// Stop treatment & remove empty magazines if there are no more surgical kit uses
if ((GVAR(consumeSurgicalKit) > 0) && {!_hasUsesLeft}) exitWith {
    [_medic, "ACE_surgicalKit_mag", 0] call EFUNC(common,removeSpecificMagazine);
    false
};

private _woundCount = 0;
{
    _x params ["_woundID", "_bodyPartN", "_amountOf"];
    _woundCount = _woundCount + (ceil _amountOf);
} forEach _stitchableWounds;

// Not enough time has elapsed to stitch a wound
if (_totalTime - _elapsedTime > (_woundCount - 1) * GVAR(woundStitchTime)) exitWith {true};

private _bandagedWounds = GET_BANDAGED_WOUNDS(_patient);
private _stitchedWounds = GET_STITCHED_WOUNDS(_patient);

// Reduce stitched wound amount from bandaged wounds and delete when empty
private _treatedWoundIndex = _bandagedWounds find (_stitchableWounds select 0);
private _bandagedWound = (_bandagedWounds select _treatedWoundIndex);
_bandagedWound params ["_bandagedID", "_bandagedBodyPartN", "_bandagedAmountOf"];
private _treatedWound = +_bandagedWound;
_treatedWound params ["_treatedID", "_treatedBodyPartN", "_treatedAmountOf"];

if (_bandagedAmountOf - 1 <= 0) then {
    _bandagedWounds deleteAt _treatedWoundIndex;
} else {
    _bandagedWound set [2, _bandagedAmountOf - 1];
    _bandagedWounds set [_treatedWoundIndex, _bandagedWound];
};

_treatedAmountOf = _treatedAmountOf min 1;
_treatedWound set [2, _treatedAmountOf];

// Check if we need to add a new stitched wound or increase the amount of an existing one
private _woundIndex = _stitchedWounds findIf {
    _x params ["_classID", "_bodyPartN"];

    _classID == _treatedID && {_bodyPartN == _treatedBodyPartN}
};

if (_woundIndex == -1) then {
    _stitchedWounds pushBack _treatedWound;
} else {
    private _wound = _stitchedWounds select _woundIndex;
    _wound set [2, (_wound select 2) + _treatedAmountOf];
};

_patient setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
_patient setVariable [VAR_STITCHED_WOUNDS, _stitchedWounds, true];

if (GVAR(consumeSurgicalKit) > 0) then {
    private _allSurgicalKits = _allMedicMagazines select {(_x select 0) isEqualTo "ACE_surgicalKit_mag"};
    private _ammo = (_allSurgicalKits select 0) select 1;
    _allSurgicalKits deleteAt 0;
    _medic removeMagazines "ACE_surgicalKit_mag";
    _medic addMagazine ["ACE_surgicalKit_mag", _ammo - 1];
    {
        _medic addMagazine ["ACE_surgicalKit_mag", _x select 1];
    } forEach _allSurgicalKits;
};

// Check if we fixed limping by stitching this wound (only for leg wounds)
if (EGVAR(medical,limping) == 2 && {_patient getVariable [QEGVAR(medical,isLimping), false]} && {_treatedBodyPartN > 3}) then {
    TRACE_3("Updating damage effects",_patient,_treatedBodyPartN,local _patient);
    [QEGVAR(medical_engine,updateDamageEffects), _patient, _patient] call CBA_fnc_targetEvent;
};

true

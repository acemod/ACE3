#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for bandaging a patient's open wounds.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Head", "FieldDressing"] call ace_medical_treatment_fnc_bandageLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_bandage"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith {false};

private _openWounds = _patient getVariable [QEGVAR(medical,openWounds), []];
if (_openWounds isEqualTo []) exitWith {false};

// Figure out which injury for this bodypart is the best choice to bandage
// TODO also use up the remainder on left over injuries
private _targetWound = [_patient, _bandage, _partIndex] call FUNC(findMostEffectiveWound);
_targetWound params ["_wound", "_woundIndex", "_effectiveness"];

// Everything is patched up on this body part already
if (_effectiveness == -1) exitWith {};

// Find the impact this bandage has and reduce the amount this injury is present
private _amountOf = _wound select 2;
private _impact = _effectiveness min _amountOf;
_amountOf = _amountOf - _impact;
_wound set [2, _amountOf];
_openWounds set [_woundIndex, _wound];

_patient setVariable [QEGVAR(medical,openWounds), _openWounds, true];

[_patient] call EFUNC(medical_status,updateWoundBloodLoss);

// Handle the reopening of bandaged wounds
if (_impact > 0 && {GVAR(advancedBandages) && {GVAR(woundReopening)}}) then {
    [_patient, _impact, _partIndex, _woundIndex, _wound, _bandage] call FUNC(handleBandageOpening);
};

// Check if we fixed limping from this treatment
if ((EGVAR(medical,limping) == 1) && {_partIndex > 3} && {_amountOf <= 0} && {_patient getVariable [QEGVAR(medical,isLimping), false]}) then {
    [_patient] call EFUNC(medical_engine,updateDamageEffects);
};

true

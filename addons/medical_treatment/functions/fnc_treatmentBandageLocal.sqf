/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment class name <STRING>
 * 2: Body part <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_bandage", "_bodyPart"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith { false };

private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
if (_openWounds isEqualTo []) exitWith { false };

// Figure out which injury for this bodypart is the best choice to bandage
// TODO also use up the remainder on left over injuries
private _targetWound = [_target, _bandage, _partIndex] call FUNC(findMostEffectiveWound);
_targetWound params ["_wound", "_woundIndex", "_effectiveness"];

// Everything is patched up on this body part already
if (_effectiveness == -1) exitWith {};

// Find the impact this bandage has and reduce the amount this injury is present
private _amountOf = _wound select 3;
private _impact = _effectiveness min _amountOf;
_wound set [3, _amountOf - _impact];
_openWounds set [_woundIndex, _wound];

_target setVariable [QEGVAR(medical,openWounds), _openWounds, true];

// Handle the reopening of bandaged wounds
if (_impact > 0 && {EGVAR(medical,advancedBandages) && {EGVAR(medical,woundReopening)}}) then {
    [_target, _impact, _partIndex, _woundIndex, _wound, _bandage] call FUNC(handleBandageOpening);
};

true

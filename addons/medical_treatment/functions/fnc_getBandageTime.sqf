#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Calculates the time to bandage a wound based on it's location, size, the patient and the medic.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * Return Value:
 * Time in seconds <NUMBER>
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodypart", "_bandage"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith { 0 };

private _targetWound = [_patient, _bandage, _partIndex] call FUNC(findMostEffectiveWound);
_targetWound params ["_wound", "_woundIndex", "_effectiveness"];

// Everything is patched up on this body part already
if (_wound isEqualTo EMPTY_WOUND) exitWith { 0 };

_wound params ["", "", "", "_amountOf", "_bloodloss", "_damage", "_category"];

// Base bandage time is based on wound category
private _bandageTime = ([4, 6, 8] select _category) * _amountOf;

// Medically unskilled units aren't so practised at applying bandages
if !([_medic] call FUNC(isMedic)) then {
    _bandageTime = _bandageTime + 3;
};

// Bandaging yourself requires more work
if (_medic == _patient) then {
    _bandageTime = _bandageTime + 2;
};

// Nobody can bandage instantly
_bandageTime max 1

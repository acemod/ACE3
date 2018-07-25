#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Calculates the time to bandage a wound based on it's size, the patient and the medic.
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

// Base bandage time is based on wound size and remaining percentage
private _bandageTime = ([
    BANDAGE_TIME_S,
    BANDAGE_TIME_M,
    BANDAGE_TIME_L
] select _category) * _amountOf;

// Medics are more practised at applying bandages
if ([_medic] call FUNC(isMedic)) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_MEDIC;
};

// Bandaging yourself requires more work
if (_medic == _patient) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_SELF;
};

// Nobody can bandage instantly
_bandageTime max 1

#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Calculates the time to bandage a wound based on it's size, the patient and the medic.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorTarget, "Head", "FieldDressing"] call ace_medical_treatment_fnc_getBandageTime
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodypart", "_bandage"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith { ERROR_1("invalid partIndex - %1",_this); 0 };

private _targetWound = [_patient, _bandage, _partIndex] call FUNC(findMostEffectiveWound);
_targetWound params ["_wound", "_woundIndex", "_effectiveness"];
TRACE_3("findMostEffectiveWound",_wound,_woundIndex,_effectiveness);

// Everything is patched up on this body part already
if (_wound isEqualTo EMPTY_WOUND) exitWith { 0 };

_wound params ["_classID", "", "_amountOf", "_bloodloss", "_damage"];
private _category = (_classID % 10);

// Base bandage time is based on wound size and remaining percentage
private _bandageTime = [BANDAGE_TIME_S, BANDAGE_TIME_M, BANDAGE_TIME_L] select _category;

// Scale bandage time based on amount left and effectiveness (less time if only a little wound left)
if (GVAR(advancedBandages)) then { // basicBandage will have a very high effectiveness and can be ignored
    _bandageTime = _bandageTime * (linearConversion [0, _effectiveness, _amountOf, 0.666, 1, true]);
};

// Medics are more practised at applying bandages
if ([_medic] call FUNC(isMedic)) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_MEDIC;
};

// Bandaging yourself requires more work
if (_medic == _patient) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_SELF;
};

TRACE_1("",_bandageTime);
// Nobody can bandage instantly
_bandageTime max 2.25

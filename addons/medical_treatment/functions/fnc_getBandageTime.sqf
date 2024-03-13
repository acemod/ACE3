#include "..\script_component.hpp"
/*
 * Author: kymckay
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
 * [player, cursorTarget, "head", "FieldDressing"] call ace_medical_treatment_fnc_getBandageTime
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_bandage"];

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;
if (_partIndex < 0) exitWith { ERROR_1("invalid partIndex - %1",_this); 0 };

private _targetWounds = [_patient, _bandage, _bodyPart] call FUNC(findMostEffectiveWounds);
TRACE_1("findMostEffectiveWounds",_targetWounds);

private _woundCount = count _targetWounds;

// Everything is patched up on this body part already
if (_woundCount == 0) exitWith {0};

// Base bandage time is based on wound size and remaining percentage
private _bandageTimesArray = [BANDAGE_TIME_S, BANDAGE_TIME_M, BANDAGE_TIME_L];
private _bandageTime = 0;

{
    private _wound = _x;
    _wound params ["_classID", "", "_amountOf"];
    _y params ["_effectiveness", "", "_impact"];
    private _category = (_classID % 10);

    // Base bandage time is based on wound size and remaining percentage
    private _woundTime = _bandageTimesArray select _category;

    // Scale bandage time based on amount left and effectiveness (less time if only a little wound left)
    // Basic bandage treatment will have a very high effectiveness and can be ignored
    if (GVAR(advancedBandages != 0)) then {
        _woundTime = _woundTime * linearConversion [0, _effectiveness, _impact, 0.666, 1, true];
    };

    _bandageTime = _bandageTime + _woundTime;
} forEach _targetWounds;

// Medics are more practised at applying bandages
if ([_medic] call FUNC(isMedic)) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_MEDIC;
};

// Bandaging yourself requires more work
if (_medic == _patient) then {
    _bandageTime = _bandageTime + BANDAGE_TIME_MOD_SELF;
};

// Bandaging multiple injuries doesn't require opening a new bandage each time
if (_woundCount > 1) then {
    _bandageTime = _bandageTime - (2 * _woundCount);
};

TRACE_1("",_bandageTime);
// Nobody can bandage instantly
_bandageTime max 2.25

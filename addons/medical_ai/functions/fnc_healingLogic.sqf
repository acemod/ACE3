#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror
 * Applies healing to target
 *
 * Arguments:
 * 0: Healer <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [a, b] call ACE_medical_ai_fnc_healingLogic
 *
 * Public: No
 */

params ["_healer", "_target"];
(_healer getVariable [QGVAR(currentTreatment), [-1]]) params ["_finishTime", "_treatmentTarget", "_treatmentAction", "_treatmentArgs"];

// Treatment in progress, check if finished and apply
if (_finishTime > 0) exitWith {
    if (CBA_missionTime >= _finishTime) then {
        TRACE_4("finished",_finishTime,_treatmentTarget,_treatmentAction,_treatmentArgs);
        _healer setVariable [QGVAR(currentTreatment), nil];
        if ((_treatmentTarget == _target) && {(_treatmentAction select [0, 1]) != "#"}) then {
            [_treatmentAction, _treatmentArgs, _target] call CBA_fnc_targetEvent;
            #ifdef DEBUG_MODE_FULL
            INFO_4("%1->%2: %3 - %4",_healer,_target,_treatmentAction,_treatmentArgs);
            systemChat format ["%1 applying treatment %2 - %3", _treatmentAction];
            #endif
        };
    };
};

private _isMedic = [_healer] call EFUNC(medical_treatment,isMedic);
private _heartRate = GET_HEART_RATE(_target);

private _treatmentAction = "#none";
private _treatmentArgs = [];
private _treatmentTime = 6;
switch (true) do {
case (GET_BLOOD_LOSS(_target) > 0): {
        // Select first bleeding wound and bandage it
        private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
        private _selection = "?";
        {
            _x params ["", "", "_index", "_amount", "_percentage"];
            if ((_amount * _percentage) > 0) exitWith { _selection = ALL_BODY_PARTS select _index; };
        } forEach _openWounds;
        _treatmentAction = QEGVAR(medical_treatment,treatmentBandageLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, "FieldDressing", _selection];
    };
case (_isMedic && {GET_BLOOD_VOLUME(_target) < BLOOD_VOLUME_CLASS_2_HEMORRHAGE}): {
        private _bloodBags = _target getVariable [QEGVAR(medical,ivBags), []];
        if ((count _bloodBags) >= 2) exitWith {
            _treatmentAction = "#waitForBlood";
        };
        _treatmentAction = QEGVAR(medical_treatment,treatmentIVLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, "SalineIV", "leftarm"];
    };
case ((count (_target getVariable [VAR_HEART_RATE_ADJ, []])) >= 6): {
        _treatmentAction = "#tooManyMeds";
    };
case (IS_UNCONSCIOUS(_target) || {_heartRate <= 50}): {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextEpinephrine), -1])) exitWith {
            _treatmentAction = "#waitForEpinephrineToTakeEffect";
        };
        if (_heartRate > 180) exitWith {
            _treatmentAction = "#waitForSlowerHeart";
        };
        _target setVariable [QGVAR(nextEpinephrine), CBA_missionTime + 10];
        _treatmentAction = QEGVAR(medical_treatment,treatmentMedicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, "Epinephrine", 2];
    };
case ((GET_PAIN_PERCEIVED(_target) > 0.25)  || {_heartRate >= 180}): {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextMorphine), -1])) exitWith {
            _treatmentAction = "#waitForMorphineToTakeEffect";
        };
        if (_heartRate < 60) exitWith {
            _treatmentAction = "#waitForFasterHeart";
        };
        _target setVariable [QGVAR(nextMorphine), CBA_missionTime + 30];
        _treatmentAction = QEGVAR(medical_treatment,treatmentMedicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, "Morphine", 2];
    };
};

_healer setVariable [QGVAR(currentTreatment), [CBA_missionTime + _treatmentTime, _target, _treatmentAction, _treatmentArgs]];

// Play animation
if ((_treatmentAction select [0,1]) != "#") then {
    [_healer, _treatmentArgs param [1, ""], (_healer == _target)] call FUNC(playTreatmentAnim);
};

#ifdef DEBUG_MODE_FULL
systemChat format ["%1 started treating %2 - %3", _healer getVariable [QGVAR(currentTreatment), -1]];
#endif

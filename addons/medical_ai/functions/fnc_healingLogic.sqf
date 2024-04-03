#include "..\script_component.hpp"
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
(_healer getVariable [QGVAR(currentTreatment), [-1]]) params ["_finishTime", "_treatmentTarget", "_treatmentEvent", "_treatmentArgs", "_treatmentItem"];

// Treatment in progress, check if finished and apply
if (_finishTime > 0) exitWith {
    if (CBA_missionTime >= _finishTime) then {
        TRACE_5("treatment finished",_finishTime,_treatmentTarget,_treatmentEvent,_treatmentArgs,_treatmentItem);
        _healer setVariable [QGVAR(currentTreatment), nil];
        if ((GVAR(requireItems) > 0) && {_treatmentItem != ""}) then {
            ([_healer, _treatmentItem] call FUNC(itemCheck)) params ["_itemOk", "_itemClassname", "_treatmentClass"];
            if (!_itemOk) exitWith { _treatmentEvent = "#fail"; }; // no item after delay
            _healer removeItem _itemClassname;
            if (_treatmentClass != "") then { _treatmentArgs set [2, _treatmentClass]; };
        };
        if ((_treatmentTarget == _target) && {(_treatmentEvent select [0, 1]) != "#"}) then {
            [_treatmentEvent, _treatmentArgs, _target] call CBA_fnc_targetEvent;
            #ifdef DEBUG_MODE_FULL
            INFO_4("%1->%2: %3 - %4",_healer,_target,_treatmentEvent,_treatmentArgs);
            systemChat format ["Applying [%1->%2]: %3", _healer, _treatmentTarget, _treatmentEvent];
            #endif
        };
    };
};

private _isMedic = [_healer] call EFUNC(medical_treatment,isMedic);
private _heartRate = GET_HEART_RATE(_target);
private _fractures = GET_FRACTURES(_target);

private _treatmentEvent = "#none";
private _treatmentArgs = [];
private _treatmentTime = 6;
private _treatmentItem = "";
switch (true) do {
    case ((GET_WOUND_BLEEDING(_target) > 0)
    && {([_healer, "@bandage"] call FUNC(itemCheck)) # 0}): {
        // Select first bleeding wound and bandage it
        private _selection = "?";
        {
            private _foundBleeding = _y findIf {
                _x params ["", "_amount", "_percentage"];
                (_amount * _percentage) > 0
            };
            if (_foundBleeding != -1) exitWith { _selection = _x; };
        } forEach GET_OPEN_WOUNDS(_target);
        _treatmentEvent = QEGVAR(medical_treatment,bandageLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, _selection, "FieldDressing"];
        _treatmentItem = "@bandage";
    };
    case (IN_CRDC_ARRST(_target) && {EGVAR(medical_treatment,cprSuccessChanceMin) > 0}): {
        _treatmentEvent = QEGVAR(medical_treatment,cprLocal);
        _treatmentArgs = [_healer, _target];
        _treatmentTime = 15;
    };
    case (_isMedic && {GET_BLOOD_VOLUME(_target) < MINIMUM_BLOOD_FOR_STABLE_VITALS}
    && {([_healer, "@iv"] call FUNC(itemCheck)) # 0}): {
        // Check if patient's blood volume + remaining IV volume is enough to allow the patient to wake up
        private _totalIvVolume = 0; //in ml
        {
            _x params ["_volumeRemaining"];
            _totalIvVolume = _totalIvVolume + _volumeRemaining;
        } forEach (_target getVariable [QEGVAR(medical,ivBags), []]);

        if (GET_BLOOD_VOLUME(_target) + (_totalIvVolume / 1000) > MINIMUM_BLOOD_FOR_STABLE_VITALS) exitWith {
            _treatmentEvent = "#waitForBlood";
        };
        _treatmentEvent = QEGVAR(medical_treatment,ivBagLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, selectRandom ["leftarm", "rightarm", "leftleg", "rightleg"], "SalineIV"];
        _treatmentItem = "@iv";
    };
    case ((count (_target getVariable [VAR_MEDICATIONS, []])) >= 6): {
        _treatmentEvent = "#tooManyMeds";
    };
    case (((_fractures select 4) == 1)
    && {([_healer, "splint"] call FUNC(itemCheck)) # 0}): {
        _treatmentEvent = QEGVAR(medical_treatment,splintLocal);
        _treatmentTime = 6;
        _treatmentArgs = [_healer, _target, "leftleg"];
        _treatmentItem = "splint";
    };
    case (((_fractures select 5) == 1)
    && {([_healer, "splint"] call FUNC(itemCheck)) # 0}): {
        _treatmentEvent = QEGVAR(medical_treatment,splintLocal);
        _treatmentTime = 6;
        _treatmentArgs = [_healer, _target, "rightleg"];
        _treatmentItem = "splint";
    };
    case ((IS_UNCONSCIOUS(_target) || {_heartRate <= 50})
    && {([_healer, "epinephrine"] call FUNC(itemCheck)) # 0}): {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextEpinephrine), -1])) exitWith {
            _treatmentEvent = "#waitForEpinephrineToTakeEffect";
        };
        if (_heartRate > 180) exitWith {
            _treatmentEvent = "#waitForSlowerHeart";
        };
        _target setVariable [QGVAR(nextEpinephrine), CBA_missionTime + 10];
        _treatmentEvent = QEGVAR(medical_treatment,medicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, selectRandom ["leftarm", "rightarm", "leftleg", "rightleg"], "Epinephrine"];
        _treatmentItem = "epinephrine";
    };
    case (((GET_PAIN_PERCEIVED(_target) > 0.25) || {_heartRate >= 180})
    && {([_healer, "morphine"] call FUNC(itemCheck)) # 0}): {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextMorphine), -1])) exitWith {
            _treatmentEvent = "#waitForMorphineToTakeEffect";
        };
        if (_heartRate < 60) exitWith {
            _treatmentEvent = "#waitForFasterHeart";
        };
        _target setVariable [QGVAR(nextMorphine), CBA_missionTime + 30];
        _treatmentEvent = QEGVAR(medical_treatment,medicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, selectRandom ["leftarm", "rightarm", "leftleg", "rightleg"], "Morphine"];
        _treatmentItem = "morphine";
    };
};

_healer setVariable [QGVAR(currentTreatment), [CBA_missionTime + _treatmentTime, _target, _treatmentEvent, _treatmentArgs, _treatmentItem]];

// Play animation
if ((_treatmentEvent select [0,1]) != "#") then {
    private _treatmentClassname = _treatmentArgs select 2;
    if (_treatmentEvent == QEGVAR(medical_treatment,splintLocal)) then { _treatmentClassname = "Splint" };
    [_healer, _treatmentClassname, (_healer == _target)] call FUNC(playTreatmentAnim);
};

#ifdef DEBUG_MODE_FULL
TRACE_4("treatment started",_treatmentTime,_target,_treatmentEvent,_treatmentArgs);
systemChat format ["Treatment [%1->%2]: %3", _healer, _target, _treatmentEvent];
#endif

#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror
 * Applies healing to target.
 *
 * Arguments:
 * 0: Healer <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [cursorObject, cursorObject] call ace_medical_ai_fnc_healingLogic
 *
 * Public: No
 */

// TODO: Add AI tourniquet behaviour
// For now, AI handle player or otherwise scripted tourniquets only

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

            // Splints are already logged on their own
            switch (_treatmentEvent) do {
                case QEGVAR(medical_treatment,bandageLocal): {
                    [_target, "activity", ELSTRING(medical_treatment,Activity_bandagedPatient), [[_healer, false, true] call EFUNC(common,getName)]] call EFUNC(medical_treatment,addToLog);
                };
                case QEGVAR(medical_treatment,ivBagLocal): {
                    [_target, _treatmentArgs select 2] call EFUNC(medical_treatment,addToTriageCard);
                    [_target, "activity", ELSTRING(medical_treatment,Activity_gaveIV), [[_healer, false, true] call EFUNC(common,getName)]] call EFUNC(medical_treatment,addToLog);
                };
                case QEGVAR(medical_treatment,medicationLocal): {
                    private _usedItem = ["ACE_epinephrine", "ACE_morphine"] select (_treatmentArgs select 2 == "Morphine");
                    [_target, _usedItem] call EFUNC(medical_treatment,addToTriageCard);
                    [_target, "activity", ELSTRING(medical_treatment,Activity_usedItem), [[_healer, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call EFUNC(medical_treatment,addToLog);
                };
            };

            #ifdef DEBUG_MODE_FULL
            INFO_4("%1->%2: %3 - %4",_healer,_target,_treatmentEvent,_treatmentArgs);
            systemChat format ["Applying [%1->%2]: %3", _healer, _treatmentTarget, _treatmentEvent];
            #endif
        };
    };
};

// Find a suitable limb (no tourniquets) for injecting and giving IVs
private _fnc_findNoTourniquet = {
    private _bodyPart = "";
    private _bodyParts = ["leftarm", "rightarm", "leftleg", "rightleg"];
    private _bodyPartsSaved = +_bodyParts;

    while {_bodyParts isNotEqualTo []} do {
        _bodyPart = selectRandom _bodyParts;

        // If no tourniquet on, use that body part
        if (_tourniquets select (ALL_BODY_PARTS find _bodyPart) == 0) exitWith {};

        _bodyParts deleteAt (_bodyParts find _bodyPart);
    };

    // If all limbs have tourniquets, use random limb
    if (_bodyPart == "") then {
        _bodyPart = selectRandom _bodyPartsSaved;
    };

    _bodyPart
};

private _isMedic = [_healer] call EFUNC(medical_treatment,isMedic);
private _heartRate = GET_HEART_RATE(_target);
private _fractures = GET_FRACTURES(_target);
private _tourniquets = GET_TOURNIQUETS(_target);

private _treatmentEvent = "#none";
private _treatmentArgs = [];
private _treatmentTime = 6;
private _treatmentItem = "";

if (true) then {
    private _isBleeding = GET_WOUND_BLEEDING(_target) > 0;
    private _hasBandage = ([_healer, "@bandage"] call FUNC(itemCheck)) # 0;

    if (
        (GET_WOUND_BLEEDING(_target) > 0) &&
        {([_healer, "@bandage"] call FUNC(itemCheck)) # 0}
    ) exitWith {
        // Select first bleeding wound and bandage it
        private _selection = "?";
        {
            // Ignore tourniqueted limbs
            if (_tourniquets select (ALL_BODY_PARTS find _x) == 0 && {
                _y findIf {
                    _x params ["", "_amount", "_percentage"];
                    (_amount * _percentage) > 0
                } != -1}
            ) exitWith { _selection = _x; };
        } forEach GET_OPEN_WOUNDS(_target);
        _treatmentEvent = QEGVAR(medical_treatment,bandageLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, _selection, "FieldDressing"];
        _treatmentItem = "@bandage";
    };

    private _hasIV = ([_healer, "@iv"] call FUNC(itemCheck)) # 0;
    private _bloodVolume = GET_BLOOD_VOLUME(_target);

    // If in cardiac arrest, first add some blood to injured if necessary, then do CPR (doing CPR when not enough blood is suboptimal if you have IVs)
    // If healer has no IVs, allow AI to do CPR to keep injured alive
    if (
        IN_CRDC_ARRST(_target) &&
        {EGVAR(medical_treatment,cprSuccessChanceMin) > 0} &&
        {!_hasIV || {_bloodVolume >= BLOOD_VOLUME_CLASS_3_HEMORRHAGE}}
    ) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,cprLocal);
        _treatmentArgs = [_healer, _target];
        _treatmentTime = 15;
    };

    private _needsIv = _bloodVolume < MINIMUM_BLOOD_FOR_STABLE_VITALS;
    private _canGiveIv = _isMedic && _hasIV && _needsIv;

    if (_canGiveIv) then {
        // Check if patient's blood volume + remaining IV volume is enough to allow the patient to wake up
        private _totalIvVolume = 0; //in ml
        {
            _x params ["_volumeRemaining"];
            _totalIvVolume = _totalIvVolume + _volumeRemaining;
        } forEach (_target getVariable [QEGVAR(medical,ivBags), []]);

        // Check if the medic has to wait, which allows for a little multitasking
        if (_bloodVolume + (_totalIvVolume / 1000) >= MINIMUM_BLOOD_FOR_STABLE_VITALS) then {
            _treatmentEvent = "#waitForIV";
            _canGiveIv = false;
        };
    };

    if (_canGiveIv) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,ivBagLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, call _fnc_findNoTourniquet, "SalineIV"];
        _treatmentItem = "@iv";
    };

    if (
        ((_fractures select 4) == 1) &&
        {([_healer, "splint"] call FUNC(itemCheck)) # 0}
    ) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,splintLocal);
        _treatmentTime = 6;
        _treatmentArgs = [_healer, _target, "leftleg"];
        _treatmentItem = "splint";
    };

    if (
        ((_fractures select 5) == 1) &&
        {([_healer, "splint"] call FUNC(itemCheck)) # 0}
    ) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,splintLocal);
        _treatmentTime = 6;
        _treatmentArgs = [_healer, _target, "rightleg"];
        _treatmentItem = "splint";
    };

    // Wait until the injured has enough blood before administering drugs
    if (_needsIv) exitWith {
        _treatmentEvent = "#needsIV";
    };

    if (_treatmentEvent == "#waitForIV") exitWith {};

    if ((count (_target getVariable [VAR_MEDICATIONS, []])) >= 6) exitWith {
        _treatmentEvent = "#tooManyMeds";
    };

    if (
        ((IS_UNCONSCIOUS(_target) && {_heartRate < 160}) || {_heartRate <= 50}) &&
        {([_healer, "epinephrine"] call FUNC(itemCheck)) # 0}
    ) exitWith {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextEpinephrine), -1])) exitWith {
            _treatmentEvent = "#waitForEpinephrineToTakeEffect";
        };
        if (_heartRate > 180) exitWith {
            _treatmentEvent = "#waitForSlowerHeart";
        };
        _target setVariable [QGVAR(nextEpinephrine), CBA_missionTime + 10];
        _treatmentEvent = QEGVAR(medical_treatment,medicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, call _fnc_findNoTourniquet, "Epinephrine"];
        _treatmentItem = "epinephrine";
    };

    if (
        (((GET_PAIN_PERCEIVED(_target) > 0.25) && {_heartRate > 40}) || {_heartRate >= 180}) &&
        {([_healer, "morphine"] call FUNC(itemCheck)) # 0}
    ) exitWith {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextMorphine), -1])) exitWith {
            _treatmentEvent = "#waitForMorphineToTakeEffect";
        };
        if (_heartRate < 60) exitWith {
            _treatmentEvent = "#waitForFasterHeart";
        };
        _target setVariable [QGVAR(nextMorphine), CBA_missionTime + 30];
        _treatmentEvent = QEGVAR(medical_treatment,medicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, call _fnc_findNoTourniquet, "Morphine"];
        _treatmentItem = "morphine";
    };
};

_healer setVariable [QGVAR(currentTreatment), [CBA_missionTime + _treatmentTime, _target, _treatmentEvent, _treatmentArgs, _treatmentItem]];

// Play animation
if ((_treatmentEvent select [0,1]) != "#") then {
    private _treatmentClassname = _treatmentArgs select 2;
    if (_treatmentEvent == QEGVAR(medical_treatment,splintLocal)) then { _treatmentClassname = "Splint" };
    if (_treatmentEvent == QEGVAR(medical_treatment,cprLocal)) then { _treatmentClassname = "CPR" };
    [_healer, _treatmentClassname, (_healer == _target)] call FUNC(playTreatmentAnim);
};

#ifdef DEBUG_MODE_FULL
TRACE_4("treatment started",_treatmentTime,_target,_treatmentEvent,_treatmentArgs);
systemChat format ["Treatment [%1->%2]: %3", _healer, _target, _treatmentEvent];
#endif

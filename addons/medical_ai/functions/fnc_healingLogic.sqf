#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror, johnb43
 * Applies healing to target.
 * States that contain "needs" are states in which the medic is blocked, either temporairly (HR too high/low) or until resupplied, from treating.
 * States that contain "wait" are states where the medic waits temporairly before continuing treatment.
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

params ["_healer", "_target"];
(_healer getVariable [QGVAR(currentTreatment), [-1]]) params ["_finishTime", "_treatmentTarget", "_treatmentEvent", "_treatmentArgs", "_treatmentItem"];

// Treatment in progress, check if finished and apply
if (_finishTime > 0) exitWith {
    if (CBA_missionTime >= _finishTime) then {
        TRACE_5("treatment finished",_finishTime,_treatmentTarget,_treatmentEvent,_treatmentArgs,_treatmentItem);
        _healer setVariable [QGVAR(currentTreatment), nil];

        private _usedItem = "";

        if ((GVAR(requireItems) > 0) && {_treatmentItem != ""}) then {
            ([_healer, _treatmentItem] call FUNC(itemCheck)) params ["_itemOk", "_itemClassname", "_treatmentClass"];
             // No item after treatment done
            if (!_itemOk) exitWith {
                _treatmentEvent = "#fail";
            };

            _healer removeItem _itemClassname;
            _usedItem = _itemClassname;

            if (_treatmentClass != "") then {
                _treatmentArgs set [2, _treatmentClass];
            };
        };
        if ((_treatmentTarget == _target) && {(_treatmentEvent select [0, 1]) != "#"}) then {
            // There is no event for tourniquet removal, so handle calling function directly
            if (_treatmentEvent == QGVAR(tourniquetRemove)) exitWith {
                _treatmentArgs call EFUNC(medical_treatment,tourniquetRemove);
            };

            [_treatmentEvent, _treatmentArgs, _target] call CBA_fnc_targetEvent;

            // Splints are already logged on their own
            switch (_treatmentEvent) do {
                case QEGVAR(medical_treatment,bandageLocal): {
                    [_target, "activity", ELSTRING(medical_treatment,Activity_bandagedPatient), [[_healer, false, true] call EFUNC(common,getName)]] call EFUNC(medical_treatment,addToLog);
                };
                case QEGVAR(medical_treatment,ivBagLocal): {
                    if (_usedItem == "") then {
                        _usedItem = "ACE_salineIV";
                    };

                    [_target, _usedItem] call EFUNC(medical_treatment,addToTriageCard);
                    [_target, "activity", ELSTRING(medical_treatment,Activity_gaveIV), [[_healer, false, true] call EFUNC(common,getName)]] call EFUNC(medical_treatment,addToLog);
                };
                case QEGVAR(medical_treatment,medicationLocal): {
                    if (_usedItem == "") then {
                        _usedItem = ["ACE_epinephrine", "ACE_morphine"] select (_treatmentArgs select 2 == "Morphine");
                    };

                    [_target, _usedItem] call EFUNC(medical_treatment,addToTriageCard);
                    [_target, "activity", ELSTRING(medical_treatment,Activity_usedItem), [[_healer, false, true] call EFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call EFUNC(medical_treatment,addToLog);
                };
                case QEGVAR(medical_treatment,tourniquetLocal): {
                    [_target, "ACE_tourniquet"] call EFUNC(medical_treatment,addToTriageCard);
                    [_target, "activity", ELSTRING(medical_treatment,Activity_appliedTourniquet), [[_healer, false, true] call EFUNC(common,getName)]] call EFUNC(medical_treatment,addToLog);
                };
            };

            #ifdef DEBUG_MODE_FULL
            INFO_4("%1->%2: %3 - %4",_healer,_target,_treatmentEvent,_treatmentArgs);
            systemChat format ["Applying [%1->%2]: %3", _healer, _treatmentTarget, _treatmentEvent];
            #endif
        };
    };
};

// Bandage a limb up, then remove the tourniquet on it
private _fnc_removeTourniquet = {
    params [["_removeAllTourniquets", false]];

    // Ignore head & torso if not removing all tourniquets (= administering drugs/IVs)
    private _offset = [2, 0] select _removeAllTourniquets;

    // Bandage the least bleeding body part
    private _bodyPartBleeding = [];
    _bodyPartBleeding resize [[4, 6] select _removeAllTourniquets, -1];

    {
        // Ignore head and torso, if only looking for place to administer drugs/IVs
        private _partIndex = (ALL_BODY_PARTS find _x) - _offset;

        if (_partIndex >= 0 && {_tourniquets select _partIndex != 0}) then {
            {
                _x params ["", "_amountOf", "_bleeding"];

                // max 0, to set the baseline to 0, as body parts with no wounds are marked with -1
                _bodyPartBleeding set [_partIndex, ((_bodyPartBleeding select _partIndex) max 0) + (_amountOf * _bleeding)];
            } forEach _y;
        };
    } forEach GET_OPEN_WOUNDS(_target);

    // If there are no open wounds, check if there are tourniquets on limbs with no open wounds (stitched or fully healed),
    // as we know there have to be tourniquets at this point
    if (_bodyPartBleeding findIf {_x != -1} == -1) then {
        _bodyPartBleeding set [_tourniquets findIf {_x != 0}, 0];
    };

    // Ignore body parts that don't have open wounds (-1)
    private _minBodyPartBleeding = selectMin (_bodyPartBleeding select {_x != -1});
    private _selection = ALL_BODY_PARTS select ((_bodyPartBleeding find _minBodyPartBleeding) + _offset);

    // If not bleeding anymore, remove the tourniquet
    if (_minBodyPartBleeding == 0) exitWith {
        _treatmentEvent = QGVAR(tourniquetRemove);
        _treatmentTime = 7;
        _treatmentArgs = [_healer, _target, _selection];
    };

    // If no bandages available, wait
    // If check is done at the start of the scope, it will miss the edge case where the unit ran out of bandages just as they finished bandaging tourniqueted body part
    if !(([_healer, "@bandage"] call FUNC(itemCheck)) # 0) exitWith {
        _treatmentEvent = "#needsBandage";
    };

    // Otherwise keep bandaging
    _treatmentEvent = QEGVAR(medical_treatment,bandageLocal);
    _treatmentTime = 5;
    _treatmentArgs = [_target, _selection, "FieldDressing"];
    _treatmentItem = "@bandage";
};

// Find a suitable limb (no tourniquets) for adminstering drugs/IVs
private _fnc_findNoTourniquet = {
    private _bodyPart = "";

    // If all limbs have tourniquets, find the least damaged limb and try to bandage it
    if ((_tourniquets select [2]) find 0 == -1) then {
        call _fnc_removeTourniquet;
    } else {
        // Select a random non-tourniqueted limb otherwise
        private _bodyParts = ["leftarm", "rightarm", "leftleg", "rightleg"];

        while {_bodyParts isNotEqualTo []} do {
            _bodyPart = selectRandom _bodyParts;

            // If no tourniquet on, use that body part
            if (_tourniquets select (ALL_BODY_PARTS find _bodyPart) == 0) exitWith {};

            _bodyParts deleteAt (_bodyParts find _bodyPart);
        };
    };

    _bodyPart // return
};

private _tourniquets = GET_TOURNIQUETS(_target);

private _treatmentEvent = "#none";
private _treatmentArgs = [];
private _treatmentTime = 6;
private _treatmentItem = "";

if (true) then {
    if (IS_BLEEDING(_target)) exitWith {
        private _hasBandage = ([_healer, "@bandage"] call FUNC(itemCheck)) # 0;
        private _hasTourniquet = ([_healer, "tourniquet"] call FUNC(itemCheck)) # 0;

        // Patient is not worth treating if bloodloss can't be stopped
        if !(_hasBandage || _hasTourniquet) exitWith {
            _treatmentEvent = "#needsBandageOrTourniquet";
        };

        // Bandage the heaviest bleeding body part
        private _bodyPartBleeding = [0, 0, 0, 0, 0, 0];

        {
            private _partIndex = ALL_BODY_PARTS find _x;

            // Ignore tourniqueted limbs
            if (_tourniquets select _partIndex == 0) then {
                {
                    _x params ["", "_amountOf", "_bleeding"];
                    _bodyPartBleeding set [_partIndex, (_bodyPartBleeding select _partIndex) + (_amountOf * _bleeding)];
                } forEach _y;
            };
        } forEach GET_OPEN_WOUNDS(_target);

        private _maxBodyPartBleeding = selectMax _bodyPartBleeding;
        private _bodyPartIndex = _bodyPartBleeding find _maxBodyPartBleeding;
        private _selection = ALL_BODY_PARTS select _bodyPartIndex;

        // Apply tourniquet if moderate bleeding or no bandage is available, and if not head and torso
        if (_hasTourniquet && {_bodyPartIndex > HITPOINT_INDEX_BODY} && {!_hasBandage || {_maxBodyPartBleeding > 0.3}}) exitWith {
            _treatmentEvent = QEGVAR(medical_treatment,tourniquetLocal);
            _treatmentTime = 7;
            _treatmentArgs = [_target, _selection];
            _treatmentItem = "tourniquet";
        };

        _treatmentEvent = QEGVAR(medical_treatment,bandageLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, _selection, "FieldDressing"];
        _treatmentItem = "@bandage";
    };

    private _bloodVolume = GET_BLOOD_VOLUME(_target);
    private _needsIV = _bloodVolume < MINIMUM_BLOOD_FOR_STABLE_VITALS;
    private _canGiveIV = _needsIV &&
                         {_healer call EFUNC(medical_treatment,isMedic)} &&
                         {([_healer, "@iv"] call FUNC(itemCheck)) # 0}; // Has IVs
    private _doCPR = IN_CRDC_ARRST(_target) && {EGVAR(medical_treatment,cprSuccessChanceMin) > 0};

    // If in cardiac arrest, first add some blood to injured if necessary, then do CPR (doing CPR when not enough blood is suboptimal if you have IVs)
    // If healer has no IVs, allow AI to do CPR to keep injured alive
    if (
        _doCPR &&
        {!_canGiveIV || {_bloodVolume >= BLOOD_VOLUME_CLASS_3_HEMORRHAGE}}
    ) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,cprLocal);
        _treatmentArgs = [_healer, _target];
        _treatmentTime = 15;
    };

    private _bodypart = "";

    if (
        _canGiveIV && {
            // If all limbs are tourniqueted, bandage the one with the least amount of wounds, so that the tourniquet can be removed
            _bodyPart = call _fnc_findNoTourniquet;
            _bodyPart == ""
        }
    ) exitWith {};

    if (_canGiveIV) then {
        // Check if patient's blood volume + remaining IV volume is enough to allow the patient to wake up
        private _totalIvVolume = 0; //in ml
        {
            _x params ["_volumeRemaining"];
            _totalIvVolume = _totalIvVolume + _volumeRemaining;
        } forEach (_target getVariable [QEGVAR(medical,ivBags), []]);

        // Check if the medic has to wait, which allows for a little multitasking
        if (_bloodVolume + (_totalIvVolume / 1000) >= MINIMUM_BLOOD_FOR_STABLE_VITALS) then {
            _treatmentEvent = "#waitForIV";
            _needsIV = false;
            _canGiveIV = false;
        };
    };

    if (_canGiveIV) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,ivBagLocal);
        _treatmentTime = 5;
        _treatmentArgs = [_target, _bodyPart, "SalineIV", _healer];
        _treatmentItem = "@iv";
    };

    // Leg fractures
    private _index = (GET_FRACTURES(_target) select [4, 2]) find 1;

    if (
        _index != -1 && {
            // In case the unit doesn't have a splint, set state here
            _treatmentEvent = "#needsSplint";

            ([_healer, "splint"] call FUNC(itemCheck)) # 0
        }
    ) exitWith {
        _treatmentEvent = QEGVAR(medical_treatment,splintLocal);
        _treatmentTime = 6;
        _treatmentArgs = [_healer, _target, ALL_BODY_PARTS select (_index + 4)];
        _treatmentItem = "splint";
    };

    // Wait until the injured has enough blood before administering drugs
     // (_needsIV && !_canGiveIV), but _canGiveIV is false here, otherwise IV would be given
    if (_needsIV || {_doCPR && {_treatmentEvent == "#waitForIV"}}) exitWith {
        // If injured is in cardiac arrest and the healer is doing nothing else, start CPR
        if (_doCPR) exitWith {
            // Medic remains in this loop until injured is given enough IVs or dies
            _treatmentEvent = QEGVAR(medical_treatment,cprLocal);
            _treatmentArgs = [_healer, _target];
            _treatmentTime = 15;
        };

        // If the injured needs IVs, but healer can't give it to them, have healder wait
        if (_needsIV) exitWith {
            _treatmentEvent = "#needsIV";
        };
    };

    // These checks are not exitWith, so that the medic can try to bandage up tourniqueted body parts
    if ((count (_target getVariable [VAR_MEDICATIONS, []])) >= 6) then {
        _treatmentEvent = "#needsFewerMeds";
    };

    private _heartRate = GET_HEART_RATE(_target);
    private _canGiveEpinephrine = !(_treatmentEvent in ["#needsFewerMeds", "#waitForIV"]) &&
                                  {IS_UNCONSCIOUS(_target) || {_heartRate <= 50}} &&
                                  {
                                      // In case the unit doesn't have a epinephrine injector, set state here
                                      _treatmentEvent = "#needsEpinephrine";

                                      ([_healer, "epinephrine"] call FUNC(itemCheck)) # 0
                                  };

    // This allows for some multitasking
    if (_canGiveEpinephrine) then {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextEpinephrine), -1])) then {
            _treatmentEvent = "#waitForEpinephrineToTakeEffect";
            _canGiveEpinephrine = false;
        };

        if (_heartRate > 180) then {
            _treatmentEvent = "#needsSlowerHeart";
            _canGiveEpinephrine = false;
        };
    };

    if (_canGiveEpinephrine) exitWith {
        // If all limbs are tourniqueted, bandage the one with the least amount of wounds, so that the tourniquet can be removed
        _bodyPart = call _fnc_findNoTourniquet;

        if (_bodyPart == "") exitWith {};

        _target setVariable [QGVAR(nextEpinephrine), CBA_missionTime + 10];
        _treatmentEvent = QEGVAR(medical_treatment,medicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, _bodyPart, "Epinephrine"];
        _treatmentItem = "epinephrine";
    };

    // Remove all remaining tourniquets by bandaging all body parts
    if (_tourniquets isNotEqualTo DEFAULT_TOURNIQUET_VALUES) then {
        true call _fnc_removeTourniquet;
    };

    // If the healer can bandage or remove tourniquets, do that
    if (_treatmentEvent in [QEGVAR(medical_treatment,bandageLocal), QGVAR(tourniquetRemove)]) exitWith {};

    // Otherwise, if the healer is either done or out of bandages, continue
    if (
        !(_treatmentEvent in ["#needsFewerMeds", "#waitForIV"]) &&
        {(GET_PAIN_PERCEIVED(_target) > 0.25) || {_heartRate >= 180}} &&
        {
            // In case the unit doesn't have a morphine injector, set state here
            _treatmentEvent = "#needsMorphine";

            ([_healer, "morphine"] call FUNC(itemCheck)) # 0
        }
    ) exitWith {
        if (CBA_missionTime < (_target getVariable [QGVAR(nextMorphine), -1])) exitWith {
            _treatmentEvent = "#waitForMorphineToTakeEffect";
        };

        if (_heartRate < 60) exitWith {
            _treatmentEvent = "#needsFasterHeart";
        };

        // If all limbs are tourniqueted, bandage the one with the least amount of wounds, so that the tourniquet can be removed
        _bodyPart = call _fnc_findNoTourniquet;

        if (_bodyPart == "") exitWith {};

        _target setVariable [QGVAR(nextMorphine), CBA_missionTime + 30];
        _treatmentEvent = QEGVAR(medical_treatment,medicationLocal);
        _treatmentTime = 2.5;
        _treatmentArgs = [_target, _bodyPart, "Morphine"];
        _treatmentItem = "morphine";
    };
};

_healer setVariable [QGVAR(currentTreatment), [CBA_missionTime + _treatmentTime, _target, _treatmentEvent, _treatmentArgs, _treatmentItem]];

// Play animation
if ((_treatmentEvent select [0, 1]) != "#") then {
    private _treatmentClassname = switch (_treatmentEvent) do {
        case QEGVAR(medical_treatment,splintLocal): {"Splint"};
        case QEGVAR(medical_treatment,cprLocal): {"CPR"};
        case QEGVAR(medical_treatment,tourniquetLocal): {"ApplyTourniquet"};
        case QGVAR(tourniquetRemove): {"RemoveTourniquet"};
        default {_treatmentArgs select 2};
    };

    [_healer, _treatmentClassname, _healer == _target] call FUNC(playTreatmentAnim);
};

#ifdef DEBUG_MODE_FULL
TRACE_4("treatment started",_treatmentTime,_target,_treatmentEvent,_treatmentArgs);
systemChat format ["Treatment [%1->%2]: %3", _healer, _target, _treatmentEvent];
#endif

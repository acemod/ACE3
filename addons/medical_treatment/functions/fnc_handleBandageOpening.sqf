#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: The impact <NUMBER>
 * 2: Body part <STRING>
 * 3: Injury index <NUMBER>
 * 4: Injury <ARRAY>
 * 5: Used Bandage type <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_target", "_impact", "_part", "_injuryIndex", "_injury", "_bandage"];
TRACE_6("handleBandageOpening",_target,_impact,_part,_injuryIndex,_injury,_bandage);

_injury params ["_classID"];

private _className = EGVAR(medical_damage,woundClassNamesComplex) select _classID;
private _reopeningChance = DEFAULT_BANDAGE_REOPENING_CHANCE;
private _reopeningMinDelay = DEFAULT_BANDAGE_REOPENING_MIN_DELAY;
private _reopeningMaxDelay = DEFAULT_BANDAGE_REOPENING_MAX_DELAY;

// Get the default values for the used bandage
private _config = configFile >> QUOTE(ADDON) >> "Bandaging";

if (isClass (_config >> _bandage)) then {
    _config = _config >> _bandage;
    _reopeningChance = getNumber (_config >> "reopeningChance");
    _reopeningMinDelay = getNumber (_config >> "reopeningMinDelay");
    _reopeningMaxDelay = getNumber (_config >> "reopeningMaxDelay") max _reopeningMinDelay;
} else {
    WARNING_2("No config for bandage [%1] config base [%2]",_bandage,_config);
};

if (isClass (_config >> _className)) then {
    private _woundTreatmentConfig = _config >> _className;

    if (isNumber (_woundTreatmentConfig >> "reopeningChance")) then {
        _reopeningChance = getNumber (_woundTreatmentConfig >> "reopeningChance");
    };

    if (isNumber (_woundTreatmentConfig >> "reopeningMinDelay")) then {
        _reopeningMinDelay = getNumber (_woundTreatmentConfig >> "reopeningMinDelay");
    };

    if (isNumber (_woundTreatmentConfig >> "reopeningMaxDelay")) then {
        _reopeningMaxDelay = getNumber (_woundTreatmentConfig >> "reopeningMaxDelay") max _reopeningMinDelay;
    };
} else {
    WARNING_2("No config for wound type [%1] config base [%2]",_className,_config);
};
TRACE_5("configs",_bandage,_className,_reopeningChance,_reopeningMinDelay,_reopeningMaxDelay);

private _bandagedWounds = GET_BANDAGED_WOUNDS(_target);
private _exist = false;
{
    _x params ["_id", "_amountOf"];
    if (_id == _classID) exitWith {
        _x set [1, _amountOf + _impact];
        TRACE_2("adding to existing bandagedWound",_id,_part);
        _exist = true;
    };
} forEach (_bandagedWounds getOrDefault [_part, []]);

if (!_exist) then {
    TRACE_2("adding new bandagedWound",_classID,_part);
    private _bandagedInjury = +_injury;
    _bandagedInjury set [1, _impact];
    (_bandagedWounds getOrDefault [_part, [], true]) pushBack _bandagedInjury;
};

_target setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];

// _reopeningChance = 1;
// _reopeningMinDelay = 5;
// _reopeningMaxDelay = 6;

TRACE_1("",_reopeningChance);
// Check if we are ever going to reopen this
if (random 1 <= _reopeningChance * GVAR(woundReopenChance)) then {
    private _delay = _reopeningMinDelay + random (_reopeningMaxDelay - _reopeningMinDelay);
    TRACE_1("Will open",_delay);
    [{
        params ["_target", "_impact", "_part", "_injuryIndex", "_injury"];
        TRACE_5("reopen delay finished",_target,_impact,_part,_injuryIndex,_injury);

        private _openWounds = GET_OPEN_WOUNDS(_target);
        private _woundsOnPart = _openWounds getOrDefault [_part, []];
        if (count _woundsOnPart - 1 < _injuryIndex) exitWith { TRACE_2("index bounds",_injuryIndex,count _woundsOnPart); };

        _injury params ["_classID"];

        private _selectedInjury = _woundsOnPart select _injuryIndex;
        _selectedInjury params ["_selClassID", "_selAmmount"];
        if (_selClassID == _classID) then { // matching the IDs
            private _bandagedWounds = GET_BANDAGED_WOUNDS(_target);
            private _exist = false;
            {
                _x params ["_id", "_amountOf"];
                if (_id == _classID) exitWith {
                    TRACE_2("bandagedWound exists",_id,_classID);
                    _x set [1, 0 max (_amountOf - _impact)];
                    _exist = true;
                };
            } forEach (_bandagedWounds getOrDefault [_part, []]);

            if (_exist) then {
                TRACE_2("Reopening Wound",_bandagedWounds,_openWounds);
                _selectedInjury set [1, _selAmmount + _impact];
                _target setVariable [VAR_BANDAGED_WOUNDS, _bandagedWounds, true];
                _target setVariable [VAR_OPEN_WOUNDS, _openWounds, true];

                [_target] call EFUNC(medical_status,updateWoundBloodLoss);

                private _partIndex = ALL_BODY_PARTS find _part;

                // Re-add trauma and damage visuals
                if (GVAR(clearTrauma) == 2) then {
                    private _injuryDamage = (_selectedInjury select 4) * _impact;
                    private _bodyPartDamage = _target getVariable [QEGVAR(medical,bodyPartDamage), [0,0,0,0,0,0]];
                    private _newDam = (_bodyPartDamage select _partIndex) + _injuryDamage;
                    _bodyPartDamage set [_partIndex, _newDam];

                    _target setVariable [QEGVAR(medical,bodyPartDamage), _bodyPartDamage, true];

                    switch (_partIndex) do {
                        case 0: { [_target, true, false, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
                        case 1: { [_target, false, true, false, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
                        case 2;
                        case 3: { [_target, false, false, true, false] call EFUNC(medical_engine,updateBodyPartVisuals); };
                        default { [_target, false, false, false, true] call EFUNC(medical_engine,updateBodyPartVisuals); };
                    };
                };

                // Check if we gained limping from this wound re-opening
                if ((EGVAR(medical,limping) == 1) && {_partIndex > 3}) then {
                    [_target] call EFUNC(medical_engine,updateDamageEffects);
                };
            };
        } else {
            TRACE_3("no match",_selectedInjury,_classID,_part);
        };
    }, [_target, _impact, _part, _injuryIndex, +_injury], _delay] call CBA_fnc_waitAndExecute;
};

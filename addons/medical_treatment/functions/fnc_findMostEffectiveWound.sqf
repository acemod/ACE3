#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Finds the wound most effective to bandage on the given bodypart of the patient for the given bandage type.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Treatment classname <STRING>
 * 2: Body part index <NUMBER>
 * 3: Percentage of bandage remaining <NUMBER>
 *
 * Return Value:
 * [Wound, [Effectiveness, Index, Impact]] <HASHMAP>
 *
 * Public: No
 * Example:
 * [player, "Head", "FieldDressing", 1] call ace_medical_treatment_fnc_findMostEffectiveWound
 */

params ["_patient", "_bandage", "_partIndex", ["_bandageRemaining", 1]];

// Get the default effectiveness for the used bandage
private _config = configFile >> QUOTE(ADDON) >> "Bandaging";
private _effectiveness = getNumber (_config >> "effectiveness");

if (isClass (_config >> _bandage)) then {
    _config = (_config >> _bandage);

    if (isNumber (_config >> "effectiveness")) then {
        _effectiveness = getNumber (_config >> "effectiveness");
    };
};

// Iterate over open wounds to find the most effective target
private _openWounds = GET_OPEN_WOUNDS(_patient);
if (_openWounds isEqualTo []) exitWith { [] };

private _return = createHashMap;

while {_bandageRemaining > 0} do {

    private _wound = EMPTY_WOUND;
    private _woundIndex = -1;
    private _effectivenessFound = -1;
    private _impactFound = -1;

    {
        _x params ["_classID", "_partIndexN", "_amountOf", "_bleeding", "_damage"];

        // Ignore iterated wounds & wounds on other bodyparts
        if (_x in _return || {_partIndexN != _partIndex}) then { continue };

        private _woundEffectiveness = _effectiveness;

        // Select the classname from the wound classname storage
        private _className = EGVAR(medical_damage,woundClassNamesComplex) select _classID;

        // Get the effectiveness of the bandage on this wound type
        if (isClass (_config >> _className)) then {
            private _woundTreatmentConfig = _config >> _className;

            if (isNumber (_woundTreatmentConfig >> "effectiveness")) then {
                _woundEffectiveness = getNumber (_woundTreatmentConfig >> "effectiveness");
            };
        } else {
            // Basic medical bandage just has a base level config (same effectiveness for all wound types)
            if (_bandage != "BasicBandage") then {
                WARNING_2("No config for wound type [%1] config base [%2]",_className,_config);
            };
        };

        // Multiply by coefficient in case this is a leftover bandage
        _woundEffectiveness = _woundEffectiveness * _bandageRemaining;

        // Track most effective found so far
        if (_woundEffectiveness * _amountOf * _bleeding > _effectivenessFound * (_wound select 2) * (_wound select 3)) then {
            _effectivenessFound = _woundEffectiveness;
            _impactFound = _amountOf min _effectivenessFound;
            _woundIndex = _forEachIndex;
            _wound = _x;
        };
    } forEach _openWounds;

    // Exit if there are no more wounds to close
    if (_woundIndex == -1) exitWith {};

    _return set [_wound, [_effectivenessFound, _woundIndex, _impactFound]];
    _bandageRemaining = _bandageRemaining - (_impactFound / _effectivenessFound);
};

_return

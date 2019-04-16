#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Finds the wound most effective to bandage on the given bodypart of the patient for the given bandage type.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment class name <STRING>
 * 2: Body part index <NUMBER>
 *
 * Return Value:
 * [Wound, Index, Effectiveness] <ARRAY, NUMBER, NUMBER>
 *
 * Public: No
 */

params ["_patient", "_bandage", "_partIndex"];

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
private _openWounds = _patient getVariable [QEGVAR(medical,openWounds), []];
if (_openWounds isEqualTo []) exitWith { [EMPTY_WOUND, -1, -1] };

private _wound = EMPTY_WOUND;
private _woundIndex = -1;
private _effectivenessFound = -1;

{
    _x params ["_classID", "_partIndexN", "_amountOf", "_bleeding", "_damage"];

    private _classIndex = floor _classID;
    private _category = round (10 * (_classID % 1));

    // Ignore wounds on other bodyparts
    if (_partIndexN == _partIndex) then {
        private _woundEffectiveness = _effectiveness;

        // Select the classname from the wound classname storage
        private _suffix = ["Minor", "Medium", "Large"] select _category;
        private _className = format ["%1%2", EGVAR(medical_damage,woundClassNames) select _classIndex, _suffix];

        // Get the effectiveness of the bandage on this wound type
        if (isClass (_config >> _className)) then {
            private _woundTreatmentConfig = _config >> _className;

            if (isNumber (_woundTreatmentConfig >> "effectiveness")) then {
                _woundEffectiveness = getNumber (_woundTreatmentConfig >> "effectiveness");
            };
        } else {
            // Basic medical bandage just has a base level config (same effectivenes for all wound types)
            if (_bandage != "BasicBandage") then {
                WARNING_2("No config for wound type [%1] config base [%2]",_className,_config);
            };
        };

        // Track most effective found so far
        if (_woundEffectiveness * _amountOf * _bleeding > _effectivenessFound * (_wound select 3) * (_wound select 4)) then {
            _effectivenessFound = _woundEffectiveness;
            _woundIndex = _forEachIndex;
            _wound = _x;
        };
    };
} forEach _openWounds;

[_wound, _woundIndex, _effectivenessFound]

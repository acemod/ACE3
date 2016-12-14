/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment class name <STRING>
 * 2: Body part <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_bandage", "_bodyPart", ["_specificClass", -1]];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;
if (_partIndex < 0) exitWith { false };

private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
if (_openWounds isEqualTo []) exitWith { false };

// Get the default effectiveness for the used bandage
private _config = configFile >> QUOTE(ADDON) >> "Bandaging";
private _effectiveness = getNumber (_config >> "effectiveness");

if (isClass (_config >> _bandage)) then {
    _config = (_config >> _bandage);

    if (isNumber (_config >> "effectiveness")) then {
        _effectiveness = getNumber (_config >> "effectiveness");
    };
};

// Figure out which injury for this bodypart is the best choice to bandage
// TODO also use up the remainder on left over injuries
private _mostEffectiveSpot = 0;
private _effectivenessFound = -1;
private _mostEffectiveInjury = _openWounds select 0;
private _exit = false;

{
    _x params ["", "_classID", "_partIndexN", "_amountOf", "_bleeding", "_damage", "_category"];
    TRACE_2("OPENWOUND: ", _target, _x);

    // Only parse injuries that are for the selected bodypart.
    if (_partIndexN == _partIndex) then {
        private _woundEffectiveness = _effectiveness;

        // Select the classname from the wound classname storage
        private _postfix = ["Minor", "Medium", "Large"] select _category;
        private _className = format ["%1%2", EGVAR(medical_damage,woundClassNames) select _classID, _postfix];

        // Check if this wound type has attributes specified for the used bandage
        if (isClass (_config >> _className)) then {
            // Collect the effectiveness from the used bandage for this wound type
            private _woundTreatmentConfig = _config >> _className;

            if (isNumber (_woundTreatmentConfig >> "effectiveness")) then {
                _woundEffectiveness = getNumber (_woundTreatmentConfig >> "effectiveness");
            };
        } else {
            //Basic medical bandage just has a base level config (same effectivenes for all wound types)
            if (_bandage != "BasicBandage") then {
                WARNING_2("No config for wound type [%1] config base [%2]", _className, _config);
            };
        };

        TRACE_2("Wound classes: ", _specificClass, _classID);
        if (_specificClass == _classID) exitWith {
            _effectivenessFound = _woundEffectiveness;
            _mostEffectiveSpot = _forEachIndex;
            _mostEffectiveInjury = _x;
            _exit = true;
        };

        // Check if this is the currently most effective found.
        if (_woundEffectiveness * _amountOf * _bleeding > _effectivenessFound * (_mostEffectiveInjury select 3) * (_mostEffectiveInjury select 4)) then {
            _effectivenessFound = _woundEffectiveness;
            _mostEffectiveSpot = _forEachIndex;
            _mostEffectiveInjury = _x;
        };
    };

    if (_exit) exitWith {};
} forEach _openWounds;

if (_effectivenessFound == -1) exitWith {}; // Seems everything is patched up on this body part already..

// Find the impact this bandage has and reduce the amount this injury is present
private _amountOf = _mostEffectiveInjury select 3;
private _impact = _effectivenessFound min _amountOf;
_mostEffectiveInjury set [3, _amountOf - _impact];
_openWounds set [_mostEffectiveSpot, _mostEffectiveInjury];

_target setVariable [QEGVAR(medical,openWounds), _openWounds, true];

// Handle the reopening of bandaged wounds
if (_impact > 0 && {EGVAR(medical,enableAdvancedWounds)}) then {
    [_target, _impact, _partIndex, _mostEffectiveSpot, _mostEffectiveInjury, _bandage] call FUNC(handleBandageOpening);
};

true

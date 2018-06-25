#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [bob, "classname"] call ACE_medical_fnc_treatmentAdvanced_bandageLocal
 *
 * Public: No
 */

params ["_target", "_bandage", "_selectionName", ["_specificClass", -1]];

// Ensure it is a valid bodypart
private _part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part < 0) exitWith {false};

// Get the open wounds for this unit
private _openWounds = _target getVariable [QGVAR(openWounds), []];
if (count _openWounds == 0) exitWith {false}; // nothing to do here!

// Get the default effectiveness for the used bandage
private _config = (ConfigFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Bandaging");
private _effectiveness = getNumber (_config >> "effectiveness");
if (isClass (_config >> _bandage)) then {
    _config = (_config >> _bandage);
    if (isNumber (_config >> "effectiveness")) then { _effectiveness = getNumber (_config >> "effectiveness");};
};

// Figure out which injury for this bodypart is the best choice to bandage
// TODO also use up the remainder on left over injuries
private _mostEffectiveSpot = 0;
private _effectivenessFound = -1;
private _mostEffectiveInjury = _openWounds select 0;
private _exit = false;
{
    _x params ["", "_classID", "_partX"];
    TRACE_2("OPENWOUND: ", _target, _x);
    // Only parse injuries that are for the selected bodypart.
    if (_partX == _part) then {
        private _woundEffectiveness = _effectiveness;

        // Select the classname from the wound classname storage
        private _className = GVAR(woundClassNames) select _classID;

        // Check if this wound type has attributes specified for the used bandage
        if (isClass (_config >> _className)) then {
            // Collect the effectiveness from the used bandage for this wound type
            private _woundTreatmentConfig = (_config >> _className);
            if (isNumber (_woundTreatmentConfig >> "effectiveness")) then {
                _woundEffectiveness = getNumber (_woundTreatmentConfig >> "effectiveness");
            };
        } else {
            //Basic medical bandage just has a base level config (same effectivenes for all wound types)
            if (_bandage != "Bandage") then {
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
        if (_woundEffectiveness * ((_x select 4) * (_x select 3)) > _effectivenessFound * ((_mostEffectiveInjury select 4) * (_mostEffectiveInjury select 3))) then {
            _effectivenessFound = _woundEffectiveness;
            _mostEffectiveSpot = _forEachIndex;
            _mostEffectiveInjury = _x;
        };
    };
    if (_exit) exitWith {};
} forEach _openWounds;

if (_effectivenessFound == -1) exitWith {}; // Seems everything is patched up on this body part already..


// TODO refactor this part
// Find the impact this bandage has and reduce the amount this injury is present
private _impact = if ((_mostEffectiveInjury select 3) >= _effectivenessFound) then {_effectivenessFound} else { (_mostEffectiveInjury select 3) };
_mostEffectiveInjury set [ 3, ((_mostEffectiveInjury select 3) - _impact) max 0];
_openWounds set [_mostEffectiveSpot, _mostEffectiveInjury];

_target setVariable [QGVAR(openWounds), _openWounds, true];

// Handle the reopening of bandaged wounds
if (_impact > 0 && {GVAR(level) >= 2} && {GVAR(enableAdvancedWounds)}) then {
    [_target, _impact, _part, _mostEffectiveSpot, _mostEffectiveInjury, _bandage] call FUNC(handleBandageOpening);
};

// If all wounds to a body part have been bandaged, reset damage to that body part to zero
// so that the body part functions normally and blood is removed from the uniform.
// Arma combines left and right arms into a single body part (HitHands), same with left and right legs (HitLegs).
// Arms are actually hands.
if (GVAR(healHitPointAfterAdvBandage) || {GVAR(level) < 2}) then {
    // Get the list of the wounds the target is currently suffering from.
    private _currentWounds = _target getVariable [QGVAR(openWounds), []];

    // Tally of unbandaged wounds to each body part.
    private _headWounds = 0;
    private _bodyWounds = 0;
    private _leftArmWounds = 0;
    private _leftLegWounds = 0;
    private _rightArmWounds = 0;
    private _rightLegWounds = 0;

    // Loop through all current wounds and add up the number of unbandaged wounds on each body part.
    {
        _x params ["", "", "_bodyPart", "_numOpenWounds", "_bloodLoss"];

        // Use switch/case for early termination if wounded limb is found before all six are checked.
        // Number of wounds multiplied by blood loss will return zero for a fully
        // bandaged body part, not incrementing the wound counter; or it will return
        // some other number which will increment the wound counter.
        switch (_bodyPart) do {
            // Head
            case 0: {
                _headWounds = _headWounds + (_numOpenWounds * _bloodLoss);
            };

            // Body
            case 1: {
                _bodyWounds = _bodyWounds + (_numOpenWounds * _bloodLoss);
            };

            // Left Arm
            case 2: {
                _leftArmWounds = _leftArmWounds + (_numOpenWounds * _bloodLoss);
            };

            // Right Arm
            case 3: {
                _rightArmWounds = _rightArmWounds + (_numOpenWounds * _bloodLoss);
            };

            // Left Leg
            case 4: {
                _leftLegWounds = _leftLegWounds + (_numOpenWounds * _bloodLoss);
            };

            // Right Leg
            case 5: {
                _rightLegWounds = _rightLegWounds + (_numOpenWounds * _bloodLoss);
            };
        };
    } forEach _currentWounds;

    // ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"]
    private _bodyStatus = _target getVariable [QGVAR(bodyPartStatus), [0,0,0,0,0,0]];

    // Any body part that has no wounds is healed to full health
    if (_headWounds == 0) then {
        _bodyStatus set [0, 0];
    };
    if (_bodyWounds == 0) then {
        _bodyStatus set [1, 0];
    };
    if (_leftArmWounds == 0) then {
        _bodyStatus set [2, 0];
    };
    if (_rightArmWounds == 0) then {
        _bodyStatus set [3, 0];
    };
    if (_leftLegWounds == 0) then {
        _bodyStatus set [4, 0];
    };
    if (_rightLegWounds == 0) then {
        _bodyStatus set [5, 0];
    };

    _target setVariable [QGVAR(bodyPartStatus), _bodyStatus, true];

    [_target] call FUNC(handleDamage_advancedSetDamage);
};

true;

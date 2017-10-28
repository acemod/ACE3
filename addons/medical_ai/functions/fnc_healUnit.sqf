/*
 * Author: BaerMitUmlaut
 * Makes a medic heal the next unit that needs treatment.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_medical_ai_fnc_healUnit
 *
 * Public: No
 */
#include "script_component.hpp"

// Can't heal other units when unconscious
if (_this getVariable ["ACE_isUnconscious", false]) exitWith {};
// Check if we're still treating
if ((_this getVariable [QGVAR(treatmentOverAt), CBA_missionTime]) > CBA_missionTime) exitWith {};

// Find next unit to treat
private _healQueue = _this getVariable [QGVAR(healQueue), []];
private _target = _healQueue select 0;

// If unit died or was healed, be lazy and wait for the next tick
if (isNull _target || {!alive _target} || {!(_target call FUNC(isInjured))}) exitWith {
    _target forceSpeed -1;
    _healQueue deleteAt 0;
    _this getVariable [QGVAR(healQueue), _healQueue];
    _this forceSpeed -1;
    // return to formation instead of going where the injured unit was if it healed itself in the mean time
    _this doFollow leader _this;
    _this setVariable [QGVAR(movingToInjured), false];

    #ifdef DEBUG_MODE_FULL
        systemChat format ["%1 finished healing %2", _this, _target];
    #endif
};

// Move to target...
if (_this distance _target > 2) exitWith {
    if !(_this getVariable [QGVAR(movingToInjured), false]) then {
        _this setVariable [QGVAR(movingToInjured), true];
        _this doMove getPosATL _target;
    };
};
_this setVariable [QGVAR(movingToInjured), false];

// ...and make sure medic and target don't move
_this forceSpeed 0;
_target forceSpeed 0;

private _needsBandaging = ([_target] call EFUNC(medical,getBloodLoss)) > 0;
private _needsMorphine  = (_target getVariable [QEGVAR(medical,pain), 0]) > 0.2;
private _needsEpinephrine = _target getVariable ["ACE_isUnconscious", false];

switch (true) do {
    case _needsBandaging: {
        // Select first wound and bandage it
        private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
        private _partIndex = {
            _x params ["", "", "_index", "_amount", "_percentage"];
            if (_amount * _percentage > 0) exitWith {
                _index
            };
        } forEach _openWounds;
        private _selection = ["head","body","hand_l","hand_r","leg_l","leg_r"] select _partIndex;
        [_this, _target, _selection, "Bandage"] call EFUNC(medical,treatmentAdvanced_bandage);

        #ifdef DEBUG_MODE_FULL
            systemChat format ["%1 is bandaging selection %2 on %3", _this, _selection, _target];
        #endif

        // Play animation
        [_this, true, false] call FUNC(playTreatmentAnim);
        _this setVariable [QGVAR(treatmentOverAt), CBA_missionTime + 5];
    };
    case _needsMorphine: {
        [_this, _target] call EFUNC(medical,treatmentBasic_morphine);
        [_this, false, false] call FUNC(playTreatmentAnim);
        _this setVariable [QGVAR(treatmentOverAt), CBA_missionTime + 2];

        #ifdef DEBUG_MODE_FULL
            systemChat format ["%1 is giving %2 morphine", _this, _target];
        #endif
    };
    case _needsEpinephrine: {
        [_this, _target] call EFUNC(medical,treatmentBasic_epipen);
        [_this, false, false] call FUNC(playTreatmentAnim);
        _this setVariable [QGVAR(treatmentOverAt), CBA_missionTime + 2];

        #ifdef DEBUG_MODE_FULL
            systemChat format ["%1 is using an epipen on %2", _this, _target];
        #endif
    };
};
